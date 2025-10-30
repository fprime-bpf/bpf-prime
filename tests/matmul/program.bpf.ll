; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca [256 x float], align 4
  %2 = alloca [256 x float], align 4
  %3 = alloca [256 x float], align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #4, !srcloc !3
  %7 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 1, i32 0, i32 0, i32 0) #4, !srcloc !4
  %8 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 2, i32 0, i32 0, i32 0) #4, !srcloc !5
  call void @llvm.lifetime.start.p0(i64 1024, ptr nonnull %1) #4
  call void @llvm.lifetime.start.p0(i64 1024, ptr nonnull %2) #4
  call void @llvm.lifetime.start.p0(i64 1024, ptr nonnull %3) #4
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #4
  store i32 0, ptr %4, align 4, !tbaa !6
  br label %10

9:                                                ; preds = %10
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #4
  br label %23

10:                                               ; preds = %0, %10
  %11 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %6, ptr noundef nonnull %4) #4
  %12 = load float, ptr %11, align 4, !tbaa !10
  %13 = load i32, ptr %4, align 4, !tbaa !6
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [256 x float], ptr %1, i64 0, i64 %14
  store float %12, ptr %15, align 4, !tbaa !10
  %16 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %7, ptr noundef nonnull %4) #4
  %17 = load float, ptr %16, align 4, !tbaa !10
  %18 = load i32, ptr %4, align 4, !tbaa !6
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [256 x float], ptr %2, i64 0, i64 %19
  store float %17, ptr %20, align 4, !tbaa !10
  %21 = add nsw i32 %18, 1
  store i32 %21, ptr %4, align 4, !tbaa !6
  %22 = icmp slt i32 %18, 255
  br i1 %22, label %10, label %9, !llvm.loop !12

23:                                               ; preds = %9, %140
  %24 = phi i64 [ 0, %9 ], [ %25, %140 ]
  %25 = add nuw nsw i64 %24, 4
  br label %27

26:                                               ; preds = %140
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %5) #4
  store i32 0, ptr %5, align 4, !tbaa !6
  br label %143

27:                                               ; preds = %23, %137
  %28 = phi i64 [ 0, %23 ], [ %138, %137 ]
  %29 = trunc i64 %28 to i32
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %78

31:                                               ; preds = %27, %75
  %32 = phi i64 [ %76, %75 ], [ 0, %27 ]
  br label %33

33:                                               ; preds = %64, %31
  %34 = phi i64 [ %73, %64 ], [ %24, %31 ]
  %35 = shl i64 %34, 4
  br label %36

36:                                               ; preds = %36, %33
  %37 = phi i64 [ %62, %36 ], [ %28, %33 ]
  %38 = phi float [ %61, %36 ], [ 0.000000e+00, %33 ]
  %39 = phi float [ %60, %36 ], [ 0.000000e+00, %33 ]
  %40 = phi float [ %53, %36 ], [ 0.000000e+00, %33 ]
  %41 = phi float [ %49, %36 ], [ 0.000000e+00, %33 ]
  %42 = or disjoint i64 %37, %35
  %43 = getelementptr inbounds nuw [256 x float], ptr %1, i64 0, i64 %42
  %44 = load float, ptr %43, align 4, !tbaa !10
  %45 = shl nuw nsw i64 %37, 4
  %46 = add nuw nsw i64 %45, %32
  %47 = getelementptr inbounds nuw [256 x float], ptr %2, i64 0, i64 %46
  %48 = load float, ptr %47, align 4, !tbaa !10
  %49 = call float @llvm.fmuladd.f32(float %44, float %48, float %41)
  %50 = or disjoint i64 %46, 1
  %51 = getelementptr inbounds nuw [256 x float], ptr %2, i64 0, i64 %50
  %52 = load float, ptr %51, align 4, !tbaa !10
  %53 = call float @llvm.fmuladd.f32(float %44, float %52, float %40)
  %54 = or i64 %35, %37
  %55 = shl i64 %54, 32
  %56 = ashr exact i64 %55, 32
  %57 = or i64 %56, 16
  %58 = getelementptr inbounds [256 x float], ptr %1, i64 0, i64 %57
  %59 = load float, ptr %58, align 4, !tbaa !10
  %60 = call float @llvm.fmuladd.f32(float %59, float %48, float %39)
  %61 = call float @llvm.fmuladd.f32(float %59, float %52, float %38)
  %62 = add nuw nsw i64 %37, 1
  %63 = icmp samesign ult i64 %37, 15
  br i1 %63, label %36, label %64, !llvm.loop !15

