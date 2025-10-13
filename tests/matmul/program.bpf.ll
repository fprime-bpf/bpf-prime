; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca [16 x float], align 4
  %2 = alloca [16 x float], align 4
  %3 = alloca [16 x float], align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #4, !srcloc !3
  %7 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 1, i32 0, i32 0, i32 0) #4, !srcloc !4
  %8 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 2, i32 0, i32 0, i32 0) #4, !srcloc !5
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %1) #4
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %2) #4
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %3) #4
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #4
  store i32 0, ptr %4, align 4, !tbaa !6
  br label %151

9:                                                ; preds = %151
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #4
  %10 = load float, ptr %2, align 4, !tbaa !10
  %11 = getelementptr inbounds nuw i8, ptr %2, i64 60
  %12 = load float, ptr %11, align 4, !tbaa !10
  %13 = getelementptr inbounds nuw i8, ptr %2, i64 44
  %14 = load float, ptr %13, align 4, !tbaa !10
  %15 = getelementptr inbounds nuw i8, ptr %2, i64 28
  %16 = load float, ptr %15, align 4, !tbaa !10
  %17 = getelementptr inbounds nuw i8, ptr %2, i64 12
  %18 = load float, ptr %17, align 4, !tbaa !10
  %19 = getelementptr inbounds nuw i8, ptr %2, i64 56
  %20 = load float, ptr %19, align 4, !tbaa !10
  %21 = getelementptr inbounds nuw i8, ptr %2, i64 40
  %22 = load float, ptr %21, align 4, !tbaa !10
  %23 = getelementptr inbounds nuw i8, ptr %2, i64 24
  %24 = load float, ptr %23, align 4, !tbaa !10
  %25 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %26 = load float, ptr %25, align 4, !tbaa !10
  %27 = getelementptr inbounds nuw i8, ptr %2, i64 52
  %28 = load float, ptr %27, align 4, !tbaa !10
  %29 = getelementptr inbounds nuw i8, ptr %2, i64 36
  %30 = load float, ptr %29, align 4, !tbaa !10
  %31 = getelementptr inbounds nuw i8, ptr %2, i64 20
  %32 = load float, ptr %31, align 4, !tbaa !10
  %33 = getelementptr inbounds nuw i8, ptr %2, i64 4
  %34 = load float, ptr %33, align 4, !tbaa !10
  %35 = getelementptr inbounds nuw i8, ptr %2, i64 48
  %36 = load float, ptr %35, align 4, !tbaa !10
  %37 = getelementptr inbounds nuw i8, ptr %2, i64 32
  %38 = load float, ptr %37, align 4, !tbaa !10
  %39 = getelementptr inbounds nuw i8, ptr %2, i64 16
  %40 = load float, ptr %39, align 4, !tbaa !10
  %41 = load float, ptr %1, align 4, !tbaa !10
  %42 = call float @llvm.fmuladd.f32(float %41, float %10, float 0.000000e+00)
  %43 = getelementptr inbounds nuw i8, ptr %1, i64 4
  %44 = load float, ptr %43, align 4, !tbaa !10
  %45 = call float @llvm.fmuladd.f32(float %44, float %40, float %42)
  %46 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %47 = load float, ptr %46, align 4, !tbaa !10
  %48 = call float @llvm.fmuladd.f32(float %47, float %38, float %45)
  %49 = getelementptr inbounds nuw i8, ptr %1, i64 12
  %50 = load float, ptr %49, align 4, !tbaa !10
  %51 = call float @llvm.fmuladd.f32(float %50, float %36, float %48)
  store float %51, ptr %3, align 4, !tbaa !10
  %52 = getelementptr inbounds nuw i8, ptr %3, i64 4
  %53 = call float @llvm.fmuladd.f32(float %41, float %34, float 0.000000e+00)
  %54 = call float @llvm.fmuladd.f32(float %44, float %32, float %53)
  %55 = call float @llvm.fmuladd.f32(float %47, float %30, float %54)
  %56 = call float @llvm.fmuladd.f32(float %50, float %28, float %55)
  store float %56, ptr %52, align 4, !tbaa !10
  %57 = getelementptr inbounds nuw i8, ptr %3, i64 8
  %58 = call float @llvm.fmuladd.f32(float %41, float %26, float 0.000000e+00)
  %59 = call float @llvm.fmuladd.f32(float %44, float %24, float %58)
  %60 = call float @llvm.fmuladd.f32(float %47, float %22, float %59)
  %61 = call float @llvm.fmuladd.f32(float %50, float %20, float %60)
  store float %61, ptr %57, align 4, !tbaa !10
  %62 = getelementptr inbounds nuw i8, ptr %3, i64 12
  %63 = call float @llvm.fmuladd.f32(float %41, float %18, float 0.000000e+00)
  %64 = call float @llvm.fmuladd.f32(float %44, float %16, float %63)
  %65 = call float @llvm.fmuladd.f32(float %47, float %14, float %64)
  %66 = call float @llvm.fmuladd.f32(float %50, float %12, float %65)
  store float %66, ptr %62, align 4, !tbaa !10
  %67 = getelementptr inbounds nuw i8, ptr %1, i64 16
  %68 = getelementptr inbounds nuw i8, ptr %3, i64 16
  %69 = load float, ptr %67, align 4, !tbaa !10
  %70 = call float @llvm.fmuladd.f32(float %69, float %10, float 0.000000e+00)
  %71 = getelementptr inbounds nuw i8, ptr %1, i64 20
  %72 = load float, ptr %71, align 4, !tbaa !10
  %73 = call float @llvm.fmuladd.f32(float %72, float %40, float %70)
  %74 = getelementptr inbounds nuw i8, ptr %1, i64 24
  %75 = load float, ptr %74, align 4, !tbaa !10
  %76 = call float @llvm.fmuladd.f32(float %75, float %38, float %73)
  %77 = getelementptr inbounds nuw i8, ptr %1, i64 28
  %78 = load float, ptr %77, align 4, !tbaa !10
  %79 = call float @llvm.fmuladd.f32(float %78, float %36, float %76)
  store float %79, ptr %68, align 4, !tbaa !10
  %80 = getelementptr inbounds nuw i8, ptr %3, i64 20
  %81 = call float @llvm.fmuladd.f32(float %69, float %34, float 0.000000e+00)
  %82 = call float @llvm.fmuladd.f32(float %72, float %32, float %81)
  %83 = call float @llvm.fmuladd.f32(float %75, float %30, float %82)
  %84 = call float @llvm.fmuladd.f32(float %78, float %28, float %83)
  store float %84, ptr %80, align 4, !tbaa !10
  %85 = getelementptr inbounds nuw i8, ptr %3, i64 24
  %86 = call float @llvm.fmuladd.f32(float %69, float %26, float 0.000000e+00)
  %87 = call float @llvm.fmuladd.f32(float %72, float %24, float %86)
  %88 = call float @llvm.fmuladd.f32(float %75, float %22, float %87)
  %89 = call float @llvm.fmuladd.f32(float %78, float %20, float %88)
  store float %89, ptr %85, align 4, !tbaa !10
  %90 = getelementptr inbounds nuw i8, ptr %3, i64 28
  %91 = call float @llvm.fmuladd.f32(float %69, float %18, float 0.000000e+00)
  %92 = call float @llvm.fmuladd.f32(float %72, float %16, float %91)
  %93 = call float @llvm.fmuladd.f32(float %75, float %14, float %92)
  %94 = call float @llvm.fmuladd.f32(float %78, float %12, float %93)
  store float %94, ptr %90, align 4, !tbaa !10
  %95 = getelementptr inbounds nuw i8, ptr %1, i64 32
  %96 = getelementptr inbounds nuw i8, ptr %3, i64 32
  %97 = load float, ptr %95, align 4, !tbaa !10
  %98 = call float @llvm.fmuladd.f32(float %97, float %10, float 0.000000e+00)
  %99 = getelementptr inbounds nuw i8, ptr %1, i64 36
  %100 = load float, ptr %99, align 4, !tbaa !10
  %101 = call float @llvm.fmuladd.f32(float %100, float %40, float %98)
  %102 = getelementptr inbounds nuw i8, ptr %1, i64 40
  %103 = load float, ptr %102, align 4, !tbaa !10
  %104 = call float @llvm.fmuladd.f32(float %103, float %38, float %101)
  %105 = getelementptr inbounds nuw i8, ptr %1, i64 44
  %106 = load float, ptr %105, align 4, !tbaa !10
  %107 = call float @llvm.fmuladd.f32(float %106, float %36, float %104)
  store float %107, ptr %96, align 4, !tbaa !10
  %108 = getelementptr inbounds nuw i8, ptr %3, i64 36
  %109 = call float @llvm.fmuladd.f32(float %97, float %34, float 0.000000e+00)
  %110 = call float @llvm.fmuladd.f32(float %100, float %32, float %109)
  %111 = call float @llvm.fmuladd.f32(float %103, float %30, float %110)
  %112 = call float @llvm.fmuladd.f32(float %106, float %28, float %111)
  store float %112, ptr %108, align 4, !tbaa !10
  %113 = getelementptr inbounds nuw i8, ptr %3, i64 40
  %114 = call float @llvm.fmuladd.f32(float %97, float %26, float 0.000000e+00)
  %115 = call float @llvm.fmuladd.f32(float %100, float %24, float %114)
  %116 = call float @llvm.fmuladd.f32(float %103, float %22, float %115)
  %117 = call float @llvm.fmuladd.f32(float %106, float %20, float %116)
  store float %117, ptr %113, align 4, !tbaa !10
  %118 = getelementptr inbounds nuw i8, ptr %3, i64 44
  %119 = call float @llvm.fmuladd.f32(float %97, float %18, float 0.000000e+00)
  %120 = call float @llvm.fmuladd.f32(float %100, float %16, float %119)
  %121 = call float @llvm.fmuladd.f32(float %103, float %14, float %120)
  %122 = call float @llvm.fmuladd.f32(float %106, float %12, float %121)
  store float %122, ptr %118, align 4, !tbaa !10
  %123 = getelementptr inbounds nuw i8, ptr %1, i64 48
  %124 = getelementptr inbounds nuw i8, ptr %3, i64 48
  %125 = load float, ptr %123, align 4, !tbaa !10
  %126 = call float @llvm.fmuladd.f32(float %125, float %10, float 0.000000e+00)
  %127 = getelementptr inbounds nuw i8, ptr %1, i64 52
  %128 = load float, ptr %127, align 4, !tbaa !10
  %129 = call float @llvm.fmuladd.f32(float %128, float %40, float %126)
  %130 = getelementptr inbounds nuw i8, ptr %1, i64 56
  %131 = load float, ptr %130, align 4, !tbaa !10
  %132 = call float @llvm.fmuladd.f32(float %131, float %38, float %129)
  %133 = getelementptr inbounds nuw i8, ptr %1, i64 60
  %134 = load float, ptr %133, align 4, !tbaa !10
  %135 = call float @llvm.fmuladd.f32(float %134, float %36, float %132)
  store float %135, ptr %124, align 4, !tbaa !10
  %136 = getelementptr inbounds nuw i8, ptr %3, i64 52
  %137 = call float @llvm.fmuladd.f32(float %125, float %34, float 0.000000e+00)
  %138 = call float @llvm.fmuladd.f32(float %128, float %32, float %137)
  %139 = call float @llvm.fmuladd.f32(float %131, float %30, float %138)
  %140 = call float @llvm.fmuladd.f32(float %134, float %28, float %139)
  store float %140, ptr %136, align 4, !tbaa !10
  %141 = getelementptr inbounds nuw i8, ptr %3, i64 56
  %142 = call float @llvm.fmuladd.f32(float %125, float %26, float 0.000000e+00)
  %143 = call float @llvm.fmuladd.f32(float %128, float %24, float %142)
  %144 = call float @llvm.fmuladd.f32(float %131, float %22, float %143)
  %145 = call float @llvm.fmuladd.f32(float %134, float %20, float %144)
  store float %145, ptr %141, align 4, !tbaa !10
  %146 = getelementptr inbounds nuw i8, ptr %3, i64 60
  %147 = call float @llvm.fmuladd.f32(float %125, float %18, float 0.000000e+00)
  %148 = call float @llvm.fmuladd.f32(float %128, float %16, float %147)
  %149 = call float @llvm.fmuladd.f32(float %131, float %14, float %148)
  %150 = call float @llvm.fmuladd.f32(float %134, float %12, float %149)
  store float %150, ptr %146, align 4, !tbaa !10
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %5) #4
  store i32 0, ptr %5, align 4, !tbaa !6
  br label %165

