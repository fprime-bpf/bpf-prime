; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca float, align 8
  %2 = alloca float, align 8
  %3 = alloca [3 x float], align 4
  %4 = alloca [3 x float], align 4
  %5 = alloca [3 x float], align 4
  %6 = alloca [3 x float], align 4
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca float, align 4
  %11 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 8, i32 0, i32 0, i32 0) #3, !srcloc !3
  %12 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 9, i32 0, i32 0, i32 0) #3, !srcloc !4
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %3) #3
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %4) #3
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %5) #3
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %6) #3
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %7) #3
  store i64 0, ptr %7, align 8, !tbaa !5
  br label %14

13:                                               ; preds = %14
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %7) #3
  br label %59

14:                                               ; preds = %0, %14
  %15 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %11, ptr noundef nonnull %7) #3
  %16 = load float, ptr %15, align 4, !tbaa !9
  %17 = load i64, ptr %7, align 8, !tbaa !5
  %18 = getelementptr inbounds [3 x float], ptr %3, i64 0, i64 %17
  store volatile float %16, ptr %18, align 4, !tbaa !9
  %19 = load volatile float, ptr %18, align 4, !tbaa !9
  %20 = getelementptr inbounds [3 x float], ptr %4, i64 0, i64 %17
  store volatile float %19, ptr %20, align 4, !tbaa !9
  %21 = add nsw i64 %17, 1
  store i64 %21, ptr %7, align 8, !tbaa !5
  %22 = icmp slt i64 %17, 2
  br i1 %22, label %14, label %13, !llvm.loop !11

23:                                               ; preds = %59
  %24 = load volatile float, ptr %5, align 4, !tbaa !9
  %25 = load volatile float, ptr %5, align 4, !tbaa !9
  %26 = getelementptr inbounds nuw i8, ptr %5, i64 4
  %27 = load volatile float, ptr %26, align 4, !tbaa !9
  %28 = load volatile float, ptr %26, align 4, !tbaa !9
  %29 = fmul float %27, %28
  %30 = call float @llvm.fmuladd.f32(float %24, float %25, float %29)
  %31 = getelementptr inbounds nuw i8, ptr %5, i64 8
  %32 = load volatile float, ptr %31, align 4, !tbaa !9
  %33 = load volatile float, ptr %31, align 4, !tbaa !9
  %34 = call float @llvm.fmuladd.f32(float %32, float %33, float %30)
  %35 = fsub float 1.000000e+00, %34
  %36 = fcmp ugt float %35, 0.000000e+00
  br i1 %36, label %37, label %48

37:                                               ; preds = %23
  %38 = fmul float %35, 5.000000e-01
  %39 = bitcast float %35 to i32
  %40 = ashr i32 %39, 1
  %41 = sub nsw i32 1597463007, %40
  %42 = bitcast i32 %41 to float
  %43 = fneg float %42
  %44 = fmul float %38, %43
  %45 = call float @llvm.fmuladd.f32(float %44, float %42, float 1.500000e+00)
  %46 = fmul float %45, %42
  %47 = fdiv float 1.000000e+00, %46
  br label %48

48:                                               ; preds = %23, %37
  %49 = phi float [ %47, %37 ], [ 0.000000e+00, %23 ]
  %50 = fdiv float 1.000000e+00, %49
  %51 = getelementptr inbounds nuw i8, ptr %4, i64 4
  %52 = getelementptr inbounds nuw i8, ptr %3, i64 4
  %53 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %54 = getelementptr inbounds nuw i8, ptr %3, i64 8
  %55 = fadd float %50, 1.000000e+00
  %56 = fdiv float %50, %55
  %57 = getelementptr inbounds nuw i8, ptr %6, i64 4
  %58 = getelementptr inbounds nuw i8, ptr %6, i64 8
  br label %69

59:                                               ; preds = %13, %59
  %60 = phi i64 [ 0, %13 ], [ %66, %59 ]
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %8) #3
  %61 = add nuw nsw i64 %60, 3
  store i64 %61, ptr %8, align 8, !tbaa !5
  %62 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %11, ptr noundef nonnull %8) #3
  %63 = load float, ptr %62, align 4, !tbaa !9
  %64 = fdiv float %63, 0x41B1DE7840000000
  %65 = getelementptr inbounds nuw [3 x float], ptr %5, i64 0, i64 %60
  store volatile float %64, ptr %65, align 4, !tbaa !9
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %8) #3
  %66 = add nuw nsw i64 %60, 1
  %67 = icmp eq i64 %66, 3
  br i1 %67, label %23, label %59, !llvm.loop !14

68:                                               ; preds = %950
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %9) #3
  store i64 0, ptr %9, align 8, !tbaa !5
  br label %962

