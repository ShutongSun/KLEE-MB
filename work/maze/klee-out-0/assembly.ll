; ModuleID = 'maze.bc'
source_filename = "maze.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@maze = dso_local global [7 x [11 x i8]] [[11 x i8] c"+-+---+---+", [11 x i8] c"| |     |#|", [11 x i8] c"| | --+ | |", [11 x i8] c"| |   | | |", [11 x i8] c"| +-- | | |", [11 x i8] c"|     |   |", [11 x i8] c"+-----+---+"], align 16, !dbg !0
@.str = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"Maze dimensions: %dx%d\0A\00", align 1
@.str.3 = private unnamed_addr constant [19 x i8] c"Player pos: %dx%d\0A\00", align 1
@.str.4 = private unnamed_addr constant [18 x i8] c"Iteration no. %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [45 x i8] c"The player moves with 'w', 's', 'a' and 'd'\0A\00", align 1
@.str.6 = private unnamed_addr constant [28 x i8] c"Try to reach the price(#)!\0A\00", align 1
@.str.7 = private unnamed_addr constant [8 x i8] c"program\00", align 1
@.str.8 = private unnamed_addr constant [31 x i8] c"Wrong command!(Only w,s,a,d!)\0A\00", align 1
@.str.9 = private unnamed_addr constant [11 x i8] c"You lose!\0A\00", align 1
@.str.10 = private unnamed_addr constant [10 x i8] c"You win!\0A\00", align 1
@.str.11 = private unnamed_addr constant [22 x i8] c"Your solution <%42s>\0A\00", align 1
@.str.12 = private unnamed_addr constant [34 x i8] c"Iteration no. %d. Action: %c. %s\0A\00", align 1
@.str.13 = private unnamed_addr constant [9 x i8] c"Blocked!\00", align 1
@.str.14 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.15 = private unnamed_addr constant [10 x i8] c"You lose\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @draw() #0 !dbg !17 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !20, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32* %2, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 0, i32* %1, align 4, !dbg !25
  br label %3, !dbg !27

3:                                                ; preds = %25, %0
  %4 = load i32, i32* %1, align 4, !dbg !28
  %5 = icmp slt i32 %4, 7, !dbg !30
  br i1 %5, label %6, label %28, !dbg !31

6:                                                ; preds = %3
  store i32 0, i32* %2, align 4, !dbg !32
  br label %7, !dbg !35

7:                                                ; preds = %20, %6
  %8 = load i32, i32* %2, align 4, !dbg !36
  %9 = icmp slt i32 %8, 11, !dbg !38
  br i1 %9, label %10, label %23, !dbg !39

10:                                               ; preds = %7
  %11 = load i32, i32* %1, align 4, !dbg !40
  %12 = sext i32 %11 to i64, !dbg !41
  %13 = getelementptr inbounds [7 x [11 x i8]], [7 x [11 x i8]]* @maze, i64 0, i64 %12, !dbg !41
  %14 = load i32, i32* %2, align 4, !dbg !42
  %15 = sext i32 %14 to i64, !dbg !41
  %16 = getelementptr inbounds [11 x i8], [11 x i8]* %13, i64 0, i64 %15, !dbg !41
  %17 = load i8, i8* %16, align 1, !dbg !41
  %18 = sext i8 %17 to i32, !dbg !41
  %19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 %18), !dbg !43
  br label %20, !dbg !43

20:                                               ; preds = %10
  %21 = load i32, i32* %2, align 4, !dbg !44
  %22 = add nsw i32 %21, 1, !dbg !44
  store i32 %22, i32* %2, align 4, !dbg !44
  br label %7, !dbg !45, !llvm.loop !46

23:                                               ; preds = %7
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !49
  br label %25, !dbg !50

25:                                               ; preds = %23
  %26 = load i32, i32* %1, align 4, !dbg !51
  %27 = add nsw i32 %26, 1, !dbg !51
  store i32 %27, i32* %1, align 4, !dbg !51
  br label %3, !dbg !52, !llvm.loop !53

