; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

%struct.bpf_iter_num = type { i64, i64, i64, i64 }

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca %struct.bpf_iter_num, align 8
  %2 = alloca [7 x float], align 4
  %3 = alloca [7 x float], align 4
  %4 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 3, i32 0, i32 0, i32 0) #2, !srcloc !3
  %5 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 4, i32 0, i32 0, i32 0) #2, !srcloc !4
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %1) #2
  call void @llvm.lifetime.start.p0(i64 28, ptr nonnull %2) #2
  call void @llvm.lifetime.start.p0(i64 28, ptr nonnull %3) #2
  %6 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %1, i32 noundef 0, i32 noundef 7) #2
  %7 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %1) #2
  %8 = icmp eq ptr %7, null
  br i1 %8, label %18, label %9

9:                                                ; preds = %0, %9
  %10 = phi ptr [ %16, %9 ], [ %7, %0 ]
  %11 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %4, ptr noundef nonnull %10) #2
  %12 = load float, ptr %11, align 4, !tbaa !5
  %13 = load i64, ptr %10, align 8, !tbaa !9
  %14 = getelementptr inbounds [7 x float], ptr %2, i64 0, i64 %13
  store float %12, ptr %14, align 4, !tbaa !5
  %15 = getelementptr inbounds [7 x float], ptr %3, i64 0, i64 %13
  store float %12, ptr %15, align 4, !tbaa !5
  %16 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %1) #2
  %17 = icmp eq ptr %16, null
  br i1 %17, label %18, label %9, !llvm.loop !11

18:                                               ; preds = %9, %0
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %1) #2
  %19 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %1, i32 noundef 0, i32 noundef 7) #2
  %20 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %1) #2
  %21 = icmp eq ptr %20, null
  br i1 %21, label %40, label %22

22:                                               ; preds = %18
  %23 = getelementptr inbounds nuw i8, ptr %3, i64 24
  br label %24

24:                                               ; preds = %22, %37
  %25 = phi ptr [ %20, %22 ], [ %38, %37 ]
  %26 = load i64, ptr %25, align 8, !tbaa !9
  %27 = icmp eq i64 %26, 6
  br i1 %27, label %34, label %28

28:                                               ; preds = %24
  %29 = add nsw i64 %26, 1
  %30 = getelementptr inbounds [7 x float], ptr %3, i64 0, i64 %29
  %31 = load float, ptr %30, align 4, !tbaa !5
  %32 = fdiv float %31, 1.500000e+00
  %33 = getelementptr inbounds [7 x float], ptr %3, i64 0, i64 %26
  store float %32, ptr %33, align 4, !tbaa !5
  br label %37

34:                                               ; preds = %24
  %35 = load float, ptr %3, align 4, !tbaa !5
  %36 = fdiv float %35, 1.500000e+00
  store float %36, ptr %23, align 4, !tbaa !5
  br label %37

37:                                               ; preds = %34, %28
  %38 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %1) #2
  %39 = icmp eq ptr %38, null
  br i1 %39, label %40, label %24, !llvm.loop !13

40:                                               ; preds = %37, %18
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %1) #2
  %41 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %1, i32 noundef 0, i32 noundef 7) #2
  %42 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %1) #2
  %43 = icmp eq ptr %42, null
  br i1 %43, label %57, label %44

44:                                               ; preds = %40, %44
  %45 = phi ptr [ %55, %44 ], [ %42, %40 ]
  %46 = load i64, ptr %45, align 8, !tbaa !9
  %47 = getelementptr inbounds [7 x float], ptr %2, i64 0, i64 %46
  %48 = load float, ptr %47, align 4, !tbaa !5
  %49 = getelementptr inbounds [7 x float], ptr %3, i64 0, i64 %46
  %50 = load float, ptr %49, align 4, !tbaa !5
  %51 = fsub float %48, %50
  %52 = fmul float %51, 0x3FA99999A0000000
  store float %52, ptr %47, align 4, !tbaa !5
  %53 = fsub float %50, %52
  store float %53, ptr %49, align 4, !tbaa !5
  %54 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %5, ptr noundef nonnull %45, ptr noundef nonnull %49, i64 noundef 0) #2
  %55 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %1) #2
  %56 = icmp eq ptr %55, null
  br i1 %56, label %57, label %44, !llvm.loop !14

57:                                               ; preds = %44, %40
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %1) #2
  call void @llvm.lifetime.end.p0(i64 28, ptr nonnull %3) #2
  call void @llvm.lifetime.end.p0(i64 28, ptr nonnull %2) #2
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %1) #2
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
!2 = !{!"clang version 20.1.0 (https://github.com/fprime-bpf/llvm-project.git 03a843fe2f5c0023ee1e6ee21d74290f4387a642)"}
!3 = !{i64 2147502639}
!4 = !{i64 2147503151}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"long long", !7, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