69:                                               ; preds = %48, %950
  %70 = phi float [ 0.000000e+00, %48 ], [ %958, %950 ]
  %71 = phi i64 [ 0, %48 ], [ %959, %950 ]
  %72 = fsub float 0x40101EB860000000, %70
  %73 = fmul float %72, 1.000000e+02
  %74 = fcmp olt float %73, 0.000000e+00
  %75 = fadd float %73, 0x401921FB60000000
  %76 = select i1 %74, float %75, float %73
  %77 = fcmp ult float %76, 0x401921FB60000000
  %78 = fadd float %76, 0xC01921FB60000000
  %79 = select i1 %77, float %76, float %78
  %80 = fcmp oge float %79, 0x3FD921FB60000000
  %81 = fadd float %79, 0xBFD921FB60000000
  %82 = select i1 %80, float %81, float %73
  %83 = select i1 %80, float 0x3FD87DE2A0000000, float 0.000000e+00
  %84 = select i1 %80, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %85 = fcmp oge float %79, 0x3FE921FB60000000
  %86 = fadd float %79, 0xBFE921FB60000000
  %87 = select i1 %85, float %86, float %82
  %88 = select i1 %85, float 0x3FE6A09E60000000, float %83
  %89 = select i1 %85, float 0x3FED906BC0000000, float %84
  %90 = fcmp oge float %79, 0x3FF2D97C80000000
  %91 = fadd float %79, 0xBFF2D97C80000000
  %92 = select i1 %90, float %91, float %87
  %93 = select i1 %90, float 0x3FED906BC0000000, float %88
  %94 = select i1 %90, float 1.000000e+00, float %89
  %95 = fcmp oge float %79, 0x3FF921FB60000000
  %96 = fadd float %79, 0xBFF921FB60000000
  %97 = select i1 %95, float %96, float %92
  %98 = select i1 %95, float 1.000000e+00, float %93
  %99 = select i1 %95, float 0x3FED906BC0000000, float %94
  %100 = fcmp oge float %79, 0x3FFF6A7A40000000
  %101 = fadd float %79, 0xBFFF6A7A40000000
  %102 = select i1 %100, float %101, float %97
  %103 = select i1 %100, float 0x3FED906BC0000000, float %98
  %104 = select i1 %100, float 0x3FE6A09E60000000, float %99
  %105 = fcmp oge float %79, 0x4002D97C80000000
  %106 = fadd float %79, 0xC002D97C80000000
  %107 = select i1 %105, float %106, float %102
  %108 = select i1 %105, float 0x3FE6A09E60000000, float %103
  %109 = select i1 %105, float 0x3FD87DE2A0000000, float %104
  %110 = fcmp oge float %79, 0x4005FDBC00000000
  %111 = fadd float %79, 0xC005FDBC00000000
  %112 = select i1 %110, float %111, float %107
  %113 = select i1 %110, float 0x3FD87DE2A0000000, float %108
  %114 = select i1 %110, float 0.000000e+00, float %109
  %115 = fcmp oge float %79, 0x400921FB60000000
  %116 = fadd float %79, 0xC00921FB60000000
  %117 = select i1 %115, float %116, float %112
  %118 = select i1 %115, float 0.000000e+00, float %113
  %119 = select i1 %115, float 0xBFD87DE2A0000000, float %114
  %120 = fcmp oge float %79, 0x400C463AC0000000
  %121 = fadd float %79, 0xC00C463AC0000000
  %122 = select i1 %120, float %121, float %117
  %123 = select i1 %120, float 0xBFD87DE2A0000000, float %118
  %124 = select i1 %120, float 0xBFE6A09E60000000, float %119
  %125 = fcmp oge float %79, 0x400F6A7A40000000
  %126 = fadd float %79, 0xC00F6A7A40000000
  %127 = select i1 %125, float %126, float %122
  %128 = select i1 %125, float 0xBFE6A09E60000000, float %123
  %129 = select i1 %125, float 0xBFED906BC0000000, float %124
  %130 = fcmp oge float %79, 0x4011475CE0000000
  %131 = fadd float %79, 0xC011475CE0000000
  %132 = select i1 %130, float %131, float %127
  %133 = select i1 %130, float 0xBFED906BC0000000, float %128
  %134 = select i1 %130, float -1.000000e+00, float %129
  %135 = fcmp oge float %79, 0x4012D97C80000000
  %136 = fadd float %79, 0xC012D97C80000000
  %137 = select i1 %135, float %136, float %132
  %138 = select i1 %135, float -1.000000e+00, float %133
  %139 = select i1 %135, float 0xBFED906BC0000000, float %134
  %140 = fcmp oge float %79, 0x40146B9C40000000
  %141 = fadd float %79, 0xC0146B9C40000000
  %142 = select i1 %140, float %141, float %137
  %143 = select i1 %140, float 0xBFED906BC0000000, float %138
  %144 = select i1 %140, float 0xBFE6A09E60000000, float %139
  %145 = fcmp oge float %79, 0x4015FDBC00000000
  %146 = fadd float %79, 0xC015FDBC00000000
  %147 = select i1 %145, float %146, float %142
  %148 = select i1 %145, float 0xBFE6A09E60000000, float %143
  %149 = select i1 %145, float 0xBFD87DE2A0000000, float %144
  %150 = fcmp oge float %79, 0x40178FDBA0000000
  %151 = fadd float %79, 0xC0178FDBA0000000
  %152 = select i1 %150, float %151, float %147
  %153 = select i1 %150, float 0xBFD87DE2A0000000, float %148
  %154 = select i1 %150, float 0.000000e+00, float %149
  %155 = fdiv float %152, 0x3FD921FB60000000
  %156 = fsub float %154, %153
  %157 = call float @llvm.fmuladd.f32(float %155, float %156, float %153)
  %158 = call float @llvm.fmuladd.f32(float %157, float 0x3FA47AE140000000, float %73)
  %159 = fcmp olt float %158, 0.000000e+00
  %160 = fadd float %158, 0x401921FB60000000
  %161 = select i1 %159, float %160, float %158
  %162 = fcmp ult float %161, 0x401921FB60000000
  %163 = fadd float %161, 0xC01921FB60000000
  %164 = select i1 %162, float %161, float %163
  %165 = fcmp oge float %164, 0x3FD921FB60000000
  %166 = fadd float %164, 0xBFD921FB60000000
  %167 = select i1 %165, float %166, float %158
  %168 = select i1 %165, float 0x3FD87DE2A0000000, float 0.000000e+00
  %169 = select i1 %165, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %170 = fcmp oge float %164, 0x3FE921FB60000000
  %171 = fadd float %164, 0xBFE921FB60000000
  %172 = select i1 %170, float %171, float %167
  %173 = select i1 %170, float 0x3FE6A09E60000000, float %168
  %174 = select i1 %170, float 0x3FED906BC0000000, float %169
  %175 = fcmp oge float %164, 0x3FF2D97C80000000
  %176 = fadd float %164, 0xBFF2D97C80000000
  %177 = select i1 %175, float %176, float %172
  %178 = select i1 %175, float 0x3FED906BC0000000, float %173
  %179 = select i1 %175, float 1.000000e+00, float %174
  %180 = fcmp oge float %164, 0x3FF921FB60000000
  %181 = fadd float %164, 0xBFF921FB60000000
  %182 = select i1 %180, float %181, float %177
  %183 = select i1 %180, float 1.000000e+00, float %178
  %184 = select i1 %180, float 0x3FED906BC0000000, float %179
  %185 = fcmp oge float %164, 0x3FFF6A7A40000000
  %186 = fadd float %164, 0xBFFF6A7A40000000
  %187 = select i1 %185, float %186, float %182
  %188 = select i1 %185, float 0x3FED906BC0000000, float %183
  %189 = select i1 %185, float 0x3FE6A09E60000000, float %184
  %190 = fcmp oge float %164, 0x4002D97C80000000
  %191 = fadd float %164, 0xC002D97C80000000
  %192 = select i1 %190, float %191, float %187
  %193 = select i1 %190, float 0x3FE6A09E60000000, float %188
  %194 = select i1 %190, float 0x3FD87DE2A0000000, float %189
  %195 = fcmp oge float %164, 0x4005FDBC00000000
  %196 = fadd float %164, 0xC005FDBC00000000
  %197 = select i1 %195, float %196, float %192
  %198 = select i1 %195, float 0x3FD87DE2A0000000, float %193
  %199 = select i1 %195, float 0.000000e+00, float %194
  %200 = fcmp oge float %164, 0x400921FB60000000
  %201 = fadd float %164, 0xC00921FB60000000
  %202 = select i1 %200, float %201, float %197
  %203 = select i1 %200, float 0.000000e+00, float %198
  %204 = select i1 %200, float 0xBFD87DE2A0000000, float %199
  %205 = fcmp oge float %164, 0x400C463AC0000000
  %206 = fadd float %164, 0xC00C463AC0000000
  %207 = select i1 %205, float %206, float %202
  %208 = select i1 %205, float 0xBFD87DE2A0000000, float %203
  %209 = select i1 %205, float 0xBFE6A09E60000000, float %204
  %210 = fcmp oge float %164, 0x400F6A7A40000000
  %211 = fadd float %164, 0xC00F6A7A40000000
  %212 = select i1 %210, float %211, float %207
  %213 = select i1 %210, float 0xBFE6A09E60000000, float %208
  %214 = select i1 %210, float 0xBFED906BC0000000, float %209
  %215 = fcmp oge float %164, 0x4011475CE0000000
  %216 = fadd float %164, 0xC011475CE0000000
  %217 = select i1 %215, float %216, float %212
  %218 = select i1 %215, float 0xBFED906BC0000000, float %213
  %219 = select i1 %215, float -1.000000e+00, float %214
  %220 = fcmp oge float %164, 0x4012D97C80000000
  %221 = fadd float %164, 0xC012D97C80000000
  %222 = select i1 %220, float %221, float %217
  %223 = select i1 %220, float -1.000000e+00, float %218
  %224 = select i1 %220, float 0xBFED906BC0000000, float %219
  %225 = fcmp oge float %164, 0x40146B9C40000000
  %226 = fadd float %164, 0xC0146B9C40000000
  %227 = select i1 %225, float %226, float %222
  %228 = select i1 %225, float 0xBFED906BC0000000, float %223
  %229 = select i1 %225, float 0xBFE6A09E60000000, float %224
  %230 = fcmp oge float %164, 0x4015FDBC00000000
  %231 = fadd float %164, 0xC015FDBC00000000
  %232 = select i1 %230, float %231, float %227
  %233 = select i1 %230, float 0xBFE6A09E60000000, float %228
  %234 = select i1 %230, float 0xBFD87DE2A0000000, float %229
  %235 = fcmp oge float %164, 0x40178FDBA0000000
  %236 = fadd float %164, 0xC0178FDBA0000000
  %237 = select i1 %235, float %236, float %232
  %238 = select i1 %235, float 0xBFD87DE2A0000000, float %233
  %239 = select i1 %235, float 0.000000e+00, float %234
  %240 = fdiv float %237, 0x3FD921FB60000000
  %241 = fsub float %239, %238
  %242 = call float @llvm.fmuladd.f32(float %240, float %241, float %238)
  %243 = call float @llvm.fmuladd.f32(float %242, float 0x3FA47AE140000000, float %73)
  %244 = fcmp olt float %243, 0.000000e+00
  %245 = fadd float %243, 0x401921FB60000000
  %246 = select i1 %244, float %245, float %243
  %247 = fcmp ult float %246, 0x401921FB60000000
  %248 = fadd float %246, 0xC01921FB60000000
  %249 = select i1 %247, float %246, float %248
  %250 = fcmp oge float %249, 0x3FD921FB60000000
  %251 = fadd float %249, 0xBFD921FB60000000
  %252 = select i1 %250, float %251, float %243
  %253 = select i1 %250, float 0x3FD87DE2A0000000, float 0.000000e+00
  %254 = select i1 %250, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %255 = fcmp oge float %249, 0x3FE921FB60000000
  %256 = fadd float %249, 0xBFE921FB60000000
  %257 = select i1 %255, float %256, float %252
  %258 = select i1 %255, float 0x3FE6A09E60000000, float %253
  %259 = select i1 %255, float 0x3FED906BC0000000, float %254
  %260 = fcmp oge float %249, 0x3FF2D97C80000000
  %261 = fadd float %249, 0xBFF2D97C80000000
  %262 = select i1 %260, float %261, float %257
  %263 = select i1 %260, float 0x3FED906BC0000000, float %258
  %264 = select i1 %260, float 1.000000e+00, float %259
  %265 = fcmp oge float %249, 0x3FF921FB60000000
  %266 = fadd float %249, 0xBFF921FB60000000
  %267 = select i1 %265, float %266, float %262
  %268 = select i1 %265, float 1.000000e+00, float %263
  %269 = select i1 %265, float 0x3FED906BC0000000, float %264
  %270 = fcmp oge float %249, 0x3FFF6A7A40000000
  %271 = fadd float %249, 0xBFFF6A7A40000000
  %272 = select i1 %270, float %271, float %267
  %273 = select i1 %270, float 0x3FED906BC0000000, float %268
  %274 = select i1 %270, float 0x3FE6A09E60000000, float %269
  %275 = fcmp oge float %249, 0x4002D97C80000000
  %276 = fadd float %249, 0xC002D97C80000000
  %277 = select i1 %275, float %276, float %272
  %278 = select i1 %275, float 0x3FE6A09E60000000, float %273
  %279 = select i1 %275, float 0x3FD87DE2A0000000, float %274
  %280 = fcmp oge float %249, 0x4005FDBC00000000
  %281 = fadd float %249, 0xC005FDBC00000000
  %282 = select i1 %280, float %281, float %277
  %283 = select i1 %280, float 0x3FD87DE2A0000000, float %278
  %284 = select i1 %280, float 0.000000e+00, float %279
  %285 = fcmp oge float %249, 0x400921FB60000000
  %286 = fadd float %249, 0xC00921FB60000000
  %287 = select i1 %285, float %286, float %282
  %288 = select i1 %285, float 0.000000e+00, float %283
  %289 = select i1 %285, float 0xBFD87DE2A0000000, float %284
  %290 = fcmp oge float %249, 0x400C463AC0000000
  %291 = fadd float %249, 0xC00C463AC0000000
  %292 = select i1 %290, float %291, float %287
  %293 = select i1 %290, float 0xBFD87DE2A0000000, float %288
  %294 = select i1 %290, float 0xBFE6A09E60000000, float %289
  %295 = fcmp oge float %249, 0x400F6A7A40000000
  %296 = fadd float %249, 0xC00F6A7A40000000
  %297 = select i1 %295, float %296, float %292
  %298 = select i1 %295, float 0xBFE6A09E60000000, float %293
  %299 = select i1 %295, float 0xBFED906BC0000000, float %294
  %300 = fcmp oge float %249, 0x4011475CE0000000
  %301 = fadd float %249, 0xC011475CE0000000
  %302 = select i1 %300, float %301, float %297
  %303 = select i1 %300, float 0xBFED906BC0000000, float %298
  %304 = select i1 %300, float -1.000000e+00, float %299
  %305 = fcmp oge float %249, 0x4012D97C80000000
  %306 = fadd float %249, 0xC012D97C80000000
  %307 = select i1 %305, float %306, float %302
  %308 = select i1 %305, float -1.000000e+00, float %303
  %309 = select i1 %305, float 0xBFED906BC0000000, float %304
  %310 = fcmp oge float %249, 0x40146B9C40000000
  %311 = fadd float %249, 0xC0146B9C40000000
  %312 = select i1 %310, float %311, float %307
  %313 = select i1 %310, float 0xBFED906BC0000000, float %308
  %314 = select i1 %310, float 0xBFE6A09E60000000, float %309
  %315 = fcmp oge float %249, 0x4015FDBC00000000
  %316 = fadd float %249, 0xC015FDBC00000000
  %317 = select i1 %315, float %316, float %312
  %318 = select i1 %315, float 0xBFE6A09E60000000, float %313
  %319 = select i1 %315, float 0xBFD87DE2A0000000, float %314
  %320 = fcmp oge float %249, 0x40178FDBA0000000
  %321 = fadd float %249, 0xC0178FDBA0000000
  %322 = select i1 %320, float %321, float %317
  %323 = select i1 %320, float 0xBFD87DE2A0000000, float %318
  %324 = select i1 %320, float 0.000000e+00, float %319
  %325 = fdiv float %322, 0x3FD921FB60000000
  %326 = fsub float %324, %323
  %327 = call float @llvm.fmuladd.f32(float %325, float %326, float %323)
  %328 = call float @llvm.fmuladd.f32(float %327, float 0x3FA47AE140000000, float %73)
  %329 = fcmp olt float %328, 0.000000e+00
  %330 = fadd float %328, 0x401921FB60000000
  %331 = select i1 %329, float %330, float %328
  %332 = fcmp ult float %331, 0x401921FB60000000
  %333 = fadd float %331, 0xC01921FB60000000
  %334 = select i1 %332, float %331, float %333
  %335 = fcmp oge float %334, 0x3FD921FB60000000
  %336 = fadd float %334, 0xBFD921FB60000000
  %337 = select i1 %335, float %336, float %328
  %338 = select i1 %335, float 0x3FD87DE2A0000000, float 0.000000e+00
  %339 = select i1 %335, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %340 = fcmp oge float %334, 0x3FE921FB60000000
  %341 = fadd float %334, 0xBFE921FB60000000
  %342 = select i1 %340, float %341, float %337
  %343 = select i1 %340, float 0x3FE6A09E60000000, float %338
  %344 = select i1 %340, float 0x3FED906BC0000000, float %339
  %345 = fcmp oge float %334, 0x3FF2D97C80000000
  %346 = fadd float %334, 0xBFF2D97C80000000
  %347 = select i1 %345, float %346, float %342
  %348 = select i1 %345, float 0x3FED906BC0000000, float %343
  %349 = select i1 %345, float 1.000000e+00, float %344
  %350 = fcmp oge float %334, 0x3FF921FB60000000
  %351 = fadd float %334, 0xBFF921FB60000000
  %352 = select i1 %350, float %351, float %347
  %353 = select i1 %350, float 1.000000e+00, float %348
  %354 = select i1 %350, float 0x3FED906BC0000000, float %349
  %355 = fcmp oge float %334, 0x3FFF6A7A40000000
  %356 = fadd float %334, 0xBFFF6A7A40000000
  %357 = select i1 %355, float %356, float %352
  %358 = select i1 %355, float 0x3FED906BC0000000, float %353
  %359 = select i1 %355, float 0x3FE6A09E60000000, float %354
  %360 = fcmp oge float %334, 0x4002D97C80000000
  %361 = fadd float %334, 0xC002D97C80000000
  %362 = select i1 %360, float %361, float %357
  %363 = select i1 %360, float 0x3FE6A09E60000000, float %358
  %364 = select i1 %360, float 0x3FD87DE2A0000000, float %359
  %365 = fcmp oge float %334, 0x4005FDBC00000000
  %366 = fadd float %334, 0xC005FDBC00000000
  %367 = select i1 %365, float %366, float %362
  %368 = select i1 %365, float 0x3FD87DE2A0000000, float %363
  %369 = select i1 %365, float 0.000000e+00, float %364
  %370 = fcmp oge float %334, 0x400921FB60000000
  %371 = fadd float %334, 0xC00921FB60000000
  %372 = select i1 %370, float %371, float %367
  %373 = select i1 %370, float 0.000000e+00, float %368
  %374 = select i1 %370, float 0xBFD87DE2A0000000, float %369
  %375 = fcmp oge float %334, 0x400C463AC0000000
  %376 = fadd float %334, 0xC00C463AC0000000
  %377 = select i1 %375, float %376, float %372
  %378 = select i1 %375, float 0xBFD87DE2A0000000, float %373
  %379 = select i1 %375, float 0xBFE6A09E60000000, float %374
  %380 = fcmp oge float %334, 0x400F6A7A40000000
  %381 = fadd float %334, 0xC00F6A7A40000000
  %382 = select i1 %380, float %381, float %377
  %383 = select i1 %380, float 0xBFE6A09E60000000, float %378
  %384 = select i1 %380, float 0xBFED906BC0000000, float %379
  %385 = fcmp oge float %334, 0x4011475CE0000000
  %386 = fadd float %334, 0xC011475CE0000000
  %387 = select i1 %385, float %386, float %382
  %388 = select i1 %385, float 0xBFED906BC0000000, float %383
  %389 = select i1 %385, float -1.000000e+00, float %384
  %390 = fcmp oge float %334, 0x4012D97C80000000
  %391 = fadd float %334, 0xC012D97C80000000
  %392 = select i1 %390, float %391, float %387
  %393 = select i1 %390, float -1.000000e+00, float %388
  %394 = select i1 %390, float 0xBFED906BC0000000, float %389
  %395 = fcmp oge float %334, 0x40146B9C40000000
  %396 = fadd float %334, 0xC0146B9C40000000
  %397 = select i1 %395, float %396, float %392
  %398 = select i1 %395, float 0xBFED906BC0000000, float %393
  %399 = select i1 %395, float 0xBFE6A09E60000000, float %394
  %400 = fcmp oge float %334, 0x4015FDBC00000000
  %401 = fadd float %334, 0xC015FDBC00000000
  %402 = select i1 %400, float %401, float %397
  %403 = select i1 %400, float 0xBFE6A09E60000000, float %398
  %404 = select i1 %400, float 0xBFD87DE2A0000000, float %399
  %405 = fcmp oge float %334, 0x40178FDBA0000000
  %406 = fadd float %334, 0xC0178FDBA0000000
  %407 = select i1 %405, float %406, float %402
  %408 = select i1 %405, float 0xBFD87DE2A0000000, float %403
  %409 = select i1 %405, float 0.000000e+00, float %404
  %410 = fdiv float %407, 0x3FD921FB60000000
  %411 = fsub float %409, %408
  %412 = call float @llvm.fmuladd.f32(float %410, float %411, float %408)
  %413 = call float @llvm.fmuladd.f32(float %412, float 0x3FA47AE140000000, float %73)
  %414 = fcmp olt float %413, 0.000000e+00
  %415 = fadd float %413, 0x401921FB60000000
  %416 = select i1 %414, float %415, float %413
  %417 = fcmp ult float %416, 0x401921FB60000000
  %418 = fadd float %416, 0xC01921FB60000000
  %419 = select i1 %417, float %416, float %418
  %420 = fcmp oge float %419, 0x3FD921FB60000000
  %421 = fadd float %419, 0xBFD921FB60000000
  %422 = select i1 %420, float %421, float %413
  %423 = select i1 %420, float 0x3FD87DE2A0000000, float 0.000000e+00
  %424 = select i1 %420, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %425 = fcmp oge float %419, 0x3FE921FB60000000
  %426 = fadd float %419, 0xBFE921FB60000000
  %427 = select i1 %425, float %426, float %422
  %428 = select i1 %425, float 0x3FE6A09E60000000, float %423
  %429 = select i1 %425, float 0x3FED906BC0000000, float %424
  %430 = fcmp oge float %419, 0x3FF2D97C80000000
  %431 = fadd float %419, 0xBFF2D97C80000000
  %432 = select i1 %430, float %431, float %427
  %433 = select i1 %430, float 0x3FED906BC0000000, float %428
  %434 = select i1 %430, float 1.000000e+00, float %429
  %435 = fcmp oge float %419, 0x3FF921FB60000000
  %436 = fadd float %419, 0xBFF921FB60000000
  %437 = select i1 %435, float %436, float %432
  %438 = select i1 %435, float 1.000000e+00, float %433
  %439 = select i1 %435, float 0x3FED906BC0000000, float %434
  %440 = fcmp oge float %419, 0x3FFF6A7A40000000
  %441 = fadd float %419, 0xBFFF6A7A40000000
  %442 = select i1 %440, float %441, float %437
  %443 = select i1 %440, float 0x3FED906BC0000000, float %438
  %444 = select i1 %440, float 0x3FE6A09E60000000, float %439
  %445 = fcmp oge float %419, 0x4002D97C80000000
  %446 = fadd float %419, 0xC002D97C80000000
  %447 = select i1 %445, float %446, float %442
  %448 = select i1 %445, float 0x3FE6A09E60000000, float %443
  %449 = select i1 %445, float 0x3FD87DE2A0000000, float %444
  %450 = fcmp oge float %419, 0x4005FDBC00000000
  %451 = fadd float %419, 0xC005FDBC00000000
  %452 = select i1 %450, float %451, float %447
  %453 = select i1 %450, float 0x3FD87DE2A0000000, float %448
  %454 = select i1 %450, float 0.000000e+00, float %449
  %455 = fcmp oge float %419, 0x400921FB60000000
  %456 = fadd float %419, 0xC00921FB60000000
  %457 = select i1 %455, float %456, float %452
  %458 = select i1 %455, float 0.000000e+00, float %453
  %459 = select i1 %455, float 0xBFD87DE2A0000000, float %454
  %460 = fcmp oge float %419, 0x400C463AC0000000
  %461 = fadd float %419, 0xC00C463AC0000000
  %462 = select i1 %460, float %461, float %457
  %463 = select i1 %460, float 0xBFD87DE2A0000000, float %458
  %464 = select i1 %460, float 0xBFE6A09E60000000, float %459
  %465 = fcmp oge float %419, 0x400F6A7A40000000
  %466 = fadd float %419, 0xC00F6A7A40000000
  %467 = select i1 %465, float %466, float %462
  %468 = select i1 %465, float 0xBFE6A09E60000000, float %463
  %469 = select i1 %465, float 0xBFED906BC0000000, float %464
  %470 = fcmp oge float %419, 0x4011475CE0000000
  %471 = fadd float %419, 0xC011475CE0000000
  %472 = select i1 %470, float %471, float %467
  %473 = select i1 %470, float 0xBFED906BC0000000, float %468
  %474 = select i1 %470, float -1.000000e+00, float %469
  %475 = fcmp oge float %419, 0x4012D97C80000000
  %476 = fadd float %419, 0xC012D97C80000000
  %477 = select i1 %475, float %476, float %472
  %478 = select i1 %475, float -1.000000e+00, float %473
  %479 = select i1 %475, float 0xBFED906BC0000000, float %474
  %480 = fcmp oge float %419, 0x40146B9C40000000
  %481 = fadd float %419, 0xC0146B9C40000000
  %482 = select i1 %480, float %481, float %477
  %483 = select i1 %480, float 0xBFED906BC0000000, float %478
  %484 = select i1 %480, float 0xBFE6A09E60000000, float %479
  %485 = fcmp oge float %419, 0x4015FDBC00000000
  %486 = fadd float %419, 0xC015FDBC00000000
  %487 = select i1 %485, float %486, float %482
  %488 = select i1 %485, float 0xBFE6A09E60000000, float %483
  %489 = select i1 %485, float 0xBFD87DE2A0000000, float %484
  %490 = fcmp oge float %419, 0x40178FDBA0000000
  %491 = fadd float %419, 0xC0178FDBA0000000
  %492 = select i1 %490, float %491, float %487
  %493 = select i1 %490, float 0xBFD87DE2A0000000, float %488
  %494 = select i1 %490, float 0.000000e+00, float %489
  %495 = fdiv float %492, 0x3FD921FB60000000
  %496 = fsub float %494, %493
  %497 = call float @llvm.fmuladd.f32(float %495, float %496, float %493)
  %498 = call float @llvm.fmuladd.f32(float %497, float 0x3FA47AE140000000, float %73)
  %499 = fmul float %498, 5.000000e-01
  %500 = fcmp olt float %499, 0.000000e+00
  %501 = fadd float %499, 0x401921FB60000000
  %502 = select i1 %500, float %501, float %499
  %503 = fcmp ult float %502, 0x401921FB60000000
  %504 = fadd float %502, 0xC01921FB60000000
  %505 = select i1 %503, float %502, float %504
  %506 = fcmp oge float %505, 0x3FD921FB60000000
  %507 = fadd float %505, 0xBFD921FB60000000
  %508 = select i1 %506, float %507, float %499
  %509 = select i1 %506, float 0x3FD87DE2A0000000, float 0.000000e+00
  %510 = select i1 %506, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %511 = fcmp oge float %505, 0x3FE921FB60000000
  %512 = fadd float %505, 0xBFE921FB60000000
  %513 = select i1 %511, float %512, float %508
  %514 = select i1 %511, float 0x3FE6A09E60000000, float %509
  %515 = select i1 %511, float 0x3FED906BC0000000, float %510
  %516 = fcmp oge float %505, 0x3FF2D97C80000000
  %517 = fadd float %505, 0xBFF2D97C80000000
  %518 = select i1 %516, float %517, float %513
  %519 = select i1 %516, float 0x3FED906BC0000000, float %514
  %520 = select i1 %516, float 1.000000e+00, float %515
  %521 = fcmp oge float %505, 0x3FF921FB60000000
  %522 = fadd float %505, 0xBFF921FB60000000
  %523 = select i1 %521, float %522, float %518
  %524 = select i1 %521, float 1.000000e+00, float %519
  %525 = select i1 %521, float 0x3FED906BC0000000, float %520
  %526 = fcmp oge float %505, 0x3FFF6A7A40000000
  %527 = fadd float %505, 0xBFFF6A7A40000000
  %528 = select i1 %526, float %527, float %523
  %529 = select i1 %526, float 0x3FED906BC0000000, float %524
  %530 = select i1 %526, float 0x3FE6A09E60000000, float %525
  %531 = fcmp oge float %505, 0x4002D97C80000000
  %532 = fadd float %505, 0xC002D97C80000000
  %533 = select i1 %531, float %532, float %528
  %534 = select i1 %531, float 0x3FE6A09E60000000, float %529
  %535 = select i1 %531, float 0x3FD87DE2A0000000, float %530
  %536 = fcmp oge float %505, 0x4005FDBC00000000
  %537 = fadd float %505, 0xC005FDBC00000000
  %538 = select i1 %536, float %537, float %533
  %539 = select i1 %536, float 0x3FD87DE2A0000000, float %534
  %540 = select i1 %536, float 0.000000e+00, float %535
  %541 = fcmp oge float %505, 0x400921FB60000000
  %542 = fadd float %505, 0xC00921FB60000000
  %543 = select i1 %541, float %542, float %538
  %544 = select i1 %541, float 0.000000e+00, float %539
  %545 = select i1 %541, float 0xBFD87DE2A0000000, float %540
  %546 = fcmp oge float %505, 0x400C463AC0000000
  %547 = fadd float %505, 0xC00C463AC0000000
  %548 = select i1 %546, float %547, float %543
  %549 = select i1 %546, float 0xBFD87DE2A0000000, float %544
  %550 = select i1 %546, float 0xBFE6A09E60000000, float %545
  %551 = fcmp oge float %505, 0x400F6A7A40000000
  %552 = fadd float %505, 0xC00F6A7A40000000
  %553 = select i1 %551, float %552, float %548
  %554 = select i1 %551, float 0xBFE6A09E60000000, float %549
  %555 = select i1 %551, float 0xBFED906BC0000000, float %550
  %556 = fcmp oge float %505, 0x4011475CE0000000
  %557 = fadd float %505, 0xC011475CE0000000
  %558 = select i1 %556, float %557, float %553
  %559 = select i1 %556, float 0xBFED906BC0000000, float %554
  %560 = select i1 %556, float -1.000000e+00, float %555
  %561 = fcmp oge float %505, 0x4012D97C80000000
  %562 = fadd float %505, 0xC012D97C80000000
  %563 = select i1 %561, float %562, float %558
  %564 = select i1 %561, float -1.000000e+00, float %559
  %565 = select i1 %561, float 0xBFED906BC0000000, float %560
  %566 = fcmp oge float %505, 0x40146B9C40000000
  %567 = fadd float %505, 0xC0146B9C40000000
  %568 = select i1 %566, float %567, float %563
  %569 = select i1 %566, float 0xBFED906BC0000000, float %564
  %570 = select i1 %566, float 0xBFE6A09E60000000, float %565
  %571 = fcmp oge float %505, 0x4015FDBC00000000
  %572 = fadd float %505, 0xC015FDBC00000000
  %573 = select i1 %571, float %572, float %568
  %574 = select i1 %571, float 0xBFE6A09E60000000, float %569
  %575 = select i1 %571, float 0xBFD87DE2A0000000, float %570
  %576 = fcmp oge float %505, 0x40178FDBA0000000
  %577 = fadd float %505, 0xC0178FDBA0000000
  %578 = select i1 %576, float %577, float %573
  %579 = select i1 %576, float 0xBFD87DE2A0000000, float %574
  %580 = select i1 %576, float 0.000000e+00, float %575
  %581 = fdiv float %578, 0x3FD921FB60000000
  %582 = fsub float %580, %579
  %583 = call float @llvm.fmuladd.f32(float %581, float %582, float %579)
  %584 = fmul float %583, 0x3FF054F4E0000000
  %585 = select i1 %506, float 0x3FED906BC0000000, float 1.000000e+00
  %586 = select i1 %506, float 0x3FE6A09E60000000, float 0x3FED906BC0000000
  %587 = select i1 %511, float 0x3FE6A09E60000000, float %585
  %588 = select i1 %511, float 0x3FD87DE2A0000000, float %586
  %589 = select i1 %516, float 0x3FD87DE2A0000000, float %587
  %590 = select i1 %516, float 0.000000e+00, float %588
  %591 = select i1 %521, float 0.000000e+00, float %589
  %592 = select i1 %521, float 0xBFD87DE2A0000000, float %590
  %593 = select i1 %526, float 0xBFD87DE2A0000000, float %591
  %594 = select i1 %526, float 0xBFE6A09E60000000, float %592
  %595 = select i1 %531, float 0xBFE6A09E60000000, float %593
  %596 = select i1 %531, float 0xBFED906BC0000000, float %594
  %597 = select i1 %536, float 0xBFED906BC0000000, float %595
  %598 = select i1 %536, float -1.000000e+00, float %596
  %599 = select i1 %541, float -1.000000e+00, float %597
  %600 = select i1 %541, float 0xBFED906BC0000000, float %598
  %601 = select i1 %546, float 0xBFED906BC0000000, float %599
  %602 = select i1 %546, float 0xBFE6A09E60000000, float %600
  %603 = select i1 %551, float 0xBFE6A09E60000000, float %601
  %604 = select i1 %551, float 0xBFD87DE2A0000000, float %602
  %605 = select i1 %556, float 0xBFD87DE2A0000000, float %603
  %606 = select i1 %556, float 0.000000e+00, float %604
  %607 = select i1 %561, float 0.000000e+00, float %605
  %608 = select i1 %561, float 0x3FD87DE2A0000000, float %606
  %609 = select i1 %566, float 0x3FD87DE2A0000000, float %607
  %610 = select i1 %566, float 0x3FE6A09E60000000, float %608
  %611 = select i1 %571, float 0x3FE6A09E60000000, float %609
  %612 = select i1 %571, float 0x3FED906BC0000000, float %610
  %613 = select i1 %576, float 0x3FED906BC0000000, float %611
  %614 = select i1 %576, float 1.000000e+00, float %612
  %615 = fsub float %614, %613
  %616 = call float @llvm.fmuladd.f32(float %581, float %615, float %613)
  %617 = fmul float %616, 0x3FEF6809C0000000
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %1)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2)
  store float %584, ptr %1, align 8, !tbaa !9
  store float %617, ptr %2, align 8, !tbaa !9
  %618 = load i64, ptr %1, align 8
  %619 = load i64, ptr %2, align 8
  %620 = icmp eq i64 %619, 0
  %621 = icmp eq i64 %618, 0
  %622 = select i1 %620, i1 %621, i1 false
  %623 = trunc i64 %619 to i32
  %624 = bitcast i32 %623 to float
  %625 = trunc i64 %618 to i32
  %626 = bitcast i32 %625 to float
  br i1 %622, label %663, label %627

