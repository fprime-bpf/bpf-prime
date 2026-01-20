; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca [4 x float], align 4
  %2 = alloca [4 x float], align 4
  %3 = alloca [6 x float], align 4
  %4 = alloca float, align 4
  %5 = alloca [5 x i64], align 8
  %6 = alloca i64, align 8
  %7 = alloca float, align 8
  %8 = alloca float, align 8
  %9 = alloca i64, align 8
  %10 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #2, !srcloc !3
  %11 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 1, i32 0, i32 0, i32 0) #2, !srcloc !4
  %12 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 2, i32 0, i32 0, i32 0) #2, !srcloc !5
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %1) #2
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %2) #2
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %3) #2
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #2
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %5) #2
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %6) #2
  store i64 0, ptr %6, align 8, !tbaa !6
  br label %73

13:                                               ; preds = %73
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %6) #2
  %14 = load volatile float, ptr %1, align 4, !tbaa !10
  %15 = getelementptr inbounds nuw i8, ptr %1, i64 4
  %16 = load volatile float, ptr %15, align 4, !tbaa !10
  %17 = load volatile float, ptr %1, align 4, !tbaa !10
  %18 = load volatile float, ptr %15, align 4, !tbaa !10
  %19 = load volatile float, ptr %2, align 4, !tbaa !10
  %20 = getelementptr inbounds nuw i8, ptr %2, i64 4
  %21 = load volatile float, ptr %20, align 4, !tbaa !10
  %22 = load volatile float, ptr %2, align 4, !tbaa !10
  %23 = load volatile float, ptr %20, align 4, !tbaa !10
  store volatile float 0.000000e+00, ptr %3, align 4, !tbaa !10
  %24 = load volatile float, ptr %15, align 4, !tbaa !10
  %25 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %26 = load volatile float, ptr %25, align 4, !tbaa !10
  %27 = load volatile float, ptr %15, align 4, !tbaa !10
  %28 = load volatile float, ptr %25, align 4, !tbaa !10
  %29 = load volatile float, ptr %20, align 4, !tbaa !10
  %30 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %31 = load volatile float, ptr %30, align 4, !tbaa !10
  %32 = load volatile float, ptr %20, align 4, !tbaa !10
  %33 = load volatile float, ptr %30, align 4, !tbaa !10
  %34 = getelementptr inbounds nuw i8, ptr %3, i64 4
  store volatile float 0.000000e+00, ptr %34, align 4, !tbaa !10
  %35 = load volatile float, ptr %25, align 4, !tbaa !10
  %36 = getelementptr inbounds nuw i8, ptr %1, i64 12
  %37 = load volatile float, ptr %36, align 4, !tbaa !10
  %38 = load volatile float, ptr %25, align 4, !tbaa !10
  %39 = load volatile float, ptr %36, align 4, !tbaa !10
  %40 = load volatile float, ptr %30, align 4, !tbaa !10
  %41 = getelementptr inbounds nuw i8, ptr %2, i64 12
  %42 = load volatile float, ptr %41, align 4, !tbaa !10
  %43 = load volatile float, ptr %30, align 4, !tbaa !10
  %44 = load volatile float, ptr %41, align 4, !tbaa !10
  %45 = getelementptr inbounds nuw i8, ptr %3, i64 8
  store volatile float 0.000000e+00, ptr %45, align 4, !tbaa !10
  %46 = load volatile float, ptr %15, align 4, !tbaa !10
  %47 = load volatile float, ptr %36, align 4, !tbaa !10
  %48 = load volatile float, ptr %15, align 4, !tbaa !10
  %49 = load volatile float, ptr %36, align 4, !tbaa !10
  %50 = load volatile float, ptr %20, align 4, !tbaa !10
  %51 = load volatile float, ptr %41, align 4, !tbaa !10
  %52 = load volatile float, ptr %20, align 4, !tbaa !10
  %53 = load volatile float, ptr %41, align 4, !tbaa !10
  %54 = getelementptr inbounds nuw i8, ptr %3, i64 12
  store volatile float 0.000000e+00, ptr %54, align 4, !tbaa !10
  %55 = load volatile float, ptr %1, align 4, !tbaa !10
  %56 = load volatile float, ptr %25, align 4, !tbaa !10
  %57 = load volatile float, ptr %1, align 4, !tbaa !10
  %58 = load volatile float, ptr %25, align 4, !tbaa !10
  %59 = load volatile float, ptr %2, align 4, !tbaa !10
  %60 = load volatile float, ptr %30, align 4, !tbaa !10
  %61 = load volatile float, ptr %2, align 4, !tbaa !10
  %62 = load volatile float, ptr %30, align 4, !tbaa !10
  %63 = getelementptr inbounds nuw i8, ptr %3, i64 16
  store volatile float 0.000000e+00, ptr %63, align 4, !tbaa !10
  %64 = load volatile float, ptr %1, align 4, !tbaa !10
  %65 = load volatile float, ptr %36, align 4, !tbaa !10
  %66 = load volatile float, ptr %1, align 4, !tbaa !10
  %67 = load volatile float, ptr %36, align 4, !tbaa !10
  %68 = load volatile float, ptr %2, align 4, !tbaa !10
  %69 = load volatile float, ptr %41, align 4, !tbaa !10
  %70 = load volatile float, ptr %2, align 4, !tbaa !10
  %71 = load volatile float, ptr %41, align 4, !tbaa !10
  %72 = getelementptr inbounds nuw i8, ptr %3, i64 20
  store volatile float 0.000000e+00, ptr %72, align 4, !tbaa !10
  br label %86

