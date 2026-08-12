; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

%struct.bpf_iter_num = type { i64, i64, i64, i64 }

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca %struct.bpf_iter_num, align 8
  %2 = alloca [7 x float], align 4
  %3 = alloca float, align 4
  %4 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 2, i32 0, i32 0, i32 0) #3, !srcloc !3
  %5 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 4, i32 0, i32 0, i32 0) #3, !srcloc !4
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %1) #3
  call void @llvm.lifetime.start.p0(i64 28, ptr nonnull %2) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %3) #3
  store float 0.000000e+00, ptr %3, align 4, !tbaa !5
  %6 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %1, i32 noundef 0, i32 noundef 7) #3
  %7 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %1) #3
  %8 = icmp eq ptr %7, null
  br i1 %8, label %17, label %9

9:                                                ; preds = %0, %9
  %10 = phi ptr [ %15, %9 ], [ %7, %0 ]
  %11 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %4, ptr noundef nonnull %10) #3
  %12 = load float, ptr %11, align 4, !tbaa !5
  %13 = load i64, ptr %10, align 8, !tbaa !9
  %14 = getelementptr inbounds [7 x float], ptr %2, i64 0, i64 %13
  store float %12, ptr %14, align 4, !tbaa !5
  %15 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %1) #3
  %16 = icmp eq ptr %15, null
  br i1 %16, label %17, label %9, !llvm.loop !11

17:                                               ; preds = %9, %0
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %1) #3
  %18 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %1, i32 noundef 0, i32 noundef 7) #3
  %19 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %1) #3
  %20 = icmp eq ptr %19, null
  br i1 %20, label %32, label %21

21:                                               ; preds = %17, %21
  %22 = phi ptr [ %30, %21 ], [ %19, %17 ]
  %23 = load i64, ptr %22, align 8, !tbaa !9
  %24 = getelementptr inbounds [7 x float], ptr %2, i64 0, i64 %23
  %25 = load float, ptr %24, align 4, !tbaa !5
  %26 = load float, ptr %3, align 4, !tbaa !5
  %27 = fmul float %26, 0x3FE99999A0000000
  %28 = call float @llvm.fmuladd.f32(float %25, float 0x3FC99999A0000000, float %27)
  store float %28, ptr %3, align 4, !tbaa !5
  %29 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %5, ptr noundef nonnull %22, ptr noundef nonnull %3, i64 noundef 0) #3
  %30 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %1) #3
  %31 = icmp eq ptr %30, null
  br i1 %31, label %32, label %21, !llvm.loop !14

32:                                               ; preds = %21, %17
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %1) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %3) #3
  call void @llvm.lifetime.end.p0(i64 28, ptr nonnull %2) #3
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %1) #3
  ret i32 0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #2

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="duotronic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 03a843fe2f5c0023ee1e6ee21d74290f4387a642)"}
!3 = !{i64 2147502599}
!4 = !{i64 2147503111}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"long long", !7, i64 0}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !12, !13}