627:                                              ; preds = %69
  %628 = and i64 %618, 2147483647
  %629 = and i64 %619, 2147483647
  %630 = icmp samesign ugt i64 %629, %628
  br i1 %630, label %631, label %633

631:                                              ; preds = %627
  %632 = fdiv float %626, %624
  br label %635

633:                                              ; preds = %627
  %634 = fdiv float %624, %626
  br label %635

635:                                              ; preds = %633, %631
  %636 = phi float [ %632, %631 ], [ %634, %633 ]
  %637 = fneg float %636
  %638 = fmul float %636, %637
  %639 = fmul float %636, %638
  %640 = fdiv float %639, 3.000000e+00
  %641 = fmul float %638, %640
  %642 = fdiv float %641, 5.000000e+00
  %643 = fmul float %638, %642
  %644 = fdiv float %643, 7.000000e+00
  %645 = fmul float %638, %644
  %646 = fdiv float %645, 9.000000e+00
  %647 = fadd float %636, %640
  %648 = fadd float %647, %642
  %649 = fadd float %648, %644
  %650 = fadd float %649, %646
  br i1 %630, label %655, label %651

651:                                              ; preds = %635
  %652 = icmp sgt i64 %618, -1
  %653 = select i1 %652, float 0x3FF921FB40000000, float 0xBFF921FB40000000
  %654 = fsub float %653, %650
  br label %663

