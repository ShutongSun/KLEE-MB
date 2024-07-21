KLEE Symbolic Virtual Machine
=============================

[![Build Status](https://github.com/klee/klee/workflows/CI/badge.svg)](https://github.com/klee/klee/actions?query=workflow%3ACI)
[![Build Status](https://api.cirrus-ci.com/github/klee/klee.svg)](https://cirrus-ci.com/github/klee/klee)
[![Coverage](https://codecov.io/gh/klee/klee/branch/master/graph/badge.svg)](https://codecov.io/gh/klee/klee)

`KLEE` is a symbolic virtual machine built on top of the LLVM compiler
infrastructure. Currently, there are two primary components:

  1. The core symbolic virtual machine engine; this is responsible for
     executing LLVM bitcode modules with support for symbolic
     values. This is comprised of the code in lib/.

  2. A POSIX/Linux emulation layer oriented towards supporting uClibc,
     with additional support for making parts of the operating system
     environment symbolic.

Additionally, there is a simple library for replaying computed inputs
on native code (for closed programs). There is also a more complicated
infrastructure for replaying the inputs generated for the POSIX/Linux
emulation layer, which handles running native programs in an
environment that matches a computed test input, including setting up
files, pipes, environment variables, and passing command line
arguments.

For further information, see the [webpage](https://klee-se.org/).



# Using Klee for finding the longest execution path, Installation steps

1. [Install Required Dependencies](#step-1-install-required-dependencies)
2. [Install Python Packages](#step-2-install-python-packages)
3. [Install LLVM](#step-3-install-llvm)
4. [Install Constraint Solver (STP)](#step-4-install-constraint-solver-stp)
5. [(Optional) Get Google Test Sources](#step-5-optional-get-google-test-sources)
6. [(Optional) Build uClibc and POSIX Environment Model](#step-6-optional-build-uclibc-and-posix-environment-model)
7. [Clone KLEE Source Code](#step-7-clone-klee-source-code)
8. [Configure and Build KLEE](#step-8-configure-and-build-klee)
9. [Build KLEE](#step-9-build-klee)
10. [Add KLEE to Executable Path](#step-10-add-klee-to-executable-path)
11. [Install Clang](#step-11-install-clang)
12. [Include klee to Executable](#step-12-include-klee-to-executable)
13. [Updating from Klee](#update-from-klee)
---

### Step 1: Install Required Dependencies


```bash
sudo apt-get update
sudo apt-get install -y build-essential cmake curl file g++-multilib gcc-multilib git libcap-dev libgoogle-perftools-dev libncurses5-dev libsqlite3-dev libtcmalloc-minimal4 python3-pip unzip graphviz doxygen
```

### Step 2: Install Python Packages
```bash
sudo pip3 install lit wllvm
sudo apt-get install -y python3-tabulate

```

### Step 3: Install LLVM 
```bash
sudo apt-get install -y clang-13 llvm-13 llvm-13-dev llvm-13-tools
```

### Step 4: Install Constraint Solver (STP) 
```bash
sudo apt-get update
sudo apt-get install -y cmake bison flex libboost-all-dev python3 perl zlib1g-dev minisat python3-pip

git clone https://github.com/stp/stp.git
cd stp
git checkout tags/2.3.3
mkdir build
cd build
cmake ..
make
sudo make install
```

#### Before running KLEE with STP on larger benchmarks, it is essential to set the size of the stack to a very large value: 
```bash
ulimit -s unlimited
```

### Step 5: (Optional) Get Google Test Sources 
```bash
curl -OL https://github.com/google/googletest/archive/release-1.11.0.zip
unzip release-1.11.0.zip
```

### Step 6: (Optional) Build uClibc and POSIX Environment Model
```bash
git clone https://github.com/klee/klee-uclibc.git
cd klee-uclibc
./configure --make-llvm-lib --with-cc clang-13 --with-llvm-config llvm-config-13
make -j$(nproc)
cd ..
```

### Step 7: Clone KLEE Source Code 
```bash
git clone https://github.com/klee/klee.git
```

### Step 8: Configure and Build KLEE 
```bash
cd klee
mkdir build
cd build
cmake -DENABLE_SOLVER_STP=ON -DENABLE_POSIX_RUNTIME=ON -DKLEE_UCLIBC_PATH=../../klee-uclibc -DENABLE_UNIT_TESTS=ON -DGTEST_SRC_DIR=../../googletest-release-1.11.0 ..
```

### Step 9: Build KLEE 
```bash
make
```

### Step 10: Add KLEE to Executable Path 
```bash
vim ~/.bashrc
```

#### Add this line:
```bash
export PATH="$HOME/klee/klee/build/bin:$PATH"
```

#### Update the changes:
```bash
source ~/.bashrc
```

### Step 11: Install Clang 
```bash
sudo apt-get update
sudo apt-get install -y clang llvm
sudo apt-get install -y clang-13 llvm-13 llvm-13-dev llvm-13-tools
```

### Step 12: Include klee to Executable 
```bash
vim ~/.bashrc
```

#### Add these lines
```bash
export C_INCLUDE_PATH=$HOME/klee/klee/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=$HOME/klee/klee/include:$CPLUS_INCLUDE_PATH
```

####
```bash
source ~/.bashrc
```


### Update from klee
```bash
git clone https://github.com/ShutongSun/KLEE-MB.git
cd KLEE-MB

git remote add upstream https://github.com/klee/klee.git

git fetch upstream

git rebase upstream/master


```


---
