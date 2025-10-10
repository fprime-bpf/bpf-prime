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
  br label %27

7:                                                ; preds = %27
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %3) #3
  %8 = getelementptr inbounds nuw i8, ptr %2, i64 24
  %9 = getelementptr inbounds nuw i8, ptr %2, i64 4
  %10 = load float, ptr %9, align 4, !tbaa !9
  %11 = fdiv float %10, 1.500000e+00
  store float %11, ptr %2, align 4, !tbaa !9
  %12 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %13 = load float, ptr %12, align 4, !tbaa !9
  %14 = fdiv float %13, 1.500000e+00
  store float %14, ptr %9, align 4, !tbaa !9
  %15 = getelementptr inbounds nuw i8, ptr %2, i64 12
  %16 = load float, ptr %15, align 4, !tbaa !9
  %17 = fdiv float %16, 1.500000e+00
  store float %17, ptr %12, align 4, !tbaa !9
  %18 = getelementptr inbounds nuw i8, ptr %2, i64 16
  %19 = load float, ptr %18, align 4, !tbaa !9
  %20 = fdiv float %19, 1.500000e+00
  store float %20, ptr %15, align 4, !tbaa !9
  %21 = getelementptr inbounds nuw i8, ptr %2, i64 20
  %22 = load float, ptr %21, align 4, !tbaa !9
  %23 = fdiv float %22, 1.500000e+00
  store float %23, ptr %18, align 4, !tbaa !9
  %24 = load float, ptr %8, align 4, !tbaa !9
  %25 = fdiv float %24, 1.500000e+00
  store float %25, ptr %21, align 4, !tbaa !9
  %26 = fdiv float %11, 1.500000e+00
  store float %26, ptr %8, align 4, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #3
  store i32 0, ptr %4, align 4, !tbaa !5
  br label %37

27:                                               ; preds = %0, %27
  %28 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %5, ptr noundef nonnull %3) #3
  %29 = load float, ptr %28, align 4, !tbaa !9
  %30 = load i32, ptr %3, align 4, !tbaa !5
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [7 x float], ptr %1, i64 0, i64 %31
  store float %29, ptr %32, align 4, !tbaa !9
  %33 = getelementptr inbounds [7 x float], ptr %2, i64 0, i64 %31
  store float %29, ptr %33, align 4, !tbaa !9
  %34 = add nsw i32 %30, 1
  store i32 %34, ptr %3, align 4, !tbaa !5
  %35 = icmp slt i32 %30, 6
  br i1 %35, label %27, label %7, !llvm.loop !11

36:                                               ; preds = %37
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #3
  call void @llvm.lifetime.end.p0(i64 28, ptr nonnull %2) #3
  call void @llvm.lifetime.end.p0(i64 28, ptr nonnull %1) #3
  ret i32 0

37:                                               ; preds = %7, %37
  %38 = phi i32 [ 0, %7 ], [ %55, %37 ]
  %39 = call i32 @llvm.bpf.passthrough.i32.i32(i32 0, i32 %38)
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [7 x float], ptr %1, i64 0, i64 %40
  %42 = load float, ptr %41, align 4, !tbaa !9
  %43 = getelementptr inbounds [7 x float], ptr %2, i64 0, i64 %40
  %44 = load float, ptr %43, align 4, !tbaa !9
  %45 = fsub float %42, %44
  store float %45, ptr %41, align 4, !tbaa !9
  %46 = sext i32 %38 to i64
  %47 = getelementptr inbounds [7 x float], ptr %1, i64 0, i64 %46
  %48 = load float, ptr %47, align 4, !tbaa !9
  %49 = fmul float %48, 0x3FA99999A0000000
  store float %49, ptr %47, align 4, !tbaa !9
  %50 = getelementptr inbounds [7 x float], ptr %2, i64 0, i64 %46
  %51 = load float, ptr %50, align 4, !tbaa !9
  %52 = fsub float %51, %49
  store float %52, ptr %50, align 4, !tbaa !9
  %53 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %6, ptr noundef nonnull %4, ptr noundef nonnull %50, i64 noundef 0) #3
  %54 = load i32, ptr %4, align 4, !tbaa !5
  %55 = add nsw i32 %54, 1
  store i32 %55, ptr %4, align 4, !tbaa !5
  %56 = icmp slt i32 %54, 6
  br i1 %56, label %37, label %36, !llvm.loop !13
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
!3 = !{i64 2147501830}
!4 = !{i64 2147502268}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !7, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