28:                                               ; preds = %3
  %29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 !dbg !57 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca [28 x i8], align 16
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i32* %6, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i32* %7, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata i32* %8, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i32* %9, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i32* %10, metadata !74, metadata !DIExpression()), !dbg !75
  store i32 0, i32* %10, align 4, !dbg !75
  call void @llvm.dbg.declare(metadata [28 x i8]* %11, metadata !76, metadata !DIExpression()), !dbg !80
  store i32 1, i32* %6, align 4, !dbg !81
  store i32 1, i32* %7, align 4, !dbg !82
  %12 = load i32, i32* %7, align 4, !dbg !83
  %13 = sext i32 %12 to i64, !dbg !84
  %14 = getelementptr inbounds [7 x [11 x i8]], [7 x [11 x i8]]* @maze, i64 0, i64 %13, !dbg !84
  %15 = load i32, i32* %6, align 4, !dbg !85
  %16 = sext i32 %15 to i64, !dbg !84
  %17 = getelementptr inbounds [11 x i8], [11 x i8]* %14, i64 0, i64 %16, !dbg !84
  store i8 88, i8* %17, align 1, !dbg !86
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i64 0, i64 0), i32 11, i32 7), !dbg !87
  %19 = load i32, i32* %6, align 4, !dbg !88
  %20 = load i32, i32* %7, align 4, !dbg !89
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 0), i32 %19, i32 %20), !dbg !90
  %22 = load i32, i32* %10, align 4, !dbg !91
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.4, i64 0, i64 0), i32 %22), !dbg !92
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.5, i64 0, i64 0)), !dbg !93
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.6, i64 0, i64 0)), !dbg !94
  call void @draw(), !dbg !95
  %26 = getelementptr inbounds [28 x i8], [28 x i8]* %11, i64 0, i64 0, !dbg !96
  %27 = call i32 (i8*, i32, i8*, ...) bitcast (i32 (...)* @klee_make_symbolic to i32 (i8*, i32, i8*, ...)*)(i8* %26, i32 28, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i64 0, i64 0)), !dbg !97
  br label %28, !dbg !98

28:                                               ; preds = %131, %2
  %29 = load i32, i32* %10, align 4, !dbg !99
  %30 = icmp slt i32 %29, 28, !dbg !100
  br i1 %30, label %31, label %141, !dbg !98

31:                                               ; preds = %28
  %32 = load i32, i32* %6, align 4, !dbg !101
  store i32 %32, i32* %8, align 4, !dbg !103
  %33 = load i32, i32* %7, align 4, !dbg !104
  store i32 %33, i32* %9, align 4, !dbg !105
  %34 = load i32, i32* %10, align 4, !dbg !106
  %35 = sext i32 %34 to i64, !dbg !107
  %36 = getelementptr inbounds [28 x i8], [28 x i8]* %11, i64 0, i64 %35, !dbg !107
  %37 = load i8, i8* %36, align 1, !dbg !107
  %38 = sext i8 %37 to i32, !dbg !107
  switch i32 %38, label %51 [
    i32 119, label %39
    i32 115, label %42
    i32 97, label %45
    i32 100, label %48
  ], !dbg !108

39:                                               ; preds = %31
  %40 = load i32, i32* %7, align 4, !dbg !109
  %41 = add nsw i32 %40, -1, !dbg !109
  store i32 %41, i32* %7, align 4, !dbg !109
  br label %54, !dbg !111

42:                                               ; preds = %31
  %43 = load i32, i32* %7, align 4, !dbg !112
  %44 = add nsw i32 %43, 1, !dbg !112
  store i32 %44, i32* %7, align 4, !dbg !112
  br label %54, !dbg !113

45:                                               ; preds = %31
  %46 = load i32, i32* %6, align 4, !dbg !114
  %47 = add nsw i32 %46, -1, !dbg !114
  store i32 %47, i32* %6, align 4, !dbg !114
  br label %54, !dbg !115

48:                                               ; preds = %31
  %49 = load i32, i32* %6, align 4, !dbg !116
  %50 = add nsw i32 %49, 1, !dbg !116
  store i32 %50, i32* %6, align 4, !dbg !116
  br label %54, !dbg !117

