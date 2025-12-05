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
  %5 = alloca i64, align 8
  %6 = alloca float, align 8
  %7 = alloca float, align 8
  %8 = alloca i64, align 8
  %9 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #3, !srcloc !3
  %10 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 1, i32 0, i32 0, i32 0) #3, !srcloc !4
  %11 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 2, i32 0, i32 0, i32 0) #3, !srcloc !5
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %1) #3
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %2) #3
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %3) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #3
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %5) #3
  store i64 0, ptr %5, align 8, !tbaa !6
  br label %176

12:                                               ; preds = %176
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %5) #3
  %13 = load float, ptr %1, align 4, !tbaa !10
  %14 = getelementptr inbounds nuw i8, ptr %1, i64 4
  %15 = load float, ptr %14, align 4, !tbaa !10
  %16 = fsub float %13, %15
  %17 = load float, ptr %2, align 4, !tbaa !10
  %18 = getelementptr inbounds nuw i8, ptr %2, i64 4
  %19 = load float, ptr %18, align 4, !tbaa !10
  %20 = fsub float %17, %19
  %21 = fmul float %20, %20
  %22 = call float @llvm.fmuladd.f32(float %16, float %16, float %21)
  %23 = fcmp ugt float %22, 0.000000e+00
  br i1 %23, label %24, label %41

24:                                               ; preds = %12
  %25 = fdiv float %22, 3.000000e+00
  %26 = fdiv float %22, %25
  %27 = fadd float %25, %26
  %28 = fmul float %27, 5.000000e-01
  %29 = fdiv float %22, %28
  %30 = fadd float %28, %29
  %31 = fmul float %30, 5.000000e-01
  %32 = fdiv float %22, %31
  %33 = fadd float %31, %32
  %34 = fmul float %33, 5.000000e-01
  %35 = fdiv float %22, %34
  %36 = fadd float %34, %35
  %37 = fmul float %36, 5.000000e-01
  %38 = fdiv float %22, %37
  %39 = fadd float %37, %38
  %40 = fmul float %39, 5.000000e-01
  br label %41

41:                                               ; preds = %12, %24
  %42 = phi float [ %40, %24 ], [ 0.000000e+00, %12 ]
  store float %42, ptr %3, align 4, !tbaa !10
  %43 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %44 = load float, ptr %43, align 4, !tbaa !10
  %45 = fsub float %15, %44
  %46 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %47 = load float, ptr %46, align 4, !tbaa !10
  %48 = fsub float %19, %47
  %49 = fmul float %48, %48
  %50 = call float @llvm.fmuladd.f32(float %45, float %45, float %49)
  %51 = fcmp ugt float %50, 0.000000e+00
  br i1 %51, label %52, label %69

52:                                               ; preds = %41
  %53 = fdiv float %50, 3.000000e+00
  %54 = fdiv float %50, %53
  %55 = fadd float %53, %54
  %56 = fmul float %55, 5.000000e-01
  %57 = fdiv float %50, %56
  %58 = fadd float %56, %57
  %59 = fmul float %58, 5.000000e-01
  %60 = fdiv float %50, %59
  %61 = fadd float %59, %60
  %62 = fmul float %61, 5.000000e-01
  %63 = fdiv float %50, %62
  %64 = fadd float %62, %63
  %65 = fmul float %64, 5.000000e-01
  %66 = fdiv float %50, %65
  %67 = fadd float %65, %66
  %68 = fmul float %67, 5.000000e-01
  br label %69

69:                                               ; preds = %41, %52
  %70 = phi float [ %68, %52 ], [ 0.000000e+00, %41 ]
  %71 = getelementptr inbounds nuw i8, ptr %3, i64 4
  store float %70, ptr %71, align 4, !tbaa !10
  %72 = getelementptr inbounds nuw i8, ptr %1, i64 12
  %73 = load float, ptr %72, align 4, !tbaa !10
  %74 = fsub float %44, %73
  %75 = getelementptr inbounds nuw i8, ptr %2, i64 12
  %76 = load float, ptr %75, align 4, !tbaa !10
  %77 = fsub float %47, %76
  %78 = fmul float %77, %77
  %79 = call float @llvm.fmuladd.f32(float %74, float %74, float %78)
  %80 = fcmp ugt float %79, 0.000000e+00
  br i1 %80, label %81, label %98

81:                                               ; preds = %69
  %82 = fdiv float %79, 3.000000e+00
  %83 = fdiv float %79, %82
  %84 = fadd float %82, %83
  %85 = fmul float %84, 5.000000e-01
  %86 = fdiv float %79, %85
  %87 = fadd float %85, %86
  %88 = fmul float %87, 5.000000e-01
  %89 = fdiv float %79, %88
  %90 = fadd float %88, %89
  %91 = fmul float %90, 5.000000e-01
  %92 = fdiv float %79, %91
  %93 = fadd float %91, %92
  %94 = fmul float %93, 5.000000e-01
  %95 = fdiv float %79, %94
  %96 = fadd float %94, %95
  %97 = fmul float %96, 5.000000e-01
  br label %98

