; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

%struct.bpf_iter_num = type { i64, i64, i64, i64 }

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca [2500 x i32], align 4
  %2 = alloca [25 x i32], align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca %struct.bpf_iter_num, align 8
  %6 = alloca %struct.bpf_iter_num, align 8
  %7 = alloca %struct.bpf_iter_num, align 8
  %8 = alloca %struct.bpf_iter_num, align 8
  %9 = alloca i32, align 4
  %10 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 13, i32 0, i32 0, i32 0) #3, !srcloc !3
  %11 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 14, i32 0, i32 0, i32 0) #3, !srcloc !4
  call void @llvm.lifetime.start.p0(i64 10000, ptr nonnull %1) #3
  call void @llvm.lifetime.start.p0(i64 100, ptr nonnull %2) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %3) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4)
  store volatile i32 -1, ptr %4, align 4, !tbaa !5
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %5) #3
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %6) #3
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %7) #3
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %8) #3
  %12 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %5, i32 noundef 0, i32 noundef 2500) #3
  %13 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #3
  %14 = icmp eq ptr %13, null
  br i1 %14, label %23, label %15

15:                                               ; preds = %0, %15
  %16 = phi ptr [ %21, %15 ], [ %13, %0 ]
  %17 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %10, ptr noundef nonnull %16) #3
  %18 = load i32, ptr %17, align 4, !tbaa !5
  %19 = load i64, ptr %16, align 8, !tbaa !9
  %20 = getelementptr inbounds [2500 x i32], ptr %1, i64 0, i64 %19
  store volatile i32 %18, ptr %20, align 4, !tbaa !5
  %21 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #3
  %22 = icmp eq ptr %21, null
  br i1 %22, label %23, label %15, !llvm.loop !11

23:                                               ; preds = %15, %0
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %5) #3
  %24 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %5, i32 noundef 0, i32 noundef 25) #3
  %25 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #3
  %26 = icmp eq ptr %25, null
  br i1 %26, label %35, label %27

27:                                               ; preds = %23, %27
  %28 = phi ptr [ %33, %27 ], [ %25, %23 ]
  %29 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %11, ptr noundef nonnull %28) #3
  %30 = load i32, ptr %29, align 4, !tbaa !5
  %31 = load i64, ptr %28, align 8, !tbaa !9
  %32 = getelementptr inbounds [25 x i32], ptr %2, i64 0, i64 %31
  store volatile i32 %30, ptr %32, align 4, !tbaa !5
  %33 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #3
  %34 = icmp eq ptr %33, null
  br i1 %34, label %35, label %27, !llvm.loop !13

35:                                               ; preds = %27, %23
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %5) #3
  %36 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %5, i32 noundef 0, i32 noundef 46) #3
  %37 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #3
  %38 = icmp eq ptr %37, null
  br i1 %38, label %113, label %39

39:                                               ; preds = %35, %110
  %40 = phi ptr [ %111, %110 ], [ %37, %35 ]
  %41 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %6, i32 noundef 0, i32 noundef 46) #3
  %42 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %6) #3
  %43 = icmp eq ptr %42, null
  br i1 %43, label %110, label %44

44:                                               ; preds = %39, %107
  %45 = phi ptr [ %108, %107 ], [ %42, %39 ]
  %46 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %7, i32 noundef 0, i32 noundef 5) #3
  %47 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #3
  %48 = icmp eq ptr %47, null
  br i1 %48, label %97, label %49

49:                                               ; preds = %44, %93
  %50 = phi ptr [ %95, %93 ], [ %47, %44 ]
  %51 = phi i32 [ %94, %93 ], [ 0, %44 ]
  %52 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %8, i32 noundef 0, i32 noundef 5) #3
  %53 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %8) #3
  %54 = icmp eq ptr %53, null
  br i1 %54, label %93, label %55

