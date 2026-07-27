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
  %5 = alloca %struct.bpf_iter_num, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.bpf_iter_num, align 8
  %9 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #2, !srcloc !3
  %10 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 1, i32 0, i32 0, i32 0) #2, !srcloc !4
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %1) #2
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2)
  store volatile i32 65535, ptr %2, align 4, !tbaa !5
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %3) #2
  %11 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %3, i32 noundef 0, i32 noundef 16) #2
  %12 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %3) #2
  %13 = icmp eq ptr %12, null
  br i1 %13, label %22, label %14

14:                                               ; preds = %0, %14
  %15 = phi ptr [ %20, %14 ], [ %12, %0 ]
  %16 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %9, ptr noundef nonnull %15) #2
  %17 = load i32, ptr %16, align 4, !tbaa !5
  %18 = load i64, ptr %15, align 8, !tbaa !9
  %19 = getelementptr inbounds [16 x i32], ptr %1, i64 0, i64 %18
  store volatile i32 %17, ptr %19, align 4, !tbaa !5
  %20 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %3) #2
  %21 = icmp eq ptr %20, null
  br i1 %21, label %22, label %14, !llvm.loop !11

22:                                               ; preds = %14, %0
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %3) #2
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %4) #2
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %5) #2
  %23 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %4, i32 noundef 0, i32 noundef 64) #2
  %24 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %4) #2
  %25 = icmp eq ptr %24, null
  br i1 %25, label %61, label %26

26:                                               ; preds = %22, %58
  %27 = phi ptr [ %59, %58 ], [ %24, %22 ]
  %28 = load i64, ptr %27, align 8, !tbaa !9
  %29 = freeze i64 %28
  %30 = sdiv i64 %29, 4
  %31 = getelementptr inbounds [16 x i32], ptr %1, i64 0, i64 %30
  %32 = load volatile i32, ptr %31, align 4, !tbaa !5
  %33 = mul i64 %30, 4
  %34 = sub i64 %29, %33
  %35 = trunc nsw i64 %34 to i32
  %36 = shl nsw i32 %35, 3
  %37 = sub nsw i32 24, %36
  %38 = lshr i32 %32, %37
  %39 = shl i32 %38, 8
  %40 = and i32 %39, 65280
  %41 = load volatile i32, ptr %2, align 4, !tbaa !5
  %42 = xor i32 %40, %41
  store volatile i32 %42, ptr %2, align 4, !tbaa !5
  %43 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %5, i32 noundef 0, i32 noundef 8) #2
  %44 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %45 = icmp eq ptr %44, null
  br i1 %45, label %58, label %46

46:                                               ; preds = %26, %46
  %47 = load volatile i32, ptr %2, align 4, !tbaa !5
  %48 = and i32 %47, 32768
  %49 = icmp eq i32 %48, 0
  %50 = load volatile i32, ptr %2, align 4, !tbaa !5
  %51 = shl i32 %50, 1
  %52 = xor i32 %51, 4129
  %53 = select i1 %49, i32 %51, i32 %52
  store volatile i32 %53, ptr %2, align 4, !tbaa !5
  %54 = load volatile i32, ptr %2, align 4, !tbaa !5
  %55 = and i32 %54, 65535
  store volatile i32 %55, ptr %2, align 4, !tbaa !5
  %56 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %57 = icmp eq ptr %56, null
  br i1 %57, label %58, label %46, !llvm.loop !14

58:                                               ; preds = %46, %26
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %5) #2
  %59 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %4) #2
  %60 = icmp eq ptr %59, null
  br i1 %60, label %61, label %26, !llvm.loop !15

61:                                               ; preds = %58, %22
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %4) #2
  %62 = load volatile i32, ptr %1, align 4, !tbaa !5
  %63 = and i32 %62, 16383
  %64 = or disjoint i32 %63, 49152
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %6) #2
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %7) #2
  store i32 0, ptr %6, align 4, !tbaa !5
  store i32 291, ptr %7, align 4, !tbaa !5
  %65 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %10, ptr noundef nonnull %6, ptr noundef nonnull %7, i64 noundef 0) #2
  store i32 1, ptr %6, align 4, !tbaa !5
  store i32 %64, ptr %7, align 4, !tbaa !5
  %66 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %10, ptr noundef nonnull %6, ptr noundef nonnull %7, i64 noundef 0) #2
  store i32 2, ptr %6, align 4, !tbaa !5
  store i32 63, ptr %7, align 4, !tbaa !5
  %67 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %10, ptr noundef nonnull %6, ptr noundef nonnull %7, i64 noundef 0) #2
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %8) #2
  %68 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %8, i32 noundef 0, i32 noundef 16) #2
  %69 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %8) #2
  %70 = icmp eq ptr %69, null
  br i1 %70, label %81, label %71

71:                                               ; preds = %61, %71
  %72 = phi ptr [ %79, %71 ], [ %69, %61 ]
  %73 = load i64, ptr %72, align 8, !tbaa !9
  %74 = trunc i64 %73 to i32
  %75 = add nsw i32 %74, 3
  store i32 %75, ptr %6, align 4, !tbaa !5
  %76 = getelementptr inbounds [16 x i32], ptr %1, i64 0, i64 %73
  %77 = load volatile i32, ptr %76, align 4, !tbaa !5
  store i32 %77, ptr %7, align 4, !tbaa !5
  %78 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %10, ptr noundef nonnull %6, ptr noundef nonnull %7, i64 noundef 0) #2
  %79 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %8) #2
  %80 = icmp eq ptr %79, null
  br i1 %80, label %81, label %71, !llvm.loop !16

81:                                               ; preds = %71, %61
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %8) #2
  store i32 19, ptr %6, align 4, !tbaa !5
  %82 = load volatile i32, ptr %2, align 4, !tbaa !5
  store i32 %82, ptr %7, align 4, !tbaa !5
  %83 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %10, ptr noundef nonnull %6, ptr noundef nonnull %7, i64 noundef 0) #2
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %8) #2
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %7) #2
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %6) #2
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %5) #2
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
!3 = !{i64 2147505560}
!4 = !{i64 2147506072}
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
!16 = distinct !{!16, !12, !13}
