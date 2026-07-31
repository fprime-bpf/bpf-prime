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
  br i1 %7, label %25, label %8

8:                                                ; preds = %0, %8
  %9 = phi ptr [ %23, %8 ], [ %6, %0 ]
  %10 = call i32 inttoptr (i64 8 to ptr)(i32 noundef 0, i32 noundef 100) #3
  %11 = or i32 %10, 1258291200
  %12 = bitcast i32 %11 to float
  %13 = fadd float %12, 0xC160000000000000
  %14 = load i64, ptr %9, align 8, !tbaa !3
  %15 = getelementptr inbounds [100 x float], ptr %1, i64 0, i64 %14
  store volatile float %13, ptr %15, align 4, !tbaa !7
  %16 = call i32 inttoptr (i64 8 to ptr)(i32 noundef 0, i32 noundef 100) #3
  %17 = or i32 %16, 1258291200
  %18 = bitcast i32 %17 to float
  %19 = fadd float %18, 0xC160000000000000
  %20 = load i64, ptr %9, align 8, !tbaa !3
  %21 = getelementptr inbounds [100 x float], ptr %2, i64 0, i64 %20
  store volatile float %19, ptr %21, align 4, !tbaa !7
  %22 = getelementptr inbounds [100 x float], ptr %3, i64 0, i64 %20
  store volatile float 0.000000e+00, ptr %22, align 4, !tbaa !7
  %23 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %4) #3
  %24 = icmp eq ptr %23, null
  br i1 %24, label %25, label %8, !llvm.loop !9

25:                                               ; preds = %8, %0
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %4) #3
  %26 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %4, i32 noundef 0, i32 noundef 1000) #3
  %27 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %4) #3
  %28 = icmp eq ptr %27, null
  br i1 %28, label %56, label %29

29:                                               ; preds = %25, %29
  %30 = phi ptr [ %54, %29 ], [ %27, %25 ]
  %31 = load i64, ptr %30, align 8, !tbaa !3
  %32 = trunc i64 %31 to i32
  %33 = sdiv i32 %32, 100
  %34 = freeze i32 %32
  %35 = sdiv i32 %34, 10
  %36 = srem i32 %35, 10
  %37 = mul i32 %35, 10
  %38 = sub i32 %34, %37
  %39 = mul nsw i32 %33, 10
  %40 = add nsw i32 %39, %38
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [100 x float], ptr %1, i64 0, i64 %41
  %43 = load volatile float, ptr %42, align 4, !tbaa !7
  %44 = mul nsw i32 %38, 10
  %45 = add nsw i32 %44, %36
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [100 x float], ptr %2, i64 0, i64 %46
  %48 = load volatile float, ptr %47, align 4, !tbaa !7
  %49 = add nsw i32 %39, %36
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [100 x float], ptr %3, i64 0, i64 %50
  %52 = load volatile float, ptr %51, align 4, !tbaa !7
  %53 = call float @llvm.fmuladd.f32(float %43, float %48, float %52)
  store volatile float %53, ptr %51, align 4, !tbaa !7
  %54 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %4) #3
  %55 = icmp eq ptr %54, null
  br i1 %55, label %56, label %29, !llvm.loop !12

56:                                               ; preds = %29, %25
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
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 03a843fe2f5c0023ee1e6ee21d74290f4387a642)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"long long", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !5, i64 0}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !10, !11}
