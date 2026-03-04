; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

%struct.bpf_iter_num = type { i32, i32, i32, i32 }

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca [2500 x i32], align 4
  %2 = alloca [25 x i32], align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca %struct.bpf_iter_num, align 4
  %6 = alloca %struct.bpf_iter_num, align 4
  %7 = alloca %struct.bpf_iter_num, align 4
  %8 = alloca %struct.bpf_iter_num, align 4
  %9 = alloca i32, align 4
  %10 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 13, i32 0, i32 0, i32 0) #3, !srcloc !3
  %11 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 14, i32 0, i32 0, i32 0) #3, !srcloc !4
  call void @llvm.lifetime.start.p0(i64 10000, ptr nonnull %1) #3
  call void @llvm.lifetime.start.p0(i64 100, ptr nonnull %2) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %3) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4)
  store volatile i32 -1, ptr %4, align 4, !tbaa !5
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %5) #3
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %6) #3
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %7) #3
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %8) #3
  %12 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %5, i32 noundef 0, i32 noundef 2500) #3
  %13 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #3
  %14 = icmp eq ptr %13, null
  br i1 %14, label %24, label %15

15:                                               ; preds = %0, %15
  %16 = phi ptr [ %22, %15 ], [ %13, %0 ]
  %17 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %10, ptr noundef nonnull %16) #3
  %18 = load i32, ptr %17, align 4, !tbaa !5
  %19 = load i32, ptr %16, align 4, !tbaa !5
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [2500 x i32], ptr %1, i64 0, i64 %20
  store volatile i32 %18, ptr %21, align 4, !tbaa !5
  %22 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #3
  %23 = icmp eq ptr %22, null
  br i1 %23, label %24, label %15, !llvm.loop !9

24:                                               ; preds = %15, %0
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %5) #3
  %25 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %5, i32 noundef 0, i32 noundef 25) #3
  %26 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #3
  %27 = icmp eq ptr %26, null
  br i1 %27, label %37, label %28

28:                                               ; preds = %24, %28
  %29 = phi ptr [ %35, %28 ], [ %26, %24 ]
  %30 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %11, ptr noundef nonnull %29) #3
  %31 = load i32, ptr %30, align 4, !tbaa !5
  %32 = load i32, ptr %29, align 4, !tbaa !5
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [25 x i32], ptr %2, i64 0, i64 %33
  store volatile i32 %31, ptr %34, align 4, !tbaa !5
  %35 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #3
  %36 = icmp eq ptr %35, null
  br i1 %36, label %37, label %28, !llvm.loop !11

37:                                               ; preds = %28, %24
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %5) #3
  %38 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %5, i32 noundef 0, i32 noundef 46) #3
  %39 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #3
  %40 = icmp eq ptr %39, null
  br i1 %40, label %116, label %41

41:                                               ; preds = %37, %113
  %42 = phi ptr [ %114, %113 ], [ %39, %37 ]
  %43 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %6, i32 noundef 0, i32 noundef 46) #3
  %44 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %6) #3
  %45 = icmp eq ptr %44, null
  br i1 %45, label %113, label %46

46:                                               ; preds = %41, %110
  %47 = phi ptr [ %111, %110 ], [ %44, %41 ]
  %48 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %7, i32 noundef 0, i32 noundef 5) #3
  %49 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #3
  %50 = icmp eq ptr %49, null
  br i1 %50, label %101, label %51

51:                                               ; preds = %46, %97
  %52 = phi ptr [ %99, %97 ], [ %49, %46 ]
  %53 = phi i32 [ %98, %97 ], [ 0, %46 ]
  %54 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %8, i32 noundef 0, i32 noundef 5) #3
  %55 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %8) #3
  %56 = icmp eq ptr %55, null
  br i1 %56, label %97, label %57

57:                                               ; preds = %51, %57
  %58 = phi ptr [ %95, %57 ], [ %55, %51 ]
  %59 = phi i32 [ %94, %57 ], [ %53, %51 ]
  %60 = load i32, ptr %42, align 4, !tbaa !5
  %61 = load i32, ptr %52, align 4, !tbaa !5
  %62 = add nsw i32 %61, %60
  %63 = mul nsw i32 %62, 50
  %64 = load i32, ptr %47, align 4, !tbaa !5
  %65 = load i32, ptr %58, align 4, !tbaa !5
  %66 = add nsw i32 %65, %64
  %67 = add nsw i32 %66, %63
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [2500 x i32], ptr %1, i64 0, i64 %68
  %70 = load volatile i32, ptr %69, align 4, !tbaa !5
  %71 = mul nsw i32 %61, 5
  %72 = add nsw i32 %65, %71
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [25 x i32], ptr %2, i64 0, i64 %73
  %75 = load volatile i32, ptr %74, align 4, !tbaa !5
  %76 = and i32 %70, 15
  %77 = and i32 %75, 15
  %78 = sub nsw i32 %76, %77
  %79 = call i32 @llvm.abs.i32(i32 %78, i1 true)
  %80 = add i32 %79, %59
  %81 = lshr i32 %70, 4
  %82 = and i32 %81, 15
  %83 = lshr i32 %75, 4
  %84 = and i32 %83, 15
  %85 = sub nsw i32 %82, %84
  %86 = call i32 @llvm.abs.i32(i32 %85, i1 true)
  %87 = add i32 %80, %86
  %88 = lshr i32 %70, 8
  %89 = and i32 %88, 15
  %90 = lshr i32 %75, 8
  %91 = and i32 %90, 15
  %92 = sub nsw i32 %89, %91
  %93 = call i32 @llvm.abs.i32(i32 %92, i1 true)
  %94 = add i32 %87, %93
  %95 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %8) #3
  %96 = icmp eq ptr %95, null
  br i1 %96, label %97, label %57, !llvm.loop !12

97:                                               ; preds = %57, %51
  %98 = phi i32 [ %53, %51 ], [ %94, %57 ]
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %8) #3
  %99 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #3
  %100 = icmp eq ptr %99, null
  br i1 %100, label %101, label %51, !llvm.loop !13

101:                                              ; preds = %97, %46
  %102 = phi i32 [ 0, %46 ], [ %98, %97 ]
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %7) #3
  %103 = load volatile i32, ptr %4, align 4, !tbaa !5
  %104 = icmp ult i32 %102, %103
  br i1 %104, label %105, label %110

105:                                              ; preds = %101
  %106 = load i32, ptr %42, align 4, !tbaa !5
  %107 = mul nsw i32 %106, 50
  %108 = load i32, ptr %47, align 4, !tbaa !5
  %109 = add nsw i32 %107, %108
  store volatile i32 %109, ptr %3, align 4, !tbaa !5
  store volatile i32 %102, ptr %4, align 4, !tbaa !5
  br label %110

110:                                              ; preds = %105, %101
  %111 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %6) #3
  %112 = icmp eq ptr %111, null
  br i1 %112, label %113, label %46, !llvm.loop !14

113:                                              ; preds = %110, %41
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %6) #3
  %114 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #3
  %115 = icmp eq ptr %114, null
  br i1 %115, label %116, label %41, !llvm.loop !15

116:                                              ; preds = %113, %37
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %5) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %9) #3
  store i32 0, ptr %9, align 4, !tbaa !5
  %117 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %11, ptr noundef nonnull %9, ptr noundef nonnull %3, i64 noundef 0) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %9) #3
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %8) #3
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %7) #3
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %6) #3
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %5) #3
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
!3 = !{i64 2147504222}
!4 = !{i64 2147504738}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = distinct !{!14, !10}
!15 = distinct !{!15, !10}
