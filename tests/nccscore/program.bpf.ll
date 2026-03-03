; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca [2500 x i32], align 4
  %2 = alloca [25 x i32], align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 13, i32 0, i32 0, i32 0) #3, !srcloc !3
  %8 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 14, i32 0, i32 0, i32 0) #3, !srcloc !4
  call void @llvm.lifetime.start.p0(i64 10000, ptr nonnull %1) #3
  call void @llvm.lifetime.start.p0(i64 100, ptr nonnull %2) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %3) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #3
  store i32 0, ptr %4, align 4, !tbaa !5
  br label %10

9:                                                ; preds = %10
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %5) #3
  store i32 0, ptr %5, align 4, !tbaa !5
  br label %19

10:                                               ; preds = %0, %10
  %11 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %7, ptr noundef nonnull %4) #3
  %12 = load i32, ptr %11, align 4, !tbaa !5
  %13 = load i32, ptr %4, align 4, !tbaa !5
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [2500 x i32], ptr %1, i64 0, i64 %14
  store i32 %12, ptr %15, align 4, !tbaa !5
  %16 = add nsw i32 %13, 1
  store i32 %16, ptr %4, align 4, !tbaa !5
  %17 = icmp slt i32 %13, 2499
  br i1 %17, label %10, label %9, !llvm.loop !9

18:                                               ; preds = %19
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %5) #3
  br label %27

19:                                               ; preds = %9, %19
  %20 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %8, ptr noundef nonnull %5) #3
  %21 = load i32, ptr %20, align 4, !tbaa !5
  %22 = load i32, ptr %5, align 4, !tbaa !5
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [25 x i32], ptr %2, i64 0, i64 %23
  store i32 %21, ptr %24, align 4, !tbaa !5
  %25 = add nsw i32 %22, 1
  store i32 %25, ptr %5, align 4, !tbaa !5
  %26 = icmp slt i32 %22, 24
  br i1 %26, label %19, label %18, !llvm.loop !11

27:                                               ; preds = %18, %38
  %28 = phi i64 [ 0, %18 ], [ %39, %38 ]
  %29 = phi i32 [ -1, %18 ], [ %148, %38 ]
  %30 = phi i32 [ undef, %18 ], [ %147, %38 ]
  %31 = mul nuw nsw i64 %28, 50
  br label %34

32:                                               ; preds = %38
  store i32 %147, ptr %3, align 4
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %6) #3
  store i32 0, ptr %6, align 4, !tbaa !5
  %33 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %8, ptr noundef nonnull %6, ptr noundef nonnull %3, i64 noundef 0) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %6) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %3) #3
  call void @llvm.lifetime.end.p0(i64 100, ptr nonnull %2) #3
  call void @llvm.lifetime.end.p0(i64 10000, ptr nonnull %1) #3
  ret i32 0

34:                                               ; preds = %27, %143
  %35 = phi i64 [ 0, %27 ], [ %149, %143 ]
  %36 = phi i32 [ %29, %27 ], [ %148, %143 ]
  %37 = phi i32 [ %30, %27 ], [ %147, %143 ]
  br label %41

38:                                               ; preds = %143
  %39 = add nuw nsw i64 %28, 1
  %40 = icmp eq i64 %39, 46
  br i1 %40, label %32, label %27, !llvm.loop !12