73:                                               ; preds = %0, %73
  %74 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %10, ptr noundef nonnull %6) #2
  %75 = load float, ptr %74, align 4, !tbaa !10
  %76 = load i64, ptr %6, align 8, !tbaa !6
  %77 = getelementptr inbounds [4 x float], ptr %1, i64 0, i64 %76
  store volatile float %75, ptr %77, align 4, !tbaa !10
  %78 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %11, ptr noundef nonnull %6) #2
  %79 = load float, ptr %78, align 4, !tbaa !10
  %80 = load i64, ptr %6, align 8, !tbaa !6
  %81 = getelementptr inbounds [4 x float], ptr %2, i64 0, i64 %80
  store volatile float %79, ptr %81, align 4, !tbaa !10
  %82 = add nsw i64 %80, 1
  store i64 %82, ptr %6, align 8, !tbaa !6
  %83 = icmp slt i64 %80, 3
  br i1 %83, label %73, label %13, !llvm.loop !12

84:                                               ; preds = %86
  %85 = getelementptr inbounds nuw [6 x float], ptr %3, i64 0, i64 %98
  br label %102

86:                                               ; preds = %13, %86
  %87 = phi i64 [ 0, %13 ], [ %99, %86 ]
  %88 = phi i64 [ 0, %13 ], [ %98, %86 ]
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %7)
  %89 = getelementptr inbounds nuw [6 x float], ptr %3, i64 0, i64 %87
  %90 = load volatile float, ptr %89, align 4, !tbaa !10
  %91 = fmul float %90, 1.000000e+04
  store float %91, ptr %7, align 8, !tbaa !10
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %8)
  %92 = getelementptr inbounds nuw [6 x float], ptr %3, i64 0, i64 %88
  %93 = load volatile float, ptr %92, align 4, !tbaa !10
  %94 = fmul float %93, 1.000000e+04
  store float %94, ptr %8, align 8, !tbaa !10
  %95 = load i64, ptr %7, align 8, !tbaa !6
  %96 = load i64, ptr %8, align 8, !tbaa !6
  %97 = icmp sgt i64 %95, %96
  %98 = select i1 %97, i64 %87, i64 %88
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %8)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %7)
  %99 = add nuw nsw i64 %87, 1
  %100 = icmp eq i64 %99, 6
  br i1 %100, label %84, label %86, !llvm.loop !15

101:                                              ; preds = %102
  switch i64 %98, label %120 [
    i64 0, label %110
    i64 1, label %112
    i64 2, label %114
    i64 3, label %116
    i64 4, label %118
  ]