98:                                               ; preds = %69, %81
  %99 = phi float [ %97, %81 ], [ 0.000000e+00, %69 ]
  %100 = getelementptr inbounds nuw i8, ptr %3, i64 8
  store float %99, ptr %100, align 4, !tbaa !10
  %101 = fsub float %15, %73
  %102 = fsub float %19, %76
  %103 = fmul float %102, %102
  %104 = call float @llvm.fmuladd.f32(float %101, float %101, float %103)
  %105 = fcmp ugt float %104, 0.000000e+00
  br i1 %105, label %106, label %123

106:                                              ; preds = %98
  %107 = fdiv float %104, 3.000000e+00
  %108 = fdiv float %104, %107
  %109 = fadd float %107, %108
  %110 = fmul float %109, 5.000000e-01
  %111 = fdiv float %104, %110
  %112 = fadd float %110, %111
  %113 = fmul float %112, 5.000000e-01
  %114 = fdiv float %104, %113
  %115 = fadd float %113, %114
  %116 = fmul float %115, 5.000000e-01
  %117 = fdiv float %104, %116
  %118 = fadd float %116, %117
  %119 = fmul float %118, 5.000000e-01
  %120 = fdiv float %104, %119
  %121 = fadd float %119, %120
  %122 = fmul float %121, 5.000000e-01
  br label %123

123:                                              ; preds = %98, %106
  %124 = phi float [ %122, %106 ], [ 0.000000e+00, %98 ]
  %125 = getelementptr inbounds nuw i8, ptr %3, i64 12
  store float %124, ptr %125, align 4, !tbaa !10
  %126 = fsub float %13, %44
  %127 = fsub float %17, %47
  %128 = fmul float %127, %127
  %129 = call float @llvm.fmuladd.f32(float %126, float %126, float %128)
  %130 = fcmp ugt float %129, 0.000000e+00
  br i1 %130, label %131, label %148

131:                                              ; preds = %123
  %132 = fdiv float %129, 3.000000e+00
  %133 = fdiv float %129, %132
  %134 = fadd float %132, %133
  %135 = fmul float %134, 5.000000e-01
  %136 = fdiv float %129, %135
  %137 = fadd float %135, %136
  %138 = fmul float %137, 5.000000e-01
  %139 = fdiv float %129, %138
  %140 = fadd float %138, %139
  %141 = fmul float %140, 5.000000e-01
  %142 = fdiv float %129, %141
  %143 = fadd float %141, %142
  %144 = fmul float %143, 5.000000e-01
  %145 = fdiv float %129, %144
  %146 = fadd float %144, %145
  %147 = fmul float %146, 5.000000e-01
  br label %148

148:                                              ; preds = %123, %131
  %149 = phi float [ %147, %131 ], [ 0.000000e+00, %123 ]
  %150 = getelementptr inbounds nuw i8, ptr %3, i64 16
  store float %149, ptr %150, align 4, !tbaa !10
  %151 = fsub float %13, %73
  %152 = fsub float %17, %76
  %153 = fmul float %152, %152
  %154 = call float @llvm.fmuladd.f32(float %151, float %151, float %153)
  %155 = fcmp ugt float %154, 0.000000e+00
  br i1 %155, label %156, label %173

156:                                              ; preds = %148
  %157 = fdiv float %154, 3.000000e+00
  %158 = fdiv float %154, %157
  %159 = fadd float %157, %158
  %160 = fmul float %159, 5.000000e-01
  %161 = fdiv float %154, %160
  %162 = fadd float %160, %161
  %163 = fmul float %162, 5.000000e-01
  %164 = fdiv float %154, %163
  %165 = fadd float %163, %164
  %166 = fmul float %165, 5.000000e-01
  %167 = fdiv float %154, %166
  %168 = fadd float %166, %167
  %169 = fmul float %168, 5.000000e-01
  %170 = fdiv float %154, %169
  %171 = fadd float %169, %170
  %172 = fmul float %171, 5.000000e-01
  br label %173

173:                                              ; preds = %148, %156
  %174 = phi float [ %172, %156 ], [ 0.000000e+00, %148 ]
  %175 = getelementptr inbounds nuw i8, ptr %3, i64 20
  store float %174, ptr %175, align 4, !tbaa !10
  br label %189

