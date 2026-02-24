; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

%struct.bpf_iter_num = type { i64, i64, i64, i64 }

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca [4 x float], align 4
  %2 = alloca [4 x float], align 4
  %3 = alloca [6 x float], align 8
  %4 = alloca float, align 4
  %5 = alloca [5 x i64], align 8
  %6 = alloca i64, align 8
  %7 = alloca %struct.bpf_iter_num, align 8
  %8 = alloca float, align 8
  %9 = alloca float, align 8
  %10 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #2, !srcloc !3
  %11 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 1, i32 0, i32 0, i32 0) #2, !srcloc !4
  %12 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 2, i32 0, i32 0, i32 0) #2, !srcloc !5
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %1) #2
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %2) #2
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %3) #2
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #2
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %5) #2
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %6) #2
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %7) #2
  %13 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %7, i32 noundef 0, i32 noundef 4) #2
  %14 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %15 = icmp eq ptr %14, null
  br i1 %15, label %30, label %16

16:                                               ; preds = %0, %16
  %17 = phi ptr [ %28, %16 ], [ %14, %0 ]
  %18 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %10, ptr noundef nonnull %17) #2
  %19 = load float, ptr %18, align 4, !tbaa !6
  %20 = load i32, ptr %17, align 4, !tbaa !10
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [4 x float], ptr %1, i64 0, i64 %21
  store volatile float %19, ptr %22, align 4, !tbaa !6
  %23 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %11, ptr noundef nonnull %17) #2
  %24 = load float, ptr %23, align 4, !tbaa !6
  %25 = load i32, ptr %17, align 4, !tbaa !10
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [4 x float], ptr %2, i64 0, i64 %26
  store volatile float %24, ptr %27, align 4, !tbaa !6
  %28 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %29 = icmp eq ptr %28, null
  br i1 %29, label %30, label %16, !llvm.loop !12

30:                                               ; preds = %16, %0
  %31 = call ptr inttoptr (i64 7 to ptr)(ptr noundef nonnull %7) #2
  %32 = load volatile float, ptr %1, align 4, !tbaa !6
  %33 = getelementptr inbounds nuw i8, ptr %1, i64 4
  %34 = load volatile float, ptr %33, align 4, !tbaa !6
  %35 = load volatile float, ptr %1, align 4, !tbaa !6
  %36 = load volatile float, ptr %33, align 4, !tbaa !6
  %37 = load volatile float, ptr %2, align 4, !tbaa !6
  %38 = getelementptr inbounds nuw i8, ptr %2, i64 4
  %39 = load volatile float, ptr %38, align 4, !tbaa !6
  %40 = load volatile float, ptr %2, align 4, !tbaa !6
  %41 = load volatile float, ptr %38, align 4, !tbaa !6
  store volatile float 0.000000e+00, ptr %3, align 4, !tbaa !6
  %42 = load volatile float, ptr %33, align 4, !tbaa !6
  %43 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %44 = load volatile float, ptr %43, align 4, !tbaa !6
  %45 = load volatile float, ptr %33, align 4, !tbaa !6
  %46 = load volatile float, ptr %43, align 4, !tbaa !6
  %47 = load volatile float, ptr %38, align 4, !tbaa !6
  %48 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %49 = load volatile float, ptr %48, align 4, !tbaa !6
  %50 = load volatile float, ptr %38, align 4, !tbaa !6
  %51 = load volatile float, ptr %48, align 4, !tbaa !6
  %52 = getelementptr inbounds nuw i8, ptr %3, i64 4
  store volatile float 0.000000e+00, ptr %52, align 4, !tbaa !6
  %53 = load volatile float, ptr %43, align 4, !tbaa !6
  %54 = getelementptr inbounds nuw i8, ptr %1, i64 12
  %55 = load volatile float, ptr %54, align 4, !tbaa !6
  %56 = load volatile float, ptr %43, align 4, !tbaa !6
  %57 = load volatile float, ptr %54, align 4, !tbaa !6
  %58 = load volatile float, ptr %48, align 4, !tbaa !6
  %59 = getelementptr inbounds nuw i8, ptr %2, i64 12
  %60 = load volatile float, ptr %59, align 4, !tbaa !6
  %61 = load volatile float, ptr %48, align 4, !tbaa !6
  %62 = load volatile float, ptr %59, align 4, !tbaa !6
  %63 = getelementptr inbounds nuw i8, ptr %3, i64 8
  store volatile float 0.000000e+00, ptr %63, align 4, !tbaa !6
  %64 = load volatile float, ptr %33, align 4, !tbaa !6
  %65 = load volatile float, ptr %54, align 4, !tbaa !6
  %66 = load volatile float, ptr %33, align 4, !tbaa !6
  %67 = load volatile float, ptr %54, align 4, !tbaa !6
  %68 = load volatile float, ptr %38, align 4, !tbaa !6
  %69 = load volatile float, ptr %59, align 4, !tbaa !6
  %70 = load volatile float, ptr %38, align 4, !tbaa !6
  %71 = load volatile float, ptr %59, align 4, !tbaa !6
  %72 = getelementptr inbounds nuw i8, ptr %3, i64 12
  store volatile float 0.000000e+00, ptr %72, align 4, !tbaa !6
  %73 = load volatile float, ptr %1, align 4, !tbaa !6
  %74 = load volatile float, ptr %43, align 4, !tbaa !6
  %75 = load volatile float, ptr %1, align 4, !tbaa !6
  %76 = load volatile float, ptr %43, align 4, !tbaa !6
  %77 = load volatile float, ptr %2, align 4, !tbaa !6
  %78 = load volatile float, ptr %48, align 4, !tbaa !6
  %79 = load volatile float, ptr %2, align 4, !tbaa !6
  %80 = load volatile float, ptr %48, align 4, !tbaa !6
  %81 = getelementptr inbounds nuw i8, ptr %3, i64 16
  store volatile float 0.000000e+00, ptr %81, align 4, !tbaa !6
  %82 = load volatile float, ptr %1, align 4, !tbaa !6
  %83 = load volatile float, ptr %54, align 4, !tbaa !6
  %84 = load volatile float, ptr %1, align 4, !tbaa !6
  %85 = load volatile float, ptr %54, align 4, !tbaa !6
  %86 = load volatile float, ptr %2, align 4, !tbaa !6
  %87 = load volatile float, ptr %59, align 4, !tbaa !6
  %88 = load volatile float, ptr %2, align 4, !tbaa !6
  %89 = load volatile float, ptr %59, align 4, !tbaa !6
  %90 = getelementptr inbounds nuw i8, ptr %3, i64 20
  store volatile float 0.000000e+00, ptr %90, align 4, !tbaa !6
  %91 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %7, i32 noundef 0, i32 noundef 6) #2
  %92 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %93 = icmp eq ptr %92, null
  br i1 %93, label %111, label %94