64:                                               ; preds = %36
  %65 = or disjoint i64 %35, %32
  %66 = getelementptr inbounds nuw [256 x float], ptr %3, i64 0, i64 %65
  store float %49, ptr %66, align 4, !tbaa !10
  %67 = or disjoint i64 %65, 1
  %68 = getelementptr inbounds nuw [256 x float], ptr %3, i64 0, i64 %67
  store float %53, ptr %68, align 4, !tbaa !10
  %69 = or disjoint i64 %65, 16
  %70 = getelementptr inbounds [256 x float], ptr %3, i64 0, i64 %69
  store float %60, ptr %70, align 4, !tbaa !10
  %71 = or disjoint i64 %65, 17
  %72 = getelementptr inbounds [256 x float], ptr %3, i64 0, i64 %71
  store float %61, ptr %72, align 4, !tbaa !10
  %73 = add nuw nsw i64 %34, 2
  %74 = icmp samesign ult i64 %73, %25
  br i1 %74, label %33, label %75, !llvm.loop !16

75:                                               ; preds = %64
  %76 = add nuw nsw i64 %32, 2
  %77 = icmp samesign ult i64 %32, 14
  br i1 %77, label %31, label %137, !llvm.loop !17

78:                                               ; preds = %27, %134
  %79 = phi i64 [ %135, %134 ], [ 0, %27 ]
  br label %80

80:                                               ; preds = %123, %78
  %81 = phi i64 [ %132, %123 ], [ %24, %78 ]
  %82 = shl i64 %81, 4
  %83 = add nuw nsw i64 %82, %79
  %84 = getelementptr inbounds nuw [256 x float], ptr %3, i64 0, i64 %83
  %85 = load float, ptr %84, align 4, !tbaa !10
  %86 = or disjoint i64 %83, 1
  %87 = getelementptr inbounds nuw [256 x float], ptr %3, i64 0, i64 %86
  %88 = load float, ptr %87, align 4, !tbaa !10
  %89 = or disjoint i64 %83, 16
  %90 = getelementptr inbounds nuw [256 x float], ptr %3, i64 0, i64 %89
  %91 = load float, ptr %90, align 4, !tbaa !10
  %92 = or disjoint i64 %83, 17
  %93 = getelementptr inbounds nuw [256 x float], ptr %3, i64 0, i64 %92
  %94 = load float, ptr %93, align 4, !tbaa !10
  br label %95

95:                                               ; preds = %95, %80
  %96 = phi i64 [ %121, %95 ], [ %28, %80 ]
  %97 = phi float [ %120, %95 ], [ %94, %80 ]
  %98 = phi float [ %119, %95 ], [ %91, %80 ]
  %99 = phi float [ %112, %95 ], [ %88, %80 ]
  %100 = phi float [ %108, %95 ], [ %85, %80 ]
  %101 = or disjoint i64 %96, %82
  %102 = getelementptr inbounds nuw [256 x float], ptr %1, i64 0, i64 %101
  %103 = load float, ptr %102, align 4, !tbaa !10
  %104 = shl nuw nsw i64 %96, 4
  %105 = add nuw nsw i64 %104, %79
  %106 = getelementptr inbounds nuw [256 x float], ptr %2, i64 0, i64 %105
  %107 = load float, ptr %106, align 4, !tbaa !10
  %108 = call float @llvm.fmuladd.f32(float %103, float %107, float %100)
  %109 = or disjoint i64 %105, 1
  %110 = getelementptr inbounds nuw [256 x float], ptr %2, i64 0, i64 %109
  %111 = load float, ptr %110, align 4, !tbaa !10
  %112 = call float @llvm.fmuladd.f32(float %103, float %111, float %99)
  %113 = or i64 %82, %96
  %114 = shl i64 %113, 32
  %115 = ashr exact i64 %114, 32
  %116 = or i64 %115, 16
  %117 = getelementptr inbounds [256 x float], ptr %1, i64 0, i64 %116
  %118 = load float, ptr %117, align 4, !tbaa !10
  %119 = call float @llvm.fmuladd.f32(float %118, float %107, float %98)
  %120 = call float @llvm.fmuladd.f32(float %118, float %111, float %97)
  %121 = add nuw nsw i64 %96, 1
  %122 = icmp samesign ult i64 %96, 15
  br i1 %122, label %95, label %123, !llvm.loop !15