51:                                               ; preds = %31
  %52 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.8, i64 0, i64 0)), !dbg !118
  %53 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.9, i64 0, i64 0)), !dbg !119
  call void @exit(i32 -1) #4, !dbg !120
  unreachable, !dbg !120

54:                                               ; preds = %48, %45, %42, %39
  %55 = load i32, i32* %7, align 4, !dbg !121
  %56 = sext i32 %55 to i64, !dbg !123
  %57 = getelementptr inbounds [7 x [11 x i8]], [7 x [11 x i8]]* @maze, i64 0, i64 %56, !dbg !123
  %58 = load i32, i32* %6, align 4, !dbg !124
  %59 = sext i32 %58 to i64, !dbg !123
  %60 = getelementptr inbounds [11 x i8], [11 x i8]* %57, i64 0, i64 %59, !dbg !123
  %61 = load i8, i8* %60, align 1, !dbg !123
  %62 = sext i8 %61 to i32, !dbg !123
  %63 = icmp eq i32 %62, 35, !dbg !125
  br i1 %63, label %64, label %68, !dbg !126

64:                                               ; preds = %54
  %65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.10, i64 0, i64 0)), !dbg !127
  %66 = getelementptr inbounds [28 x i8], [28 x i8]* %11, i64 0, i64 0, !dbg !129
  %67 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.11, i64 0, i64 0), i8* %66), !dbg !130
  call void @exit(i32 1) #4, !dbg !131
  unreachable, !dbg !131

68:                                               ; preds = %54
  %69 = load i32, i32* %7, align 4, !dbg !132
  %70 = sext i32 %69 to i64, !dbg !134
  %71 = getelementptr inbounds [7 x [11 x i8]], [7 x [11 x i8]]* @maze, i64 0, i64 %70, !dbg !134
  %72 = load i32, i32* %6, align 4, !dbg !135
  %73 = sext i32 %72 to i64, !dbg !134
  %74 = getelementptr inbounds [11 x i8], [11 x i8]* %71, i64 0, i64 %73, !dbg !134
  %75 = load i8, i8* %74, align 1, !dbg !134
  %76 = sext i8 %75 to i32, !dbg !134
  %77 = icmp ne i32 %76, 32, !dbg !136
  br i1 %77, label %78, label %100, !dbg !137

78:                                               ; preds = %68
  %79 = load i32, i32* %7, align 4, !dbg !138
  %80 = icmp eq i32 %79, 2, !dbg !139
  br i1 %80, label %81, label %97, !dbg !140

81:                                               ; preds = %78
  %82 = load i32, i32* %7, align 4, !dbg !141
  %83 = sext i32 %82 to i64, !dbg !142
  %84 = getelementptr inbounds [7 x [11 x i8]], [7 x [11 x i8]]* @maze, i64 0, i64 %83, !dbg !142
  %85 = load i32, i32* %6, align 4, !dbg !143
  %86 = sext i32 %85 to i64, !dbg !142
  %87 = getelementptr inbounds [11 x i8], [11 x i8]* %84, i64 0, i64 %86, !dbg !142
  %88 = load i8, i8* %87, align 1, !dbg !142
  %89 = sext i8 %88 to i32, !dbg !142
  %90 = icmp eq i32 %89, 124, !dbg !144
  br i1 %90, label %91, label %97, !dbg !145

91:                                               ; preds = %81
  %92 = load i32, i32* %6, align 4, !dbg !146
  %93 = icmp sgt i32 %92, 0, !dbg !147
  br i1 %93, label %94, label %97, !dbg !148

94:                                               ; preds = %91
  %95 = load i32, i32* %6, align 4, !dbg !149
  %96 = icmp slt i32 %95, 11, !dbg !150
  br i1 %96, label %100, label %97, !dbg !151