151:                                              ; preds = %0, %151
  %152 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %6, ptr noundef nonnull %4) #4
  %153 = load float, ptr %152, align 4, !tbaa !10
  %154 = load i32, ptr %4, align 4, !tbaa !6
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds [16 x float], ptr %1, i64 0, i64 %155
  store float %153, ptr %156, align 4, !tbaa !10
  %157 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %7, ptr noundef nonnull %4) #4
  %158 = load float, ptr %157, align 4, !tbaa !10
  %159 = load i32, ptr %4, align 4, !tbaa !6
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds [16 x float], ptr %2, i64 0, i64 %160
  store float %158, ptr %161, align 4, !tbaa !10
  %162 = add nsw i32 %159, 1
  store i32 %162, ptr %4, align 4, !tbaa !6
  %163 = icmp slt i32 %159, 15
  br i1 %163, label %151, label %9, !llvm.loop !12

164:                                              ; preds = %165
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %5) #4
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %3) #4
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %2) #4
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %1) #4
  ret i32 0

165:                                              ; preds = %9, %165
  %166 = phi i32 [ 0, %9 ], [ %172, %165 ]
  %167 = call i32 @llvm.bpf.passthrough.i32.i32(i32 0, i32 %166)
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds [16 x float], ptr %3, i64 0, i64 %168
  %170 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %8, ptr noundef nonnull %5, ptr noundef nonnull %169, i64 noundef 0) #4
  %171 = load i32, ptr %5, align 4, !tbaa !6
  %172 = add nsw i32 %171, 1
  store i32 %172, ptr %5, align 4, !tbaa !6
  %173 = icmp slt i32 %171, 15
  br i1 %173, label %165, label %164, !llvm.loop !14
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: nounwind memory(none)
declare i32 @llvm.bpf.passthrough.i32.i32(i32, i32) #3

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="duotronic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nounwind memory(none) }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 755f040f24df9a74f4e5f7f7bdd64e3acd4e61b9)"}
!3 = !{i64 2147502065}
!4 = !{i64 2147502577}
!5 = !{i64 2147503089}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !8, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
