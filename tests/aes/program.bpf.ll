; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

@__const.main.block = private unnamed_addr constant [4 x [4 x i8]] [[4 x i8] c"\14\00\00\00", [4 x i8] zeroinitializer, [4 x i8] zeroinitializer, [4 x i8] zeroinitializer], align 1
@__const.main.key = private unnamed_addr constant <{ i8, [15 x i8] }> <{ i8 -122, [15 x i8] zeroinitializer }>, align 1

; Function Attrs: nofree norecurse nosync nounwind memory(none)
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca [4 x [4 x i8]], align 1
  %2 = alloca [4 x [4 x i8]], align 1
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %1) #4
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(16) %1, ptr noundef nonnull align 1 dereferenceable(16) @__const.main.block, i64 16, i1 false)
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %2) #4
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(16) %2, i8 0, i64 16, i1 false)
  %3 = getelementptr inbounds nuw i8, ptr %1, i64 1
  %4 = getelementptr inbounds nuw i8, ptr %1, i64 5
  %5 = getelementptr inbounds nuw i8, ptr %1, i64 9
  %6 = getelementptr inbounds nuw i8, ptr %1, i64 13
  %7 = getelementptr inbounds nuw i8, ptr %1, i64 2
  %8 = getelementptr inbounds nuw i8, ptr %1, i64 6
  %9 = getelementptr inbounds nuw i8, ptr %1, i64 10
  %10 = getelementptr inbounds nuw i8, ptr %1, i64 14
  %11 = getelementptr inbounds nuw i8, ptr %1, i64 15
  %12 = getelementptr inbounds nuw i8, ptr %1, i64 11
  %13 = getelementptr inbounds nuw i8, ptr %1, i64 7
  %14 = getelementptr inbounds nuw i8, ptr %1, i64 3
  br label %15

15:                                               ; preds = %0, %34
  %16 = phi i32 [ 0, %0 ], [ %47, %34 ]
  br label %18

17:                                               ; preds = %34
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %2) #4
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %1) #4
  ret i32 0

18:                                               ; preds = %15, %20
  %19 = phi i64 [ 0, %15 ], [ %21, %20 ]
  br label %23

20:                                               ; preds = %23
  %21 = add nuw nsw i64 %19, 1
  %22 = icmp eq i64 %21, 4
  br i1 %22, label %32, label %18, !llvm.loop !3

23:                                               ; preds = %18, %23
  %24 = phi i64 [ 0, %18 ], [ %30, %23 ]
  %25 = getelementptr inbounds nuw [4 x [4 x i8]], ptr %2, i64 0, i64 %19, i64 %24
  %26 = load i8, ptr %25, align 1, !tbaa !6
  %27 = getelementptr inbounds nuw [4 x [4 x i8]], ptr %1, i64 0, i64 %19, i64 %24
  %28 = load i8, ptr %27, align 1, !tbaa !6
  %29 = xor i8 %28, %26
  store i8 %29, ptr %27, align 1, !tbaa !6
  %30 = add nuw nsw i64 %24, 1
  %31 = icmp eq i64 %30, 4
  br i1 %31, label %20, label %23, !llvm.loop !9

32:                                               ; preds = %20, %49
  %33 = phi i64 [ %50, %49 ], [ 0, %20 ]
  br label %52

34:                                               ; preds = %49
  %35 = load i8, ptr %3, align 1, !tbaa !6
  %36 = load i8, ptr %4, align 1, !tbaa !6
  store i8 %36, ptr %3, align 1, !tbaa !6
  %37 = load i8, ptr %5, align 1, !tbaa !6
  store i8 %37, ptr %4, align 1, !tbaa !6
  %38 = load i8, ptr %6, align 1, !tbaa !6
  store i8 %38, ptr %5, align 1, !tbaa !6
  store i8 %35, ptr %6, align 1, !tbaa !6
  %39 = load i8, ptr %7, align 1, !tbaa !6
  %40 = load i8, ptr %8, align 1, !tbaa !6
  %41 = load i8, ptr %9, align 1, !tbaa !6
  store i8 %41, ptr %7, align 1, !tbaa !6
  %42 = load i8, ptr %10, align 1, !tbaa !6
  store i8 %42, ptr %8, align 1, !tbaa !6
  store i8 %39, ptr %9, align 1, !tbaa !6
  store i8 %40, ptr %10, align 1, !tbaa !6
  %43 = load i8, ptr %11, align 1, !tbaa !6
  %44 = load i8, ptr %12, align 1, !tbaa !6
  store i8 %44, ptr %11, align 1, !tbaa !6
  %45 = load i8, ptr %13, align 1, !tbaa !6
  store i8 %45, ptr %12, align 1, !tbaa !6
  %46 = load i8, ptr %14, align 1, !tbaa !6
  store i8 %46, ptr %13, align 1, !tbaa !6
  store i8 %43, ptr %14, align 1, !tbaa !6
  %47 = add nuw nsw i32 %16, 1
  %48 = icmp eq i32 %47, 1000
  br i1 %48, label %17, label %15, !llvm.loop !10

49:                                               ; preds = %52
  %50 = add nuw nsw i64 %33, 1
  %51 = icmp eq i64 %50, 4
  br i1 %51, label %34, label %32, !llvm.loop !11

52:                                               ; preds = %32, %52
  %53 = phi i64 [ 0, %32 ], [ %59, %52 ]
  %54 = getelementptr inbounds nuw [4 x [4 x i8]], ptr %1, i64 0, i64 %33, i64 %53
  %55 = load i8, ptr %54, align 1, !tbaa !6
  %56 = sext i8 %55 to i64
  %57 = getelementptr inbounds [16 x i8], ptr @__const.main.key, i64 0, i64 %56
  %58 = load i8, ptr %57, align 1, !tbaa !6
  store i8 %58, ptr %54, align 1, !tbaa !6
  %59 = add nuw nsw i64 %53, 1
  %60 = icmp eq i64 %59, 4
  br i1 %60, label %49, label %52, !llvm.loop !12
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

attributes #0 = { nofree norecurse nosync nounwind memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="duotronic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 755f040f24df9a74f4e5f7f7bdd64e3acd4e61b9)"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.mustprogress"}
!5 = !{!"llvm.loop.unroll.disable"}
!6 = !{!7, !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !4, !5}
!10 = distinct !{!10, !4, !5}
!11 = distinct !{!11, !4, !5}
!12 = distinct !{!12, !4, !5}