655:                                              ; preds = %635
  %656 = icmp slt i64 %619, 0
  br i1 %656, label %657, label %663

657:                                              ; preds = %655
  %658 = icmp sgt i64 %618, -1
  br i1 %658, label %659, label %661

659:                                              ; preds = %657
  %660 = fadd float %650, 0x400921FB60000000
  br label %663

661:                                              ; preds = %657
  %662 = fadd float %650, 0xC00921FB60000000
  br label %663

663:                                              ; preds = %69, %651, %655, %659, %661
  %664 = phi float [ 0.000000e+00, %69 ], [ %654, %651 ], [ %660, %659 ], [ %662, %661 ], [ %650, %655 ]
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %1)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2)
  %665 = fmul float %664, 2.000000e+00
  %666 = fcmp olt float %498, 0.000000e+00
  %667 = fadd float %498, 0x401921FB60000000
  %668 = select i1 %666, float %667, float %498
  %669 = fcmp ult float %668, 0x401921FB60000000
  %670 = fadd float %668, 0xC01921FB60000000
  %671 = select i1 %669, float %668, float %670
  %672 = fcmp oge float %671, 0x3FD921FB60000000
  %673 = fadd float %671, 0xBFD921FB60000000
  %674 = select i1 %672, float %673, float %498
  %675 = select i1 %672, float 0x3FED906BC0000000, float 1.000000e+00
  %676 = select i1 %672, float 0x3FE6A09E60000000, float 0x3FED906BC0000000
  %677 = fcmp oge float %671, 0x3FE921FB60000000
  %678 = fadd float %671, 0xBFE921FB60000000
  %679 = select i1 %677, float %678, float %674
  %680 = select i1 %677, float 0x3FE6A09E60000000, float %675
  %681 = select i1 %677, float 0x3FD87DE2A0000000, float %676
  %682 = fcmp oge float %671, 0x3FF2D97C80000000
  %683 = fadd float %671, 0xBFF2D97C80000000
  %684 = select i1 %682, float %683, float %679
  %685 = select i1 %682, float 0x3FD87DE2A0000000, float %680
  %686 = select i1 %682, float 0.000000e+00, float %681
  %687 = fcmp oge float %671, 0x3FF921FB60000000
  %688 = fadd float %671, 0xBFF921FB60000000
  %689 = select i1 %687, float %688, float %684
  %690 = select i1 %687, float 0.000000e+00, float %685
  %691 = select i1 %687, float 0xBFD87DE2A0000000, float %686
  %692 = fcmp oge float %671, 0x3FFF6A7A40000000
  %693 = fadd float %671, 0xBFFF6A7A40000000
  %694 = select i1 %692, float %693, float %689
  %695 = select i1 %692, float 0xBFD87DE2A0000000, float %690
  %696 = select i1 %692, float 0xBFE6A09E60000000, float %691
  %697 = fcmp oge float %671, 0x4002D97C80000000
  %698 = fadd float %671, 0xC002D97C80000000
  %699 = select i1 %697, float %698, float %694
  %700 = select i1 %697, float 0xBFE6A09E60000000, float %695
  %701 = select i1 %697, float 0xBFED906BC0000000, float %696
  %702 = fcmp oge float %671, 0x4005FDBC00000000
  %703 = fadd float %671, 0xC005FDBC00000000
  %704 = select i1 %702, float %703, float %699
  %705 = select i1 %702, float 0xBFED906BC0000000, float %700
  %706 = select i1 %702, float -1.000000e+00, float %701
  %707 = fcmp oge float %671, 0x400921FB60000000
  %708 = fadd float %671, 0xC00921FB60000000
  %709 = select i1 %707, float %708, float %704
  %710 = select i1 %707, float -1.000000e+00, float %705
  %711 = select i1 %707, float 0xBFED906BC0000000, float %706
  %712 = fcmp oge float %671, 0x400C463AC0000000
  %713 = fadd float %671, 0xC00C463AC0000000
  %714 = select i1 %712, float %713, float %709
  %715 = select i1 %712, float 0xBFED906BC0000000, float %710
  %716 = select i1 %712, float 0xBFE6A09E60000000, float %711
  %717 = fcmp oge float %671, 0x400F6A7A40000000
  %718 = fadd float %671, 0xC00F6A7A40000000
  %719 = select i1 %717, float %718, float %714
  %720 = select i1 %717, float 0xBFE6A09E60000000, float %715
  %721 = select i1 %717, float 0xBFD87DE2A0000000, float %716
  %722 = fcmp oge float %671, 0x4011475CE0000000
  %723 = fadd float %671, 0xC011475CE0000000
  %724 = select i1 %722, float %723, float %719
  %725 = select i1 %722, float 0xBFD87DE2A0000000, float %720
  %726 = select i1 %722, float 0.000000e+00, float %721
  %727 = fcmp oge float %671, 0x4012D97C80000000
  %728 = fadd float %671, 0xC012D97C80000000
  %729 = select i1 %727, float %728, float %724
  %730 = select i1 %727, float 0.000000e+00, float %725
  %731 = select i1 %727, float 0x3FD87DE2A0000000, float %726
  %732 = fcmp oge float %671, 0x40146B9C40000000
  %733 = fadd float %671, 0xC0146B9C40000000
  %734 = select i1 %732, float %733, float %729
  %735 = select i1 %732, float 0x3FD87DE2A0000000, float %730
  %736 = select i1 %732, float 0x3FE6A09E60000000, float %731
  %737 = fcmp oge float %671, 0x4015FDBC00000000
  %738 = fadd float %671, 0xC015FDBC00000000
  %739 = select i1 %737, float %738, float %734
  %740 = select i1 %737, float 0x3FE6A09E60000000, float %735
  %741 = select i1 %737, float 0x3FED906BC0000000, float %736
  %742 = fcmp oge float %671, 0x40178FDBA0000000
  %743 = fadd float %671, 0xC0178FDBA0000000
  %744 = select i1 %742, float %743, float %739
  %745 = select i1 %742, float 0x3FED906BC0000000, float %740
  %746 = select i1 %742, float 1.000000e+00, float %741
  %747 = fdiv float %744, 0x3FD921FB60000000
  %748 = fsub float %746, %745
  %749 = call float @llvm.fmuladd.f32(float %747, float %748, float %745)
  %750 = call float @llvm.fmuladd.f32(float %749, float 0xBFA47AE140000000, float 1.000000e+00)
  %751 = fmul float %750, 0x404F3C2900000000
  %752 = fcmp olt float %665, 0.000000e+00
  %753 = fadd float %665, 0x401921FB60000000
  %754 = select i1 %752, float %753, float %665
  %755 = fcmp ult float %754, 0x401921FB60000000
  %756 = fadd float %754, 0xC01921FB60000000
  %757 = select i1 %755, float %754, float %756
  %758 = fcmp oge float %757, 0x3FD921FB60000000
  %759 = fadd float %757, 0xBFD921FB60000000
  %760 = select i1 %758, float %759, float %665
  %761 = select i1 %758, float 0x3FED906BC0000000, float 1.000000e+00
  %762 = select i1 %758, float 0x3FE6A09E60000000, float 0x3FED906BC0000000
  %763 = fcmp oge float %757, 0x3FE921FB60000000
  %764 = fadd float %757, 0xBFE921FB60000000
  %765 = select i1 %763, float %764, float %760
  %766 = select i1 %763, float 0x3FE6A09E60000000, float %761
  %767 = select i1 %763, float 0x3FD87DE2A0000000, float %762
  %768 = fcmp oge float %757, 0x3FF2D97C80000000
  %769 = fadd float %757, 0xBFF2D97C80000000
  %770 = select i1 %768, float %769, float %765
  %771 = select i1 %768, float 0x3FD87DE2A0000000, float %766
  %772 = select i1 %768, float 0.000000e+00, float %767
  %773 = fcmp oge float %757, 0x3FF921FB60000000
  %774 = fadd float %757, 0xBFF921FB60000000
  %775 = select i1 %773, float %774, float %770
  %776 = select i1 %773, float 0.000000e+00, float %771
  %777 = select i1 %773, float 0xBFD87DE2A0000000, float %772
  %778 = fcmp oge float %757, 0x3FFF6A7A40000000
  %779 = fadd float %757, 0xBFFF6A7A40000000
  %780 = select i1 %778, float %779, float %775
  %781 = select i1 %778, float 0xBFD87DE2A0000000, float %776
  %782 = select i1 %778, float 0xBFE6A09E60000000, float %777
  %783 = fcmp oge float %757, 0x4002D97C80000000
  %784 = fadd float %757, 0xC002D97C80000000
  %785 = select i1 %783, float %784, float %780
  %786 = select i1 %783, float 0xBFE6A09E60000000, float %781
  %787 = select i1 %783, float 0xBFED906BC0000000, float %782
  %788 = fcmp oge float %757, 0x4005FDBC00000000
  %789 = fadd float %757, 0xC005FDBC00000000
  %790 = select i1 %788, float %789, float %785
  %791 = select i1 %788, float 0xBFED906BC0000000, float %786
  %792 = select i1 %788, float -1.000000e+00, float %787
  %793 = fcmp oge float %757, 0x400921FB60000000
  %794 = fadd float %757, 0xC00921FB60000000
  %795 = select i1 %793, float %794, float %790
  %796 = select i1 %793, float -1.000000e+00, float %791
  %797 = select i1 %793, float 0xBFED906BC0000000, float %792
  %798 = fcmp oge float %757, 0x400C463AC0000000
  %799 = fadd float %757, 0xC00C463AC0000000
  %800 = select i1 %798, float %799, float %795
  %801 = select i1 %798, float 0xBFED906BC0000000, float %796
  %802 = select i1 %798, float 0xBFE6A09E60000000, float %797
  %803 = fcmp oge float %757, 0x400F6A7A40000000
  %804 = fadd float %757, 0xC00F6A7A40000000
  %805 = select i1 %803, float %804, float %800
  %806 = select i1 %803, float 0xBFE6A09E60000000, float %801
  %807 = select i1 %803, float 0xBFD87DE2A0000000, float %802
  %808 = fcmp oge float %757, 0x4011475CE0000000
  %809 = fadd float %757, 0xC011475CE0000000
  %810 = select i1 %808, float %809, float %805
  %811 = select i1 %808, float 0xBFD87DE2A0000000, float %806
  %812 = select i1 %808, float 0.000000e+00, float %807
  %813 = fcmp oge float %757, 0x4012D97C80000000
  %814 = fadd float %757, 0xC012D97C80000000
  %815 = select i1 %813, float %814, float %810
  %816 = select i1 %813, float 0.000000e+00, float %811
  %817 = select i1 %813, float 0x3FD87DE2A0000000, float %812
  %818 = fcmp oge float %757, 0x40146B9C40000000
  %819 = fadd float %757, 0xC0146B9C40000000
  %820 = select i1 %818, float %819, float %815
  %821 = select i1 %818, float 0x3FD87DE2A0000000, float %816
  %822 = select i1 %818, float 0x3FE6A09E60000000, float %817
  %823 = fcmp oge float %757, 0x4015FDBC00000000
  %824 = fadd float %757, 0xC015FDBC00000000
  %825 = select i1 %823, float %824, float %820
  %826 = select i1 %823, float 0x3FE6A09E60000000, float %821
  %827 = select i1 %823, float 0x3FED906BC0000000, float %822
  %828 = fcmp oge float %757, 0x40178FDBA0000000
  %829 = fadd float %757, 0xC0178FDBA0000000
  %830 = select i1 %828, float %829, float %825
  %831 = select i1 %828, float 0x3FED906BC0000000, float %826
  %832 = select i1 %828, float 1.000000e+00, float %827
  %833 = fdiv float %830, 0x3FD921FB60000000
  %834 = fsub float %832, %831
  %835 = call float @llvm.fmuladd.f32(float %833, float %834, float %831)
  %836 = select i1 %758, float 0x3FD87DE2A0000000, float 0.000000e+00
  %837 = select i1 %758, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %838 = select i1 %763, float 0x3FE6A09E60000000, float %836
  %839 = select i1 %763, float 0x3FED906BC0000000, float %837
  %840 = select i1 %768, float 0x3FED906BC0000000, float %838
  %841 = select i1 %768, float 1.000000e+00, float %839
  %842 = select i1 %773, float 1.000000e+00, float %840
  %843 = select i1 %773, float 0x3FED906BC0000000, float %841
  %844 = select i1 %778, float 0x3FED906BC0000000, float %842
  %845 = select i1 %778, float 0x3FE6A09E60000000, float %843
  %846 = select i1 %783, float 0x3FE6A09E60000000, float %844
  %847 = select i1 %783, float 0x3FD87DE2A0000000, float %845
  %848 = select i1 %788, float 0x3FD87DE2A0000000, float %846
  %849 = select i1 %788, float 0.000000e+00, float %847
  %850 = select i1 %793, float 0.000000e+00, float %848
  %851 = select i1 %793, float 0xBFD87DE2A0000000, float %849
  %852 = select i1 %798, float 0xBFD87DE2A0000000, float %850
  %853 = select i1 %798, float 0xBFE6A09E60000000, float %851
  %854 = select i1 %803, float 0xBFE6A09E60000000, float %852
  %855 = select i1 %803, float 0xBFED906BC0000000, float %853
  %856 = select i1 %808, float 0xBFED906BC0000000, float %854
  %857 = select i1 %808, float -1.000000e+00, float %855
  %858 = select i1 %813, float -1.000000e+00, float %856
  %859 = select i1 %813, float 0xBFED906BC0000000, float %857
  %860 = select i1 %818, float 0xBFED906BC0000000, float %858
  %861 = select i1 %818, float 0xBFE6A09E60000000, float %859
  %862 = select i1 %823, float 0xBFE6A09E60000000, float %860
  %863 = select i1 %823, float 0xBFD87DE2A0000000, float %861
  %864 = select i1 %828, float 0xBFD87DE2A0000000, float %862
  %865 = select i1 %828, float 0.000000e+00, float %863
  %866 = fsub float %865, %864
  %867 = call float @llvm.fmuladd.f32(float %833, float %866, float %864)
  %868 = load volatile float, ptr %4, align 4, !tbaa !9
  %869 = fneg float %868
  %870 = call float @llvm.fmuladd.f32(float %751, float %835, float %869)
  store volatile float %870, ptr %3, align 4, !tbaa !9
  %871 = load volatile float, ptr %51, align 4, !tbaa !9
  %872 = fneg float %871
  %873 = call float @llvm.fmuladd.f32(float %751, float %867, float %872)
  store volatile float %873, ptr %52, align 4, !tbaa !9
  %874 = load volatile float, ptr %53, align 4, !tbaa !9
  %875 = fsub float 0.000000e+00, %874
  store volatile float %875, ptr %54, align 4, !tbaa !9
  %876 = fmul float %873, %873
  %877 = call float @llvm.fmuladd.f32(float %870, float %870, float %876)
  %878 = call float @llvm.fmuladd.f32(float %875, float %875, float %877)
  %879 = fcmp ugt float %878, 0.000000e+00
  br i1 %879, label %880, label %891

