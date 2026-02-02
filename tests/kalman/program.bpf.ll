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
  %4 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #2, !srcloc !3
  %5 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 1, i32 0, i32 0, i32 0) #2, !srcloc !4
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
  %20 = call ptr inttoptr (i64 7 to ptr)(ptr noundef nonnull %1) #2
  %21 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %1, i32 noundef 0, i32 noundef 7) #2
  %22 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %1) #2
  %23 = icmp eq ptr %22, null
  br i1 %23, label %44, label %24

24:                                               ; preds = %19
  %25 = getelementptr inbounds nuw i8, ptr %3, i64 24
  br label %26

26:                                               ; preds = %24, %41
  %27 = phi ptr [ %22, %24 ], [ %42, %41 ]
  %28 = load i32, ptr %27, align 4, !tbaa !9
  %29 = icmp eq i32 %28, 6
  br i1 %29, label %38, label %30

30:                                               ; preds = %26
  %31 = add nsw i32 %28, 1
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [7 x float], ptr %3, i64 0, i64 %32
  %34 = load float, ptr %33, align 4, !tbaa !5
  %35 = fdiv float %34, 1.500000e+00
  %36 = sext i32 %28 to i64
  %37 = getelementptr inbounds [7 x float], ptr %3, i64 0, i64 %36
  store float %35, ptr %37, align 4, !tbaa !5
  br label %41

38:                                               ; preds = %26
  %39 = load float, ptr %3, align 4, !tbaa !5
  %40 = fdiv float %39, 1.500000e+00
  store float %40, ptr %25, align 4, !tbaa !5
  br label %41

41:                                               ; preds = %38, %30
  %42 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %1) #2
  %43 = icmp eq ptr %42, null
  br i1 %43, label %44, label %26, !llvm.loop !14

44:                                               ; preds = %41, %19
  %45 = call ptr inttoptr (i64 7 to ptr)(ptr noundef nonnull %1) #2
  %46 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %1, i32 noundef 0, i32 noundef 7) #2
  %47 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %1) #2
  %48 = icmp eq ptr %47, null
  br i1 %48, label %63, label %49

49:                                               ; preds = %44, %49
  %50 = phi ptr [ %61, %49 ], [ %47, %44 ]
  %51 = load i32, ptr %50, align 4, !tbaa !9
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [7 x float], ptr %2, i64 0, i64 %52
  %54 = load float, ptr %53, align 4, !tbaa !5
  %55 = getelementptr inbounds [7 x float], ptr %3, i64 0, i64 %52
  %56 = load float, ptr %55, align 4, !tbaa !5
  %57 = fsub float %54, %56
  %58 = fmul float %57, 0x3FA99999A0000000
  store float %58, ptr %53, align 4, !tbaa !5
  %59 = fsub float %56, %58
  store float %59, ptr %55, align 4, !tbaa !5
  %60 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %5, ptr noundef nonnull %50, ptr noundef nonnull %55, i64 noundef 0) #2
  %61 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %1) #2
  %62 = icmp eq ptr %61, null
  br i1 %62, label %63, label %49, !llvm.loop !15

63:                                               ; preds = %49, %44
  %64 = call ptr inttoptr (i64 7 to ptr)(ptr noundef nonnull %1) #2
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
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 3047ef595b8b4944540de771dcf86dc85a97ef76)"}
!3 = !{i64 2147502526}
!4 = !{i64 2147503038}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !7, i64 0}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !12, !13}
!15 = distinct !{!15, !12, !13}