55:                                               ; preds = %49, %55
  %56 = phi ptr [ %91, %55 ], [ %53, %49 ]
  %57 = phi i32 [ %90, %55 ], [ %51, %49 ]
  %58 = load i64, ptr %40, align 8, !tbaa !9
  %59 = load i64, ptr %50, align 8, !tbaa !9
  %60 = add nsw i64 %59, %58
  %61 = mul nsw i64 %60, 50
  %62 = load i64, ptr %45, align 8, !tbaa !9
  %63 = load i64, ptr %56, align 8, !tbaa !9
  %64 = add nsw i64 %63, %62
  %65 = add nsw i64 %64, %61
  %66 = getelementptr inbounds [2500 x i32], ptr %1, i64 0, i64 %65
  %67 = load volatile i32, ptr %66, align 4, !tbaa !5
  %68 = mul nsw i64 %59, 5
  %69 = add nsw i64 %63, %68
  %70 = getelementptr inbounds [25 x i32], ptr %2, i64 0, i64 %69
  %71 = load volatile i32, ptr %70, align 4, !tbaa !5
  %72 = and i32 %67, 15
  %73 = and i32 %71, 15
  %74 = sub nsw i32 %72, %73
  %75 = call i32 @llvm.abs.i32(i32 %74, i1 true)
  %76 = add i32 %75, %57
  %77 = lshr i32 %67, 4
  %78 = and i32 %77, 15
  %79 = lshr i32 %71, 4
  %80 = and i32 %79, 15
  %81 = sub nsw i32 %78, %80
  %82 = call i32 @llvm.abs.i32(i32 %81, i1 true)
  %83 = add i32 %76, %82
  %84 = lshr i32 %67, 8
  %85 = and i32 %84, 15
  %86 = lshr i32 %71, 8
  %87 = and i32 %86, 15
  %88 = sub nsw i32 %85, %87
  %89 = call i32 @llvm.abs.i32(i32 %88, i1 true)
  %90 = add i32 %83, %89
  %91 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %8) #3
  %92 = icmp eq ptr %91, null
  br i1 %92, label %93, label %55, !llvm.loop !14

93:                                               ; preds = %55, %49
  %94 = phi i32 [ %51, %49 ], [ %90, %55 ]
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %8) #3
  %95 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #3
  %96 = icmp eq ptr %95, null
  br i1 %96, label %97, label %49, !llvm.loop !15

97:                                               ; preds = %93, %44
  %98 = phi i32 [ 0, %44 ], [ %94, %93 ]
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %7) #3
  %99 = load volatile i32, ptr %4, align 4, !tbaa !5
  %100 = icmp ult i32 %98, %99
  br i1 %100, label %101, label %107

101:                                              ; preds = %97
  %102 = load i64, ptr %40, align 8, !tbaa !9
  %103 = mul nsw i64 %102, 50
  %104 = load i64, ptr %45, align 8, !tbaa !9
  %105 = add nsw i64 %103, %104
  %106 = trunc i64 %105 to i32
  store volatile i32 %106, ptr %3, align 4, !tbaa !5
  store volatile i32 %98, ptr %4, align 4, !tbaa !5
  br label %107

107:                                              ; preds = %101, %97
  %108 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %6) #3
  %109 = icmp eq ptr %108, null
  br i1 %109, label %110, label %44, !llvm.loop !16

110:                                              ; preds = %107, %39
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %6) #3
  %111 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #3
  %112 = icmp eq ptr %111, null
  br i1 %112, label %113, label %39, !llvm.loop !17

113:                                              ; preds = %110, %35
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %5) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %9) #3
  store i32 0, ptr %9, align 4, !tbaa !5
  %114 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %11, ptr noundef nonnull %9, ptr noundef nonnull %3, i64 noundef 0) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %9) #3
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %8) #3
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %7) #3
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %6) #3
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %5) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %3) #3
  call void @llvm.lifetime.end.p0(i64 100, ptr nonnull %2) #3
  call void @llvm.lifetime.end.p0(i64 10000, ptr nonnull %1) #3
  ret i32 0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #2

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="duotronic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 20.1.0 (https://github.com/fprime-bpf/llvm-project.git 03a843fe2f5c0023ee1e6ee21d74290f4387a642)"}
!3 = !{i64 2147504267}
!4 = !{i64 2147504783}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"long long", !7, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}
!17 = distinct !{!17, !12}
