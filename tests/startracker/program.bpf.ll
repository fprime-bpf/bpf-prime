; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

%struct.bpf_iter_num = type { i64, i64, i64, i64 }

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca [4 x float], align 4
  %2 = alloca [4 x float], align 4
  %3 = alloca [6 x float], align 4
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
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %7) #2
  %31 = load volatile float, ptr %1, align 4, !tbaa !6
  %32 = getelementptr inbounds nuw i8, ptr %1, i64 4
  %33 = load volatile float, ptr %32, align 4, !tbaa !6
  %34 = load volatile float, ptr %1, align 4, !tbaa !6
  %35 = load volatile float, ptr %32, align 4, !tbaa !6
  %36 = load volatile float, ptr %2, align 4, !tbaa !6
  %37 = getelementptr inbounds nuw i8, ptr %2, i64 4
  %38 = load volatile float, ptr %37, align 4, !tbaa !6
  %39 = load volatile float, ptr %2, align 4, !tbaa !6
  %40 = load volatile float, ptr %37, align 4, !tbaa !6
  store volatile float 0.000000e+00, ptr %3, align 4, !tbaa !6
  %41 = load volatile float, ptr %32, align 4, !tbaa !6
  %42 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %43 = load volatile float, ptr %42, align 4, !tbaa !6
  %44 = load volatile float, ptr %32, align 4, !tbaa !6
  %45 = load volatile float, ptr %42, align 4, !tbaa !6
  %46 = load volatile float, ptr %37, align 4, !tbaa !6
  %47 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %48 = load volatile float, ptr %47, align 4, !tbaa !6
  %49 = load volatile float, ptr %37, align 4, !tbaa !6
  %50 = load volatile float, ptr %47, align 4, !tbaa !6
  %51 = getelementptr inbounds nuw i8, ptr %3, i64 4
  store volatile float 0.000000e+00, ptr %51, align 4, !tbaa !6
  %52 = load volatile float, ptr %42, align 4, !tbaa !6
  %53 = getelementptr inbounds nuw i8, ptr %1, i64 12
  %54 = load volatile float, ptr %53, align 4, !tbaa !6
  %55 = load volatile float, ptr %42, align 4, !tbaa !6
  %56 = load volatile float, ptr %53, align 4, !tbaa !6
  %57 = load volatile float, ptr %47, align 4, !tbaa !6
  %58 = getelementptr inbounds nuw i8, ptr %2, i64 12
  %59 = load volatile float, ptr %58, align 4, !tbaa !6
  %60 = load volatile float, ptr %47, align 4, !tbaa !6
  %61 = load volatile float, ptr %58, align 4, !tbaa !6
  %62 = getelementptr inbounds nuw i8, ptr %3, i64 8
  store volatile float 0.000000e+00, ptr %62, align 4, !tbaa !6
  %63 = load volatile float, ptr %32, align 4, !tbaa !6
  %64 = load volatile float, ptr %53, align 4, !tbaa !6
  %65 = load volatile float, ptr %32, align 4, !tbaa !6
  %66 = load volatile float, ptr %53, align 4, !tbaa !6
  %67 = load volatile float, ptr %37, align 4, !tbaa !6
  %68 = load volatile float, ptr %58, align 4, !tbaa !6
  %69 = load volatile float, ptr %37, align 4, !tbaa !6
  %70 = load volatile float, ptr %58, align 4, !tbaa !6
  %71 = getelementptr inbounds nuw i8, ptr %3, i64 12
  store volatile float 0.000000e+00, ptr %71, align 4, !tbaa !6
  %72 = load volatile float, ptr %1, align 4, !tbaa !6
  %73 = load volatile float, ptr %42, align 4, !tbaa !6
  %74 = load volatile float, ptr %1, align 4, !tbaa !6
  %75 = load volatile float, ptr %42, align 4, !tbaa !6
  %76 = load volatile float, ptr %2, align 4, !tbaa !6
  %77 = load volatile float, ptr %47, align 4, !tbaa !6
  %78 = load volatile float, ptr %2, align 4, !tbaa !6
  %79 = load volatile float, ptr %47, align 4, !tbaa !6
  %80 = getelementptr inbounds nuw i8, ptr %3, i64 16
  store volatile float 0.000000e+00, ptr %80, align 4, !tbaa !6
  %81 = load volatile float, ptr %1, align 4, !tbaa !6
  %82 = load volatile float, ptr %53, align 4, !tbaa !6
  %83 = load volatile float, ptr %1, align 4, !tbaa !6
  %84 = load volatile float, ptr %53, align 4, !tbaa !6
  %85 = load volatile float, ptr %2, align 4, !tbaa !6
  %86 = load volatile float, ptr %58, align 4, !tbaa !6
  %87 = load volatile float, ptr %2, align 4, !tbaa !6
  %88 = load volatile float, ptr %58, align 4, !tbaa !6
  %89 = getelementptr inbounds nuw i8, ptr %3, i64 20
  store volatile float 0.000000e+00, ptr %89, align 4, !tbaa !6
  %90 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %7, i32 noundef 0, i32 noundef 6) #2
  %91 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %92 = icmp eq ptr %91, null
  br i1 %92, label %110, label %93