880:                                              ; preds = %663
  %881 = fmul float %878, 5.000000e-01
  %882 = bitcast float %878 to i32
  %883 = ashr i32 %882, 1
  %884 = sub nsw i32 1597463007, %883
  %885 = bitcast i32 %884 to float
  %886 = fneg float %885
  %887 = fmul float %881, %886
  %888 = call float @llvm.fmuladd.f32(float %887, float %885, float 1.500000e+00)
  %889 = fmul float %888, %885
  %890 = fdiv float 1.000000e+00, %889
  br label %891

891:                                              ; preds = %663, %880
  %892 = phi float [ %890, %880 ], [ 0.000000e+00, %663 ]
  %893 = load volatile float, ptr %3, align 4, !tbaa !9
  %894 = fdiv float %893, %892
  store volatile float %894, ptr %3, align 4, !tbaa !9
  %895 = load volatile float, ptr %52, align 4, !tbaa !9
  %896 = fdiv float %895, %892
  store volatile float %896, ptr %52, align 4, !tbaa !9
  %897 = load volatile float, ptr %54, align 4, !tbaa !9
  %898 = fdiv float %897, %892
  store volatile float %898, ptr %54, align 4, !tbaa !9
  %899 = load volatile float, ptr %5, align 4, !tbaa !9
  %900 = load volatile float, ptr %3, align 4, !tbaa !9
  %901 = load volatile float, ptr %26, align 4, !tbaa !9
  %902 = load volatile float, ptr %52, align 4, !tbaa !9
  %903 = fmul float %901, %902
  %904 = call float @llvm.fmuladd.f32(float %899, float %900, float %903)
  %905 = load volatile float, ptr %31, align 4, !tbaa !9
  %906 = load volatile float, ptr %54, align 4, !tbaa !9
  %907 = call float @llvm.fmuladd.f32(float %905, float %906, float %904)
  %908 = fadd float %907, 1.000000e+00
  %909 = fmul float %50, %908
  %910 = fmul float %56, %907
  %911 = load volatile float, ptr %3, align 4, !tbaa !9
  %912 = load volatile float, ptr %5, align 4, !tbaa !9
  %913 = call float @llvm.fmuladd.f32(float %910, float %912, float %911)
  %914 = load volatile float, ptr %5, align 4, !tbaa !9
  %915 = fadd float %913, %914
  %916 = fdiv float %915, %909
  store volatile float %916, ptr %6, align 4, !tbaa !9
  %917 = load volatile float, ptr %52, align 4, !tbaa !9
  %918 = load volatile float, ptr %26, align 4, !tbaa !9
  %919 = call float @llvm.fmuladd.f32(float %910, float %918, float %917)
  %920 = load volatile float, ptr %26, align 4, !tbaa !9
  %921 = fadd float %919, %920
  %922 = fdiv float %921, %909
  store volatile float %922, ptr %57, align 4, !tbaa !9
  %923 = load volatile float, ptr %54, align 4, !tbaa !9
  %924 = load volatile float, ptr %31, align 4, !tbaa !9
  %925 = call float @llvm.fmuladd.f32(float %910, float %924, float %923)
  %926 = load volatile float, ptr %31, align 4, !tbaa !9
  %927 = fadd float %925, %926
  %928 = fdiv float %927, %909
  store volatile float %928, ptr %58, align 4, !tbaa !9
  %929 = load volatile float, ptr %6, align 4, !tbaa !9
  %930 = load volatile float, ptr %6, align 4, !tbaa !9
  %931 = load volatile float, ptr %57, align 4, !tbaa !9
  %932 = load volatile float, ptr %57, align 4, !tbaa !9
  %933 = fmul float %931, %932
  %934 = call float @llvm.fmuladd.f32(float %929, float %930, float %933)
  %935 = load volatile float, ptr %58, align 4, !tbaa !9
  %936 = load volatile float, ptr %58, align 4, !tbaa !9
  %937 = call float @llvm.fmuladd.f32(float %935, float %936, float %934)
  %938 = fcmp ugt float %937, 0.000000e+00
  br i1 %938, label %939, label %950

