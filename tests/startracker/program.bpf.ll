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
  br i1 %15, label %28, label %16

16:                                               ; preds = %0, %16
  %17 = phi ptr [ %26, %16 ], [ %14, %0 ]
  %18 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %10, ptr noundef nonnull %17) #2
  %19 = load float, ptr %18, align 4, !tbaa !6
  %20 = load i64, ptr %17, align 8, !tbaa !10
  %21 = getelementptr inbounds [4 x float], ptr %1, i64 0, i64 %20
  store volatile float %19, ptr %21, align 4, !tbaa !6
  %22 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %11, ptr noundef nonnull %17) #2
  %23 = load float, ptr %22, align 4, !tbaa !6
  %24 = load i64, ptr %17, align 8, !tbaa !10
  %25 = getelementptr inbounds [4 x float], ptr %2, i64 0, i64 %24
  store volatile float %23, ptr %25, align 4, !tbaa !6
  %26 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %27 = icmp eq ptr %26, null
  br i1 %27, label %28, label %16, !llvm.loop !12

28:                                               ; preds = %16, %0
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %7) #2
  %29 = load volatile float, ptr %1, align 4, !tbaa !6
  %30 = getelementptr inbounds nuw i8, ptr %1, i64 4
  %31 = load volatile float, ptr %30, align 4, !tbaa !6
  %32 = load volatile float, ptr %1, align 4, !tbaa !6
  %33 = load volatile float, ptr %30, align 4, !tbaa !6
  %34 = load volatile float, ptr %2, align 4, !tbaa !6
  %35 = getelementptr inbounds nuw i8, ptr %2, i64 4
  %36 = load volatile float, ptr %35, align 4, !tbaa !6
  %37 = load volatile float, ptr %2, align 4, !tbaa !6
  %38 = load volatile float, ptr %35, align 4, !tbaa !6
  store volatile float 0.000000e+00, ptr %3, align 4, !tbaa !6
  %39 = load volatile float, ptr %30, align 4, !tbaa !6
  %40 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %41 = load volatile float, ptr %40, align 4, !tbaa !6
  %42 = load volatile float, ptr %30, align 4, !tbaa !6
  %43 = load volatile float, ptr %40, align 4, !tbaa !6
  %44 = load volatile float, ptr %35, align 4, !tbaa !6
  %45 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %46 = load volatile float, ptr %45, align 4, !tbaa !6
  %47 = load volatile float, ptr %35, align 4, !tbaa !6
  %48 = load volatile float, ptr %45, align 4, !tbaa !6
  %49 = getelementptr inbounds nuw i8, ptr %3, i64 4
  store volatile float 0.000000e+00, ptr %49, align 4, !tbaa !6
  %50 = load volatile float, ptr %40, align 4, !tbaa !6
  %51 = getelementptr inbounds nuw i8, ptr %1, i64 12
  %52 = load volatile float, ptr %51, align 4, !tbaa !6
  %53 = load volatile float, ptr %40, align 4, !tbaa !6
  %54 = load volatile float, ptr %51, align 4, !tbaa !6
  %55 = load volatile float, ptr %45, align 4, !tbaa !6
  %56 = getelementptr inbounds nuw i8, ptr %2, i64 12
  %57 = load volatile float, ptr %56, align 4, !tbaa !6
  %58 = load volatile float, ptr %45, align 4, !tbaa !6
  %59 = load volatile float, ptr %56, align 4, !tbaa !6
  %60 = getelementptr inbounds nuw i8, ptr %3, i64 8
  store volatile float 0.000000e+00, ptr %60, align 4, !tbaa !6
  %61 = load volatile float, ptr %30, align 4, !tbaa !6
  %62 = load volatile float, ptr %51, align 4, !tbaa !6
  %63 = load volatile float, ptr %30, align 4, !tbaa !6
  %64 = load volatile float, ptr %51, align 4, !tbaa !6
  %65 = load volatile float, ptr %35, align 4, !tbaa !6
  %66 = load volatile float, ptr %56, align 4, !tbaa !6
  %67 = load volatile float, ptr %35, align 4, !tbaa !6
  %68 = load volatile float, ptr %56, align 4, !tbaa !6
  %69 = getelementptr inbounds nuw i8, ptr %3, i64 12
  store volatile float 0.000000e+00, ptr %69, align 4, !tbaa !6
  %70 = load volatile float, ptr %1, align 4, !tbaa !6
  %71 = load volatile float, ptr %40, align 4, !tbaa !6
  %72 = load volatile float, ptr %1, align 4, !tbaa !6
  %73 = load volatile float, ptr %40, align 4, !tbaa !6
  %74 = load volatile float, ptr %2, align 4, !tbaa !6
  %75 = load volatile float, ptr %45, align 4, !tbaa !6
  %76 = load volatile float, ptr %2, align 4, !tbaa !6
  %77 = load volatile float, ptr %45, align 4, !tbaa !6
  %78 = getelementptr inbounds nuw i8, ptr %3, i64 16
  store volatile float 0.000000e+00, ptr %78, align 4, !tbaa !6
  %79 = load volatile float, ptr %1, align 4, !tbaa !6
  %80 = load volatile float, ptr %51, align 4, !tbaa !6
  %81 = load volatile float, ptr %1, align 4, !tbaa !6
  %82 = load volatile float, ptr %51, align 4, !tbaa !6
  %83 = load volatile float, ptr %2, align 4, !tbaa !6
  %84 = load volatile float, ptr %56, align 4, !tbaa !6
  %85 = load volatile float, ptr %2, align 4, !tbaa !6
  %86 = load volatile float, ptr %56, align 4, !tbaa !6
  %87 = getelementptr inbounds nuw i8, ptr %3, i64 20
  store volatile float 0.000000e+00, ptr %87, align 4, !tbaa !6
  %88 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %7, i32 noundef 0, i32 noundef 6) #2
  %89 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %90 = icmp eq ptr %89, null
  br i1 %90, label %107, label %91

