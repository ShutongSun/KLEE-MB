; ModuleID = 'for_loop.bc'
source_filename = "for_loop.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"times\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @repeatPrint(i32 %0) #0 !dbg !9 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.declare(metadata i32* %3, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 0, i32* %3, align 4, !dbg !16
  call void @llvm.dbg.declare(metadata i32* %4, metadata !17, metadata !DIExpression()), !dbg !19
  store i32 1, i32* %4, align 4, !dbg !19
  br label %5, !dbg !20

5:                                                ; preds = %12, %1
  %6 = load i32, i32* %4, align 4, !dbg !21
  %7 = load i32, i32* %2, align 4, !dbg !23
  %8 = icmp sle i32 %6, %7, !dbg !24
  br i1 %8, label %9, label %15, !dbg !25

9:                                                ; preds = %5
  %10 = load i32, i32* %3, align 4, !dbg !26
  %11 = add nsw i32 %10, 1, !dbg !28
  store i32 %11, i32* %3, align 4, !dbg !29
  br label %12, !dbg !30

12:                                               ; preds = %9
  %13 = load i32, i32* %4, align 4, !dbg !31
  %14 = add nsw i32 %13, 1, !dbg !31
  store i32 %14, i32* %4, align 4, !dbg !31
  br label %5, !dbg !32, !llvm.loop !33

15:                                               ; preds = %5
  %16 = load i32, i32* %3, align 4, !dbg !36
  ret i32 %16, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !38 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !41, metadata !DIExpression()), !dbg !42
  %3 = bitcast i32* %2 to i8*, !dbg !43
  call void @klee_make_symbolic(i8* %3, i64 4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0)), !dbg !44
  %4 = load i32, i32* %2, align 4, !dbg !45
  %5 = call i32 @repeatPrint(i32 %4), !dbg !46
  ret i32 %5, !dbg !47
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "for_loop.c", directory: "/home/stu221425/klee/klee/work/for_loop")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Ubuntu clang version 13.0.1-2ubuntu2.2"}
!9 = distinct !DISubprogram(name: "repeatPrint", scope: !1, file: !1, line: 3, type: !10, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12, !12}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "count", arg: 1, scope: !9, file: !1, line: 3, type: !12)
!14 = !DILocation(line: 3, column: 21, scope: !9)
!15 = !DILocalVariable(name: "a", scope: !9, file: !1, line: 4, type: !12)
!16 = !DILocation(line: 4, column: 9, scope: !9)
!17 = !DILocalVariable(name: "i", scope: !18, file: !1, line: 5, type: !12)
!18 = distinct !DILexicalBlock(scope: !9, file: !1, line: 5, column: 5)
!19 = !DILocation(line: 5, column: 14, scope: !18)
!20 = !DILocation(line: 5, column: 10, scope: !18)
!21 = !DILocation(line: 5, column: 21, scope: !22)
!22 = distinct !DILexicalBlock(scope: !18, file: !1, line: 5, column: 5)
!23 = !DILocation(line: 5, column: 26, scope: !22)
!24 = !DILocation(line: 5, column: 23, scope: !22)
!25 = !DILocation(line: 5, column: 5, scope: !18)
!26 = !DILocation(line: 6, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !22, file: !1, line: 5, column: 38)
!28 = !DILocation(line: 6, column: 15, scope: !27)
!29 = !DILocation(line: 6, column: 11, scope: !27)
!30 = !DILocation(line: 7, column: 5, scope: !27)
!31 = !DILocation(line: 5, column: 34, scope: !22)
!32 = !DILocation(line: 5, column: 5, scope: !22)
!33 = distinct !{!33, !25, !34, !35}
!34 = !DILocation(line: 7, column: 5, scope: !18)
!35 = !{!"llvm.loop.mustprogress"}
!36 = !DILocation(line: 8, column: 12, scope: !9)
!37 = !DILocation(line: 8, column: 5, scope: !9)
!38 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 11, type: !39, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DISubroutineType(types: !40)
!40 = !{!12}
!41 = !DILocalVariable(name: "times", scope: !38, file: !1, line: 12, type: !12)
!42 = !DILocation(line: 12, column: 9, scope: !38)
!43 = !DILocation(line: 13, column: 24, scope: !38)
!44 = !DILocation(line: 13, column: 5, scope: !38)
!45 = !DILocation(line: 14, column: 24, scope: !38)
!46 = !DILocation(line: 14, column: 12, scope: !38)
!47 = !DILocation(line: 14, column: 5, scope: !38)
