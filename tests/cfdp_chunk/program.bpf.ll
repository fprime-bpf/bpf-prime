; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

%struct.bpf_iter_num = type { i64, i64, i64, i64 }

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca i32, align 4
  %2 = alloca [8 x i32], align 4
  %3 = alloca i32, align 4
  %4 = alloca %struct.bpf_iter_num, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.bpf_iter_num, align 8
  %9 = alloca i32, align 4
  %10 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #2, !srcloc !3
  %11 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 1, i32 0, i32 0, i32 0) #2, !srcloc !4
  %12 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 2, i32 0, i32 0, i32 0) #2, !srcloc !5
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %1) #2
  store i32 0, ptr %1, align 4, !tbaa !6
  %13 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %11, ptr noundef nonnull %1) #2
  %14 = icmp eq ptr %13, null
  br i1 %14, label %22, label %15

15:                                               ; preds = %0
  %16 = load i32, ptr %13, align 4, !tbaa !6
  %17 = freeze i32 %16
  %18 = srem i32 %17, 8
  %19 = icmp slt i32 %18, 0
  br i1 %19, label %20, label %22

20:                                               ; preds = %15
  %21 = add nsw i32 %18, 8
  br label %22

22:                                               ; preds = %0, %15, %20
  %23 = phi i32 [ %21, %20 ], [ %18, %15 ], [ 0, %0 ]
  %24 = shl nuw nsw i32 %23, 3
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %2) #2
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %3)
  store volatile i32 0, ptr %3, align 4, !tbaa !6
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %4) #2
  %25 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %4, i32 noundef 0, i32 noundef 8) #2
  %26 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %4) #2
  %27 = icmp eq ptr %26, null
  br i1 %27, label %43, label %28

28:                                               ; preds = %22
  %29 = zext nneg i32 %24 to i64
  br label %30

30:                                               ; preds = %28, %30
  %31 = phi ptr [ %26, %28 ], [ %41, %30 ]
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %5) #2
  %32 = load i64, ptr %31, align 8, !tbaa !10
  %33 = add nsw i64 %32, %29
  store i64 %33, ptr %5, align 8, !tbaa !10
  %34 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %10, ptr noundef nonnull %5) #2
  %35 = load i32, ptr %34, align 4, !tbaa !6
  %36 = load i64, ptr %31, align 8, !tbaa !10
  %37 = getelementptr inbounds [8 x i32], ptr %2, i64 0, i64 %36
  store volatile i32 %35, ptr %37, align 4, !tbaa !6
  %38 = load volatile i32, ptr %37, align 4, !tbaa !6
  %39 = load volatile i32, ptr %3, align 4, !tbaa !6
  %40 = add i32 %39, %38
  store volatile i32 %40, ptr %3, align 4, !tbaa !6
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %5) #2
  %41 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %4) #2
  %42 = icmp eq ptr %41, null
  br i1 %42, label %43, label %30, !llvm.loop !12

43:                                               ; preds = %30, %22
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %4) #2
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %6) #2
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %7) #2
  store i32 0, ptr %6, align 4, !tbaa !6
  store i32 %24, ptr %7, align 4, !tbaa !6
  %44 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %12, ptr noundef nonnull %6, ptr noundef nonnull %7, i64 noundef 0) #2
  store i32 1, ptr %6, align 4, !tbaa !6
  store i32 8, ptr %7, align 4, !tbaa !6
  %45 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %12, ptr noundef nonnull %6, ptr noundef nonnull %7, i64 noundef 0) #2
  store i32 2, ptr %6, align 4, !tbaa !6
  %46 = load volatile i32, ptr %3, align 4, !tbaa !6
  store i32 %46, ptr %7, align 4, !tbaa !6
  %47 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %12, ptr noundef nonnull %6, ptr noundef nonnull %7, i64 noundef 0) #2
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %8) #2
  %48 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %8, i32 noundef 0, i32 noundef 8) #2
  %49 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %8) #2
  %50 = icmp eq ptr %49, null
  br i1 %50, label %61, label %51

51:                                               ; preds = %43, %51
  %52 = phi ptr [ %59, %51 ], [ %49, %43 ]
  %53 = load i64, ptr %52, align 8, !tbaa !10
  %54 = trunc i64 %53 to i32
  %55 = add nsw i32 %54, 3
  store i32 %55, ptr %6, align 4, !tbaa !6
  %56 = getelementptr inbounds [8 x i32], ptr %2, i64 0, i64 %53
  %57 = load volatile i32, ptr %56, align 4, !tbaa !6
  store i32 %57, ptr %7, align 4, !tbaa !6
  %58 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %12, ptr noundef nonnull %6, ptr noundef nonnull %7, i64 noundef 0) #2
  %59 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %8) #2
  %60 = icmp eq ptr %59, null
  br i1 %60, label %61, label %51, !llvm.loop !15

61:                                               ; preds = %51, %43
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %8) #2
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %9) #2
  %62 = add nuw nsw i32 %23, 1
  %63 = and i32 %62, 7
  store i32 %63, ptr %9, align 4, !tbaa !6
  %64 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %11, ptr noundef nonnull %1, ptr noundef nonnull %9, i64 noundef 0) #2
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %9) #2
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %8) #2
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %7) #2
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %6) #2
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %4) #2
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %3)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %2) #2
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %1) #2
  ret i32 0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="duotronic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 03a843fe2f5c0023ee1e6ee21d74290f4387a642)"}
!3 = !{i64 2147504299}
!4 = !{i64 2147504811}
!5 = !{i64 2147505323}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"long long", !8, i64 0}
!12 = distinct !{!12, !13, !14}
!13 = !{!"llvm.loop.mustprogress"}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !13, !14}