97:                                               ; preds = %94, %91, %81, %78
  %98 = load i32, i32* %8, align 4, !dbg !152
  store i32 %98, i32* %6, align 4, !dbg !154
  %99 = load i32, i32* %9, align 4, !dbg !155
  store i32 %99, i32* %7, align 4, !dbg !156
  br label %100, !dbg !157

100:                                              ; preds = %97, %94, %68
  %101 = load i32, i32* %6, align 4, !dbg !158
  %102 = load i32, i32* %7, align 4, !dbg !159
  %103 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 0), i32 %101, i32 %102), !dbg !160
  %104 = load i32, i32* %10, align 4, !dbg !161
  %105 = load i32, i32* %10, align 4, !dbg !162
  %106 = sext i32 %105 to i64, !dbg !163
  %107 = getelementptr inbounds [28 x i8], [28 x i8]* %11, i64 0, i64 %106, !dbg !163
  %108 = load i8, i8* %107, align 1, !dbg !163
  %109 = sext i8 %108 to i32, !dbg !163
  %110 = load i32, i32* %8, align 4, !dbg !164
  %111 = load i32, i32* %6, align 4, !dbg !165
  %112 = icmp eq i32 %110, %111, !dbg !166
  br i1 %112, label %113, label %117, !dbg !167

113:                                              ; preds = %100
  %114 = load i32, i32* %9, align 4, !dbg !168
  %115 = load i32, i32* %7, align 4, !dbg !169
  %116 = icmp eq i32 %114, %115, !dbg !170
  br label %117

117:                                              ; preds = %113, %100
  %118 = phi i1 [ false, %100 ], [ %116, %113 ], !dbg !171
  %119 = zext i1 %118 to i64, !dbg !172
  %120 = select i1 %118, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.13, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.14, i64 0, i64 0), !dbg !172
  %121 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.12, i64 0, i64 0), i32 %104, i32 %109, i8* %120), !dbg !173
  %122 = load i32, i32* %8, align 4, !dbg !174
  %123 = load i32, i32* %6, align 4, !dbg !176
  %124 = icmp eq i32 %122, %123, !dbg !177
  br i1 %124, label %125, label %131, !dbg !178

125:                                              ; preds = %117
  %126 = load i32, i32* %9, align 4, !dbg !179
  %127 = load i32, i32* %7, align 4, !dbg !180
  %128 = icmp eq i32 %126, %127, !dbg !181
  br i1 %128, label %129, label %131, !dbg !182

129:                                              ; preds = %125
  %130 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.15, i64 0, i64 0)), !dbg !183
  call void @exit(i32 -2) #4, !dbg !185
  unreachable, !dbg !185

131:                                              ; preds = %125, %117
  %132 = load i32, i32* %7, align 4, !dbg !186
  %133 = sext i32 %132 to i64, !dbg !187
  %134 = getelementptr inbounds [7 x [11 x i8]], [7 x [11 x i8]]* @maze, i64 0, i64 %133, !dbg !187
  %135 = load i32, i32* %6, align 4, !dbg !188
  %136 = sext i32 %135 to i64, !dbg !187
  %137 = getelementptr inbounds [11 x i8], [11 x i8]* %134, i64 0, i64 %136, !dbg !187
  store i8 88, i8* %137, align 1, !dbg !189
  call void @draw(), !dbg !190
  %138 = load i32, i32* %10, align 4, !dbg !191
  %139 = add nsw i32 %138, 1, !dbg !191
  store i32 %139, i32* %10, align 4, !dbg !191
  %140 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 1), !dbg !192
  br label %28, !dbg !98, !llvm.loop !193

141:                                              ; preds = %28
  %142 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.15, i64 0, i64 0)), !dbg !195
  %143 = load i32, i32* %3, align 4, !dbg !196
  ret i32 %143, !dbg !196
}