123:                                              ; preds = %95
  %124 = or disjoint i64 %82, %79
  %125 = getelementptr inbounds nuw [256 x float], ptr %3, i64 0, i64 %124
  store float %108, ptr %125, align 4, !tbaa !10
  %126 = or disjoint i64 %124, 1
  %127 = getelementptr inbounds nuw [256 x float], ptr %3, i64 0, i64 %126
  store float %112, ptr %127, align 4, !tbaa !10
  %128 = or disjoint i64 %124, 16
  %129 = getelementptr inbounds [256 x float], ptr %3, i64 0, i64 %128
  store float %119, ptr %129, align 4, !tbaa !10
  %130 = or disjoint i64 %124, 17
  %131 = getelementptr inbounds [256 x float], ptr %3, i64 0, i64 %130
  store float %120, ptr %131, align 4, !tbaa !10
  %132 = add nuw nsw i64 %81, 2
  %133 = icmp samesign ult i64 %132, %25
  br i1 %133, label %80, label %134, !llvm.loop !16

134:                                              ; preds = %123
  %135 = add nuw nsw i64 %79, 2
  %136 = icmp samesign ult i64 %79, 14
  br i1 %136, label %78, label %137, !llvm.loop !17

137:                                              ; preds = %134, %75
  %138 = add nuw nsw i64 %28, 4
  %139 = icmp samesign ult i32 %29, 12
  br i1 %139, label %27, label %140, !llvm.loop !18

140:                                              ; preds = %137
  %141 = icmp samesign ult i64 %24, 12
  br i1 %141, label %23, label %26, !llvm.loop !19

142:                                              ; preds = %143
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %5) #4
  call void @llvm.lifetime.end.p0(i64 1024, ptr nonnull %3) #4
  call void @llvm.lifetime.end.p0(i64 1024, ptr nonnull %2) #4
  call void @llvm.lifetime.end.p0(i64 1024, ptr nonnull %1) #4
  ret i32 0

143:                                              ; preds = %26, %143
  %144 = phi i32 [ 0, %26 ], [ %150, %143 ]
  %145 = call i32 @llvm.bpf.passthrough.i32.i32(i32 0, i32 %144)
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds [256 x float], ptr %3, i64 0, i64 %146
  %148 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %8, ptr noundef nonnull %5, ptr noundef nonnull %147, i64 noundef 0) #4
  %149 = load i32, ptr %5, align 4, !tbaa !6
  %150 = add nsw i32 %149, 1
  store i32 %150, ptr %5, align 4, !tbaa !6
  %151 = icmp slt i32 %149, 255
  br i1 %151, label %143, label %142, !llvm.loop !20
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: nounwind memory(none)
declare i32 @llvm.bpf.passthrough.i32.i32(i32, i32) #3

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="duotronic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nounwind memory(none) }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 755f040f24df9a74f4e5f7f7bdd64e3acd4e61b9)"}
!3 = !{i64 2147503089}
!4 = !{i64 2147503601}
!5 = !{i64 2147504113}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !8, i64 0}
!12 = distinct !{!12, !13, !14}
!13 = !{!"llvm.loop.mustprogress"}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !13, !14}
!16 = distinct !{!16, !13, !14}
!17 = distinct !{!17, !13, !14}
!18 = distinct !{!18, !13, !14}
!19 = distinct !{!19, !13, !14}
!20 = distinct !{!20, !13, !14}