939:                                              ; preds = %891
  %940 = fmul float %937, 5.000000e-01
  %941 = bitcast float %937 to i32
  %942 = ashr i32 %941, 1
  %943 = sub nsw i32 1597463007, %942
  %944 = bitcast i32 %943 to float
  %945 = fneg float %944
  %946 = fmul float %940, %945
  %947 = call float @llvm.fmuladd.f32(float %946, float %944, float 1.500000e+00)
  %948 = fmul float %947, %944
  %949 = fdiv float 1.000000e+00, %948
  br label %950

950:                                              ; preds = %891, %939
  %951 = phi float [ %949, %939 ], [ 0.000000e+00, %891 ]
  %952 = load volatile float, ptr %6, align 4, !tbaa !9
  %953 = fdiv float %952, %951
  store volatile float %953, ptr %6, align 4, !tbaa !9
  %954 = load volatile float, ptr %57, align 4, !tbaa !9
  %955 = fdiv float %954, %951
  store volatile float %955, ptr %57, align 4, !tbaa !9
  %956 = load volatile float, ptr %58, align 4, !tbaa !9
  %957 = fdiv float %956, %951
  store volatile float %957, ptr %58, align 4, !tbaa !9
  %958 = fdiv float %892, 0x41B1DE7840000000
  %959 = add nuw nsw i64 %71, 1
  %960 = icmp eq i64 %959, 5
  br i1 %960, label %68, label %69, !llvm.loop !15

