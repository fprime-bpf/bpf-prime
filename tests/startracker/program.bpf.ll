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
  %10 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #3, !srcloc !3
  %11 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 1, i32 0, i32 0, i32 0) #3, !srcloc !4
  %12 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 2, i32 0, i32 0, i32 0) #3, !srcloc !5
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %1) #3
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %2) #3
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %3) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #3
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %5) #3
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %6) #3
  store i64 0, ptr %6, align 8, !tbaa !6
  br label %177

13:                                               ; preds = %177
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %6) #3
  %14 = load float, ptr %1, align 4, !tbaa !10
  %15 = getelementptr inbounds nuw i8, ptr %1, i64 4
  %16 = load float, ptr %15, align 4, !tbaa !10
  %17 = fsub float %14, %16
  %18 = load float, ptr %2, align 4, !tbaa !10
  %19 = getelementptr inbounds nuw i8, ptr %2, i64 4
  %20 = load float, ptr %19, align 4, !tbaa !10
  %21 = fsub float %18, %20
  %22 = fmul float %21, %21
  %23 = call float @llvm.fmuladd.f32(float %17, float %17, float %22)
  %24 = fcmp ugt float %23, 0.000000e+00
  br i1 %24, label %25, label %42

25:                                               ; preds = %13
  %26 = fdiv float %23, 3.000000e+00
  %27 = fdiv float %23, %26
  %28 = fadd float %26, %27
  %29 = fmul float %28, 5.000000e-01
  %30 = fdiv float %23, %29
  %31 = fadd float %29, %30
  %32 = fmul float %31, 5.000000e-01
  %33 = fdiv float %23, %32
  %34 = fadd float %32, %33
  %35 = fmul float %34, 5.000000e-01
  %36 = fdiv float %23, %35
  %37 = fadd float %35, %36
  %38 = fmul float %37, 5.000000e-01
  %39 = fdiv float %23, %38
  %40 = fadd float %38, %39
  %41 = fmul float %40, 5.000000e-01
  br label %42

42:                                               ; preds = %13, %25
  %43 = phi float [ %41, %25 ], [ 0.000000e+00, %13 ]
  store float %43, ptr %3, align 4, !tbaa !10
  %44 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %45 = load float, ptr %44, align 4, !tbaa !10
  %46 = fsub float %16, %45
  %47 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %48 = load float, ptr %47, align 4, !tbaa !10
  %49 = fsub float %20, %48
  %50 = fmul float %49, %49
  %51 = call float @llvm.fmuladd.f32(float %46, float %46, float %50)
  %52 = fcmp ugt float %51, 0.000000e+00
  br i1 %52, label %53, label %70

53:                                               ; preds = %42
  %54 = fdiv float %51, 3.000000e+00
  %55 = fdiv float %51, %54
  %56 = fadd float %54, %55
  %57 = fmul float %56, 5.000000e-01
  %58 = fdiv float %51, %57
  %59 = fadd float %57, %58
  %60 = fmul float %59, 5.000000e-01
  %61 = fdiv float %51, %60
  %62 = fadd float %60, %61
  %63 = fmul float %62, 5.000000e-01
  %64 = fdiv float %51, %63
  %65 = fadd float %63, %64
  %66 = fmul float %65, 5.000000e-01
  %67 = fdiv float %51, %66
  %68 = fadd float %66, %67
  %69 = fmul float %68, 5.000000e-01
  br label %70

70:                                               ; preds = %42, %53
  %71 = phi float [ %69, %53 ], [ 0.000000e+00, %42 ]
  %72 = getelementptr inbounds nuw i8, ptr %3, i64 4
  store float %71, ptr %72, align 4, !tbaa !10
  %73 = getelementptr inbounds nuw i8, ptr %1, i64 12
  %74 = load float, ptr %73, align 4, !tbaa !10
  %75 = fsub float %45, %74
  %76 = getelementptr inbounds nuw i8, ptr %2, i64 12
  %77 = load float, ptr %76, align 4, !tbaa !10
  %78 = fsub float %48, %77
  %79 = fmul float %78, %78
  %80 = call float @llvm.fmuladd.f32(float %75, float %75, float %79)
  %81 = fcmp ugt float %80, 0.000000e+00
  br i1 %81, label %82, label %99

82:                                               ; preds = %70
  %83 = fdiv float %80, 3.000000e+00
  %84 = fdiv float %80, %83
  %85 = fadd float %83, %84
  %86 = fmul float %85, 5.000000e-01
  %87 = fdiv float %80, %86
  %88 = fadd float %86, %87
  %89 = fmul float %88, 5.000000e-01
  %90 = fdiv float %80, %89
  %91 = fadd float %89, %90
  %92 = fmul float %91, 5.000000e-01
  %93 = fdiv float %80, %92
  %94 = fadd float %92, %93
  %95 = fmul float %94, 5.000000e-01
  %96 = fdiv float %80, %95
  %97 = fadd float %95, %96
  %98 = fmul float %97, 5.000000e-01
  br label %99