94:                                               ; preds = %30, %94
  %95 = phi ptr [ %109, %94 ], [ %92, %30 ]
  %96 = phi i64 [ %108, %94 ], [ 0, %30 ]
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %8)
  %97 = load i32, ptr %95, align 4, !tbaa !10
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [6 x float], ptr %3, i64 0, i64 %98
  %100 = load volatile float, ptr %99, align 4, !tbaa !6
  %101 = fmul float %100, 1.000000e+04
  store float %101, ptr %8, align 8, !tbaa !6
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %9)
  %102 = getelementptr inbounds [6 x float], ptr %3, i64 0, i64 %96
  %103 = load volatile float, ptr %102, align 4, !tbaa !6
  %104 = fmul float %103, 1.000000e+04
  store float %104, ptr %9, align 8, !tbaa !6
  %105 = load i64, ptr %8, align 8, !tbaa !15
  %106 = load i64, ptr %9, align 8, !tbaa !15
  %107 = icmp sgt i64 %105, %106
  %108 = select i1 %107, i64 %98, i64 %96
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %9)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %8)
  %109 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %110 = icmp eq ptr %109, null
  br i1 %110, label %111, label %94, !llvm.loop !17

111:                                              ; preds = %94, %30
  %112 = phi i64 [ 0, %30 ], [ %108, %94 ]
  %113 = call ptr inttoptr (i64 7 to ptr)(ptr noundef nonnull %7) #2
  %114 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %7, i32 noundef 0, i32 noundef 6) #2
  %115 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %116 = icmp eq ptr %115, null
  br i1 %116, label %129, label %117

117:                                              ; preds = %111
  %118 = getelementptr inbounds [6 x float], ptr %3, i64 0, i64 %112
  br label %119

119:                                              ; preds = %117, %119
  %120 = phi ptr [ %115, %117 ], [ %127, %119 ]
  %121 = load i32, ptr %120, align 4, !tbaa !10
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [6 x float], ptr %3, i64 0, i64 %122
  %124 = load volatile float, ptr %123, align 4, !tbaa !6
  %125 = load volatile float, ptr %118, align 4, !tbaa !6
  %126 = fdiv float %124, %125
  store volatile float %126, ptr %123, align 4, !tbaa !6
  %127 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %128 = icmp eq ptr %127, null
  br i1 %128, label %129, label %119, !llvm.loop !18