102:                                              ; preds = %84, %102
  %103 = phi i64 [ 0, %84 ], [ %108, %102 ]
  %104 = getelementptr inbounds nuw [6 x float], ptr %3, i64 0, i64 %103
  %105 = load volatile float, ptr %104, align 4, !tbaa !10
  %106 = load volatile float, ptr %85, align 4, !tbaa !10
  %107 = fdiv float %105, %106
  store volatile float %107, ptr %104, align 4, !tbaa !10
  %108 = add nuw nsw i64 %103, 1
  %109 = icmp eq i64 %108, 6
  br i1 %109, label %101, label %102, !llvm.loop !16

110:                                              ; preds = %101
  %111 = load volatile float, ptr %34, align 4, !tbaa !10
  store volatile float %111, ptr %3, align 4, !tbaa !10
  br label %112

112:                                              ; preds = %101, %110
  %113 = load volatile float, ptr %45, align 4, !tbaa !10
  store volatile float %113, ptr %34, align 4, !tbaa !10
  br label %114

114:                                              ; preds = %101, %112
  %115 = load volatile float, ptr %54, align 4, !tbaa !10
  store volatile float %115, ptr %45, align 4, !tbaa !10
  br label %116

116:                                              ; preds = %101, %114
  %117 = load volatile float, ptr %63, align 4, !tbaa !10
  store volatile float %117, ptr %54, align 4, !tbaa !10
  br label %118

118:                                              ; preds = %101, %116
  %119 = load volatile float, ptr %72, align 4, !tbaa !10
  store volatile float %119, ptr %63, align 4, !tbaa !10
  br label %120

120:                                              ; preds = %101, %118
  br label %145

121:                                              ; preds = %145
  %122 = load i64, ptr %5, align 8, !tbaa !6
  %123 = getelementptr inbounds nuw i8, ptr %5, i64 8
  %124 = load i64, ptr %123, align 8, !tbaa !6
  %125 = and i64 %124, %122
  %126 = xor i64 %122, -1
  %127 = getelementptr inbounds nuw i8, ptr %5, i64 16
  %128 = load i64, ptr %127, align 8, !tbaa !6
  %129 = and i64 %128, %126
  %130 = or i64 %129, %125
  %131 = getelementptr inbounds nuw i8, ptr %5, i64 24
  %132 = load i64, ptr %131, align 8, !tbaa !6
  %133 = and i64 %132, %124
  %134 = xor i64 %132, -1
  %135 = and i64 %128, %134
  %136 = or i64 %133, %135
  %137 = getelementptr inbounds nuw i8, ptr %5, i64 32
  %138 = load i64, ptr %137, align 8, !tbaa !6
  %139 = xor i64 %138, -1
  %140 = and i64 %128, %139
  %141 = xor i64 %140, %132
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %9) #2
  %142 = xor i64 %136, %130
  %143 = xor i64 %142, %141
  store i64 %143, ptr %9, align 8, !tbaa !6
  %144 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %12, ptr noundef nonnull %9, ptr noundef nonnull %4, i64 noundef 0) #2
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %9) #2
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %5) #2
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #2
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3) #2
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %2) #2
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %1) #2
  ret i32 0

145:                                              ; preds = %120, %145
  %146 = phi i64 [ %150, %145 ], [ 0, %120 ]
  %147 = getelementptr inbounds nuw [6 x float], ptr %3, i64 0, i64 %146
  %148 = load i64, ptr %147, align 4, !tbaa !6
  %149 = getelementptr inbounds nuw [5 x i64], ptr %5, i64 0, i64 %146
  store i64 %148, ptr %149, align 8, !tbaa !6
  %150 = add nuw nsw i64 %146, 1
  %151 = icmp eq i64 %150, 5
  br i1 %151, label %121, label %145, !llvm.loop !17
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
!2 = !{!"clang version 20.1.0 (git@github.com:h313/llvm-duotronic.git 3047ef595b8b4944540de771dcf86dc85a97ef76)"}
!3 = !{i64 2147509687}
!4 = !{i64 2147510199}
!5 = !{i64 2147510711}
!6 = !{!7, !7, i64 0}
!7 = !{!"long", !8, i64 0}
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