99:                                               ; preds = %70, %82
  %100 = phi float [ %98, %82 ], [ 0.000000e+00, %70 ]
  %101 = getelementptr inbounds nuw i8, ptr %3, i64 8
  store float %100, ptr %101, align 4, !tbaa !10
  %102 = fsub float %16, %74
  %103 = fsub float %20, %77
  %104 = fmul float %103, %103
  %105 = call float @llvm.fmuladd.f32(float %102, float %102, float %104)
  %106 = fcmp ugt float %105, 0.000000e+00
  br i1 %106, label %107, label %124

107:                                              ; preds = %99
  %108 = fdiv float %105, 3.000000e+00
  %109 = fdiv float %105, %108
  %110 = fadd float %108, %109
  %111 = fmul float %110, 5.000000e-01
  %112 = fdiv float %105, %111
  %113 = fadd float %111, %112
  %114 = fmul float %113, 5.000000e-01
  %115 = fdiv float %105, %114
  %116 = fadd float %114, %115
  %117 = fmul float %116, 5.000000e-01
  %118 = fdiv float %105, %117
  %119 = fadd float %117, %118
  %120 = fmul float %119, 5.000000e-01
  %121 = fdiv float %105, %120
  %122 = fadd float %120, %121
  %123 = fmul float %122, 5.000000e-01
  br label %124

124:                                              ; preds = %99, %107
  %125 = phi float [ %123, %107 ], [ 0.000000e+00, %99 ]
  %126 = getelementptr inbounds nuw i8, ptr %3, i64 12
  store float %125, ptr %126, align 4, !tbaa !10
  %127 = fsub float %14, %45
  %128 = fsub float %18, %48
  %129 = fmul float %128, %128
  %130 = call float @llvm.fmuladd.f32(float %127, float %127, float %129)
  %131 = fcmp ugt float %130, 0.000000e+00
  br i1 %131, label %132, label %149

132:                                              ; preds = %124
  %133 = fdiv float %130, 3.000000e+00
  %134 = fdiv float %130, %133
  %135 = fadd float %133, %134
  %136 = fmul float %135, 5.000000e-01
  %137 = fdiv float %130, %136
  %138 = fadd float %136, %137
  %139 = fmul float %138, 5.000000e-01
  %140 = fdiv float %130, %139
  %141 = fadd float %139, %140
  %142 = fmul float %141, 5.000000e-01
  %143 = fdiv float %130, %142
  %144 = fadd float %142, %143
  %145 = fmul float %144, 5.000000e-01
  %146 = fdiv float %130, %145
  %147 = fadd float %145, %146
  %148 = fmul float %147, 5.000000e-01
  br label %149

149:                                              ; preds = %124, %132
  %150 = phi float [ %148, %132 ], [ 0.000000e+00, %124 ]
  %151 = getelementptr inbounds nuw i8, ptr %3, i64 16
  store float %150, ptr %151, align 4, !tbaa !10
  %152 = fsub float %14, %74
  %153 = fsub float %18, %77
  %154 = fmul float %153, %153
  %155 = call float @llvm.fmuladd.f32(float %152, float %152, float %154)
  %156 = fcmp ugt float %155, 0.000000e+00
  br i1 %156, label %157, label %174

157:                                              ; preds = %149
  %158 = fdiv float %155, 3.000000e+00
  %159 = fdiv float %155, %158
  %160 = fadd float %158, %159
  %161 = fmul float %160, 5.000000e-01
  %162 = fdiv float %155, %161
  %163 = fadd float %161, %162
  %164 = fmul float %163, 5.000000e-01
  %165 = fdiv float %155, %164
  %166 = fadd float %164, %165
  %167 = fmul float %166, 5.000000e-01
  %168 = fdiv float %155, %167
  %169 = fadd float %167, %168
  %170 = fmul float %169, 5.000000e-01
  %171 = fdiv float %155, %170
  %172 = fadd float %170, %171
  %173 = fmul float %172, 5.000000e-01
  br label %174

174:                                              ; preds = %149, %157
  %175 = phi float [ %173, %157 ], [ 0.000000e+00, %149 ]
  %176 = getelementptr inbounds nuw i8, ptr %3, i64 20
  store float %175, ptr %176, align 4, !tbaa !10
  br label %190