961:                                              ; preds = %962
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %9) #3
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %6) #3
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %5) #3
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %4) #3
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %3) #3
  ret i32 0

962:                                              ; preds = %68, %962
  %963 = phi i64 [ 0, %68 ], [ %971, %962 ]
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %10) #3
  %964 = getelementptr inbounds [3 x float], ptr %4, i64 0, i64 %963
  %965 = load volatile float, ptr %964, align 4, !tbaa !9
  %966 = getelementptr inbounds [3 x float], ptr %6, i64 0, i64 %963
  %967 = load volatile float, ptr %966, align 4, !tbaa !9
  %968 = call float @llvm.fmuladd.f32(float %892, float %967, float %965)
  store float %968, ptr %10, align 4, !tbaa !9
  %969 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %12, ptr noundef nonnull %9, ptr noundef nonnull %10, i64 noundef 0) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %10) #3
  %970 = load i64, ptr %9, align 8, !tbaa !5
  %971 = add nsw i64 %970, 1
  store i64 %971, ptr %9, align 8, !tbaa !5
  %972 = icmp slt i64 %970, 2
  br i1 %972, label %962, label %961, !llvm.loop !16
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
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 3047ef595b8b4944540de771dcf86dc85a97ef76)"}
!3 = !{i64 2147511398}
!4 = !{i64 2147511910}
!5 = !{!6, !6, i64 0}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !7, i64 0}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !12, !13}
!15 = distinct !{!15, !12, !13}
!16 = distinct !{!16, !12, !13}
