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
  br label %10

9:                                                ; preds = %10
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #4
  br label %23

10:                                               ; preds = %0, %10
  %11 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %6, ptr noundef nonnull %4) #4
  %12 = load float, ptr %11, align 4, !tbaa !10
  %13 = load i32, ptr %4, align 4, !tbaa !6
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [16 x float], ptr %1, i64 0, i64 %14
  store float %12, ptr %15, align 4, !tbaa !10
  %16 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %7, ptr noundef nonnull %4) #4
  %17 = load float, ptr %16, align 4, !tbaa !10
  %18 = load i32, ptr %4, align 4, !tbaa !6
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [16 x float], ptr %2, i64 0, i64 %19
  store float %17, ptr %20, align 4, !tbaa !10
  %21 = add nsw i32 %18, 1
  store i32 %21, ptr %4, align 4, !tbaa !6
  %22 = icmp slt i32 %18, 15
  br i1 %22, label %10, label %9, !llvm.loop !12

23:                                               ; preds = %9, %27
  %24 = phi i64 [ 0, %9 ], [ %28, %27 ]
  %25 = shl nuw nsw i64 %24, 2
  br label %30

26:                                               ; preds = %27
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %5) #4
  store i32 0, ptr %5, align 4, !tbaa !6
  br label %51

27:                                               ; preds = %34
  %28 = add nuw nsw i64 %24, 1
  %29 = icmp eq i64 %28, 4
  br i1 %29, label %26, label %23, !llvm.loop !15

30:                                               ; preds = %23, %34
  %31 = phi i64 [ 0, %23 ], [ %35, %34 ]
  %32 = or disjoint i64 %31, %25
  %33 = getelementptr inbounds nuw [16 x float], ptr %3, i64 0, i64 %32
  br label %37

34:                                               ; preds = %37
  store float %47, ptr %33, align 4, !tbaa !10
  %35 = add nuw nsw i64 %31, 1
  %36 = icmp eq i64 %35, 4
  br i1 %36, label %27, label %30, !llvm.loop !16

37:                                               ; preds = %30, %37
  %38 = phi i64 [ 0, %30 ], [ %48, %37 ]
  %39 = phi float [ 0.000000e+00, %30 ], [ %47, %37 ]
  %40 = or disjoint i64 %38, %25
  %41 = getelementptr inbounds nuw [16 x float], ptr %1, i64 0, i64 %40
  %42 = load float, ptr %41, align 4, !tbaa !10
  %43 = shl nuw nsw i64 %38, 2
  %44 = add nuw nsw i64 %43, %31
  %45 = getelementptr inbounds nuw [16 x float], ptr %2, i64 0, i64 %44
  %46 = load float, ptr %45, align 4, !tbaa !10
  %47 = call float @llvm.fmuladd.f32(float %42, float %46, float %39)
  %48 = add nuw nsw i64 %38, 1
  %49 = icmp eq i64 %48, 4
  br i1 %49, label %34, label %37, !llvm.loop !17

50:                                               ; preds = %51
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %5) #4
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %3) #4
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %2) #4
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %1) #4
  ret i32 0

51:                                               ; preds = %26, %51
  %52 = phi i32 [ 0, %26 ], [ %58, %51 ]
  %53 = call i32 @llvm.bpf.passthrough.i32.i32(i32 0, i32 %52)
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [16 x float], ptr %3, i64 0, i64 %54
  %56 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %8, ptr noundef nonnull %5, ptr noundef nonnull %55, i64 noundef 0) #4
  %57 = load i32, ptr %5, align 4, !tbaa !6
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %5, align 4, !tbaa !6
  %59 = icmp slt i32 %57, 15
  br i1 %59, label %51, label %50, !llvm.loop !18
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
!2 = !{!"clang version 20.1.0 (https://github.com/fprime-bpf/llvm-project.git 755f040f24df9a74f4e5f7f7bdd64e3acd4e61b9)"}
!3 = !{i64 2147502073}
!4 = !{i64 2147502585}
!5 = !{i64 2147503097}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !8, i64 0}
!12 = distinct !{!12, !13, !14}
!13 = !{!"llvm.loop.mustprogress"}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !13, !14}
!16 = distinct !{!16, !13, !14}
!17 = distinct !{!17, !13, !14}
!18 = distinct !{!18, !13, !14}
