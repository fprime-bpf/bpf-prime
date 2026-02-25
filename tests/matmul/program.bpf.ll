; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

%struct.bpf_iter_num = type { i64, i64, i64, i64 }

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca [100 x float], align 4
  %2 = alloca [100 x float], align 4
  %3 = alloca [100 x float], align 4
  %4 = alloca %struct.bpf_iter_num, align 8
  call void @llvm.lifetime.start.p0(i64 400, ptr nonnull %1) #3
  call void @llvm.lifetime.start.p0(i64 400, ptr nonnull %2) #3
  call void @llvm.lifetime.start.p0(i64 400, ptr nonnull %3) #3
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %4) #3
  %5 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %4, i32 noundef 0, i32 noundef 100) #3
  %6 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %4) #3
  %7 = icmp eq ptr %6, null
  br i1 %7, label %23, label %8

8:                                                ; preds = %0, %8
  %9 = phi ptr [ %21, %8 ], [ %6, %0 ]
  %10 = call i32 inttoptr (i64 8 to ptr)(i32 noundef 0, i32 noundef 100) #3
  %11 = sitofp i32 %10 to float
  %12 = load i32, ptr %9, align 4, !tbaa !3
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [100 x float], ptr %1, i64 0, i64 %13
  store volatile float %11, ptr %14, align 4, !tbaa !7
  %15 = call i32 inttoptr (i64 8 to ptr)(i32 noundef 0, i32 noundef 100) #3
  %16 = sitofp i32 %15 to float
  %17 = load i32, ptr %9, align 4, !tbaa !3
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [100 x float], ptr %2, i64 0, i64 %18
  store volatile float %16, ptr %19, align 4, !tbaa !7
  %20 = getelementptr inbounds [100 x float], ptr %3, i64 0, i64 %18
  store volatile float 0.000000e+00, ptr %20, align 4, !tbaa !7
  %21 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %4) #3
  %22 = icmp eq ptr %21, null
  br i1 %22, label %23, label %8, !llvm.loop !9

23:                                               ; preds = %8, %0
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %4) #3
  %24 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %4, i32 noundef 0, i32 noundef 1000) #3
  %25 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %4) #3
  %26 = icmp eq ptr %25, null
  br i1 %26, label %53, label %27

27:                                               ; preds = %23, %27
  %28 = phi ptr [ %51, %27 ], [ %25, %23 ]
  %29 = load i32, ptr %28, align 4, !tbaa !3
  %30 = sdiv i32 %29, 100
  %31 = freeze i32 %29
  %32 = sdiv i32 %31, 10
  %33 = srem i32 %32, 10
  %34 = mul i32 %32, 10
  %35 = sub i32 %31, %34
  %36 = mul nsw i32 %30, 10
  %37 = add nsw i32 %36, %35
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [100 x float], ptr %1, i64 0, i64 %38
  %40 = load volatile float, ptr %39, align 4, !tbaa !7
  %41 = mul nsw i32 %35, 10
  %42 = add nsw i32 %41, %33
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [100 x float], ptr %2, i64 0, i64 %43
  %45 = load volatile float, ptr %44, align 4, !tbaa !7
  %46 = add nsw i32 %36, %33
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [100 x float], ptr %3, i64 0, i64 %47
  %49 = load volatile float, ptr %48, align 4, !tbaa !7
  %50 = call float @llvm.fmuladd.f32(float %40, float %45, float %49)
  store volatile float %50, ptr %48, align 4, !tbaa !7
  %51 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %4) #3
  %52 = icmp eq ptr %51, null
  br i1 %52, label %53, label %27, !llvm.loop !12

53:                                               ; preds = %27, %23
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %4) #3
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %4) #3
  call void @llvm.lifetime.end.p0(i64 400, ptr nonnull %3) #3
  call void @llvm.lifetime.end.p0(i64 400, ptr nonnull %2) #3
  call void @llvm.lifetime.end.p0(i64 400, ptr nonnull %1) #3
  ret i32 0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="duotronic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 3047ef595b8b4944540de771dcf86dc85a97ef76)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !5, i64 0}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !10, !11}