93:                                               ; preds = %30, %93
  %94 = phi ptr [ %108, %93 ], [ %91, %30 ]
  %95 = phi i64 [ %107, %93 ], [ 0, %30 ]
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %8)
  %96 = load i32, ptr %94, align 4, !tbaa !10
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [6 x float], ptr %3, i64 0, i64 %97
  %99 = load volatile float, ptr %98, align 4, !tbaa !6
  %100 = fmul float %99, 1.000000e+04
  store float %100, ptr %8, align 8, !tbaa !6
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %9)
  %101 = getelementptr inbounds [6 x float], ptr %3, i64 0, i64 %95
  %102 = load volatile float, ptr %101, align 4, !tbaa !6
  %103 = fmul float %102, 1.000000e+04
  store float %103, ptr %9, align 8, !tbaa !6
  %104 = load i64, ptr %8, align 8, !tbaa !14
  %105 = load i64, ptr %9, align 8, !tbaa !14
  %106 = icmp sgt i64 %104, %105
  %107 = select i1 %106, i64 %97, i64 %95
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %9)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %8)
  %108 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %109 = icmp eq ptr %108, null
  br i1 %109, label %110, label %93, !llvm.loop !16

110:                                              ; preds = %93, %30
  %111 = phi i64 [ 0, %30 ], [ %107, %93 ]
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %7) #2
  %112 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %7, i32 noundef 0, i32 noundef 6) #2
  %113 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %114 = icmp eq ptr %113, null
  br i1 %114, label %127, label %115

115:                                              ; preds = %110
  %116 = getelementptr inbounds [6 x float], ptr %3, i64 0, i64 %111
  br label %117

117:                                              ; preds = %115, %117
  %118 = phi ptr [ %113, %115 ], [ %125, %117 ]
  %119 = load i32, ptr %118, align 4, !tbaa !10
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds [6 x float], ptr %3, i64 0, i64 %120
  %122 = load volatile float, ptr %121, align 4, !tbaa !6
  %123 = load volatile float, ptr %116, align 4, !tbaa !6
  %124 = fdiv float %122, %123
  store volatile float %124, ptr %121, align 4, !tbaa !6
  %125 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %126 = icmp eq ptr %125, null
  br i1 %126, label %127, label %117, !llvm.loop !17

127:                                              ; preds = %117, %110
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %7) #2
  switch i64 %111, label %138 [
    i64 0, label %128
    i64 1, label %130
    i64 2, label %132
    i64 3, label %134
    i64 4, label %136
  ]

128:                                              ; preds = %127
  %129 = load volatile float, ptr %51, align 4, !tbaa !6
  store volatile float %129, ptr %3, align 4, !tbaa !6
  br label %130

