; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

%struct.bpf_iter_num = type { i64, i64, i64, i64 }

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca %struct.bpf_iter_num, align 8
  %2 = alloca float, align 4
  %3 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 3, i32 0, i32 0, i32 0) #3, !srcloc !3
  %4 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 4, i32 0, i32 0, i32 0) #3, !srcloc !4
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %1) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2) #3
  store float 0.000000e+00, ptr %2, align 4, !tbaa !5
  %5 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %1, i32 noundef 0, i32 noundef 7) #3
  %6 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %1) #3
  %7 = icmp eq ptr %6, null
  br i1 %7, label %24, label %8

8:                                                ; preds = %0, %8
  %9 = phi ptr [ %22, %8 ], [ %6, %0 ]
  %10 = phi float [ %20, %8 ], [ 1.000000e+03, %0 ]
  %11 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %3, ptr noundef nonnull %9) #3
  %12 = load float, ptr %11, align 4, !tbaa !5
  %13 = fadd float %10, 0x3F847AE140000000
  %14 = fadd float %13, 5.000000e-01
  %15 = fdiv float %13, %14
  %16 = load float, ptr %2, align 4, !tbaa !5
  %17 = fsub float %12, %16
  %18 = call float @llvm.fmuladd.f32(float %15, float %17, float %16)
  store float %18, ptr %2, align 4, !tbaa !5
  %19 = fsub float 1.000000e+00, %15
  %20 = fmul float %13, %19
  %21 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %4, ptr noundef nonnull %9, ptr noundef nonnull %2, i64 noundef 0) #3
  %22 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %1) #3
  %23 = icmp eq ptr %22, null
  br i1 %23, label %24, label %8, !llvm.loop !9

24:                                               ; preds = %8, %0
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %1) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2) #3
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
!3 = !{i64 2147502880}
!4 = !{i64 2147503392}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.unroll.disable"}