177:                                              ; preds = %0, %177
  %178 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %10, ptr noundef nonnull %6) #3
  %179 = load float, ptr %178, align 4, !tbaa !10
  %180 = load i64, ptr %6, align 8, !tbaa !6
  %181 = getelementptr inbounds [4 x float], ptr %1, i64 0, i64 %180
  store float %179, ptr %181, align 4, !tbaa !10
  %182 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %11, ptr noundef nonnull %6) #3
  %183 = load float, ptr %182, align 4, !tbaa !10
  %184 = load i64, ptr %6, align 8, !tbaa !6
  %185 = getelementptr inbounds [4 x float], ptr %2, i64 0, i64 %184
  store float %183, ptr %185, align 4, !tbaa !10
  %186 = add nsw i64 %184, 1
  store i64 %186, ptr %6, align 8, !tbaa !6
  %187 = icmp slt i64 %184, 3
  br i1 %187, label %177, label %13, !llvm.loop !12

188:                                              ; preds = %190
  %189 = getelementptr inbounds nuw [6 x float], ptr %3, i64 0, i64 %202
  br label %205

190:                                              ; preds = %174, %190
  %191 = phi i64 [ 0, %174 ], [ %203, %190 ]
  %192 = phi i64 [ 0, %174 ], [ %202, %190 ]
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %7)
  %193 = getelementptr inbounds nuw [6 x float], ptr %3, i64 0, i64 %191
  %194 = load float, ptr %193, align 4, !tbaa !10
  %195 = fmul float %194, 1.000000e+04
  store float %195, ptr %7, align 8, !tbaa !10
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %8)
  %196 = getelementptr inbounds nuw [6 x float], ptr %3, i64 0, i64 %192
  %197 = load float, ptr %196, align 4, !tbaa !10
  %198 = fmul float %197, 1.000000e+04
  store float %198, ptr %8, align 8, !tbaa !10
  %199 = load i64, ptr %7, align 8, !tbaa !6
  %200 = load i64, ptr %8, align 8, !tbaa !6
  %201 = icmp sgt i64 %199, %200
  %202 = select i1 %201, i64 %191, i64 %192
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %8)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %7)
  %203 = add nuw nsw i64 %191, 1
  %204 = icmp eq i64 %203, 6
  br i1 %204, label %188, label %190, !llvm.loop !15

205:                                              ; preds = %188, %205
  %206 = phi i64 [ 0, %188 ], [ %211, %205 ]
  %207 = getelementptr inbounds nuw [6 x float], ptr %3, i64 0, i64 %206
  %208 = load float, ptr %207, align 4, !tbaa !10
  %209 = load float, ptr %189, align 4, !tbaa !10
  %210 = fdiv float %208, %209
  store float %210, ptr %207, align 4, !tbaa !10
  %211 = add nuw nsw i64 %206, 1
  %212 = icmp eq i64 %211, 6
  br i1 %212, label %237, label %205, !llvm.loop !16

213:                                              ; preds = %237
  %214 = load i64, ptr %5, align 8, !tbaa !6
  %215 = getelementptr inbounds nuw i8, ptr %5, i64 8
  %216 = load i64, ptr %215, align 8, !tbaa !6
  %217 = and i64 %216, %214
  %218 = xor i64 %214, -1
  %219 = getelementptr inbounds nuw i8, ptr %5, i64 16
  %220 = load i64, ptr %219, align 8, !tbaa !6
  %221 = and i64 %220, %218
  %222 = or i64 %221, %217
  %223 = getelementptr inbounds nuw i8, ptr %5, i64 24
  %224 = load i64, ptr %223, align 8, !tbaa !6
  %225 = and i64 %224, %216
  %226 = xor i64 %224, -1
  %227 = and i64 %220, %226
  %228 = or i64 %225, %227
  %229 = getelementptr inbounds nuw i8, ptr %5, i64 32
  %230 = load i64, ptr %229, align 8, !tbaa !6
  %231 = xor i64 %230, -1
  %232 = and i64 %220, %231
  %233 = xor i64 %232, %224
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %9) #3
  %234 = xor i64 %228, %222
  %235 = xor i64 %234, %233
  store i64 %235, ptr %9, align 8, !tbaa !6
  %236 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %12, ptr noundef nonnull %9, ptr noundef nonnull %4, i64 noundef 0) #3
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %9) #3
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %5) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #3
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3) #3
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %2) #3
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %1) #3
  ret i32 0

237:                                              ; preds = %205, %237
  %238 = phi i64 [ %242, %237 ], [ 0, %205 ]
  %239 = getelementptr inbounds nuw [6 x float], ptr %3, i64 0, i64 %238
  %240 = load i64, ptr %239, align 4, !tbaa !6
  %241 = getelementptr inbounds nuw [5 x i64], ptr %5, i64 0, i64 %238
  store i64 %240, ptr %241, align 8, !tbaa !6
  %242 = add nuw nsw i64 %238, 1
  %243 = icmp eq i64 %242, 5
  br i1 %243, label %213, label %237, !llvm.loop !17
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #2

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="duotronic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 755f040f24df9a74f4e5f7f7bdd64e3acd4e61b9)"}
!3 = !{i64 2147504684}
!4 = !{i64 2147505196}
!5 = !{i64 2147505708}
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
