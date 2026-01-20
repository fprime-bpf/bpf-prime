; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca [2500 x i32], align 4
  %2 = alloca [25 x i32], align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #3, !srcloc !3
  %8 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 1, i32 0, i32 0, i32 0) #3, !srcloc !4
  call void @llvm.lifetime.start.p0(i64 10000, ptr nonnull %1) #3
  call void @llvm.lifetime.start.p0(i64 100, ptr nonnull %2) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %3) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #3
  store i32 0, ptr %4, align 4, !tbaa !5
  br label %10

9:                                                ; preds = %10
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %5) #3
  store i32 0, ptr %5, align 4, !tbaa !5
  br label %19

10:                                               ; preds = %0, %10
  %11 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %7, ptr noundef nonnull %4) #3
  %12 = load i32, ptr %11, align 4, !tbaa !5
  %13 = load i32, ptr %4, align 4, !tbaa !5
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [2500 x i32], ptr %1, i64 0, i64 %14
  store i32 %12, ptr %15, align 4, !tbaa !5
  %16 = add nsw i32 %13, 1
  store i32 %16, ptr %4, align 4, !tbaa !5
  %17 = icmp slt i32 %13, 2499
  br i1 %17, label %10, label %9, !llvm.loop !9

18:                                               ; preds = %19
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %5) #3
  br label %27

19:                                               ; preds = %9, %19
  %20 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %8, ptr noundef nonnull %5) #3
  %21 = load i32, ptr %20, align 4, !tbaa !5
  %22 = load i32, ptr %5, align 4, !tbaa !5
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [25 x i32], ptr %2, i64 0, i64 %23
  store i32 %21, ptr %24, align 4, !tbaa !5
  %25 = add nsw i32 %22, 1
  store i32 %25, ptr %5, align 4, !tbaa !5
  %26 = icmp slt i32 %22, 24
  br i1 %26, label %19, label %18, !llvm.loop !12

27:                                               ; preds = %18, %38
  %28 = phi i64 [ 0, %18 ], [ %39, %38 ]
  %29 = phi i32 [ -1, %18 ], [ %50, %38 ]
  %30 = phi i32 [ undef, %18 ], [ %49, %38 ]
  %31 = trunc nuw nsw i64 %28 to i32
  br label %34

32:                                               ; preds = %38
  store i32 %49, ptr %3, align 4
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %6) #3
  store i32 0, ptr %6, align 4, !tbaa !5
  %33 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %8, ptr noundef nonnull %6, ptr noundef nonnull %3, i64 noundef 0) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %6) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %3) #3
  call void @llvm.lifetime.end.p0(i64 100, ptr nonnull %2) #3
  call void @llvm.lifetime.end.p0(i64 10000, ptr nonnull %1) #3
  ret i32 0

34:                                               ; preds = %27, %47
  %35 = phi i64 [ 0, %27 ], [ %51, %47 ]
  %36 = phi i32 [ %29, %27 ], [ %50, %47 ]
  %37 = phi i32 [ %30, %27 ], [ %49, %47 ]
  br label %41

38:                                               ; preds = %47
  %39 = add nuw nsw i64 %28, 1
  %40 = icmp eq i64 %39, 45
  br i1 %40, label %32, label %27, !llvm.loop !13

41:                                               ; preds = %34, %53
  %42 = phi i64 [ 0, %34 ], [ %54, %53 ]
  %43 = phi i32 [ 0, %34 ], [ %69, %53 ]
  %44 = add nuw nsw i64 %42, %28
  %45 = mul nuw nsw i64 %44, 50
  %46 = add nuw nsw i64 %45, %35
  br label %56

47:                                               ; preds = %53
  %48 = icmp slt i32 %69, %36
  %49 = select i1 %48, i32 %31, i32 %37
  %50 = call i32 @llvm.smin.i32(i32 %69, i32 %36)
  %51 = add nuw nsw i64 %35, 1
  %52 = icmp eq i64 %51, 45
  br i1 %52, label %38, label %34, !llvm.loop !14

53:                                               ; preds = %56
  %54 = add nuw nsw i64 %42, 1
  %55 = icmp eq i64 %54, 5
  br i1 %55, label %47, label %41, !llvm.loop !15

56:                                               ; preds = %41, %56
  %57 = phi i64 [ 0, %41 ], [ %70, %56 ]
  %58 = phi i32 [ %43, %41 ], [ %69, %56 ]
  %59 = add nuw nsw i64 %46, %57
  %60 = getelementptr inbounds nuw [2500 x i32], ptr %1, i64 0, i64 %59
  %61 = load i32, ptr %60, align 4, !tbaa !5
  %62 = and i32 %61, 15
  %63 = add nuw nsw i64 %57, %42
  %64 = getelementptr inbounds nuw [25 x i32], ptr %2, i64 0, i64 %63
  %65 = load i32, ptr %64, align 4, !tbaa !5
  %66 = and i32 %65, 15
  %67 = sub nsw i32 %62, %66
  %68 = call i32 @llvm.abs.i32(i32 %67, i1 true)
  %69 = add i32 %68, %58
  %70 = add nuw nsw i64 %57, 1
  %71 = icmp eq i64 %70, 5
  br i1 %71, label %53, label %56, !llvm.loop !16
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #2

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="duotronic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 20.1.0 (git@github.com:h313/llvm-duotronic.git 3047ef595b8b4944540de771dcf86dc85a97ef76)"}
!3 = !{i64 2147503074}
!4 = !{i64 2147503586}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !10, !11}
!13 = distinct !{!13, !10, !11}
!14 = distinct !{!14, !10, !11}
!15 = distinct !{!15, !10, !11}
!16 = distinct !{!16, !10, !11}
