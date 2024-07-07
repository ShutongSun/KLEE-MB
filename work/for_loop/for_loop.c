#include "klee/klee.h"

int repeatPrint(int count) {
    int a = 0;
    for (int i = 1; i <= count; i++) {
        a = a + 1;
    }
    return a;
}

int main(){
    int times;
    klee_make_symbolic(&times, sizeof(times), "times");
    return repeatPrint(times);    
}
