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
  br i1 %8, label %19, label %9

9:                                                ; preds = %0, %9
  %10 = phi ptr [ %17, %9 ], [ %7, %0 ]
  %11 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %4, ptr noundef nonnull %10) #2
  %12 = load float, ptr %11, align 4, !tbaa !5
  %13 = load i32, ptr %10, align 4, !tbaa !9
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [7 x float], ptr %2, i64 0, i64 %14
  store float %12, ptr %15, align 4, !tbaa !5
  %16 = getelementptr inbounds [7 x float], ptr %3, i64 0, i64 %14
  store float %12, ptr %16, align 4, !tbaa !5
  %17 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %1) #2
  %18 = icmp eq ptr %17, null
  br i1 %18, label %19, label %9, !llvm.loop !11

19:                                               ; preds = %9, %0
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %1) #2
  %20 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %1, i32 noundef 0, i32 noundef 7) #2
  %21 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %1) #2
  %22 = icmp eq ptr %21, null
  br i1 %22, label %43, label %23

23:                                               ; preds = %19
  %24 = getelementptr inbounds nuw i8, ptr %3, i64 24
  br label %25

25:                                               ; preds = %23, %40
  %26 = phi ptr [ %21, %23 ], [ %41, %40 ]
  %27 = load i32, ptr %26, align 4, !tbaa !9
  %28 = icmp eq i32 %27, 6
  br i1 %28, label %37, label %29

29:                                               ; preds = %25
  %30 = add nsw i32 %27, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [7 x float], ptr %3, i64 0, i64 %31
  %33 = load float, ptr %32, align 4, !tbaa !5
  %34 = fdiv float %33, 1.500000e+00
  %35 = sext i32 %27 to i64
  %36 = getelementptr inbounds [7 x float], ptr %3, i64 0, i64 %35
  store float %34, ptr %36, align 4, !tbaa !5
  br label %40

37:                                               ; preds = %25
  %38 = load float, ptr %3, align 4, !tbaa !5
  %39 = fdiv float %38, 1.500000e+00
  store float %39, ptr %24, align 4, !tbaa !5
  br label %40

40:                                               ; preds = %37, %29
  %41 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %1) #2
  %42 = icmp eq ptr %41, null
  br i1 %42, label %43, label %25, !llvm.loop !13

43:                                               ; preds = %40, %19
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %1) #2
  %44 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %1, i32 noundef 0, i32 noundef 7) #2
  %45 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %1) #2
  %46 = icmp eq ptr %45, null
  br i1 %46, label %61, label %47

47:                                               ; preds = %43, %47
  %48 = phi ptr [ %59, %47 ], [ %45, %43 ]
  %49 = load i32, ptr %48, align 4, !tbaa !9
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [7 x float], ptr %2, i64 0, i64 %50
  %52 = load float, ptr %51, align 4, !tbaa !5
  %53 = getelementptr inbounds [7 x float], ptr %3, i64 0, i64 %50
  %54 = load float, ptr %53, align 4, !tbaa !5
  %55 = fsub float %52, %54
  %56 = fmul float %55, 0x3FA99999A0000000
  store float %56, ptr %51, align 4, !tbaa !5
  %57 = fsub float %54, %56
  store float %57, ptr %53, align 4, !tbaa !5
  %58 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %5, ptr noundef nonnull %48, ptr noundef nonnull %53, i64 noundef 0) #2
  %59 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %1) #2
  %60 = icmp eq ptr %59, null
  br i1 %60, label %61, label %47, !llvm.loop !14

61:                                               ; preds = %47, %43
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
!2 = !{!"clang version 20.1.0 (https://github.com/fprime-bpf/llvm-project.git 3047ef595b8b4944540de771dcf86dc85a97ef76)"}
!3 = !{i64 2147502642}
!4 = !{i64 2147503154}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !7, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