41:                                               ; preds = %34, %41
  %42 = phi i64 [ 0, %34 ], [ %141, %41 ]
  %43 = phi i32 [ 0, %34 ], [ %140, %41 ]
  %44 = add nuw nsw i64 %42, %28
  %45 = mul nuw nsw i64 %44, 50
  %46 = add nuw nsw i64 %45, %35
  %47 = mul nuw nsw i64 %42, 5
  %48 = getelementptr inbounds nuw [2500 x i32], ptr %1, i64 0, i64 %46
  %49 = getelementptr inbounds nuw [25 x i32], ptr %2, i64 0, i64 %47
  %50 = add nuw nsw i64 %46, 2
  %51 = getelementptr inbounds nuw [2500 x i32], ptr %1, i64 0, i64 %50
  %52 = load i32, ptr %51, align 4, !tbaa !5
  %53 = add nuw nsw i64 %47, 2
  %54 = getelementptr inbounds nuw [25 x i32], ptr %2, i64 0, i64 %53
  %55 = load i32, ptr %54, align 4, !tbaa !5
  %56 = lshr i32 %52, 4
  %57 = lshr i32 %55, 4
  %58 = load <2 x i32>, ptr %48, align 4, !tbaa !5
  %59 = load i32, ptr %48, align 4, !tbaa !5
  %60 = lshr i32 %59, 4
  %61 = load <2 x i32>, ptr %49, align 4, !tbaa !5
  %62 = load i32, ptr %49, align 4, !tbaa !5
  %63 = lshr i32 %62, 4
  %64 = lshr i32 %59, 8
  %65 = lshr i32 %62, 8
  %66 = shufflevector <2 x i32> %58, <2 x i32> poison, <2 x i32> <i32 1, i32 1>
  %67 = lshr <2 x i32> %66, <i32 4, i32 8>
  %68 = shufflevector <2 x i32> %61, <2 x i32> poison, <2 x i32> <i32 1, i32 1>
  %69 = lshr <2 x i32> %68, <i32 4, i32 8>
  %70 = shufflevector <2 x i32> %58, <2 x i32> poison, <8 x i32> <i32 0, i32 poison, i32 poison, i32 1, i32 poison, i32 poison, i32 poison, i32 poison>
  %71 = insertelement <8 x i32> %70, i32 %60, i64 1
  %72 = insertelement <8 x i32> %71, i32 %64, i64 2
  %73 = insertelement <8 x i32> %72, i32 %52, i64 6
  %74 = insertelement <8 x i32> %73, i32 %56, i64 7
  %75 = shufflevector <2 x i32> %67, <2 x i32> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %76 = shufflevector <8 x i32> %74, <8 x i32> %75, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 6, i32 7>
  %77 = and <8 x i32> %76, splat (i32 15)
  %78 = shufflevector <2 x i32> %61, <2 x i32> poison, <8 x i32> <i32 0, i32 poison, i32 poison, i32 1, i32 poison, i32 poison, i32 poison, i32 poison>
  %79 = insertelement <8 x i32> %78, i32 %63, i64 1
  %80 = insertelement <8 x i32> %79, i32 %65, i64 2
  %81 = insertelement <8 x i32> %80, i32 %55, i64 6
  %82 = insertelement <8 x i32> %81, i32 %57, i64 7
  %83 = shufflevector <2 x i32> %69, <2 x i32> poison, <8 x i32> <i32 0, i32 1, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %84 = shufflevector <8 x i32> %82, <8 x i32> %83, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 6, i32 7>
  %85 = and <8 x i32> %84, splat (i32 15)
  %86 = sub nsw <8 x i32> %77, %85
  %87 = call <8 x i32> @llvm.abs.v8i32(<8 x i32> %86, i1 true)
  %88 = lshr i32 %52, 8
  %89 = and i32 %88, 15
  %90 = lshr i32 %55, 8
  %91 = and i32 %90, 15
  %92 = sub nsw i32 %89, %91
  %93 = call i32 @llvm.abs.i32(i32 %92, i1 true)
  %94 = add nuw nsw i64 %46, 3
  %95 = getelementptr inbounds nuw [2500 x i32], ptr %1, i64 0, i64 %94
  %96 = add nuw nsw i64 %47, 3
  %97 = getelementptr inbounds nuw [25 x i32], ptr %2, i64 0, i64 %96
  %98 = add nuw nsw i64 %46, 4
  %99 = getelementptr inbounds nuw [2500 x i32], ptr %1, i64 0, i64 %98
  %100 = add nuw nsw i64 %47, 4
  %101 = getelementptr inbounds nuw [25 x i32], ptr %2, i64 0, i64 %100
  %102 = load i32, ptr %99, align 4, !tbaa !5
  %103 = load <2 x i32>, ptr %95, align 4, !tbaa !5
  %104 = load i32, ptr %95, align 4, !tbaa !5
  %105 = lshr i32 %104, 4
  %106 = load i32, ptr %101, align 4, !tbaa !5
  %107 = load <2 x i32>, ptr %97, align 4, !tbaa !5
  %108 = load i32, ptr %97, align 4, !tbaa !5
  %109 = lshr i32 %108, 4
  %110 = lshr i32 %104, 8
  %111 = lshr i32 %108, 8
  %112 = shufflevector <2 x i32> %103, <2 x i32> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 1>
  %113 = insertelement <4 x i32> %112, i32 %105, i64 1
  %114 = insertelement <4 x i32> %113, i32 %110, i64 2
  %115 = and <4 x i32> %114, splat (i32 15)
  %116 = shufflevector <2 x i32> %107, <2 x i32> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 1>
  %117 = insertelement <4 x i32> %116, i32 %109, i64 1
  %118 = insertelement <4 x i32> %117, i32 %111, i64 2
  %119 = and <4 x i32> %118, splat (i32 15)
  %120 = sub nsw <4 x i32> %115, %119
  %121 = call <4 x i32> @llvm.abs.v4i32(<4 x i32> %120, i1 true)
  %122 = lshr i32 %102, 4
  %123 = and i32 %122, 15
  %124 = lshr i32 %106, 4
  %125 = and i32 %124, 15
  %126 = sub nsw i32 %123, %125
  %127 = call i32 @llvm.abs.i32(i32 %126, i1 true)
  %128 = lshr i32 %102, 8
  %129 = and i32 %128, 15
  %130 = lshr i32 %106, 8
  %131 = and i32 %130, 15
  %132 = sub nsw i32 %129, %131
  %133 = call i32 @llvm.abs.i32(i32 %132, i1 true)
  %134 = call i32 @llvm.vector.reduce.add.v8i32(<8 x i32> %87)
  %135 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %121)
  %136 = add i32 %134, %135
  %137 = add i32 %136, %93
  %138 = add nuw nsw i32 %127, %133
  %139 = add i32 %137, %138
  %140 = add i32 %139, %43
  %141 = add nuw nsw i64 %42, 1
  %142 = icmp eq i64 %141, 5
  br i1 %142, label %143, label %41, !llvm.loop !13

143:                                              ; preds = %41
  %144 = icmp ult i32 %140, %36
  %145 = add nuw nsw i64 %35, %31
  %146 = trunc nuw nsw i64 %145 to i32
  %147 = select i1 %144, i32 %146, i32 %37
  %148 = call i32 @llvm.umin.i32(i32 %140, i32 %36)
  %149 = add nuw nsw i64 %35, 1
  %150 = icmp eq i64 %149, 46
  br i1 %150, label %38, label %34, !llvm.loop !14
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.abs.v8i32(<8 x i32>, i1 immarg) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v8i32(<8 x i32>) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.abs.v4i32(<4 x i32>, i1 immarg) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #2

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="duotronic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 20.1.0 (https://github.com/fprime-bpf/llvm-project.git 3047ef595b8b4944540de771dcf86dc85a97ef76)"}
!3 = !{i64 2147503628}
!4 = !{i64 2147504144}
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
