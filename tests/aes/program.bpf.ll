; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

@__const.main.block = private unnamed_addr constant [4 x [4 x i8]] [[4 x i8] c"\14\00\00\00", [4 x i8] zeroinitializer, [4 x i8] zeroinitializer, [4 x i8] zeroinitializer], align 1
@__const.main.key = private unnamed_addr constant <{ i8, [15 x i8] }> <{ i8 -122, [15 x i8] zeroinitializer }>, align 1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [4 x [4 x i8]], align 1
  %3 = alloca [16 x i8], align 1
  %4 = alloca [4 x [4 x i8]], align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8, align 1
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i8, align 1
  %12 = alloca i8, align 1
  store i32 0, ptr %1, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %2, ptr align 1 @__const.main.block, i64 16, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %3, ptr align 1 @__const.main.key, i64 16, i1 false)
  call void @llvm.memset.p0.i64(ptr align 1 %4, i8 0, i64 16, i1 false)
  store i32 0, ptr %5, align 4
  br label %13

13:                                               ; preds = %149, %0
  %14 = load i32, ptr %5, align 4
  %15 = icmp slt i32 %14, 1000
  br i1 %15, label %16, label %152

16:                                               ; preds = %13
  store i32 0, ptr %6, align 4
  br label %17

17:                                               ; preds = %47, %16
  %18 = load i32, ptr %6, align 4
  %19 = icmp slt i32 %18, 4
  br i1 %19, label %20, label %50

20:                                               ; preds = %17
  store i32 0, ptr %7, align 4
  br label %21

21:                                               ; preds = %43, %20
  %22 = load i32, ptr %7, align 4
  %23 = icmp slt i32 %22, 4
  br i1 %23, label %24, label %46

24:                                               ; preds = %21
  %25 = load i32, ptr %6, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [4 x [4 x i8]], ptr %4, i64 0, i64 %26
  %28 = load i32, ptr %7, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [4 x i8], ptr %27, i64 0, i64 %29
  %31 = load i8, ptr %30, align 1
  %32 = sext i8 %31 to i32
  %33 = load i32, ptr %6, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [4 x [4 x i8]], ptr %2, i64 0, i64 %34
  %36 = load i32, ptr %7, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [4 x i8], ptr %35, i64 0, i64 %37
  %39 = load i8, ptr %38, align 1
  %40 = sext i8 %39 to i32
  %41 = xor i32 %40, %32
  %42 = trunc i32 %41 to i8
  store i8 %42, ptr %38, align 1
  br label %43

43:                                               ; preds = %24
  %44 = load i32, ptr %7, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %7, align 4
  br label %21, !llvm.loop !3

46:                                               ; preds = %21
  br label %47

47:                                               ; preds = %46
  %48 = load i32, ptr %6, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, ptr %6, align 4
  br label %17, !llvm.loop !5

50:                                               ; preds = %17
  store i32 0, ptr %9, align 4
  br label %51

51:                                               ; preds = %80, %50
  %52 = load i32, ptr %9, align 4
  %53 = icmp slt i32 %52, 4
  br i1 %53, label %54, label %83

54:                                               ; preds = %51
  store i32 0, ptr %10, align 4
  br label %55

55:                                               ; preds = %76, %54
  %56 = load i32, ptr %10, align 4
  %57 = icmp slt i32 %56, 4
  br i1 %57, label %58, label %79

58:                                               ; preds = %55
  %59 = load i32, ptr %9, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [4 x [4 x i8]], ptr %2, i64 0, i64 %60
  %62 = load i32, ptr %10, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [4 x i8], ptr %61, i64 0, i64 %63
  %65 = load i8, ptr %64, align 1
  store i8 %65, ptr %8, align 1
  %66 = load i8, ptr %8, align 1
  %67 = sext i8 %66 to i64
  %68 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 %67
  %69 = load i8, ptr %68, align 1
  %70 = load i32, ptr %9, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [4 x [4 x i8]], ptr %2, i64 0, i64 %71
  %73 = load i32, ptr %10, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [4 x i8], ptr %72, i64 0, i64 %74
  store i8 %69, ptr %75, align 1
  br label %76