176:                                              ; preds = %0, %176
  %177 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %9, ptr noundef nonnull %5) #3
  %178 = load float, ptr %177, align 4, !tbaa !10
  %179 = load i64, ptr %5, align 8, !tbaa !6
  %180 = getelementptr inbounds [4 x float], ptr %1, i64 0, i64 %179
  store float %178, ptr %180, align 4, !tbaa !10
  %181 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %10, ptr noundef nonnull %5) #3
  %182 = load float, ptr %181, align 4, !tbaa !10
  %183 = load i64, ptr %5, align 8, !tbaa !6
  %184 = getelementptr inbounds [4 x float], ptr %2, i64 0, i64 %183
  store float %182, ptr %184, align 4, !tbaa !10
  %185 = add nsw i64 %183, 1
  store i64 %185, ptr %5, align 8, !tbaa !6
  %186 = icmp slt i64 %183, 3
  br i1 %186, label %176, label %12, !llvm.loop !12

187:                                              ; preds = %189
  %188 = getelementptr inbounds nuw [6 x float], ptr %3, i64 0, i64 %201
  br label %207

189:                                              ; preds = %173, %189
  %190 = phi i64 [ 0, %173 ], [ %202, %189 ]
  %191 = phi i64 [ 0, %173 ], [ %201, %189 ]
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %6)
  %192 = getelementptr inbounds nuw [6 x float], ptr %3, i64 0, i64 %190
  %193 = load float, ptr %192, align 4, !tbaa !10
  %194 = fmul float %193, 1.000000e+04
  store float %194, ptr %6, align 8, !tbaa !10
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %7)
  %195 = getelementptr inbounds nuw [6 x float], ptr %3, i64 0, i64 %191
  %196 = load float, ptr %195, align 4, !tbaa !10
  %197 = fmul float %196, 1.000000e+04
  store float %197, ptr %7, align 8, !tbaa !10
  %198 = load i64, ptr %6, align 8, !tbaa !6
  %199 = load i64, ptr %7, align 8, !tbaa !6
  %200 = icmp sgt i64 %198, %199
  %201 = select i1 %200, i64 %190, i64 %191
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %7)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %6)
  %202 = add nuw nsw i64 %190, 1
  %203 = icmp eq i64 %202, 6
  br i1 %203, label %187, label %189, !llvm.loop !15

204:                                              ; preds = %207
  switch i64 %201, label %205 [
    i64 0, label %215
    i64 1, label %217
    i64 2, label %219
    i64 3, label %221
    i64 4, label %223
  ]

205:                                              ; preds = %204
  %206 = load float, ptr %150, align 4, !tbaa !10
  br label %225

207:                                              ; preds = %187, %207
  %208 = phi i64 [ 0, %187 ], [ %213, %207 ]
  %209 = getelementptr inbounds nuw [6 x float], ptr %3, i64 0, i64 %208
  %210 = load float, ptr %209, align 4, !tbaa !10
  %211 = load float, ptr %188, align 4, !tbaa !10
  %212 = fdiv float %210, %211
  store float %212, ptr %209, align 4, !tbaa !10
  %213 = add nuw nsw i64 %208, 1
  %214 = icmp eq i64 %213, 6
  br i1 %214, label %204, label %207, !llvm.loop !16

215:                                              ; preds = %204
  %216 = load float, ptr %71, align 4, !tbaa !10
  store float %216, ptr %3, align 4, !tbaa !10
  br label %217

217:                                              ; preds = %204, %215
  %218 = load float, ptr %100, align 4, !tbaa !10
  store float %218, ptr %71, align 4, !tbaa !10
  br label %219

219:                                              ; preds = %204, %217
  %220 = load float, ptr %125, align 4, !tbaa !10
  store float %220, ptr %100, align 4, !tbaa !10
  br label %221

221:                                              ; preds = %204, %219
  %222 = load float, ptr %150, align 4, !tbaa !10
  store float %222, ptr %125, align 4, !tbaa !10
  br label %223

223:                                              ; preds = %204, %221
  %224 = load float, ptr %175, align 4, !tbaa !10
  br label %225

225:                                              ; preds = %205, %223
  %226 = phi float [ %206, %205 ], [ %224, %223 ]
  %227 = load float, ptr %3, align 4, !tbaa !10
  %228 = load float, ptr %71, align 4, !tbaa !10
  %229 = fdiv float %227, %228
  %230 = load float, ptr %100, align 4, !tbaa !10
  %231 = fmul float %229, %230
  %232 = load float, ptr %125, align 4, !tbaa !10
  %233 = fdiv float %231, %232
  %234 = fmul float %233, %226
  store float %234, ptr %4, align 4, !tbaa !10
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %8) #3
  store i64 0, ptr %8, align 8, !tbaa !6
  %235 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %11, ptr noundef nonnull %8, ptr noundef nonnull %4, i64 noundef 0) #3
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %8) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #3
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3) #3
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %2) #3
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %1) #3
  ret i32 0
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
!3 = !{i64 2147504433}
!4 = !{i64 2147504945}
!5 = !{i64 2147505457}
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
