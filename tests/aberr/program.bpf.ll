; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca [3 x float], align 4
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca float, align 4
  %7 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #3, !srcloc !3
  %8 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 2, i32 0, i32 0, i32 0) #3, !srcloc !4
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %1) #3
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2) #3
  store i64 0, ptr %2, align 8, !tbaa !5
  br label %10

9:                                                ; preds = %10
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2) #3
  br label %21

10:                                               ; preds = %0, %10
  %11 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %7, ptr noundef nonnull %2) #3
  %12 = load i64, ptr %2, align 8, !tbaa !5
  %13 = add nsw i64 %12, 1
  store i64 %13, ptr %2, align 8, !tbaa !5
  %14 = icmp slt i64 %12, 2
  br i1 %14, label %10, label %9, !llvm.loop !9

15:                                               ; preds = %21
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %4) #3
  store i64 6, ptr %4, align 8, !tbaa !5
  %16 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %7, ptr noundef nonnull %4) #3
  store i64 7, ptr %4, align 8, !tbaa !5
  %17 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %7, ptr noundef nonnull %4) #3
  store i64 8, ptr %4, align 8, !tbaa !5
  %18 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %7, ptr noundef nonnull %4) #3
  store i64 9, ptr %4, align 8, !tbaa !5
  %19 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %7, ptr noundef nonnull %4) #3
  %20 = getelementptr inbounds nuw i8, ptr %1, i64 4
  br label %29

21:                                               ; preds = %9, %21
  %22 = phi i64 [ 0, %9 ], [ %25, %21 ]
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3) #3
  %23 = add nuw nsw i64 %22, 3
  store i64 %23, ptr %3, align 8, !tbaa !5
  %24 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %7, ptr noundef nonnull %3) #3
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #3
  %25 = add nuw nsw i64 %22, 1
  %26 = icmp eq i64 %25, 3
  br i1 %26, label %15, label %21, !llvm.loop !12

27:                                               ; preds = %29
  %28 = getelementptr inbounds nuw i8, ptr %1, i64 8
  store float 0x7FF8000000000000, ptr %20, align 4
  store float 0x7FF8000000000000, ptr %28, align 4
  store float 0x7FF8000000000000, ptr %1, align 4
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %5) #3
  store i64 0, ptr %5, align 8, !tbaa !5
  br label %37

29:                                               ; preds = %15, %29
  %30 = phi i64 [ 0, %15 ], [ %34, %29 ]
  store i64 0, ptr %4, align 8, !tbaa !5
  %31 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %7, ptr noundef nonnull %4) #3
  store i64 1, ptr %4, align 8, !tbaa !5
  %32 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %7, ptr noundef nonnull %4) #3
  store i64 2, ptr %4, align 8, !tbaa !5
  %33 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %7, ptr noundef nonnull %4) #3
  %34 = add nuw nsw i64 %30, 1
  %35 = icmp eq i64 %34, 10
  br i1 %35, label %27, label %29, !llvm.loop !13

36:                                               ; preds = %37
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %5) #3
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4) #3
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %1) #3
  ret i32 0

37:                                               ; preds = %27, %37
  %38 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %7, ptr noundef nonnull %5) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %6) #3
  %39 = load float, ptr %38, align 4, !tbaa !14
  %40 = load i64, ptr %5, align 8, !tbaa !5
  %41 = getelementptr inbounds [3 x float], ptr %1, i64 0, i64 %40
  %42 = load float, ptr %41, align 4, !tbaa !14
  %43 = call float @llvm.fmuladd.f32(float %42, float 0.000000e+00, float %39)
  store float %43, ptr %6, align 4, !tbaa !14
  %44 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %8, ptr noundef nonnull %5, ptr noundef nonnull %6, i64 noundef 0) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %6) #3
  %45 = load i64, ptr %5, align 8, !tbaa !5
  %46 = add nsw i64 %45, 1
  store i64 %46, ptr %5, align 8, !tbaa !5
  %47 = icmp slt i64 %45, 2
  br i1 %47, label %37, label %36, !llvm.loop !16
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #2

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="duotronic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 755f040f24df9a74f4e5f7f7bdd64e3acd4e61b9)"}
!3 = !{i64 2147506844}
!4 = !{i64 2147507356}
!5 = !{!6, !6, i64 0}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !10, !11}
!13 = distinct !{!13, !10, !11}
!14 = !{!15, !15, i64 0}
!15 = !{!"float", !7, i64 0}
!16 = distinct !{!16, !10, !11}
