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
  br label %167

9:                                                ; preds = %167
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #4
  %10 = load float, ptr %1, align 4, !tbaa !10
  %11 = load float, ptr %2, align 4, !tbaa !10
  %12 = call float @llvm.fmuladd.f32(float %10, float %11, float 0.000000e+00)
  %13 = getelementptr inbounds nuw i8, ptr %1, i64 4
  %14 = load float, ptr %13, align 4, !tbaa !10
  %15 = getelementptr inbounds nuw i8, ptr %2, i64 16
  %16 = load float, ptr %15, align 4, !tbaa !10
  %17 = call float @llvm.fmuladd.f32(float %14, float %16, float %12)
  %18 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %19 = load float, ptr %18, align 4, !tbaa !10
  %20 = getelementptr inbounds nuw i8, ptr %2, i64 32
  %21 = load float, ptr %20, align 4, !tbaa !10
  %22 = call float @llvm.fmuladd.f32(float %19, float %21, float %17)
  %23 = getelementptr inbounds nuw i8, ptr %1, i64 12
  %24 = load float, ptr %23, align 4, !tbaa !10
  %25 = getelementptr inbounds nuw i8, ptr %2, i64 48
  %26 = load float, ptr %25, align 4, !tbaa !10
  %27 = call float @llvm.fmuladd.f32(float %24, float %26, float %22)
  store float %27, ptr %3, align 4, !tbaa !10
  %28 = getelementptr inbounds nuw i8, ptr %3, i64 4
  %29 = getelementptr inbounds nuw i8, ptr %2, i64 4
  %30 = load float, ptr %29, align 4, !tbaa !10
  %31 = call float @llvm.fmuladd.f32(float %10, float %30, float 0.000000e+00)
  %32 = getelementptr inbounds nuw i8, ptr %2, i64 20
  %33 = load float, ptr %32, align 4, !tbaa !10
  %34 = call float @llvm.fmuladd.f32(float %14, float %33, float %31)
  %35 = getelementptr inbounds nuw i8, ptr %2, i64 36
  %36 = load float, ptr %35, align 4, !tbaa !10
  %37 = call float @llvm.fmuladd.f32(float %19, float %36, float %34)
  %38 = getelementptr inbounds nuw i8, ptr %2, i64 52
  %39 = load float, ptr %38, align 4, !tbaa !10
  %40 = call float @llvm.fmuladd.f32(float %24, float %39, float %37)
  store float %40, ptr %28, align 4, !tbaa !10
  %41 = getelementptr inbounds nuw i8, ptr %3, i64 8
  %42 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %43 = load float, ptr %42, align 4, !tbaa !10
  %44 = call float @llvm.fmuladd.f32(float %10, float %43, float 0.000000e+00)
  %45 = getelementptr inbounds nuw i8, ptr %2, i64 24
  %46 = load float, ptr %45, align 4, !tbaa !10
  %47 = call float @llvm.fmuladd.f32(float %14, float %46, float %44)
  %48 = getelementptr inbounds nuw i8, ptr %2, i64 40
  %49 = load float, ptr %48, align 4, !tbaa !10
  %50 = call float @llvm.fmuladd.f32(float %19, float %49, float %47)
  %51 = getelementptr inbounds nuw i8, ptr %2, i64 56
  %52 = load float, ptr %51, align 4, !tbaa !10
  %53 = call float @llvm.fmuladd.f32(float %24, float %52, float %50)
  store float %53, ptr %41, align 4, !tbaa !10
  %54 = getelementptr inbounds nuw i8, ptr %3, i64 12
  %55 = getelementptr inbounds nuw i8, ptr %2, i64 12
  %56 = load float, ptr %55, align 4, !tbaa !10
  %57 = call float @llvm.fmuladd.f32(float %10, float %56, float 0.000000e+00)
  %58 = getelementptr inbounds nuw i8, ptr %2, i64 28
  %59 = load float, ptr %58, align 4, !tbaa !10
  %60 = call float @llvm.fmuladd.f32(float %14, float %59, float %57)
  %61 = getelementptr inbounds nuw i8, ptr %2, i64 44
  %62 = load float, ptr %61, align 4, !tbaa !10
  %63 = call float @llvm.fmuladd.f32(float %19, float %62, float %60)
  %64 = getelementptr inbounds nuw i8, ptr %2, i64 60
  %65 = load float, ptr %64, align 4, !tbaa !10
  %66 = call float @llvm.fmuladd.f32(float %24, float %65, float %63)
  store float %66, ptr %54, align 4, !tbaa !10
  %67 = getelementptr inbounds nuw i8, ptr %1, i64 16
  %68 = getelementptr inbounds nuw i8, ptr %3, i64 16
  %69 = load float, ptr %67, align 4, !tbaa !10
  %70 = call float @llvm.fmuladd.f32(float %69, float %11, float 0.000000e+00)
  %71 = getelementptr inbounds nuw i8, ptr %1, i64 20
  %72 = load float, ptr %71, align 4, !tbaa !10
  %73 = call float @llvm.fmuladd.f32(float %72, float %16, float %70)
  %74 = getelementptr inbounds nuw i8, ptr %1, i64 24
  %75 = load float, ptr %74, align 4, !tbaa !10
  %76 = call float @llvm.fmuladd.f32(float %75, float %21, float %73)
  %77 = getelementptr inbounds nuw i8, ptr %1, i64 28
  %78 = load float, ptr %77, align 4, !tbaa !10
  %79 = call float @llvm.fmuladd.f32(float %78, float %26, float %76)
  store float %79, ptr %68, align 4, !tbaa !10
  %80 = getelementptr inbounds nuw i8, ptr %3, i64 20
  %81 = call float @llvm.fmuladd.f32(float %69, float %30, float 0.000000e+00)
  %82 = call float @llvm.fmuladd.f32(float %72, float %33, float %81)
  %83 = call float @llvm.fmuladd.f32(float %75, float %36, float %82)
  %84 = call float @llvm.fmuladd.f32(float %78, float %39, float %83)
  store float %84, ptr %80, align 4, !tbaa !10
  %85 = getelementptr inbounds nuw i8, ptr %3, i64 24
  %86 = call float @llvm.fmuladd.f32(float %69, float %43, float 0.000000e+00)
  %87 = call float @llvm.fmuladd.f32(float %72, float %46, float %86)
  %88 = call float @llvm.fmuladd.f32(float %75, float %49, float %87)
  %89 = call float @llvm.fmuladd.f32(float %78, float %52, float %88)
  store float %89, ptr %85, align 4, !tbaa !10
  %90 = getelementptr inbounds nuw i8, ptr %3, i64 28
  %91 = call float @llvm.fmuladd.f32(float %69, float %56, float 0.000000e+00)
  %92 = call float @llvm.fmuladd.f32(float %72, float %59, float %91)
  %93 = call float @llvm.fmuladd.f32(float %75, float %62, float %92)
  %94 = call float @llvm.fmuladd.f32(float %78, float %65, float %93)
  store float %94, ptr %90, align 4, !tbaa !10
  %95 = getelementptr inbounds nuw i8, ptr %1, i64 32
  %96 = getelementptr inbounds nuw i8, ptr %3, i64 32
  %97 = load float, ptr %95, align 4, !tbaa !10
  %98 = load float, ptr %2, align 4, !tbaa !10
  %99 = call float @llvm.fmuladd.f32(float %97, float %98, float 0.000000e+00)
  %100 = getelementptr inbounds nuw i8, ptr %1, i64 36
  %101 = load float, ptr %100, align 4, !tbaa !10
  %102 = load float, ptr %15, align 4, !tbaa !10
  %103 = call float @llvm.fmuladd.f32(float %101, float %102, float %99)
  %104 = getelementptr inbounds nuw i8, ptr %1, i64 40
  %105 = load float, ptr %104, align 4, !tbaa !10
  %106 = load float, ptr %20, align 4, !tbaa !10
  %107 = call float @llvm.fmuladd.f32(float %105, float %106, float %103)
  %108 = getelementptr inbounds nuw i8, ptr %1, i64 44
  %109 = load float, ptr %108, align 4, !tbaa !10
  %110 = load float, ptr %25, align 4, !tbaa !10
  %111 = call float @llvm.fmuladd.f32(float %109, float %110, float %107)
  store float %111, ptr %96, align 4, !tbaa !10
  %112 = getelementptr inbounds nuw i8, ptr %3, i64 36
  %113 = call float @llvm.fmuladd.f32(float %97, float %30, float 0.000000e+00)
  %114 = call float @llvm.fmuladd.f32(float %101, float %33, float %113)
  %115 = call float @llvm.fmuladd.f32(float %105, float %36, float %114)
  %116 = call float @llvm.fmuladd.f32(float %109, float %39, float %115)
  store float %116, ptr %112, align 4, !tbaa !10
  %117 = getelementptr inbounds nuw i8, ptr %3, i64 40
  %118 = call float @llvm.fmuladd.f32(float %97, float %43, float 0.000000e+00)
  %119 = call float @llvm.fmuladd.f32(float %101, float %46, float %118)
  %120 = call float @llvm.fmuladd.f32(float %105, float %49, float %119)
  %121 = call float @llvm.fmuladd.f32(float %109, float %52, float %120)
  store float %121, ptr %117, align 4, !tbaa !10
  %122 = getelementptr inbounds nuw i8, ptr %3, i64 44
  %123 = call float @llvm.fmuladd.f32(float %97, float %56, float 0.000000e+00)
  %124 = call float @llvm.fmuladd.f32(float %101, float %59, float %123)
  %125 = call float @llvm.fmuladd.f32(float %105, float %62, float %124)
  %126 = call float @llvm.fmuladd.f32(float %109, float %65, float %125)
  store float %126, ptr %122, align 4, !tbaa !10
  %127 = getelementptr inbounds nuw i8, ptr %1, i64 48
  %128 = getelementptr inbounds nuw i8, ptr %3, i64 48
  %129 = load float, ptr %127, align 4, !tbaa !10
  %130 = call float @llvm.fmuladd.f32(float %129, float %98, float 0.000000e+00)
  %131 = getelementptr inbounds nuw i8, ptr %1, i64 52
  %132 = load float, ptr %131, align 4, !tbaa !10
  %133 = call float @llvm.fmuladd.f32(float %132, float %102, float %130)
  %134 = getelementptr inbounds nuw i8, ptr %1, i64 56
  %135 = load float, ptr %134, align 4, !tbaa !10
  %136 = call float @llvm.fmuladd.f32(float %135, float %106, float %133)
  %137 = getelementptr inbounds nuw i8, ptr %1, i64 60
  %138 = load float, ptr %137, align 4, !tbaa !10
  %139 = call float @llvm.fmuladd.f32(float %138, float %110, float %136)
  store float %139, ptr %128, align 4, !tbaa !10
  %140 = getelementptr inbounds nuw i8, ptr %3, i64 52
  %141 = load float, ptr %29, align 4, !tbaa !10
  %142 = call float @llvm.fmuladd.f32(float %129, float %141, float 0.000000e+00)
  %143 = load float, ptr %32, align 4, !tbaa !10
  %144 = call float @llvm.fmuladd.f32(float %132, float %143, float %142)
  %145 = load float, ptr %35, align 4, !tbaa !10
  %146 = call float @llvm.fmuladd.f32(float %135, float %145, float %144)
  %147 = load float, ptr %38, align 4, !tbaa !10
  %148 = call float @llvm.fmuladd.f32(float %138, float %147, float %146)
  store float %148, ptr %140, align 4, !tbaa !10
  %149 = getelementptr inbounds nuw i8, ptr %3, i64 56
  %150 = load float, ptr %42, align 4, !tbaa !10
  %151 = call float @llvm.fmuladd.f32(float %129, float %150, float 0.000000e+00)
  %152 = load float, ptr %45, align 4, !tbaa !10
  %153 = call float @llvm.fmuladd.f32(float %132, float %152, float %151)
  %154 = load float, ptr %48, align 4, !tbaa !10
  %155 = call float @llvm.fmuladd.f32(float %135, float %154, float %153)
  %156 = load float, ptr %51, align 4, !tbaa !10
  %157 = call float @llvm.fmuladd.f32(float %138, float %156, float %155)
  store float %157, ptr %149, align 4, !tbaa !10
  %158 = getelementptr inbounds nuw i8, ptr %3, i64 60
  %159 = load float, ptr %55, align 4, !tbaa !10
  %160 = call float @llvm.fmuladd.f32(float %129, float %159, float 0.000000e+00)
  %161 = load float, ptr %58, align 4, !tbaa !10
  %162 = call float @llvm.fmuladd.f32(float %132, float %161, float %160)
  %163 = load float, ptr %61, align 4, !tbaa !10
  %164 = call float @llvm.fmuladd.f32(float %135, float %163, float %162)
  %165 = load float, ptr %64, align 4, !tbaa !10
  %166 = call float @llvm.fmuladd.f32(float %138, float %165, float %164)
  store float %166, ptr %158, align 4, !tbaa !10
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %5) #4
  store i32 0, ptr %5, align 4, !tbaa !6
  br label %181

