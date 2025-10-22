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
  %5 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #3, !srcloc !3
  %6 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 1, i32 0, i32 0, i32 0) #3, !srcloc !4
  call void @llvm.lifetime.start.p0(i64 28, ptr nonnull %1) #3
  call void @llvm.lifetime.start.p0(i64 28, ptr nonnull %2) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %3) #3
  store i32 0, ptr %3, align 4, !tbaa !5
  br label %9

7:                                                ; preds = %9
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %3) #3
  %8 = getelementptr inbounds nuw i8, ptr %2, i64 24
  br label %21

9:                                                ; preds = %0, %9
  %10 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %5, ptr noundef nonnull %3) #3
  %11 = load float, ptr %10, align 4, !tbaa !9
  %12 = load i32, ptr %3, align 4, !tbaa !5
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [7 x float], ptr %1, i64 0, i64 %13
  store float %11, ptr %14, align 4, !tbaa !9
  %15 = getelementptr inbounds [7 x float], ptr %2, i64 0, i64 %13
  store float %11, ptr %15, align 4, !tbaa !9
  %16 = add nsw i32 %12, 1
  store i32 %16, ptr %3, align 4, !tbaa !5
  %17 = icmp slt i32 %12, 6
  br i1 %17, label %9, label %7, !llvm.loop !11

18:                                               ; preds = %21
  %19 = load float, ptr %2, align 4, !tbaa !9
  %20 = fdiv float %19, 1.500000e+00
  store float %20, ptr %8, align 4, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #3
  store i32 0, ptr %4, align 4, !tbaa !5
  br label %30

21:                                               ; preds = %7, %21
  %22 = phi i64 [ 0, %7 ], [ %23, %21 ]
  %23 = add nuw nsw i64 %22, 1
  %24 = getelementptr inbounds nuw [7 x float], ptr %2, i64 0, i64 %23
  %25 = load float, ptr %24, align 4, !tbaa !9
  %26 = fdiv float %25, 1.500000e+00
  %27 = getelementptr inbounds nuw [7 x float], ptr %2, i64 0, i64 %22
  store float %26, ptr %27, align 4, !tbaa !9
  %28 = icmp eq i64 %23, 6
  br i1 %28, label %18, label %21

29:                                               ; preds = %30
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #3
  call void @llvm.lifetime.end.p0(i64 28, ptr nonnull %2) #3
  call void @llvm.lifetime.end.p0(i64 28, ptr nonnull %1) #3
  ret i32 0

30:                                               ; preds = %18, %30
  %31 = phi i32 [ 0, %18 ], [ %48, %30 ]
  %32 = call i32 @llvm.bpf.passthrough.i32.i32(i32 0, i32 %31)
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [7 x float], ptr %1, i64 0, i64 %33
  %35 = load float, ptr %34, align 4, !tbaa !9
  %36 = getelementptr inbounds [7 x float], ptr %2, i64 0, i64 %33
  %37 = load float, ptr %36, align 4, !tbaa !9
  %38 = fsub float %35, %37
  store float %38, ptr %34, align 4, !tbaa !9
  %39 = sext i32 %31 to i64
  %40 = getelementptr inbounds [7 x float], ptr %1, i64 0, i64 %39
  %41 = load float, ptr %40, align 4, !tbaa !9
  %42 = fmul float %41, 0x3FA99999A0000000
  store float %42, ptr %40, align 4, !tbaa !9
  %43 = getelementptr inbounds [7 x float], ptr %2, i64 0, i64 %39
  %44 = load float, ptr %43, align 4, !tbaa !9
  %45 = fsub float %44, %42
  store float %45, ptr %43, align 4, !tbaa !9
  %46 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %6, ptr noundef nonnull %4, ptr noundef nonnull %43, i64 noundef 0) #3
  %47 = load i32, ptr %4, align 4, !tbaa !5
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %4, align 4, !tbaa !5
  %49 = icmp slt i32 %47, 6
  br i1 %49, label %30, label %29, !llvm.loop !14
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
!3 = !{i64 2147501902}
!4 = !{i64 2147502414}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !7, i64 0}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !12, !13}
