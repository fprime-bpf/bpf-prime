; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

%struct.bpf_iter_num = type { i64, i64, i64, i64 }

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca [16 x i32], align 4
  %2 = alloca i32, align 4
  %3 = alloca %struct.bpf_iter_num, align 8
  %4 = alloca %struct.bpf_iter_num, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.bpf_iter_num, align 8
  %8 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 15, i32 0, i32 0, i32 0) #2, !srcloc !3
  %9 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 16, i32 0, i32 0, i32 0) #2, !srcloc !4
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %1) #2
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2)
  store volatile i32 65535, ptr %2, align 4, !tbaa !5
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %3) #2
  %10 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %3, i32 noundef 0, i32 noundef 16) #2
  %11 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %3) #2
  %12 = icmp eq ptr %11, null
  br i1 %12, label %21, label %13

13:                                               ; preds = %0, %13
  %14 = phi ptr [ %19, %13 ], [ %11, %0 ]
  %15 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %8, ptr noundef nonnull %14) #2
  %16 = load i32, ptr %15, align 4, !tbaa !5
  %17 = load i64, ptr %14, align 8, !tbaa !9
  %18 = getelementptr inbounds [16 x i32], ptr %1, i64 0, i64 %17
  store volatile i32 %16, ptr %18, align 4, !tbaa !5
  %19 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %3) #2
  %20 = icmp eq ptr %19, null
  br i1 %20, label %21, label %13, !llvm.loop !11

21:                                               ; preds = %13, %0
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %3) #2
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %4) #2
  %22 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %4, i32 noundef 0, i32 noundef 512) #2
  %23 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %4) #2
  %24 = icmp eq ptr %23, null
  br i1 %24, label %56, label %25

25:                                               ; preds = %21, %45
  %26 = phi ptr [ %54, %45 ], [ %23, %21 ]
  %27 = load i64, ptr %26, align 8, !tbaa !9
  %28 = and i64 %27, 7
  %29 = icmp eq i64 %28, 0
  br i1 %29, label %30, label %45

30:                                               ; preds = %25
  %31 = ashr exact i64 %27, 3
  %32 = trunc i64 %31 to i32
  %33 = lshr i64 %31, 2
  %34 = and i64 %33, 1073741823
  %35 = getelementptr inbounds nuw [16 x i32], ptr %1, i64 0, i64 %34
  %36 = load volatile i32, ptr %35, align 4, !tbaa !5
  %37 = shl i32 %32, 3
  %38 = and i32 %37, 24
  %39 = xor i32 %38, 24
  %40 = lshr i32 %36, %39
  %41 = shl i32 %40, 8
  %42 = and i32 %41, 65280
  %43 = load volatile i32, ptr %2, align 4, !tbaa !5
  %44 = xor i32 %42, %43
  store volatile i32 %44, ptr %2, align 4, !tbaa !5
  br label %45

45:                                               ; preds = %30, %25
  %46 = load volatile i32, ptr %2, align 4, !tbaa !5
  %47 = load volatile i32, ptr %2, align 4, !tbaa !5
  %48 = shl i32 %47, 1
  %49 = and i32 %46, 32768
  %50 = icmp eq i32 %49, 0
  %51 = select i1 %50, i32 0, i32 4129
  %52 = and i32 %48, 65534
  %53 = xor i32 %52, %51
  store volatile i32 %53, ptr %2, align 4, !tbaa !5
  %54 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %4) #2
  %55 = icmp eq ptr %54, null
  br i1 %55, label %56, label %25, !llvm.loop !14

56:                                               ; preds = %45, %21
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %4) #2
  %57 = load volatile i32, ptr %1, align 4, !tbaa !5
  %58 = and i32 %57, 16383
  %59 = or disjoint i32 %58, 49152
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %5) #2
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %6) #2
  store i32 0, ptr %5, align 4, !tbaa !5
  store i32 291, ptr %6, align 4, !tbaa !5
  %60 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %9, ptr noundef nonnull %5, ptr noundef nonnull %6, i64 noundef 0) #2
  store i32 1, ptr %5, align 4, !tbaa !5
  store i32 %59, ptr %6, align 4, !tbaa !5
  %61 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %9, ptr noundef nonnull %5, ptr noundef nonnull %6, i64 noundef 0) #2
  store i32 2, ptr %5, align 4, !tbaa !5
  store i32 63, ptr %6, align 4, !tbaa !5
  %62 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %9, ptr noundef nonnull %5, ptr noundef nonnull %6, i64 noundef 0) #2
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %7) #2
  %63 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %7, i32 noundef 0, i32 noundef 16) #2
  %64 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %65 = icmp eq ptr %64, null
  br i1 %65, label %76, label %66

66:                                               ; preds = %56, %66
  %67 = phi ptr [ %74, %66 ], [ %64, %56 ]
  %68 = load i64, ptr %67, align 8, !tbaa !9
  %69 = trunc i64 %68 to i32
  %70 = add nsw i32 %69, 3
  store i32 %70, ptr %5, align 4, !tbaa !5
  %71 = getelementptr inbounds [16 x i32], ptr %1, i64 0, i64 %68
  %72 = load volatile i32, ptr %71, align 4, !tbaa !5
  store i32 %72, ptr %6, align 4, !tbaa !5
  %73 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %9, ptr noundef nonnull %5, ptr noundef nonnull %6, i64 noundef 0) #2
  %74 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %75 = icmp eq ptr %74, null
  br i1 %75, label %76, label %66, !llvm.loop !15

76:                                               ; preds = %66, %56
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %7) #2
  store i32 19, ptr %5, align 4, !tbaa !5
  %77 = load volatile i32, ptr %2, align 4, !tbaa !5
  store i32 %77, ptr %6, align 4, !tbaa !5
  %78 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %9, ptr noundef nonnull %5, ptr noundef nonnull %6, i64 noundef 0) #2
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %7) #2
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %6) #2
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %5) #2
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %4) #2
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %3) #2
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2)
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %1) #2
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
!3 = !{i64 2147506445}
!4 = !{i64 2147506961}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"long long", !7, i64 0}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !12, !13}
!15 = distinct !{!15, !12, !13}