167:                                              ; preds = %0, %167
  %168 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %6, ptr noundef nonnull %4) #4
  %169 = load float, ptr %168, align 4, !tbaa !10
  %170 = load i32, ptr %4, align 4, !tbaa !6
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds [16 x float], ptr %1, i64 0, i64 %171
  store float %169, ptr %172, align 4, !tbaa !10
  %173 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %7, ptr noundef nonnull %4) #4
  %174 = load float, ptr %173, align 4, !tbaa !10
  %175 = load i32, ptr %4, align 4, !tbaa !6
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds [16 x float], ptr %2, i64 0, i64 %176
  store float %174, ptr %177, align 4, !tbaa !10
  %178 = add nsw i32 %175, 1
  store i32 %178, ptr %4, align 4, !tbaa !6
  %179 = icmp slt i32 %175, 15
  br i1 %179, label %167, label %9, !llvm.loop !12

180:                                              ; preds = %181
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %5) #4
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %3) #4
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %2) #4
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %1) #4
  ret i32 0

181:                                              ; preds = %9, %181
  %182 = phi i32 [ 0, %9 ], [ %188, %181 ]
  %183 = call i32 @llvm.bpf.passthrough.i32.i32(i32 0, i32 %182)
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds [16 x float], ptr %3, i64 0, i64 %184
  %186 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %8, ptr noundef nonnull %5, ptr noundef nonnull %185, i64 noundef 0) #4
  %187 = load i32, ptr %5, align 4, !tbaa !6
  %188 = add nsw i32 %187, 1
  store i32 %188, ptr %5, align 4, !tbaa !6
  %189 = icmp slt i32 %187, 15
  br i1 %189, label %181, label %180, !llvm.loop !14
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