76:                                               ; preds = %58
  %77 = load i32, ptr %10, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, ptr %10, align 4
  br label %55, !llvm.loop !6

79:                                               ; preds = %55
  br label %80

80:                                               ; preds = %79
  %81 = load i32, ptr %9, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, ptr %9, align 4
  br label %51, !llvm.loop !7

83:                                               ; preds = %51
  %84 = getelementptr inbounds [4 x [4 x i8]], ptr %2, i64 0, i64 0
  %85 = getelementptr inbounds [4 x i8], ptr %84, i64 0, i64 1
  %86 = load i8, ptr %85, align 1
  store i8 %86, ptr %11, align 1
  %87 = getelementptr inbounds [4 x [4 x i8]], ptr %2, i64 0, i64 1
  %88 = getelementptr inbounds [4 x i8], ptr %87, i64 0, i64 1
  %89 = load i8, ptr %88, align 1
  %90 = getelementptr inbounds [4 x [4 x i8]], ptr %2, i64 0, i64 0
  %91 = getelementptr inbounds [4 x i8], ptr %90, i64 0, i64 1
  store i8 %89, ptr %91, align 1
  %92 = getelementptr inbounds [4 x [4 x i8]], ptr %2, i64 0, i64 2
  %93 = getelementptr inbounds [4 x i8], ptr %92, i64 0, i64 1
  %94 = load i8, ptr %93, align 1
  %95 = getelementptr inbounds [4 x [4 x i8]], ptr %2, i64 0, i64 1
  %96 = getelementptr inbounds [4 x i8], ptr %95, i64 0, i64 1
  store i8 %94, ptr %96, align 1
  %97 = getelementptr inbounds [4 x [4 x i8]], ptr %2, i64 0, i64 3
  %98 = getelementptr inbounds [4 x i8], ptr %97, i64 0, i64 1
  %99 = load i8, ptr %98, align 1
  %100 = getelementptr inbounds [4 x [4 x i8]], ptr %2, i64 0, i64 2
  %101 = getelementptr inbounds [4 x i8], ptr %100, i64 0, i64 1
  store i8 %99, ptr %101, align 1
  %102 = load i8, ptr %11, align 1
  %103 = getelementptr inbounds [4 x [4 x i8]], ptr %2, i64 0, i64 3
  %104 = getelementptr inbounds [4 x i8], ptr %103, i64 0, i64 1
  store i8 %102, ptr %104, align 1
  %105 = getelementptr inbounds [4 x [4 x i8]], ptr %2, i64 0, i64 0
  %106 = getelementptr inbounds [4 x i8], ptr %105, i64 0, i64 2
  %107 = load i8, ptr %106, align 1
  store i8 %107, ptr %11, align 1
  %108 = getelementptr inbounds [4 x [4 x i8]], ptr %2, i64 0, i64 1
  %109 = getelementptr inbounds [4 x i8], ptr %108, i64 0, i64 2
  %110 = load i8, ptr %109, align 1
  store i8 %110, ptr %12, align 1
  %111 = getelementptr inbounds [4 x [4 x i8]], ptr %2, i64 0, i64 2
  %112 = getelementptr inbounds [4 x i8], ptr %111, i64 0, i64 2
  %113 = load i8, ptr %112, align 1
  %114 = getelementptr inbounds [4 x [4 x i8]], ptr %2, i64 0, i64 0
  %115 = getelementptr inbounds [4 x i8], ptr %114, i64 0, i64 2
  store i8 %113, ptr %115, align 1
  %116 = getelementptr inbounds [4 x [4 x i8]], ptr %2, i64 0, i64 3
  %117 = getelementptr inbounds [4 x i8], ptr %116, i64 0, i64 2
  %118 = load i8, ptr %117, align 1
  %119 = getelementptr inbounds [4 x [4 x i8]], ptr %2, i64 0, i64 1
  %120 = getelementptr inbounds [4 x i8], ptr %119, i64 0, i64 2
  store i8 %118, ptr %120, align 1
  %121 = load i8, ptr %11, align 1
  %122 = getelementptr inbounds [4 x [4 x i8]], ptr %2, i64 0, i64 2
  %123 = getelementptr inbounds [4 x i8], ptr %122, i64 0, i64 2
  store i8 %121, ptr %123, align 1
  %124 = load i8, ptr %12, align 1
  %125 = getelementptr inbounds [4 x [4 x i8]], ptr %2, i64 0, i64 3
  %126 = getelementptr inbounds [4 x i8], ptr %125, i64 0, i64 2
  store i8 %124, ptr %126, align 1
  %127 = getelementptr inbounds [4 x [4 x i8]], ptr %2, i64 0, i64 3
  %128 = getelementptr inbounds [4 x i8], ptr %127, i64 0, i64 3
  %129 = load i8, ptr %128, align 1
  store i8 %129, ptr %11, align 1
  %130 = getelementptr inbounds [4 x [4 x i8]], ptr %2, i64 0, i64 2
  %131 = getelementptr inbounds [4 x i8], ptr %130, i64 0, i64 3
  %132 = load i8, ptr %131, align 1
  %133 = getelementptr inbounds [4 x [4 x i8]], ptr %2, i64 0, i64 3
  %134 = getelementptr inbounds [4 x i8], ptr %133, i64 0, i64 3
  store i8 %132, ptr %134, align 1
  %135 = getelementptr inbounds [4 x [4 x i8]], ptr %2, i64 0, i64 1
  %136 = getelementptr inbounds [4 x i8], ptr %135, i64 0, i64 3
  %137 = load i8, ptr %136, align 1
  %138 = getelementptr inbounds [4 x [4 x i8]], ptr %2, i64 0, i64 2
  %139 = getelementptr inbounds [4 x i8], ptr %138, i64 0, i64 3
  store i8 %137, ptr %139, align 1
  %140 = getelementptr inbounds [4 x [4 x i8]], ptr %2, i64 0, i64 0
  %141 = getelementptr inbounds [4 x i8], ptr %140, i64 0, i64 3
  %142 = load i8, ptr %141, align 1
  %143 = getelementptr inbounds [4 x [4 x i8]], ptr %2, i64 0, i64 1
  %144 = getelementptr inbounds [4 x i8], ptr %143, i64 0, i64 3
  store i8 %142, ptr %144, align 1
  %145 = load i8, ptr %11, align 1
  %146 = getelementptr inbounds [4 x [4 x i8]], ptr %2, i64 0, i64 0
  %147 = getelementptr inbounds [4 x i8], ptr %146, i64 0, i64 3
  store i8 %145, ptr %147, align 1
  %148 = getelementptr inbounds [4 x [4 x i8]], ptr %2, i64 0, i64 0
  call void @AES_MixColumns(ptr noundef %148)
  br label %149

149:                                              ; preds = %83
  %150 = load i32, ptr %5, align 4
  %151 = add nsw i32 %150, 1
  store i32 %151, ptr %5, align 4
  br label %13, !llvm.loop !8

152:                                              ; preds = %13
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @AES_MixColumns(ptr noundef) #3

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="duotronic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="duotronic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 755f040f24df9a74f4e5f7f7bdd64e3acd4e61b9)"}
!3 = distinct !{!3, !4}
!4 = !{!"llvm.loop.mustprogress"}
!5 = distinct !{!5, !4}
!6 = distinct !{!6, !4}
!7 = distinct !{!7, !4}
!8 = distinct !{!8, !4}