130:                                              ; preds = %127, %128
  %131 = load volatile float, ptr %62, align 4, !tbaa !6
  store volatile float %131, ptr %51, align 4, !tbaa !6
  br label %132

132:                                              ; preds = %127, %130
  %133 = load volatile float, ptr %71, align 4, !tbaa !6
  store volatile float %133, ptr %62, align 4, !tbaa !6
  br label %134

134:                                              ; preds = %127, %132
  %135 = load volatile float, ptr %80, align 4, !tbaa !6
  store volatile float %135, ptr %71, align 4, !tbaa !6
  br label %136

136:                                              ; preds = %127, %134
  %137 = load volatile float, ptr %89, align 4, !tbaa !6
  store volatile float %137, ptr %80, align 4, !tbaa !6
  br label %138

138:                                              ; preds = %127, %136
  %139 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %7, i32 noundef 0, i32 noundef 5) #2
  %140 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %141 = icmp eq ptr %140, null
  br i1 %141, label %162, label %142

142:                                              ; preds = %138, %142
  %143 = phi ptr [ %149, %142 ], [ %140, %138 ]
  %144 = load i32, ptr %143, align 4, !tbaa !10
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds [6 x float], ptr %3, i64 0, i64 %145
  %147 = load i64, ptr %146, align 4, !tbaa !14
  %148 = getelementptr inbounds [5 x i64], ptr %5, i64 0, i64 %145
  store i64 %147, ptr %148, align 8, !tbaa !14
  %149 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %150 = icmp eq ptr %149, null
  br i1 %150, label %151, label %142, !llvm.loop !18

151:                                              ; preds = %142
  %152 = load i64, ptr %5, align 8, !tbaa !14
  %153 = getelementptr inbounds nuw i8, ptr %5, i64 8
  %154 = load i64, ptr %153, align 8, !tbaa !14
  %155 = getelementptr inbounds nuw i8, ptr %5, i64 16
  %156 = load i64, ptr %155, align 8, !tbaa !14
  %157 = getelementptr inbounds nuw i8, ptr %5, i64 24
  %158 = load i64, ptr %157, align 8, !tbaa !14
  %159 = getelementptr inbounds nuw i8, ptr %5, i64 32
  %160 = load i64, ptr %159, align 8, !tbaa !14
  %161 = xor i64 %160, -1
  br label %162

162:                                              ; preds = %151, %138
  %163 = phi i64 [ %161, %151 ], [ undef, %138 ]
  %164 = phi i64 [ %158, %151 ], [ undef, %138 ]
  %165 = phi i64 [ %156, %151 ], [ undef, %138 ]
  %166 = phi i64 [ %154, %151 ], [ undef, %138 ]
  %167 = phi i64 [ %152, %151 ], [ undef, %138 ]
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %7) #2
  %168 = and i64 %166, %167
  %169 = xor i64 %167, -1
  %170 = and i64 %165, %169
  %171 = or i64 %170, %168
  %172 = and i64 %164, %166
  %173 = xor i64 %164, -1
  %174 = and i64 %165, %173
  %175 = or i64 %172, %174
  %176 = and i64 %165, %163
  %177 = xor i64 %176, %164
  %178 = xor i64 %175, %171
  %179 = xor i64 %178, %177
  store i64 %179, ptr %6, align 8, !tbaa !14
  %180 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %12, ptr noundef nonnull %6, ptr noundef nonnull %4, i64 noundef 0) #2
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
!2 = !{!"clang version 20.1.0 (https://github.com/fprime-bpf/llvm-project.git 3047ef595b8b4944540de771dcf86dc85a97ef76)"}
!3 = !{i64 2147510360}
!4 = !{i64 2147510872}
!5 = !{i64 2147511384}
!6 = !{!7, !7, i64 0}
!7 = !{!"float", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !8, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = !{!15, !15, i64 0}
!15 = !{!"long", !8, i64 0}
!16 = distinct !{!16, !13}
!17 = distinct !{!17, !13}
!18 = distinct !{!18, !13}
