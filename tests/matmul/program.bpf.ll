; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "aarch64-unknown-linux"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca [100 x float], align 4
  %13 = alloca [100 x float], align 4
  %14 = alloca [100 x float], align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %20 = call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "=r,i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #2, !srcloc !6
  store ptr %20, ptr %3, align 8
  %21 = load ptr, ptr %3, align 8
  store ptr %21, ptr %4, align 8
  %22 = load ptr, ptr %4, align 8
  store ptr %22, ptr %2, align 8
  %23 = call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "=r,i,i,i,i"(i32 1, i32 0, i32 0, i32 0) #2, !srcloc !7
  store ptr %23, ptr %6, align 8
  %24 = load ptr, ptr %6, align 8
  store ptr %24, ptr %7, align 8
  %25 = load ptr, ptr %7, align 8
  store ptr %25, ptr %5, align 8
  %26 = call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "=r,i,i,i,i"(i32 2, i32 0, i32 0, i32 0) #2, !srcloc !8
  store ptr %26, ptr %9, align 8
  %27 = load ptr, ptr %9, align 8
  store ptr %27, ptr %10, align 8
  %28 = load ptr, ptr %10, align 8
  store ptr %28, ptr %8, align 8
  store i32 0, ptr %15, align 4
  br label %29

29:                                               ; preds = %47, %0
  %30 = load i32, ptr %15, align 4
  %31 = icmp slt i32 %30, 100
  br i1 %31, label %32, label %50

32:                                               ; preds = %29
  %33 = load ptr, ptr %2, align 8
  %34 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %33, ptr noundef %15)
  store ptr %34, ptr %11, align 8
  %35 = load ptr, ptr %11, align 8
  %36 = load float, ptr %35, align 4
  %37 = load i32, ptr %15, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [100 x float], ptr %12, i64 0, i64 %38
  store float %36, ptr %39, align 4
  %40 = load ptr, ptr %5, align 8
  %41 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %40, ptr noundef %15)
  store ptr %41, ptr %11, align 8
  %42 = load ptr, ptr %11, align 8
  %43 = load float, ptr %42, align 4
  %44 = load i32, ptr %15, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [100 x float], ptr %13, i64 0, i64 %45
  store float %43, ptr %46, align 4
  br label %47

47:                                               ; preds = %32
  %48 = load i32, ptr %15, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, ptr %15, align 4
  br label %29, !llvm.loop !9

50:                                               ; preds = %29
  store i32 0, ptr %16, align 4
  br label %51

51:                                               ; preds = %99, %50
  %52 = load i32, ptr %16, align 4
  %53 = icmp slt i32 %52, 10
  br i1 %53, label %54, label %102

54:                                               ; preds = %51
  store i32 0, ptr %17, align 4
  br label %55

55:                                               ; preds = %95, %54
  %56 = load i32, ptr %17, align 4
  %57 = icmp slt i32 %56, 10
  br i1 %57, label %58, label %98

58:                                               ; preds = %55
  %59 = load i32, ptr %16, align 4
  %60 = mul nsw i32 %59, 10
  %61 = load i32, ptr %17, align 4
  %62 = add nsw i32 %60, %61
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [100 x float], ptr %14, i64 0, i64 %63
  store float 0.000000e+00, ptr %64, align 4
  store i32 0, ptr %18, align 4
  br label %65

65:                                               ; preds = %91, %58
  %66 = load i32, ptr %18, align 4
  %67 = icmp slt i32 %66, 10
  br i1 %67, label %68, label %94

68:                                               ; preds = %65
  %69 = load i32, ptr %16, align 4
  %70 = mul nsw i32 %69, 10
  %71 = load i32, ptr %18, align 4
  %72 = add nsw i32 %70, %71
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [100 x float], ptr %12, i64 0, i64 %73
  %75 = load float, ptr %74, align 4
  %76 = load i32, ptr %18, align 4
  %77 = mul nsw i32 %76, 10
  %78 = load i32, ptr %17, align 4
  %79 = add nsw i32 %77, %78
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [100 x float], ptr %13, i64 0, i64 %80
  %82 = load float, ptr %81, align 4
  %83 = load i32, ptr %16, align 4
  %84 = mul nsw i32 %83, 10
  %85 = load i32, ptr %17, align 4
  %86 = add nsw i32 %84, %85
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [100 x float], ptr %14, i64 0, i64 %87
  %89 = load float, ptr %88, align 4
  %90 = call float @llvm.fmuladd.f32(float %75, float %82, float %89)
  store float %90, ptr %88, align 4
  br label %91

91:                                               ; preds = %68
  %92 = load i32, ptr %18, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, ptr %18, align 4
  br label %65, !llvm.loop !11

94:                                               ; preds = %65
  br label %95

95:                                               ; preds = %94
  %96 = load i32, ptr %17, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, ptr %17, align 4
  br label %55, !llvm.loop !12

98:                                               ; preds = %55
  br label %99

99:                                               ; preds = %98
  %100 = load i32, ptr %16, align 4
  %101 = add nsw i32 %100, 1
  store i32 %101, ptr %16, align 4
  br label %51, !llvm.loop !13

102:                                              ; preds = %51
  store i32 0, ptr %19, align 4
  br label %103

103:                                              ; preds = %112, %102
  %104 = load i32, ptr %19, align 4
  %105 = icmp slt i32 %104, 100
  br i1 %105, label %106, label %115

106:                                              ; preds = %103
  %107 = load ptr, ptr %8, align 8
  %108 = load i32, ptr %19, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [100 x float], ptr %14, i64 0, i64 %109
  %111 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %107, ptr noundef %19, ptr noundef %110, i64 noundef 0)
  br label %112

112:                                              ; preds = %106
  %113 = load i32, ptr %19, align 4
  %114 = add nsw i32 %113, 1
  store i32 %114, ptr %19, align 4
  br label %103, !llvm.loop !14

115:                                              ; preds = %103
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Homebrew clang version 21.1.2"}
!6 = !{i64 2147503614}
!7 = !{i64 2147504052}
!8 = !{i64 2147504490}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = distinct !{!14, !10}
