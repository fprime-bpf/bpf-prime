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
  br i1 %7, label %21, label %8

8:                                                ; preds = %0, %8
  %9 = phi ptr [ %19, %8 ], [ %6, %0 ]
  %10 = call i32 inttoptr (i64 8 to ptr)(i32 noundef 0, i32 noundef 100) #3
  %11 = sitofp i32 %10 to float
  %12 = load i64, ptr %9, align 8, !tbaa !3
  %13 = getelementptr inbounds [100 x float], ptr %1, i64 0, i64 %12
  store volatile float %11, ptr %13, align 4, !tbaa !7
  %14 = call i32 inttoptr (i64 8 to ptr)(i32 noundef 0, i32 noundef 100) #3
  %15 = sitofp i32 %14 to float
  %16 = load i64, ptr %9, align 8, !tbaa !3
  %17 = getelementptr inbounds [100 x float], ptr %2, i64 0, i64 %16
  store volatile float %15, ptr %17, align 4, !tbaa !7
  %18 = getelementptr inbounds [100 x float], ptr %3, i64 0, i64 %16
  store volatile float 0.000000e+00, ptr %18, align 4, !tbaa !7
  %19 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %4) #3
  %20 = icmp eq ptr %19, null
  br i1 %20, label %21, label %8, !llvm.loop !9

21:                                               ; preds = %8, %0
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %4) #3
  %22 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %4, i32 noundef 0, i32 noundef 1000) #3
  %23 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %4) #3
  %24 = icmp eq ptr %23, null
  br i1 %24, label %52, label %25

25:                                               ; preds = %21, %25
  %26 = phi ptr [ %50, %25 ], [ %23, %21 ]
  %27 = load i64, ptr %26, align 8, !tbaa !3
  %28 = trunc i64 %27 to i32
  %29 = sdiv i32 %28, 100
  %30 = freeze i32 %28
  %31 = sdiv i32 %30, 10
  %32 = srem i32 %31, 10
  %33 = mul i32 %31, 10
  %34 = sub i32 %30, %33
  %35 = mul nsw i32 %29, 10
  %36 = add nsw i32 %35, %34
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [100 x float], ptr %1, i64 0, i64 %37
  %39 = load volatile float, ptr %38, align 4, !tbaa !7
  %40 = mul nsw i32 %34, 10
  %41 = add nsw i32 %40, %32
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [100 x float], ptr %2, i64 0, i64 %42
  %44 = load volatile float, ptr %43, align 4, !tbaa !7
  %45 = add nsw i32 %35, %32
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [100 x float], ptr %3, i64 0, i64 %46
  %48 = load volatile float, ptr %47, align 4, !tbaa !7
  %49 = call float @llvm.fmuladd.f32(float %39, float %44, float %48)
  store volatile float %49, ptr %47, align 4, !tbaa !7
  %50 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %4) #3
  %51 = icmp eq ptr %50, null
  br i1 %51, label %52, label %25, !llvm.loop !11

52:                                               ; preds = %25, %21
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
!2 = !{!"clang version 20.1.0 (https://github.com/fprime-bpf/llvm-project.git 03a843fe2f5c0023ee1e6ee21d74290f4387a642)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"long long", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !5, i64 0}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
