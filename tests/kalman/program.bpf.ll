; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca [7 x float], align 4
  %2 = alloca [7 x float], align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "=r,i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #3, !srcloc !3
  %6 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "=r,i,i,i,i"(i32 1, i32 0, i32 0, i32 0) #3, !srcloc !4
  call void @llvm.lifetime.start.p0(i64 28, ptr nonnull %1) #3
  call void @llvm.lifetime.start.p0(i64 28, ptr nonnull %2) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %3) #3
  store i32 0, ptr %3, align 4, !tbaa !5
  br label %32

7:                                                ; preds = %32
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %3) #3
  %8 = getelementptr inbounds nuw i8, ptr %2, i64 24
  %9 = getelementptr inbounds nuw i8, ptr %2, i64 4
  %10 = load float, ptr %9, align 4, !tbaa !9
  %11 = fdiv float %10, 1.500000e+00
  store float %11, ptr %2, align 4, !tbaa !9
  %12 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %13 = load float, ptr %12, align 4, !tbaa !9
  %14 = fdiv float %13, 1.500000e+00
  %15 = getelementptr inbounds nuw i8, ptr %2, i64 4
  store float %14, ptr %15, align 4, !tbaa !9
  %16 = getelementptr inbounds nuw i8, ptr %2, i64 12
  %17 = load float, ptr %16, align 4, !tbaa !9
  %18 = fdiv float %17, 1.500000e+00
  %19 = getelementptr inbounds nuw i8, ptr %2, i64 8
  store float %18, ptr %19, align 4, !tbaa !9
  %20 = getelementptr inbounds nuw i8, ptr %2, i64 16
  %21 = load float, ptr %20, align 4, !tbaa !9
  %22 = fdiv float %21, 1.500000e+00
  %23 = getelementptr inbounds nuw i8, ptr %2, i64 12
  store float %22, ptr %23, align 4, !tbaa !9
  %24 = getelementptr inbounds nuw i8, ptr %2, i64 20
  %25 = load float, ptr %24, align 4, !tbaa !9
  %26 = fdiv float %25, 1.500000e+00
  %27 = getelementptr inbounds nuw i8, ptr %2, i64 16
  store float %26, ptr %27, align 4, !tbaa !9
  %28 = load float, ptr %8, align 4, !tbaa !9
  %29 = fdiv float %28, 1.500000e+00
  %30 = getelementptr inbounds nuw i8, ptr %2, i64 20
  store float %29, ptr %30, align 4, !tbaa !9
  %31 = fdiv float %11, 1.500000e+00
  store float %31, ptr %8, align 4, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #3
  store i32 0, ptr %4, align 4, !tbaa !5
  br label %42

32:                                               ; preds = %0, %32
  %33 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %5, ptr noundef nonnull %3) #3
  %34 = load float, ptr %33, align 4, !tbaa !9
  %35 = load i32, ptr %3, align 4, !tbaa !5
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [7 x float], ptr %1, i64 0, i64 %36
  store float %34, ptr %37, align 4, !tbaa !9
  %38 = getelementptr inbounds [7 x float], ptr %2, i64 0, i64 %36
  store float %34, ptr %38, align 4, !tbaa !9
  %39 = add nsw i32 %35, 1
  store i32 %39, ptr %3, align 4, !tbaa !5
  %40 = icmp slt i32 %35, 6
  br i1 %40, label %32, label %7, !llvm.loop !11

41:                                               ; preds = %42
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #3
  call void @llvm.lifetime.end.p0(i64 28, ptr nonnull %2) #3
  call void @llvm.lifetime.end.p0(i64 28, ptr nonnull %1) #3
  ret i32 0

42:                                               ; preds = %7, %42
  %43 = phi i32 [ 0, %7 ], [ %60, %42 ]
  %44 = call i32 @llvm.bpf.passthrough.i32.i32(i32 0, i32 %43)
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [7 x float], ptr %1, i64 0, i64 %45
  %47 = load float, ptr %46, align 4, !tbaa !9
  %48 = getelementptr inbounds [7 x float], ptr %2, i64 0, i64 %45
  %49 = load float, ptr %48, align 4, !tbaa !9
  %50 = fsub float %47, %49
  store float %50, ptr %46, align 4, !tbaa !9
  %51 = sext i32 %43 to i64
  %52 = getelementptr inbounds [7 x float], ptr %1, i64 0, i64 %51
  %53 = load float, ptr %52, align 4, !tbaa !9
  %54 = fmul float %53, 0x3FA99999A0000000
  store float %54, ptr %52, align 4, !tbaa !9
  %55 = getelementptr inbounds [7 x float], ptr %2, i64 0, i64 %51
  %56 = load float, ptr %55, align 4, !tbaa !9
  %57 = fsub float %56, %54
  store float %57, ptr %55, align 4, !tbaa !9
  %58 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %6, ptr noundef nonnull %4, ptr noundef nonnull %55, i64 noundef 0) #3
  %59 = load i32, ptr %4, align 4, !tbaa !5
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr %4, align 4, !tbaa !5
  %61 = icmp slt i32 %59, 6
  br i1 %61, label %42, label %41, !llvm.loop !13
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind memory(none)
declare i32 @llvm.bpf.passthrough.i32.i32(i32, i32) #2

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="duotronic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind memory(none) }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 755f040f24df9a74f4e5f7f7bdd64e3acd4e61b9)"}
!3 = !{i64 2147501771}
!4 = !{i64 2147502209}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !7, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