129:                                              ; preds = %119, %111
  %130 = call ptr inttoptr (i64 7 to ptr)(ptr noundef nonnull %7) #2
  switch i64 %112, label %141 [
    i64 0, label %131
    i64 1, label %133
    i64 2, label %135
    i64 3, label %137
    i64 4, label %139
  ]

131:                                              ; preds = %129
  %132 = load volatile float, ptr %52, align 4, !tbaa !6
  store volatile float %132, ptr %3, align 4, !tbaa !6
  br label %133

133:                                              ; preds = %129, %131
  %134 = load volatile float, ptr %63, align 4, !tbaa !6
  store volatile float %134, ptr %52, align 4, !tbaa !6
  br label %135

135:                                              ; preds = %129, %133
  %136 = load volatile float, ptr %72, align 4, !tbaa !6
  store volatile float %136, ptr %63, align 4, !tbaa !6
  br label %137

137:                                              ; preds = %129, %135
  %138 = load volatile float, ptr %81, align 4, !tbaa !6
  store volatile float %138, ptr %72, align 4, !tbaa !6
  br label %139

139:                                              ; preds = %129, %137
  %140 = load volatile float, ptr %90, align 4, !tbaa !6
  store volatile float %140, ptr %81, align 4, !tbaa !6
  br label %141

141:                                              ; preds = %129, %139
  %142 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %7, i32 noundef 0, i32 noundef 5) #2
  %143 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %144 = icmp eq ptr %143, null
  br i1 %144, label %165, label %145

145:                                              ; preds = %141, %145
  %146 = phi ptr [ %152, %145 ], [ %143, %141 ]
  %147 = load i32, ptr %146, align 4, !tbaa !10
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds [6 x float], ptr %3, i64 0, i64 %148
  %150 = load i64, ptr %149, align 4, !tbaa !15
  %151 = getelementptr inbounds [5 x i64], ptr %5, i64 0, i64 %148
  store i64 %150, ptr %151, align 8, !tbaa !15
  %152 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %153 = icmp eq ptr %152, null
  br i1 %153, label %154, label %145, !llvm.loop !19

154:                                              ; preds = %145
  %155 = load i64, ptr %5, align 8, !tbaa !15
  %156 = getelementptr inbounds nuw i8, ptr %5, i64 8
  %157 = load i64, ptr %156, align 8, !tbaa !15
  %158 = getelementptr inbounds nuw i8, ptr %5, i64 16
  %159 = load i64, ptr %158, align 8, !tbaa !15
  %160 = getelementptr inbounds nuw i8, ptr %5, i64 24
  %161 = load i64, ptr %160, align 8, !tbaa !15
  %162 = getelementptr inbounds nuw i8, ptr %5, i64 32
  %163 = load i64, ptr %162, align 8, !tbaa !15
  %164 = xor i64 %163, -1
  br label %165

165:                                              ; preds = %154, %141
  %166 = phi i64 [ %164, %154 ], [ undef, %141 ]
  %167 = phi i64 [ %161, %154 ], [ undef, %141 ]
  %168 = phi i64 [ %159, %154 ], [ undef, %141 ]
  %169 = phi i64 [ %157, %154 ], [ undef, %141 ]
  %170 = phi i64 [ %155, %154 ], [ undef, %141 ]
  %171 = call ptr inttoptr (i64 7 to ptr)(ptr noundef nonnull %7) #2
  %172 = and i64 %169, %170
  %173 = xor i64 %170, -1
  %174 = and i64 %168, %173
  %175 = or i64 %174, %172
  %176 = and i64 %167, %169
  %177 = xor i64 %167, -1
  %178 = and i64 %168, %177
  %179 = or i64 %176, %178
  %180 = and i64 %168, %166
  %181 = xor i64 %180, %167
  %182 = xor i64 %179, %175
  %183 = xor i64 %182, %181
  store i64 %183, ptr %6, align 8, !tbaa !15
  %184 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %12, ptr noundef nonnull %6, ptr noundef nonnull %4, i64 noundef 0) #2
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %7) #2
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %6) #2
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %5) #2
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #2
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3) #2
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %2) #2
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %1) #2
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
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 3047ef595b8b4944540de771dcf86dc85a97ef76)"}
!3 = !{i64 2147510344}
!4 = !{i64 2147510856}
!5 = !{i64 2147511368}
!6 = !{!7, !7, i64 0}
!7 = !{!"float", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !8, i64 0}
!12 = distinct !{!12, !13, !14}
!13 = !{!"llvm.loop.mustprogress"}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = !{!16, !16, i64 0}
!16 = !{!"long", !8, i64 0}
!17 = distinct !{!17, !13, !14}
!18 = distinct !{!18, !13, !14}
!19 = distinct !{!19, !13, !14}