91:                                               ; preds = %28, %91
  %92 = phi ptr [ %105, %91 ], [ %89, %28 ]
  %93 = phi i64 [ %104, %91 ], [ 0, %28 ]
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %8)
  %94 = load i64, ptr %92, align 8, !tbaa !10
  %95 = getelementptr inbounds [6 x float], ptr %3, i64 0, i64 %94
  %96 = load volatile float, ptr %95, align 4, !tbaa !6
  %97 = fmul float %96, 1.000000e+04
  store float %97, ptr %8, align 8, !tbaa !6
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %9)
  %98 = getelementptr inbounds [6 x float], ptr %3, i64 0, i64 %93
  %99 = load volatile float, ptr %98, align 4, !tbaa !6
  %100 = fmul float %99, 1.000000e+04
  store float %100, ptr %9, align 8, !tbaa !6
  %101 = load i64, ptr %8, align 8, !tbaa !14
  %102 = load i64, ptr %9, align 8, !tbaa !14
  %103 = icmp sgt i64 %101, %102
  %104 = select i1 %103, i64 %94, i64 %93
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %9)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %8)
  %105 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %106 = icmp eq ptr %105, null
  br i1 %106, label %107, label %91, !llvm.loop !16

107:                                              ; preds = %91, %28
  %108 = phi i64 [ 0, %28 ], [ %104, %91 ]
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %7) #2
  %109 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %7, i32 noundef 0, i32 noundef 6) #2
  %110 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %111 = icmp eq ptr %110, null
  br i1 %111, label %123, label %112

112:                                              ; preds = %107
  %113 = getelementptr inbounds [6 x float], ptr %3, i64 0, i64 %108
  br label %114

114:                                              ; preds = %112, %114
  %115 = phi ptr [ %110, %112 ], [ %121, %114 ]
  %116 = load i64, ptr %115, align 8, !tbaa !10
  %117 = getelementptr inbounds [6 x float], ptr %3, i64 0, i64 %116
  %118 = load volatile float, ptr %117, align 4, !tbaa !6
  %119 = load volatile float, ptr %113, align 4, !tbaa !6
  %120 = fdiv float %118, %119
  store volatile float %120, ptr %117, align 4, !tbaa !6
  %121 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %122 = icmp eq ptr %121, null
  br i1 %122, label %123, label %114, !llvm.loop !17

123:                                              ; preds = %114, %107
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %7) #2
  switch i64 %108, label %134 [
    i64 0, label %124
    i64 1, label %126
    i64 2, label %128
    i64 3, label %130
    i64 4, label %132
  ]