declare dso_local i32 @klee_make_symbolic(...) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local i32 @sleep(...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "maze", scope: !2, file: !3, line: 18, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "maze.c", directory: "/home/stu221425/klee/klee/work/maze")
!4 = !{}
!5 = !{!0}
!6 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 616, elements: !8)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !{!9, !10}
!9 = !DISubrange(count: 7)
!10 = !DISubrange(count: 11)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"Ubuntu clang version 13.0.1-2ubuntu2.2"}
!17 = distinct !DISubprogram(name: "draw", scope: !3, file: !3, line: 28, type: !18, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "i", scope: !17, file: !3, line: 30, type: !21)
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !DILocation(line: 30, column: 6, scope: !17)
!23 = !DILocalVariable(name: "j", scope: !17, file: !3, line: 30, type: !21)
!24 = !DILocation(line: 30, column: 9, scope: !17)
!25 = !DILocation(line: 31, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !17, file: !3, line: 31, column: 2)
!27 = !DILocation(line: 31, column: 7, scope: !26)
!28 = !DILocation(line: 31, column: 14, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !3, line: 31, column: 2)
!30 = !DILocation(line: 31, column: 16, scope: !29)
!31 = !DILocation(line: 31, column: 2, scope: !26)
!32 = !DILocation(line: 33, column: 10, scope: !33)
!33 = distinct !DILexicalBlock(scope: !34, file: !3, line: 33, column: 3)
!34 = distinct !DILexicalBlock(scope: !29, file: !3, line: 32, column: 2)
!35 = !DILocation(line: 33, column: 8, scope: !33)
!36 = !DILocation(line: 33, column: 15, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !3, line: 33, column: 3)
!38 = !DILocation(line: 33, column: 17, scope: !37)
!39 = !DILocation(line: 33, column: 3, scope: !33)
!40 = !DILocation(line: 34, column: 23, scope: !37)
!41 = !DILocation(line: 34, column: 18, scope: !37)
!42 = !DILocation(line: 34, column: 26, scope: !37)
!43 = !DILocation(line: 34, column: 4, scope: !37)
!44 = !DILocation(line: 33, column: 23, scope: !37)
!45 = !DILocation(line: 33, column: 3, scope: !37)
!46 = distinct !{!46, !39, !47, !48}
!47 = !DILocation(line: 34, column: 28, scope: !33)
!48 = !{!"llvm.loop.mustprogress"}
!49 = !DILocation(line: 35, column: 3, scope: !34)
!50 = !DILocation(line: 36, column: 2, scope: !34)
!51 = !DILocation(line: 31, column: 22, scope: !29)
!52 = !DILocation(line: 31, column: 2, scope: !29)
!53 = distinct !{!53, !31, !54, !48}
!54 = !DILocation(line: 36, column: 2, scope: !26)
!55 = !DILocation(line: 37, column: 2, scope: !17)
!56 = !DILocation(line: 38, column: 1, scope: !17)
!57 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 41, type: !58, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DISubroutineType(types: !59)
!59 = !{!21, !21, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !3, line: 41, type: !21)
!63 = !DILocation(line: 41, column: 15, scope: !57)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !3, line: 41, type: !60)
!65 = !DILocation(line: 41, column: 27, scope: !57)
!66 = !DILocalVariable(name: "x", scope: !57, file: !3, line: 43, type: !21)
!67 = !DILocation(line: 43, column: 6, scope: !57)
!68 = !DILocalVariable(name: "y", scope: !57, file: !3, line: 43, type: !21)
!69 = !DILocation(line: 43, column: 9, scope: !57)
!70 = !DILocalVariable(name: "ox", scope: !57, file: !3, line: 44, type: !21)
!71 = !DILocation(line: 44, column: 6, scope: !57)
!72 = !DILocalVariable(name: "oy", scope: !57, file: !3, line: 44, type: !21)
!73 = !DILocation(line: 44, column: 10, scope: !57)
!74 = !DILocalVariable(name: "i", scope: !57, file: !3, line: 45, type: !21)
!75 = !DILocation(line: 45, column: 6, scope: !57)
!76 = !DILocalVariable(name: "program", scope: !57, file: !3, line: 47, type: !77)
!77 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 224, elements: !78)
!78 = !{!79}
!79 = !DISubrange(count: 28)
!80 = !DILocation(line: 47, column: 7, scope: !57)
!81 = !DILocation(line: 50, column: 4, scope: !57)
!82 = !DILocation(line: 51, column: 4, scope: !57)
!83 = !DILocation(line: 52, column: 7, scope: !57)
!84 = !DILocation(line: 52, column: 2, scope: !57)
!85 = !DILocation(line: 52, column: 10, scope: !57)
!86 = !DILocation(line: 52, column: 12, scope: !57)
!87 = !DILocation(line: 55, column: 2, scope: !57)
!88 = !DILocation(line: 56, column: 33, scope: !57)
!89 = !DILocation(line: 56, column: 36, scope: !57)
!90 = !DILocation(line: 56, column: 2, scope: !57)
!91 = !DILocation(line: 57, column: 31, scope: !57)
!92 = !DILocation(line: 57, column: 2, scope: !57)
!93 = !DILocation(line: 58, column: 2, scope: !57)
!94 = !DILocation(line: 59, column: 2, scope: !57)
!95 = !DILocation(line: 62, column: 2, scope: !57)
!96 = !DILocation(line: 65, column: 21, scope: !57)
!97 = !DILocation(line: 65, column: 2, scope: !57)
!98 = !DILocation(line: 68, column: 2, scope: !57)
!99 = !DILocation(line: 68, column: 8, scope: !57)
!100 = !DILocation(line: 68, column: 10, scope: !57)
!101 = !DILocation(line: 71, column: 8, scope: !102)
!102 = distinct !DILexicalBlock(scope: !57, file: !3, line: 69, column: 2)
!103 = !DILocation(line: 71, column: 6, scope: !102)
!104 = !DILocation(line: 72, column: 8, scope: !102)
!105 = !DILocation(line: 72, column: 6, scope: !102)
!106 = !DILocation(line: 75, column: 19, scope: !102)
!107 = !DILocation(line: 75, column: 11, scope: !102)
!108 = !DILocation(line: 75, column: 3, scope: !102)
!109 = !DILocation(line: 78, column: 6, scope: !110)
!110 = distinct !DILexicalBlock(scope: !102, file: !3, line: 76, column: 3)
!111 = !DILocation(line: 79, column: 5, scope: !110)
!112 = !DILocation(line: 81, column: 6, scope: !110)
!113 = !DILocation(line: 82, column: 5, scope: !110)
!114 = !DILocation(line: 84, column: 6, scope: !110)
!115 = !DILocation(line: 85, column: 5, scope: !110)
!116 = !DILocation(line: 87, column: 6, scope: !110)
!117 = !DILocation(line: 88, column: 5, scope: !110)
!118 = !DILocation(line: 90, column: 5, scope: !110)
!119 = !DILocation(line: 91, column: 5, scope: !110)
!120 = !DILocation(line: 92, column: 5, scope: !110)
!121 = !DILocation(line: 96, column: 12, scope: !122)
!122 = distinct !DILexicalBlock(scope: !102, file: !3, line: 96, column: 7)
!123 = !DILocation(line: 96, column: 7, scope: !122)
!124 = !DILocation(line: 96, column: 15, scope: !122)
!125 = !DILocation(line: 96, column: 18, scope: !122)
!126 = !DILocation(line: 96, column: 7, scope: !102)
!127 = !DILocation(line: 98, column: 4, scope: !128)
!128 = distinct !DILexicalBlock(scope: !122, file: !3, line: 97, column: 3)
!129 = !DILocation(line: 99, column: 37, scope: !128)
!130 = !DILocation(line: 99, column: 4, scope: !128)
!131 = !DILocation(line: 100, column: 4, scope: !128)
!132 = !DILocation(line: 104, column: 12, scope: !133)
!133 = distinct !DILexicalBlock(scope: !102, file: !3, line: 104, column: 7)
!134 = !DILocation(line: 104, column: 7, scope: !133)
!135 = !DILocation(line: 104, column: 15, scope: !133)
!136 = !DILocation(line: 104, column: 18, scope: !133)
!137 = !DILocation(line: 104, column: 25, scope: !133)
!138 = !DILocation(line: 105, column: 7, scope: !133)
!139 = !DILocation(line: 105, column: 9, scope: !133)
!140 = !DILocation(line: 105, column: 14, scope: !133)
!141 = !DILocation(line: 105, column: 22, scope: !133)
!142 = !DILocation(line: 105, column: 17, scope: !133)
!143 = !DILocation(line: 105, column: 25, scope: !133)
!144 = !DILocation(line: 105, column: 28, scope: !133)
!145 = !DILocation(line: 105, column: 35, scope: !133)
!146 = !DILocation(line: 105, column: 38, scope: !133)
!147 = !DILocation(line: 105, column: 40, scope: !133)
!148 = !DILocation(line: 105, column: 44, scope: !133)
!149 = !DILocation(line: 105, column: 47, scope: !133)
!150 = !DILocation(line: 105, column: 49, scope: !133)
!151 = !DILocation(line: 104, column: 7, scope: !102)
!152 = !DILocation(line: 107, column: 8, scope: !153)
!153 = distinct !DILexicalBlock(scope: !133, file: !3, line: 106, column: 3)
!154 = !DILocation(line: 107, column: 6, scope: !153)
!155 = !DILocation(line: 108, column: 8, scope: !153)
!156 = !DILocation(line: 108, column: 6, scope: !153)
!157 = !DILocation(line: 109, column: 3, scope: !153)
!158 = !DILocation(line: 112, column: 34, scope: !102)
!159 = !DILocation(line: 112, column: 37, scope: !102)
!160 = !DILocation(line: 112, column: 3, scope: !102)
!161 = !DILocation(line: 115, column: 4, scope: !102)
!162 = !DILocation(line: 115, column: 14, scope: !102)
!163 = !DILocation(line: 115, column: 6, scope: !102)
!164 = !DILocation(line: 115, column: 20, scope: !102)
!165 = !DILocation(line: 115, column: 24, scope: !102)
!166 = !DILocation(line: 115, column: 22, scope: !102)
!167 = !DILocation(line: 115, column: 26, scope: !102)
!168 = !DILocation(line: 115, column: 29, scope: !102)
!169 = !DILocation(line: 115, column: 33, scope: !102)
!170 = !DILocation(line: 115, column: 31, scope: !102)
!171 = !DILocation(line: 0, scope: !102)
!172 = !DILocation(line: 115, column: 19, scope: !102)
!173 = !DILocation(line: 113, column: 3, scope: !102)
!174 = !DILocation(line: 118, column: 7, scope: !175)
!175 = distinct !DILexicalBlock(scope: !102, file: !3, line: 118, column: 7)
!176 = !DILocation(line: 118, column: 11, scope: !175)
!177 = !DILocation(line: 118, column: 9, scope: !175)
!178 = !DILocation(line: 118, column: 13, scope: !175)
!179 = !DILocation(line: 118, column: 16, scope: !175)
!180 = !DILocation(line: 118, column: 20, scope: !175)
!181 = !DILocation(line: 118, column: 18, scope: !175)
!182 = !DILocation(line: 118, column: 7, scope: !102)
!183 = !DILocation(line: 119, column: 4, scope: !184)
!184 = distinct !DILexicalBlock(scope: !175, file: !3, line: 118, column: 22)
!185 = !DILocation(line: 120, column: 4, scope: !184)
!186 = !DILocation(line: 124, column: 8, scope: !102)
!187 = !DILocation(line: 124, column: 3, scope: !102)
!188 = !DILocation(line: 124, column: 11, scope: !102)
!189 = !DILocation(line: 124, column: 13, scope: !102)
!190 = !DILocation(line: 127, column: 3, scope: !102)
!191 = !DILocation(line: 130, column: 4, scope: !102)
!192 = !DILocation(line: 133, column: 3, scope: !102)
!193 = distinct !{!193, !98, !194, !48}
!194 = !DILocation(line: 134, column: 2, scope: !57)
!195 = !DILocation(line: 137, column: 2, scope: !57)
!196 = !DILocation(line: 139, column: 1, scope: !57)