124:                                              ; preds = %123
  %125 = load volatile float, ptr %49, align 4, !tbaa !6
  store volatile float %125, ptr %3, align 4, !tbaa !6
  br label %126

126:                                              ; preds = %123, %124
  %127 = load volatile float, ptr %60, align 4, !tbaa !6
  store volatile float %127, ptr %49, align 4, !tbaa !6
  br label %128

128:                                              ; preds = %123, %126
  %129 = load volatile float, ptr %69, align 4, !tbaa !6
  store volatile float %129, ptr %60, align 4, !tbaa !6
  br label %130

130:                                              ; preds = %123, %128
  %131 = load volatile float, ptr %78, align 4, !tbaa !6
  store volatile float %131, ptr %69, align 4, !tbaa !6
  br label %132

132:                                              ; preds = %123, %130
  %133 = load volatile float, ptr %87, align 4, !tbaa !6
  store volatile float %133, ptr %78, align 4, !tbaa !6
  br label %134

134:                                              ; preds = %123, %132
  %135 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %7, i32 noundef 0, i32 noundef 5) #2
  %136 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %137 = icmp eq ptr %136, null
  br i1 %137, label %157, label %138

138:                                              ; preds = %134, %138
  %139 = phi ptr [ %144, %138 ], [ %136, %134 ]
  %140 = load i64, ptr %139, align 8, !tbaa !10
  %141 = getelementptr inbounds [6 x float], ptr %3, i64 0, i64 %140
  %142 = load i64, ptr %141, align 4, !tbaa !14
  %143 = getelementptr inbounds [5 x i64], ptr %5, i64 0, i64 %140
  store i64 %142, ptr %143, align 8, !tbaa !14
  %144 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %145 = icmp eq ptr %144, null
  br i1 %145, label %146, label %138, !llvm.loop !18

146:                                              ; preds = %138
  %147 = load i64, ptr %5, align 8, !tbaa !14
  %148 = getelementptr inbounds nuw i8, ptr %5, i64 8
  %149 = load i64, ptr %148, align 8, !tbaa !14
  %150 = getelementptr inbounds nuw i8, ptr %5, i64 16
  %151 = load i64, ptr %150, align 8, !tbaa !14
  %152 = getelementptr inbounds nuw i8, ptr %5, i64 24
  %153 = load i64, ptr %152, align 8, !tbaa !14
  %154 = getelementptr inbounds nuw i8, ptr %5, i64 32
  %155 = load i64, ptr %154, align 8, !tbaa !14
  %156 = xor i64 %155, -1
  br label %157

157:                                              ; preds = %146, %134
  %158 = phi i64 [ %156, %146 ], [ undef, %134 ]
  %159 = phi i64 [ %153, %146 ], [ undef, %134 ]
  %160 = phi i64 [ %151, %146 ], [ undef, %134 ]
  %161 = phi i64 [ %149, %146 ], [ undef, %134 ]
  %162 = phi i64 [ %147, %146 ], [ undef, %134 ]
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %7) #2
  %163 = and i64 %161, %162
  %164 = xor i64 %162, -1
  %165 = and i64 %160, %164
  %166 = or i64 %165, %163
  %167 = and i64 %159, %161
  %168 = xor i64 %159, -1
  %169 = and i64 %160, %168
  %170 = or i64 %167, %169
  %171 = and i64 %160, %158
  %172 = xor i64 %171, %159
  %173 = xor i64 %170, %166
  %174 = xor i64 %173, %172
  store i64 %174, ptr %6, align 8, !tbaa !14
  %175 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %12, ptr noundef nonnull %6, ptr noundef nonnull %4, i64 noundef 0) #2
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
!2 = !{!"clang version 20.1.0 (https://github.com/fprime-bpf/llvm-project.git 03a843fe2f5c0023ee1e6ee21d74290f4387a642)"}
!3 = !{i64 2147510580}
!4 = !{i64 2147511092}
!5 = !{i64 2147511604}
!6 = !{!7, !7, i64 0}
!7 = !{!"float", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"long long", !8, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = !{!15, !15, i64 0}
!15 = !{!"long", !8, i64 0}
!16 = distinct !{!16, !13}
!17 = distinct !{!17, !13}
!18 = distinct !{!18, !13}
