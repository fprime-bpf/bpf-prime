; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

%struct.bpf_iter_num = type { i64, i64, i64, i64 }

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca float, align 8
  %2 = alloca float, align 8
  %3 = alloca [3 x float], align 4
  %4 = alloca [3 x float], align 4
  %5 = alloca [3 x float], align 4
  %6 = alloca [3 x float], align 4
  %7 = alloca %struct.bpf_iter_num, align 8
  %8 = alloca i64, align 8
  %9 = alloca float, align 4
  %10 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 8, i32 0, i32 0, i32 0) #3, !srcloc !3
  %11 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 9, i32 0, i32 0, i32 0) #3, !srcloc !4
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %3) #3
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %4) #3
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %5) #3
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %6) #3
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %7) #3
  %12 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %7, i32 noundef 0, i32 noundef 3) #3
  %13 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #3
  %14 = icmp eq ptr %13, null
  br i1 %14, label %25, label %15

15:                                               ; preds = %0, %15
  %16 = phi ptr [ %23, %15 ], [ %13, %0 ]
  %17 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %10, ptr noundef nonnull %16) #3
  %18 = load float, ptr %17, align 4, !tbaa !5
  %19 = load i64, ptr %16, align 8, !tbaa !9
  %20 = getelementptr inbounds [3 x float], ptr %3, i64 0, i64 %19
  store volatile float %18, ptr %20, align 4, !tbaa !5
  %21 = load volatile float, ptr %20, align 4, !tbaa !5
  %22 = getelementptr inbounds [3 x float], ptr %4, i64 0, i64 %19
  store volatile float %21, ptr %22, align 4, !tbaa !5
  %23 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #3
  %24 = icmp eq ptr %23, null
  br i1 %24, label %25, label %15, !llvm.loop !11

25:                                               ; preds = %15, %0
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %7) #3
  %26 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %7, i32 noundef 0, i32 noundef 3) #3
  %27 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #3
  %28 = icmp eq ptr %27, null
  br i1 %28, label %40, label %29

29:                                               ; preds = %25, %29
  %30 = phi ptr [ %38, %29 ], [ %27, %25 ]
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %8) #3
  %31 = load i64, ptr %30, align 8, !tbaa !9
  %32 = add nsw i64 %31, 3
  store i64 %32, ptr %8, align 8, !tbaa !9
  %33 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %10, ptr noundef nonnull %8) #3
  %34 = load float, ptr %33, align 4, !tbaa !5
  %35 = fdiv float %34, 0x41B1DE7840000000
  %36 = load i64, ptr %30, align 8, !tbaa !9
  %37 = getelementptr inbounds [3 x float], ptr %5, i64 0, i64 %36
  store volatile float %35, ptr %37, align 4, !tbaa !5
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %8) #3
  %38 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #3
  %39 = icmp eq ptr %38, null
  br i1 %39, label %40, label %29, !llvm.loop !14

40:                                               ; preds = %29, %25
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %7) #3
  %41 = load volatile float, ptr %5, align 4, !tbaa !5
  %42 = load volatile float, ptr %5, align 4, !tbaa !5
  %43 = getelementptr inbounds nuw i8, ptr %5, i64 4
  %44 = load volatile float, ptr %43, align 4, !tbaa !5
  %45 = load volatile float, ptr %43, align 4, !tbaa !5
  %46 = fmul float %44, %45
  %47 = call float @llvm.fmuladd.f32(float %41, float %42, float %46)
  %48 = getelementptr inbounds nuw i8, ptr %5, i64 8
  %49 = load volatile float, ptr %48, align 4, !tbaa !5
  %50 = load volatile float, ptr %48, align 4, !tbaa !5
  %51 = call float @llvm.fmuladd.f32(float %49, float %50, float %47)
  %52 = fsub float 1.000000e+00, %51
  %53 = fcmp ugt float %52, 0.000000e+00
  br i1 %53, label %54, label %65

54:                                               ; preds = %40
  %55 = fmul float %52, 5.000000e-01
  %56 = bitcast float %52 to i32
  %57 = ashr i32 %56, 1
  %58 = sub nsw i32 1597463007, %57
  %59 = bitcast i32 %58 to float
  %60 = fneg float %59
  %61 = fmul float %55, %60
  %62 = call float @llvm.fmuladd.f32(float %61, float %59, float 1.500000e+00)
  %63 = fmul float %62, %59
  %64 = fdiv float 1.000000e+00, %63
  br label %65

65:                                               ; preds = %40, %54
  %66 = phi float [ %64, %54 ], [ 0.000000e+00, %40 ]
  %67 = fdiv float 1.000000e+00, %66
  %68 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %7, i32 noundef 0, i32 noundef 5) #3
  %69 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #3
  %70 = icmp eq ptr %69, null
  br i1 %70, label %971, label %71

71:                                               ; preds = %65
  %72 = getelementptr inbounds nuw i8, ptr %4, i64 4
  %73 = getelementptr inbounds nuw i8, ptr %3, i64 4
  %74 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %75 = getelementptr inbounds nuw i8, ptr %3, i64 8
  %76 = fadd float %67, 1.000000e+00
  %77 = fdiv float %67, %76
  %78 = getelementptr inbounds nuw i8, ptr %6, i64 4
  %79 = getelementptr inbounds nuw i8, ptr %6, i64 8
  br label %80

80:                                               ; preds = %71, %960
  %81 = phi float [ 0.000000e+00, %71 ], [ %968, %960 ]
  %82 = fsub float 0x40101EB860000000, %81
  %83 = fmul float %82, 1.000000e+02
  %84 = fcmp olt float %83, 0.000000e+00
  %85 = fadd float %83, 0x401921FB60000000
  %86 = select i1 %84, float %85, float %83
  %87 = fcmp ult float %86, 0x401921FB60000000
  %88 = fadd float %86, 0xC01921FB60000000
  %89 = select i1 %87, float %86, float %88
  %90 = fcmp oge float %89, 0x3FD921FB60000000
  %91 = fadd float %89, 0xBFD921FB60000000
  %92 = select i1 %90, float %91, float %83
  %93 = select i1 %90, float 0x3FD87DE2A0000000, float 0.000000e+00
  %94 = select i1 %90, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %95 = fcmp oge float %89, 0x3FE921FB60000000
  %96 = fadd float %89, 0xBFE921FB60000000
  %97 = select i1 %95, float %96, float %92
  %98 = select i1 %95, float 0x3FE6A09E60000000, float %93
  %99 = select i1 %95, float 0x3FED906BC0000000, float %94
  %100 = fcmp oge float %89, 0x3FF2D97C80000000
  %101 = fadd float %89, 0xBFF2D97C80000000
  %102 = select i1 %100, float %101, float %97
  %103 = select i1 %100, float 0x3FED906BC0000000, float %98
  %104 = select i1 %100, float 1.000000e+00, float %99
  %105 = fcmp oge float %89, 0x3FF921FB60000000
  %106 = fadd float %89, 0xBFF921FB60000000
  %107 = select i1 %105, float %106, float %102
  %108 = select i1 %105, float 1.000000e+00, float %103
  %109 = select i1 %105, float 0x3FED906BC0000000, float %104
  %110 = fcmp oge float %89, 0x3FFF6A7A40000000
  %111 = fadd float %89, 0xBFFF6A7A40000000
  %112 = select i1 %110, float %111, float %107
  %113 = select i1 %110, float 0x3FED906BC0000000, float %108
  %114 = select i1 %110, float 0x3FE6A09E60000000, float %109
  %115 = fcmp oge float %89, 0x4002D97C80000000
  %116 = fadd float %89, 0xC002D97C80000000
  %117 = select i1 %115, float %116, float %112
  %118 = select i1 %115, float 0x3FE6A09E60000000, float %113
  %119 = select i1 %115, float 0x3FD87DE2A0000000, float %114
  %120 = fcmp oge float %89, 0x4005FDBC00000000
  %121 = fadd float %89, 0xC005FDBC00000000
  %122 = select i1 %120, float %121, float %117
  %123 = select i1 %120, float 0x3FD87DE2A0000000, float %118
  %124 = select i1 %120, float 0.000000e+00, float %119
  %125 = fcmp oge float %89, 0x400921FB60000000
  %126 = fadd float %89, 0xC00921FB60000000
  %127 = select i1 %125, float %126, float %122
  %128 = select i1 %125, float 0.000000e+00, float %123
  %129 = select i1 %125, float 0xBFD87DE2A0000000, float %124
  %130 = fcmp oge float %89, 0x400C463AC0000000
  %131 = fadd float %89, 0xC00C463AC0000000
  %132 = select i1 %130, float %131, float %127
  %133 = select i1 %130, float 0xBFD87DE2A0000000, float %128
  %134 = select i1 %130, float 0xBFE6A09E60000000, float %129
  %135 = fcmp oge float %89, 0x400F6A7A40000000
  %136 = fadd float %89, 0xC00F6A7A40000000
  %137 = select i1 %135, float %136, float %132
  %138 = select i1 %135, float 0xBFE6A09E60000000, float %133
  %139 = select i1 %135, float 0xBFED906BC0000000, float %134
  %140 = fcmp oge float %89, 0x4011475CE0000000
  %141 = fadd float %89, 0xC011475CE0000000
  %142 = select i1 %140, float %141, float %137
  %143 = select i1 %140, float 0xBFED906BC0000000, float %138
  %144 = select i1 %140, float -1.000000e+00, float %139
  %145 = fcmp oge float %89, 0x4012D97C80000000
  %146 = fadd float %89, 0xC012D97C80000000
  %147 = select i1 %145, float %146, float %142
  %148 = select i1 %145, float -1.000000e+00, float %143
  %149 = select i1 %145, float 0xBFED906BC0000000, float %144
  %150 = fcmp oge float %89, 0x40146B9C40000000
  %151 = fadd float %89, 0xC0146B9C40000000
  %152 = select i1 %150, float %151, float %147
  %153 = select i1 %150, float 0xBFED906BC0000000, float %148
  %154 = select i1 %150, float 0xBFE6A09E60000000, float %149
  %155 = fcmp oge float %89, 0x4015FDBC00000000
  %156 = fadd float %89, 0xC015FDBC00000000
  %157 = select i1 %155, float %156, float %152
  %158 = select i1 %155, float 0xBFE6A09E60000000, float %153
  %159 = select i1 %155, float 0xBFD87DE2A0000000, float %154
  %160 = fcmp oge float %89, 0x40178FDBA0000000
  %161 = fadd float %89, 0xC0178FDBA0000000
  %162 = select i1 %160, float %161, float %157
  %163 = select i1 %160, float 0xBFD87DE2A0000000, float %158
  %164 = select i1 %160, float 0.000000e+00, float %159
  %165 = fdiv float %162, 0x3FD921FB60000000
  %166 = fsub float %164, %163
  %167 = call float @llvm.fmuladd.f32(float %165, float %166, float %163)
  %168 = call float @llvm.fmuladd.f32(float %167, float 0x3FA47AE140000000, float %83)
  %169 = fcmp olt float %168, 0.000000e+00
  %170 = fadd float %168, 0x401921FB60000000
  %171 = select i1 %169, float %170, float %168
  %172 = fcmp ult float %171, 0x401921FB60000000
  %173 = fadd float %171, 0xC01921FB60000000
  %174 = select i1 %172, float %171, float %173
  %175 = fcmp oge float %174, 0x3FD921FB60000000
  %176 = fadd float %174, 0xBFD921FB60000000
  %177 = select i1 %175, float %176, float %168
  %178 = select i1 %175, float 0x3FD87DE2A0000000, float 0.000000e+00
  %179 = select i1 %175, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %180 = fcmp oge float %174, 0x3FE921FB60000000
  %181 = fadd float %174, 0xBFE921FB60000000
  %182 = select i1 %180, float %181, float %177
  %183 = select i1 %180, float 0x3FE6A09E60000000, float %178
  %184 = select i1 %180, float 0x3FED906BC0000000, float %179
  %185 = fcmp oge float %174, 0x3FF2D97C80000000
  %186 = fadd float %174, 0xBFF2D97C80000000
  %187 = select i1 %185, float %186, float %182
  %188 = select i1 %185, float 0x3FED906BC0000000, float %183
  %189 = select i1 %185, float 1.000000e+00, float %184
  %190 = fcmp oge float %174, 0x3FF921FB60000000
  %191 = fadd float %174, 0xBFF921FB60000000
  %192 = select i1 %190, float %191, float %187
  %193 = select i1 %190, float 1.000000e+00, float %188
  %194 = select i1 %190, float 0x3FED906BC0000000, float %189
  %195 = fcmp oge float %174, 0x3FFF6A7A40000000
  %196 = fadd float %174, 0xBFFF6A7A40000000
  %197 = select i1 %195, float %196, float %192
  %198 = select i1 %195, float 0x3FED906BC0000000, float %193
  %199 = select i1 %195, float 0x3FE6A09E60000000, float %194
  %200 = fcmp oge float %174, 0x4002D97C80000000
  %201 = fadd float %174, 0xC002D97C80000000
  %202 = select i1 %200, float %201, float %197
  %203 = select i1 %200, float 0x3FE6A09E60000000, float %198
  %204 = select i1 %200, float 0x3FD87DE2A0000000, float %199
  %205 = fcmp oge float %174, 0x4005FDBC00000000
  %206 = fadd float %174, 0xC005FDBC00000000
  %207 = select i1 %205, float %206, float %202
  %208 = select i1 %205, float 0x3FD87DE2A0000000, float %203
  %209 = select i1 %205, float 0.000000e+00, float %204
  %210 = fcmp oge float %174, 0x400921FB60000000
  %211 = fadd float %174, 0xC00921FB60000000
  %212 = select i1 %210, float %211, float %207
  %213 = select i1 %210, float 0.000000e+00, float %208
  %214 = select i1 %210, float 0xBFD87DE2A0000000, float %209
  %215 = fcmp oge float %174, 0x400C463AC0000000
  %216 = fadd float %174, 0xC00C463AC0000000
  %217 = select i1 %215, float %216, float %212
  %218 = select i1 %215, float 0xBFD87DE2A0000000, float %213
  %219 = select i1 %215, float 0xBFE6A09E60000000, float %214
  %220 = fcmp oge float %174, 0x400F6A7A40000000
  %221 = fadd float %174, 0xC00F6A7A40000000
  %222 = select i1 %220, float %221, float %217
  %223 = select i1 %220, float 0xBFE6A09E60000000, float %218
  %224 = select i1 %220, float 0xBFED906BC0000000, float %219
  %225 = fcmp oge float %174, 0x4011475CE0000000
  %226 = fadd float %174, 0xC011475CE0000000
  %227 = select i1 %225, float %226, float %222
  %228 = select i1 %225, float 0xBFED906BC0000000, float %223
  %229 = select i1 %225, float -1.000000e+00, float %224
  %230 = fcmp oge float %174, 0x4012D97C80000000
  %231 = fadd float %174, 0xC012D97C80000000
  %232 = select i1 %230, float %231, float %227
  %233 = select i1 %230, float -1.000000e+00, float %228
  %234 = select i1 %230, float 0xBFED906BC0000000, float %229
  %235 = fcmp oge float %174, 0x40146B9C40000000
  %236 = fadd float %174, 0xC0146B9C40000000
  %237 = select i1 %235, float %236, float %232
  %238 = select i1 %235, float 0xBFED906BC0000000, float %233
  %239 = select i1 %235, float 0xBFE6A09E60000000, float %234
  %240 = fcmp oge float %174, 0x4015FDBC00000000
  %241 = fadd float %174, 0xC015FDBC00000000
  %242 = select i1 %240, float %241, float %237
  %243 = select i1 %240, float 0xBFE6A09E60000000, float %238
  %244 = select i1 %240, float 0xBFD87DE2A0000000, float %239
  %245 = fcmp oge float %174, 0x40178FDBA0000000
  %246 = fadd float %174, 0xC0178FDBA0000000
  %247 = select i1 %245, float %246, float %242
  %248 = select i1 %245, float 0xBFD87DE2A0000000, float %243
  %249 = select i1 %245, float 0.000000e+00, float %244
  %250 = fdiv float %247, 0x3FD921FB60000000
  %251 = fsub float %249, %248
  %252 = call float @llvm.fmuladd.f32(float %250, float %251, float %248)
  %253 = call float @llvm.fmuladd.f32(float %252, float 0x3FA47AE140000000, float %83)
  %254 = fcmp olt float %253, 0.000000e+00
  %255 = fadd float %253, 0x401921FB60000000
  %256 = select i1 %254, float %255, float %253
  %257 = fcmp ult float %256, 0x401921FB60000000
  %258 = fadd float %256, 0xC01921FB60000000
  %259 = select i1 %257, float %256, float %258
  %260 = fcmp oge float %259, 0x3FD921FB60000000
  %261 = fadd float %259, 0xBFD921FB60000000
  %262 = select i1 %260, float %261, float %253
  %263 = select i1 %260, float 0x3FD87DE2A0000000, float 0.000000e+00
  %264 = select i1 %260, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %265 = fcmp oge float %259, 0x3FE921FB60000000
  %266 = fadd float %259, 0xBFE921FB60000000
  %267 = select i1 %265, float %266, float %262
  %268 = select i1 %265, float 0x3FE6A09E60000000, float %263
  %269 = select i1 %265, float 0x3FED906BC0000000, float %264
  %270 = fcmp oge float %259, 0x3FF2D97C80000000
  %271 = fadd float %259, 0xBFF2D97C80000000
  %272 = select i1 %270, float %271, float %267
  %273 = select i1 %270, float 0x3FED906BC0000000, float %268
  %274 = select i1 %270, float 1.000000e+00, float %269
  %275 = fcmp oge float %259, 0x3FF921FB60000000
  %276 = fadd float %259, 0xBFF921FB60000000
  %277 = select i1 %275, float %276, float %272
  %278 = select i1 %275, float 1.000000e+00, float %273
  %279 = select i1 %275, float 0x3FED906BC0000000, float %274
  %280 = fcmp oge float %259, 0x3FFF6A7A40000000
  %281 = fadd float %259, 0xBFFF6A7A40000000
  %282 = select i1 %280, float %281, float %277
  %283 = select i1 %280, float 0x3FED906BC0000000, float %278
  %284 = select i1 %280, float 0x3FE6A09E60000000, float %279
  %285 = fcmp oge float %259, 0x4002D97C80000000
  %286 = fadd float %259, 0xC002D97C80000000
  %287 = select i1 %285, float %286, float %282
  %288 = select i1 %285, float 0x3FE6A09E60000000, float %283
  %289 = select i1 %285, float 0x3FD87DE2A0000000, float %284
  %290 = fcmp oge float %259, 0x4005FDBC00000000
  %291 = fadd float %259, 0xC005FDBC00000000
  %292 = select i1 %290, float %291, float %287
  %293 = select i1 %290, float 0x3FD87DE2A0000000, float %288
  %294 = select i1 %290, float 0.000000e+00, float %289
  %295 = fcmp oge float %259, 0x400921FB60000000
  %296 = fadd float %259, 0xC00921FB60000000
  %297 = select i1 %295, float %296, float %292
  %298 = select i1 %295, float 0.000000e+00, float %293
  %299 = select i1 %295, float 0xBFD87DE2A0000000, float %294
  %300 = fcmp oge float %259, 0x400C463AC0000000
  %301 = fadd float %259, 0xC00C463AC0000000
  %302 = select i1 %300, float %301, float %297
  %303 = select i1 %300, float 0xBFD87DE2A0000000, float %298
  %304 = select i1 %300, float 0xBFE6A09E60000000, float %299
  %305 = fcmp oge float %259, 0x400F6A7A40000000
  %306 = fadd float %259, 0xC00F6A7A40000000
  %307 = select i1 %305, float %306, float %302
  %308 = select i1 %305, float 0xBFE6A09E60000000, float %303
  %309 = select i1 %305, float 0xBFED906BC0000000, float %304
  %310 = fcmp oge float %259, 0x4011475CE0000000
  %311 = fadd float %259, 0xC011475CE0000000
  %312 = select i1 %310, float %311, float %307
  %313 = select i1 %310, float 0xBFED906BC0000000, float %308
  %314 = select i1 %310, float -1.000000e+00, float %309
  %315 = fcmp oge float %259, 0x4012D97C80000000
  %316 = fadd float %259, 0xC012D97C80000000
  %317 = select i1 %315, float %316, float %312
  %318 = select i1 %315, float -1.000000e+00, float %313
  %319 = select i1 %315, float 0xBFED906BC0000000, float %314
  %320 = fcmp oge float %259, 0x40146B9C40000000
  %321 = fadd float %259, 0xC0146B9C40000000
  %322 = select i1 %320, float %321, float %317
  %323 = select i1 %320, float 0xBFED906BC0000000, float %318
  %324 = select i1 %320, float 0xBFE6A09E60000000, float %319
  %325 = fcmp oge float %259, 0x4015FDBC00000000
  %326 = fadd float %259, 0xC015FDBC00000000
  %327 = select i1 %325, float %326, float %322
  %328 = select i1 %325, float 0xBFE6A09E60000000, float %323
  %329 = select i1 %325, float 0xBFD87DE2A0000000, float %324
  %330 = fcmp oge float %259, 0x40178FDBA0000000
  %331 = fadd float %259, 0xC0178FDBA0000000
  %332 = select i1 %330, float %331, float %327
  %333 = select i1 %330, float 0xBFD87DE2A0000000, float %328
  %334 = select i1 %330, float 0.000000e+00, float %329
  %335 = fdiv float %332, 0x3FD921FB60000000
  %336 = fsub float %334, %333
  %337 = call float @llvm.fmuladd.f32(float %335, float %336, float %333)
  %338 = call float @llvm.fmuladd.f32(float %337, float 0x3FA47AE140000000, float %83)
  %339 = fcmp olt float %338, 0.000000e+00
  %340 = fadd float %338, 0x401921FB60000000
  %341 = select i1 %339, float %340, float %338
  %342 = fcmp ult float %341, 0x401921FB60000000
  %343 = fadd float %341, 0xC01921FB60000000
  %344 = select i1 %342, float %341, float %343
  %345 = fcmp oge float %344, 0x3FD921FB60000000
  %346 = fadd float %344, 0xBFD921FB60000000
  %347 = select i1 %345, float %346, float %338
  %348 = select i1 %345, float 0x3FD87DE2A0000000, float 0.000000e+00
  %349 = select i1 %345, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %350 = fcmp oge float %344, 0x3FE921FB60000000
  %351 = fadd float %344, 0xBFE921FB60000000
  %352 = select i1 %350, float %351, float %347
  %353 = select i1 %350, float 0x3FE6A09E60000000, float %348
  %354 = select i1 %350, float 0x3FED906BC0000000, float %349
  %355 = fcmp oge float %344, 0x3FF2D97C80000000
  %356 = fadd float %344, 0xBFF2D97C80000000
  %357 = select i1 %355, float %356, float %352
  %358 = select i1 %355, float 0x3FED906BC0000000, float %353
  %359 = select i1 %355, float 1.000000e+00, float %354
  %360 = fcmp oge float %344, 0x3FF921FB60000000
  %361 = fadd float %344, 0xBFF921FB60000000
  %362 = select i1 %360, float %361, float %357
  %363 = select i1 %360, float 1.000000e+00, float %358
  %364 = select i1 %360, float 0x3FED906BC0000000, float %359
  %365 = fcmp oge float %344, 0x3FFF6A7A40000000
  %366 = fadd float %344, 0xBFFF6A7A40000000
  %367 = select i1 %365, float %366, float %362
  %368 = select i1 %365, float 0x3FED906BC0000000, float %363
  %369 = select i1 %365, float 0x3FE6A09E60000000, float %364
  %370 = fcmp oge float %344, 0x4002D97C80000000
  %371 = fadd float %344, 0xC002D97C80000000
  %372 = select i1 %370, float %371, float %367
  %373 = select i1 %370, float 0x3FE6A09E60000000, float %368
  %374 = select i1 %370, float 0x3FD87DE2A0000000, float %369
  %375 = fcmp oge float %344, 0x4005FDBC00000000
  %376 = fadd float %344, 0xC005FDBC00000000
  %377 = select i1 %375, float %376, float %372
  %378 = select i1 %375, float 0x3FD87DE2A0000000, float %373
  %379 = select i1 %375, float 0.000000e+00, float %374
  %380 = fcmp oge float %344, 0x400921FB60000000
  %381 = fadd float %344, 0xC00921FB60000000
  %382 = select i1 %380, float %381, float %377
  %383 = select i1 %380, float 0.000000e+00, float %378
  %384 = select i1 %380, float 0xBFD87DE2A0000000, float %379
  %385 = fcmp oge float %344, 0x400C463AC0000000
  %386 = fadd float %344, 0xC00C463AC0000000
  %387 = select i1 %385, float %386, float %382
  %388 = select i1 %385, float 0xBFD87DE2A0000000, float %383
  %389 = select i1 %385, float 0xBFE6A09E60000000, float %384
  %390 = fcmp oge float %344, 0x400F6A7A40000000
  %391 = fadd float %344, 0xC00F6A7A40000000
  %392 = select i1 %390, float %391, float %387
  %393 = select i1 %390, float 0xBFE6A09E60000000, float %388
  %394 = select i1 %390, float 0xBFED906BC0000000, float %389
  %395 = fcmp oge float %344, 0x4011475CE0000000
  %396 = fadd float %344, 0xC011475CE0000000
  %397 = select i1 %395, float %396, float %392
  %398 = select i1 %395, float 0xBFED906BC0000000, float %393
  %399 = select i1 %395, float -1.000000e+00, float %394
  %400 = fcmp oge float %344, 0x4012D97C80000000
  %401 = fadd float %344, 0xC012D97C80000000
  %402 = select i1 %400, float %401, float %397
  %403 = select i1 %400, float -1.000000e+00, float %398
  %404 = select i1 %400, float 0xBFED906BC0000000, float %399
  %405 = fcmp oge float %344, 0x40146B9C40000000
  %406 = fadd float %344, 0xC0146B9C40000000
  %407 = select i1 %405, float %406, float %402
  %408 = select i1 %405, float 0xBFED906BC0000000, float %403
  %409 = select i1 %405, float 0xBFE6A09E60000000, float %404
  %410 = fcmp oge float %344, 0x4015FDBC00000000
  %411 = fadd float %344, 0xC015FDBC00000000
  %412 = select i1 %410, float %411, float %407
  %413 = select i1 %410, float 0xBFE6A09E60000000, float %408
  %414 = select i1 %410, float 0xBFD87DE2A0000000, float %409
  %415 = fcmp oge float %344, 0x40178FDBA0000000
  %416 = fadd float %344, 0xC0178FDBA0000000
  %417 = select i1 %415, float %416, float %412
  %418 = select i1 %415, float 0xBFD87DE2A0000000, float %413
  %419 = select i1 %415, float 0.000000e+00, float %414
  %420 = fdiv float %417, 0x3FD921FB60000000
  %421 = fsub float %419, %418
  %422 = call float @llvm.fmuladd.f32(float %420, float %421, float %418)
  %423 = call float @llvm.fmuladd.f32(float %422, float 0x3FA47AE140000000, float %83)
  %424 = fcmp olt float %423, 0.000000e+00
  %425 = fadd float %423, 0x401921FB60000000
  %426 = select i1 %424, float %425, float %423
  %427 = fcmp ult float %426, 0x401921FB60000000
  %428 = fadd float %426, 0xC01921FB60000000
  %429 = select i1 %427, float %426, float %428
  %430 = fcmp oge float %429, 0x3FD921FB60000000
  %431 = fadd float %429, 0xBFD921FB60000000
  %432 = select i1 %430, float %431, float %423
  %433 = select i1 %430, float 0x3FD87DE2A0000000, float 0.000000e+00
  %434 = select i1 %430, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %435 = fcmp oge float %429, 0x3FE921FB60000000
  %436 = fadd float %429, 0xBFE921FB60000000
  %437 = select i1 %435, float %436, float %432
  %438 = select i1 %435, float 0x3FE6A09E60000000, float %433
  %439 = select i1 %435, float 0x3FED906BC0000000, float %434
  %440 = fcmp oge float %429, 0x3FF2D97C80000000
  %441 = fadd float %429, 0xBFF2D97C80000000
  %442 = select i1 %440, float %441, float %437
  %443 = select i1 %440, float 0x3FED906BC0000000, float %438
  %444 = select i1 %440, float 1.000000e+00, float %439
  %445 = fcmp oge float %429, 0x3FF921FB60000000
  %446 = fadd float %429, 0xBFF921FB60000000
  %447 = select i1 %445, float %446, float %442
  %448 = select i1 %445, float 1.000000e+00, float %443
  %449 = select i1 %445, float 0x3FED906BC0000000, float %444
  %450 = fcmp oge float %429, 0x3FFF6A7A40000000
  %451 = fadd float %429, 0xBFFF6A7A40000000
  %452 = select i1 %450, float %451, float %447
  %453 = select i1 %450, float 0x3FED906BC0000000, float %448
  %454 = select i1 %450, float 0x3FE6A09E60000000, float %449
  %455 = fcmp oge float %429, 0x4002D97C80000000
  %456 = fadd float %429, 0xC002D97C80000000
  %457 = select i1 %455, float %456, float %452
  %458 = select i1 %455, float 0x3FE6A09E60000000, float %453
  %459 = select i1 %455, float 0x3FD87DE2A0000000, float %454
  %460 = fcmp oge float %429, 0x4005FDBC00000000
  %461 = fadd float %429, 0xC005FDBC00000000
  %462 = select i1 %460, float %461, float %457
  %463 = select i1 %460, float 0x3FD87DE2A0000000, float %458
  %464 = select i1 %460, float 0.000000e+00, float %459
  %465 = fcmp oge float %429, 0x400921FB60000000
  %466 = fadd float %429, 0xC00921FB60000000
  %467 = select i1 %465, float %466, float %462
  %468 = select i1 %465, float 0.000000e+00, float %463
  %469 = select i1 %465, float 0xBFD87DE2A0000000, float %464
  %470 = fcmp oge float %429, 0x400C463AC0000000
  %471 = fadd float %429, 0xC00C463AC0000000
  %472 = select i1 %470, float %471, float %467
  %473 = select i1 %470, float 0xBFD87DE2A0000000, float %468
  %474 = select i1 %470, float 0xBFE6A09E60000000, float %469
  %475 = fcmp oge float %429, 0x400F6A7A40000000
  %476 = fadd float %429, 0xC00F6A7A40000000
  %477 = select i1 %475, float %476, float %472
  %478 = select i1 %475, float 0xBFE6A09E60000000, float %473
  %479 = select i1 %475, float 0xBFED906BC0000000, float %474
  %480 = fcmp oge float %429, 0x4011475CE0000000
  %481 = fadd float %429, 0xC011475CE0000000
  %482 = select i1 %480, float %481, float %477
  %483 = select i1 %480, float 0xBFED906BC0000000, float %478
  %484 = select i1 %480, float -1.000000e+00, float %479
  %485 = fcmp oge float %429, 0x4012D97C80000000
  %486 = fadd float %429, 0xC012D97C80000000
  %487 = select i1 %485, float %486, float %482
  %488 = select i1 %485, float -1.000000e+00, float %483
  %489 = select i1 %485, float 0xBFED906BC0000000, float %484
  %490 = fcmp oge float %429, 0x40146B9C40000000
  %491 = fadd float %429, 0xC0146B9C40000000
  %492 = select i1 %490, float %491, float %487
  %493 = select i1 %490, float 0xBFED906BC0000000, float %488
  %494 = select i1 %490, float 0xBFE6A09E60000000, float %489
  %495 = fcmp oge float %429, 0x4015FDBC00000000
  %496 = fadd float %429, 0xC015FDBC00000000
  %497 = select i1 %495, float %496, float %492
  %498 = select i1 %495, float 0xBFE6A09E60000000, float %493
  %499 = select i1 %495, float 0xBFD87DE2A0000000, float %494
  %500 = fcmp oge float %429, 0x40178FDBA0000000
  %501 = fadd float %429, 0xC0178FDBA0000000
  %502 = select i1 %500, float %501, float %497
  %503 = select i1 %500, float 0xBFD87DE2A0000000, float %498
  %504 = select i1 %500, float 0.000000e+00, float %499
  %505 = fdiv float %502, 0x3FD921FB60000000
  %506 = fsub float %504, %503
  %507 = call float @llvm.fmuladd.f32(float %505, float %506, float %503)
  %508 = call float @llvm.fmuladd.f32(float %507, float 0x3FA47AE140000000, float %83)
  %509 = fmul float %508, 5.000000e-01
  %510 = fcmp olt float %509, 0.000000e+00
  %511 = fadd float %509, 0x401921FB60000000
  %512 = select i1 %510, float %511, float %509
  %513 = fcmp ult float %512, 0x401921FB60000000
  %514 = fadd float %512, 0xC01921FB60000000
  %515 = select i1 %513, float %512, float %514
  %516 = fcmp oge float %515, 0x3FD921FB60000000
  %517 = fadd float %515, 0xBFD921FB60000000
  %518 = select i1 %516, float %517, float %509
  %519 = select i1 %516, float 0x3FD87DE2A0000000, float 0.000000e+00
  %520 = select i1 %516, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %521 = fcmp oge float %515, 0x3FE921FB60000000
  %522 = fadd float %515, 0xBFE921FB60000000
  %523 = select i1 %521, float %522, float %518
  %524 = select i1 %521, float 0x3FE6A09E60000000, float %519
  %525 = select i1 %521, float 0x3FED906BC0000000, float %520
  %526 = fcmp oge float %515, 0x3FF2D97C80000000
  %527 = fadd float %515, 0xBFF2D97C80000000
  %528 = select i1 %526, float %527, float %523
  %529 = select i1 %526, float 0x3FED906BC0000000, float %524
  %530 = select i1 %526, float 1.000000e+00, float %525
  %531 = fcmp oge float %515, 0x3FF921FB60000000
  %532 = fadd float %515, 0xBFF921FB60000000
  %533 = select i1 %531, float %532, float %528
  %534 = select i1 %531, float 1.000000e+00, float %529
  %535 = select i1 %531, float 0x3FED906BC0000000, float %530
  %536 = fcmp oge float %515, 0x3FFF6A7A40000000
  %537 = fadd float %515, 0xBFFF6A7A40000000
  %538 = select i1 %536, float %537, float %533
  %539 = select i1 %536, float 0x3FED906BC0000000, float %534
  %540 = select i1 %536, float 0x3FE6A09E60000000, float %535
  %541 = fcmp oge float %515, 0x4002D97C80000000
  %542 = fadd float %515, 0xC002D97C80000000
  %543 = select i1 %541, float %542, float %538
  %544 = select i1 %541, float 0x3FE6A09E60000000, float %539
  %545 = select i1 %541, float 0x3FD87DE2A0000000, float %540
  %546 = fcmp oge float %515, 0x4005FDBC00000000
  %547 = fadd float %515, 0xC005FDBC00000000
  %548 = select i1 %546, float %547, float %543
  %549 = select i1 %546, float 0x3FD87DE2A0000000, float %544
  %550 = select i1 %546, float 0.000000e+00, float %545
  %551 = fcmp oge float %515, 0x400921FB60000000
  %552 = fadd float %515, 0xC00921FB60000000
  %553 = select i1 %551, float %552, float %548
  %554 = select i1 %551, float 0.000000e+00, float %549
  %555 = select i1 %551, float 0xBFD87DE2A0000000, float %550
  %556 = fcmp oge float %515, 0x400C463AC0000000
  %557 = fadd float %515, 0xC00C463AC0000000
  %558 = select i1 %556, float %557, float %553
  %559 = select i1 %556, float 0xBFD87DE2A0000000, float %554
  %560 = select i1 %556, float 0xBFE6A09E60000000, float %555
  %561 = fcmp oge float %515, 0x400F6A7A40000000
  %562 = fadd float %515, 0xC00F6A7A40000000
  %563 = select i1 %561, float %562, float %558
  %564 = select i1 %561, float 0xBFE6A09E60000000, float %559
  %565 = select i1 %561, float 0xBFED906BC0000000, float %560
  %566 = fcmp oge float %515, 0x4011475CE0000000
  %567 = fadd float %515, 0xC011475CE0000000
  %568 = select i1 %566, float %567, float %563
  %569 = select i1 %566, float 0xBFED906BC0000000, float %564
  %570 = select i1 %566, float -1.000000e+00, float %565
  %571 = fcmp oge float %515, 0x4012D97C80000000
  %572 = fadd float %515, 0xC012D97C80000000
  %573 = select i1 %571, float %572, float %568
  %574 = select i1 %571, float -1.000000e+00, float %569
  %575 = select i1 %571, float 0xBFED906BC0000000, float %570
  %576 = fcmp oge float %515, 0x40146B9C40000000
  %577 = fadd float %515, 0xC0146B9C40000000
  %578 = select i1 %576, float %577, float %573
  %579 = select i1 %576, float 0xBFED906BC0000000, float %574
  %580 = select i1 %576, float 0xBFE6A09E60000000, float %575
  %581 = fcmp oge float %515, 0x4015FDBC00000000
  %582 = fadd float %515, 0xC015FDBC00000000
  %583 = select i1 %581, float %582, float %578
  %584 = select i1 %581, float 0xBFE6A09E60000000, float %579
  %585 = select i1 %581, float 0xBFD87DE2A0000000, float %580
  %586 = fcmp oge float %515, 0x40178FDBA0000000
  %587 = fadd float %515, 0xC0178FDBA0000000
  %588 = select i1 %586, float %587, float %583
  %589 = select i1 %586, float 0xBFD87DE2A0000000, float %584
  %590 = select i1 %586, float 0.000000e+00, float %585
  %591 = fdiv float %588, 0x3FD921FB60000000
  %592 = fsub float %590, %589
  %593 = call float @llvm.fmuladd.f32(float %591, float %592, float %589)
  %594 = fmul float %593, 0x3FF054F4E0000000
  %595 = select i1 %516, float 0x3FED906BC0000000, float 1.000000e+00
  %596 = select i1 %516, float 0x3FE6A09E60000000, float 0x3FED906BC0000000
  %597 = select i1 %521, float 0x3FE6A09E60000000, float %595
  %598 = select i1 %521, float 0x3FD87DE2A0000000, float %596
  %599 = select i1 %526, float 0x3FD87DE2A0000000, float %597
  %600 = select i1 %526, float 0.000000e+00, float %598
  %601 = select i1 %531, float 0.000000e+00, float %599
  %602 = select i1 %531, float 0xBFD87DE2A0000000, float %600
  %603 = select i1 %536, float 0xBFD87DE2A0000000, float %601
  %604 = select i1 %536, float 0xBFE6A09E60000000, float %602
  %605 = select i1 %541, float 0xBFE6A09E60000000, float %603
  %606 = select i1 %541, float 0xBFED906BC0000000, float %604
  %607 = select i1 %546, float 0xBFED906BC0000000, float %605
  %608 = select i1 %546, float -1.000000e+00, float %606
  %609 = select i1 %551, float -1.000000e+00, float %607
  %610 = select i1 %551, float 0xBFED906BC0000000, float %608
  %611 = select i1 %556, float 0xBFED906BC0000000, float %609
  %612 = select i1 %556, float 0xBFE6A09E60000000, float %610
  %613 = select i1 %561, float 0xBFE6A09E60000000, float %611
  %614 = select i1 %561, float 0xBFD87DE2A0000000, float %612
  %615 = select i1 %566, float 0xBFD87DE2A0000000, float %613
  %616 = select i1 %566, float 0.000000e+00, float %614
  %617 = select i1 %571, float 0.000000e+00, float %615
  %618 = select i1 %571, float 0x3FD87DE2A0000000, float %616
  %619 = select i1 %576, float 0x3FD87DE2A0000000, float %617
  %620 = select i1 %576, float 0x3FE6A09E60000000, float %618
  %621 = select i1 %581, float 0x3FE6A09E60000000, float %619
  %622 = select i1 %581, float 0x3FED906BC0000000, float %620
  %623 = select i1 %586, float 0x3FED906BC0000000, float %621
  %624 = select i1 %586, float 1.000000e+00, float %622
  %625 = fsub float %624, %623
  %626 = call float @llvm.fmuladd.f32(float %591, float %625, float %623)
  %627 = fmul float %626, 0x3FEF6809C0000000
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %1)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2)
  store float %594, ptr %1, align 8, !tbaa !5
  store float %627, ptr %2, align 8, !tbaa !5
  %628 = load i64, ptr %1, align 8
  %629 = load i64, ptr %2, align 8
  %630 = icmp eq i64 %629, 0
  %631 = icmp eq i64 %628, 0
  %632 = select i1 %630, i1 %631, i1 false
  %633 = trunc i64 %629 to i32
  %634 = bitcast i32 %633 to float
  %635 = trunc i64 %628 to i32
  %636 = bitcast i32 %635 to float
  br i1 %632, label %673, label %637

637:                                              ; preds = %80
  %638 = and i64 %628, 2147483647
  %639 = and i64 %629, 2147483647
  %640 = icmp samesign ugt i64 %639, %638
  br i1 %640, label %641, label %643

641:                                              ; preds = %637
  %642 = fdiv float %636, %634
  br label %645

643:                                              ; preds = %637
  %644 = fdiv float %634, %636
  br label %645

645:                                              ; preds = %643, %641
  %646 = phi float [ %642, %641 ], [ %644, %643 ]
  %647 = fneg float %646
  %648 = fmul float %646, %647
  %649 = fmul float %646, %648
  %650 = fdiv float %649, 3.000000e+00
  %651 = fmul float %648, %650
  %652 = fdiv float %651, 5.000000e+00
  %653 = fmul float %648, %652
  %654 = fdiv float %653, 7.000000e+00
  %655 = fmul float %648, %654
  %656 = fdiv float %655, 9.000000e+00
  %657 = fadd float %646, %650
  %658 = fadd float %657, %652
  %659 = fadd float %658, %654
  %660 = fadd float %659, %656
  br i1 %640, label %665, label %661

661:                                              ; preds = %645
  %662 = icmp sgt i64 %628, -1
  %663 = select i1 %662, float 0x3FF921FB40000000, float 0xBFF921FB40000000
  %664 = fsub float %663, %660
  br label %673

665:                                              ; preds = %645
  %666 = icmp slt i64 %629, 0
  br i1 %666, label %667, label %673

667:                                              ; preds = %665
  %668 = icmp sgt i64 %628, -1
  br i1 %668, label %669, label %671

669:                                              ; preds = %667
  %670 = fadd float %660, 0x400921FB60000000
  br label %673

671:                                              ; preds = %667
  %672 = fadd float %660, 0xC00921FB60000000
  br label %673

673:                                              ; preds = %80, %661, %665, %669, %671
  %674 = phi float [ 0.000000e+00, %80 ], [ %664, %661 ], [ %670, %669 ], [ %672, %671 ], [ %660, %665 ]
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %1)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2)
  %675 = fmul float %674, 2.000000e+00
  %676 = fcmp olt float %508, 0.000000e+00
  %677 = fadd float %508, 0x401921FB60000000
  %678 = select i1 %676, float %677, float %508
  %679 = fcmp ult float %678, 0x401921FB60000000
  %680 = fadd float %678, 0xC01921FB60000000
  %681 = select i1 %679, float %678, float %680
  %682 = fcmp oge float %681, 0x3FD921FB60000000
  %683 = fadd float %681, 0xBFD921FB60000000
  %684 = select i1 %682, float %683, float %508
  %685 = select i1 %682, float 0x3FED906BC0000000, float 1.000000e+00
  %686 = select i1 %682, float 0x3FE6A09E60000000, float 0x3FED906BC0000000
  %687 = fcmp oge float %681, 0x3FE921FB60000000
  %688 = fadd float %681, 0xBFE921FB60000000
  %689 = select i1 %687, float %688, float %684
  %690 = select i1 %687, float 0x3FE6A09E60000000, float %685
  %691 = select i1 %687, float 0x3FD87DE2A0000000, float %686
  %692 = fcmp oge float %681, 0x3FF2D97C80000000
  %693 = fadd float %681, 0xBFF2D97C80000000
  %694 = select i1 %692, float %693, float %689
  %695 = select i1 %692, float 0x3FD87DE2A0000000, float %690
  %696 = select i1 %692, float 0.000000e+00, float %691
  %697 = fcmp oge float %681, 0x3FF921FB60000000
  %698 = fadd float %681, 0xBFF921FB60000000
  %699 = select i1 %697, float %698, float %694
  %700 = select i1 %697, float 0.000000e+00, float %695
  %701 = select i1 %697, float 0xBFD87DE2A0000000, float %696
  %702 = fcmp oge float %681, 0x3FFF6A7A40000000
  %703 = fadd float %681, 0xBFFF6A7A40000000
  %704 = select i1 %702, float %703, float %699
  %705 = select i1 %702, float 0xBFD87DE2A0000000, float %700
  %706 = select i1 %702, float 0xBFE6A09E60000000, float %701
  %707 = fcmp oge float %681, 0x4002D97C80000000
  %708 = fadd float %681, 0xC002D97C80000000
  %709 = select i1 %707, float %708, float %704
  %710 = select i1 %707, float 0xBFE6A09E60000000, float %705
  %711 = select i1 %707, float 0xBFED906BC0000000, float %706
  %712 = fcmp oge float %681, 0x4005FDBC00000000
  %713 = fadd float %681, 0xC005FDBC00000000
  %714 = select i1 %712, float %713, float %709
  %715 = select i1 %712, float 0xBFED906BC0000000, float %710
  %716 = select i1 %712, float -1.000000e+00, float %711
  %717 = fcmp oge float %681, 0x400921FB60000000
  %718 = fadd float %681, 0xC00921FB60000000
  %719 = select i1 %717, float %718, float %714
  %720 = select i1 %717, float -1.000000e+00, float %715
  %721 = select i1 %717, float 0xBFED906BC0000000, float %716
  %722 = fcmp oge float %681, 0x400C463AC0000000
  %723 = fadd float %681, 0xC00C463AC0000000
  %724 = select i1 %722, float %723, float %719
  %725 = select i1 %722, float 0xBFED906BC0000000, float %720
  %726 = select i1 %722, float 0xBFE6A09E60000000, float %721
  %727 = fcmp oge float %681, 0x400F6A7A40000000
  %728 = fadd float %681, 0xC00F6A7A40000000
  %729 = select i1 %727, float %728, float %724
  %730 = select i1 %727, float 0xBFE6A09E60000000, float %725
  %731 = select i1 %727, float 0xBFD87DE2A0000000, float %726
  %732 = fcmp oge float %681, 0x4011475CE0000000
  %733 = fadd float %681, 0xC011475CE0000000
  %734 = select i1 %732, float %733, float %729
  %735 = select i1 %732, float 0xBFD87DE2A0000000, float %730
  %736 = select i1 %732, float 0.000000e+00, float %731
  %737 = fcmp oge float %681, 0x4012D97C80000000
  %738 = fadd float %681, 0xC012D97C80000000
  %739 = select i1 %737, float %738, float %734
  %740 = select i1 %737, float 0.000000e+00, float %735
  %741 = select i1 %737, float 0x3FD87DE2A0000000, float %736
  %742 = fcmp oge float %681, 0x40146B9C40000000
  %743 = fadd float %681, 0xC0146B9C40000000
  %744 = select i1 %742, float %743, float %739
  %745 = select i1 %742, float 0x3FD87DE2A0000000, float %740
  %746 = select i1 %742, float 0x3FE6A09E60000000, float %741
  %747 = fcmp oge float %681, 0x4015FDBC00000000
  %748 = fadd float %681, 0xC015FDBC00000000
  %749 = select i1 %747, float %748, float %744
  %750 = select i1 %747, float 0x3FE6A09E60000000, float %745
  %751 = select i1 %747, float 0x3FED906BC0000000, float %746
  %752 = fcmp oge float %681, 0x40178FDBA0000000
  %753 = fadd float %681, 0xC0178FDBA0000000
  %754 = select i1 %752, float %753, float %749
  %755 = select i1 %752, float 0x3FED906BC0000000, float %750
  %756 = select i1 %752, float 1.000000e+00, float %751
  %757 = fdiv float %754, 0x3FD921FB60000000
  %758 = fsub float %756, %755
  %759 = call float @llvm.fmuladd.f32(float %757, float %758, float %755)
  %760 = call float @llvm.fmuladd.f32(float %759, float 0xBFA47AE140000000, float 1.000000e+00)
  %761 = fmul float %760, 0x404F3C2900000000
  %762 = fcmp olt float %675, 0.000000e+00
  %763 = fadd float %675, 0x401921FB60000000
  %764 = select i1 %762, float %763, float %675
  %765 = fcmp ult float %764, 0x401921FB60000000
  %766 = fadd float %764, 0xC01921FB60000000
  %767 = select i1 %765, float %764, float %766
  %768 = fcmp oge float %767, 0x3FD921FB60000000
  %769 = fadd float %767, 0xBFD921FB60000000
  %770 = select i1 %768, float %769, float %675
  %771 = select i1 %768, float 0x3FED906BC0000000, float 1.000000e+00
  %772 = select i1 %768, float 0x3FE6A09E60000000, float 0x3FED906BC0000000
  %773 = fcmp oge float %767, 0x3FE921FB60000000
  %774 = fadd float %767, 0xBFE921FB60000000
  %775 = select i1 %773, float %774, float %770
  %776 = select i1 %773, float 0x3FE6A09E60000000, float %771
  %777 = select i1 %773, float 0x3FD87DE2A0000000, float %772
  %778 = fcmp oge float %767, 0x3FF2D97C80000000
  %779 = fadd float %767, 0xBFF2D97C80000000
  %780 = select i1 %778, float %779, float %775
  %781 = select i1 %778, float 0x3FD87DE2A0000000, float %776
  %782 = select i1 %778, float 0.000000e+00, float %777
  %783 = fcmp oge float %767, 0x3FF921FB60000000
  %784 = fadd float %767, 0xBFF921FB60000000
  %785 = select i1 %783, float %784, float %780
  %786 = select i1 %783, float 0.000000e+00, float %781
  %787 = select i1 %783, float 0xBFD87DE2A0000000, float %782
  %788 = fcmp oge float %767, 0x3FFF6A7A40000000
  %789 = fadd float %767, 0xBFFF6A7A40000000
  %790 = select i1 %788, float %789, float %785
  %791 = select i1 %788, float 0xBFD87DE2A0000000, float %786
  %792 = select i1 %788, float 0xBFE6A09E60000000, float %787
  %793 = fcmp oge float %767, 0x4002D97C80000000
  %794 = fadd float %767, 0xC002D97C80000000
  %795 = select i1 %793, float %794, float %790
  %796 = select i1 %793, float 0xBFE6A09E60000000, float %791
  %797 = select i1 %793, float 0xBFED906BC0000000, float %792
  %798 = fcmp oge float %767, 0x4005FDBC00000000
  %799 = fadd float %767, 0xC005FDBC00000000
  %800 = select i1 %798, float %799, float %795
  %801 = select i1 %798, float 0xBFED906BC0000000, float %796
  %802 = select i1 %798, float -1.000000e+00, float %797
  %803 = fcmp oge float %767, 0x400921FB60000000
  %804 = fadd float %767, 0xC00921FB60000000
  %805 = select i1 %803, float %804, float %800
  %806 = select i1 %803, float -1.000000e+00, float %801
  %807 = select i1 %803, float 0xBFED906BC0000000, float %802
  %808 = fcmp oge float %767, 0x400C463AC0000000
  %809 = fadd float %767, 0xC00C463AC0000000
  %810 = select i1 %808, float %809, float %805
  %811 = select i1 %808, float 0xBFED906BC0000000, float %806
  %812 = select i1 %808, float 0xBFE6A09E60000000, float %807
  %813 = fcmp oge float %767, 0x400F6A7A40000000
  %814 = fadd float %767, 0xC00F6A7A40000000
  %815 = select i1 %813, float %814, float %810
  %816 = select i1 %813, float 0xBFE6A09E60000000, float %811
  %817 = select i1 %813, float 0xBFD87DE2A0000000, float %812
  %818 = fcmp oge float %767, 0x4011475CE0000000
  %819 = fadd float %767, 0xC011475CE0000000
  %820 = select i1 %818, float %819, float %815
  %821 = select i1 %818, float 0xBFD87DE2A0000000, float %816
  %822 = select i1 %818, float 0.000000e+00, float %817
  %823 = fcmp oge float %767, 0x4012D97C80000000
  %824 = fadd float %767, 0xC012D97C80000000
  %825 = select i1 %823, float %824, float %820
  %826 = select i1 %823, float 0.000000e+00, float %821
  %827 = select i1 %823, float 0x3FD87DE2A0000000, float %822
  %828 = fcmp oge float %767, 0x40146B9C40000000
  %829 = fadd float %767, 0xC0146B9C40000000
  %830 = select i1 %828, float %829, float %825
  %831 = select i1 %828, float 0x3FD87DE2A0000000, float %826
  %832 = select i1 %828, float 0x3FE6A09E60000000, float %827
  %833 = fcmp oge float %767, 0x4015FDBC00000000
  %834 = fadd float %767, 0xC015FDBC00000000
  %835 = select i1 %833, float %834, float %830
  %836 = select i1 %833, float 0x3FE6A09E60000000, float %831
  %837 = select i1 %833, float 0x3FED906BC0000000, float %832
  %838 = fcmp oge float %767, 0x40178FDBA0000000
  %839 = fadd float %767, 0xC0178FDBA0000000
  %840 = select i1 %838, float %839, float %835
  %841 = select i1 %838, float 0x3FED906BC0000000, float %836
  %842 = select i1 %838, float 1.000000e+00, float %837
  %843 = fdiv float %840, 0x3FD921FB60000000
  %844 = fsub float %842, %841
  %845 = call float @llvm.fmuladd.f32(float %843, float %844, float %841)
  %846 = select i1 %768, float 0x3FD87DE2A0000000, float 0.000000e+00
  %847 = select i1 %768, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %848 = select i1 %773, float 0x3FE6A09E60000000, float %846
  %849 = select i1 %773, float 0x3FED906BC0000000, float %847
  %850 = select i1 %778, float 0x3FED906BC0000000, float %848
  %851 = select i1 %778, float 1.000000e+00, float %849
  %852 = select i1 %783, float 1.000000e+00, float %850
  %853 = select i1 %783, float 0x3FED906BC0000000, float %851
  %854 = select i1 %788, float 0x3FED906BC0000000, float %852
  %855 = select i1 %788, float 0x3FE6A09E60000000, float %853
  %856 = select i1 %793, float 0x3FE6A09E60000000, float %854
  %857 = select i1 %793, float 0x3FD87DE2A0000000, float %855
  %858 = select i1 %798, float 0x3FD87DE2A0000000, float %856
  %859 = select i1 %798, float 0.000000e+00, float %857
  %860 = select i1 %803, float 0.000000e+00, float %858
  %861 = select i1 %803, float 0xBFD87DE2A0000000, float %859
  %862 = select i1 %808, float 0xBFD87DE2A0000000, float %860
  %863 = select i1 %808, float 0xBFE6A09E60000000, float %861
  %864 = select i1 %813, float 0xBFE6A09E60000000, float %862
  %865 = select i1 %813, float 0xBFED906BC0000000, float %863
  %866 = select i1 %818, float 0xBFED906BC0000000, float %864
  %867 = select i1 %818, float -1.000000e+00, float %865
  %868 = select i1 %823, float -1.000000e+00, float %866
  %869 = select i1 %823, float 0xBFED906BC0000000, float %867
  %870 = select i1 %828, float 0xBFED906BC0000000, float %868
  %871 = select i1 %828, float 0xBFE6A09E60000000, float %869
  %872 = select i1 %833, float 0xBFE6A09E60000000, float %870
  %873 = select i1 %833, float 0xBFD87DE2A0000000, float %871
  %874 = select i1 %838, float 0xBFD87DE2A0000000, float %872
  %875 = select i1 %838, float 0.000000e+00, float %873
  %876 = fsub float %875, %874
  %877 = call float @llvm.fmuladd.f32(float %843, float %876, float %874)
  %878 = load volatile float, ptr %4, align 4, !tbaa !5
  %879 = fneg float %878
  %880 = call float @llvm.fmuladd.f32(float %761, float %845, float %879)
  store volatile float %880, ptr %3, align 4, !tbaa !5
  %881 = load volatile float, ptr %72, align 4, !tbaa !5
  %882 = fneg float %881
  %883 = call float @llvm.fmuladd.f32(float %761, float %877, float %882)
  store volatile float %883, ptr %73, align 4, !tbaa !5
  %884 = load volatile float, ptr %74, align 4, !tbaa !5
  %885 = fsub float 0.000000e+00, %884
  store volatile float %885, ptr %75, align 4, !tbaa !5
  %886 = fmul float %883, %883
  %887 = call float @llvm.fmuladd.f32(float %880, float %880, float %886)
  %888 = call float @llvm.fmuladd.f32(float %885, float %885, float %887)
  %889 = fcmp ugt float %888, 0.000000e+00
  br i1 %889, label %890, label %901

890:                                              ; preds = %673
  %891 = fmul float %888, 5.000000e-01
  %892 = bitcast float %888 to i32
  %893 = ashr i32 %892, 1
  %894 = sub nsw i32 1597463007, %893
  %895 = bitcast i32 %894 to float
  %896 = fneg float %895
  %897 = fmul float %891, %896
  %898 = call float @llvm.fmuladd.f32(float %897, float %895, float 1.500000e+00)
  %899 = fmul float %898, %895
  %900 = fdiv float 1.000000e+00, %899
  br label %901

901:                                              ; preds = %673, %890
  %902 = phi float [ %900, %890 ], [ 0.000000e+00, %673 ]
  %903 = load volatile float, ptr %3, align 4, !tbaa !5
  %904 = fdiv float %903, %902
  store volatile float %904, ptr %3, align 4, !tbaa !5
  %905 = load volatile float, ptr %73, align 4, !tbaa !5
  %906 = fdiv float %905, %902
  store volatile float %906, ptr %73, align 4, !tbaa !5
  %907 = load volatile float, ptr %75, align 4, !tbaa !5
  %908 = fdiv float %907, %902
  store volatile float %908, ptr %75, align 4, !tbaa !5
  %909 = load volatile float, ptr %5, align 4, !tbaa !5
  %910 = load volatile float, ptr %3, align 4, !tbaa !5
  %911 = load volatile float, ptr %43, align 4, !tbaa !5
  %912 = load volatile float, ptr %73, align 4, !tbaa !5
  %913 = fmul float %911, %912
  %914 = call float @llvm.fmuladd.f32(float %909, float %910, float %913)
  %915 = load volatile float, ptr %48, align 4, !tbaa !5
  %916 = load volatile float, ptr %75, align 4, !tbaa !5
  %917 = call float @llvm.fmuladd.f32(float %915, float %916, float %914)
  %918 = fadd float %917, 1.000000e+00
  %919 = fmul float %67, %918
  %920 = fmul float %77, %917
  %921 = load volatile float, ptr %3, align 4, !tbaa !5
  %922 = load volatile float, ptr %5, align 4, !tbaa !5
  %923 = call float @llvm.fmuladd.f32(float %920, float %922, float %921)
  %924 = load volatile float, ptr %5, align 4, !tbaa !5
  %925 = fadd float %923, %924
  %926 = fdiv float %925, %919
  store volatile float %926, ptr %6, align 4, !tbaa !5
  %927 = load volatile float, ptr %73, align 4, !tbaa !5
  %928 = load volatile float, ptr %43, align 4, !tbaa !5
  %929 = call float @llvm.fmuladd.f32(float %920, float %928, float %927)
  %930 = load volatile float, ptr %43, align 4, !tbaa !5
  %931 = fadd float %929, %930
  %932 = fdiv float %931, %919
  store volatile float %932, ptr %78, align 4, !tbaa !5
  %933 = load volatile float, ptr %75, align 4, !tbaa !5
  %934 = load volatile float, ptr %48, align 4, !tbaa !5
  %935 = call float @llvm.fmuladd.f32(float %920, float %934, float %933)
  %936 = load volatile float, ptr %48, align 4, !tbaa !5
  %937 = fadd float %935, %936
  %938 = fdiv float %937, %919
  store volatile float %938, ptr %79, align 4, !tbaa !5
  %939 = load volatile float, ptr %6, align 4, !tbaa !5
  %940 = load volatile float, ptr %6, align 4, !tbaa !5
  %941 = load volatile float, ptr %78, align 4, !tbaa !5
  %942 = load volatile float, ptr %78, align 4, !tbaa !5
  %943 = fmul float %941, %942
  %944 = call float @llvm.fmuladd.f32(float %939, float %940, float %943)
  %945 = load volatile float, ptr %79, align 4, !tbaa !5
  %946 = load volatile float, ptr %79, align 4, !tbaa !5
  %947 = call float @llvm.fmuladd.f32(float %945, float %946, float %944)
  %948 = fcmp ugt float %947, 0.000000e+00
  br i1 %948, label %949, label %960

949:                                              ; preds = %901
  %950 = fmul float %947, 5.000000e-01
  %951 = bitcast float %947 to i32
  %952 = ashr i32 %951, 1
  %953 = sub nsw i32 1597463007, %952
  %954 = bitcast i32 %953 to float
  %955 = fneg float %954
  %956 = fmul float %950, %955
  %957 = call float @llvm.fmuladd.f32(float %956, float %954, float 1.500000e+00)
  %958 = fmul float %957, %954
  %959 = fdiv float 1.000000e+00, %958
  br label %960

960:                                              ; preds = %901, %949
  %961 = phi float [ %959, %949 ], [ 0.000000e+00, %901 ]
  %962 = load volatile float, ptr %6, align 4, !tbaa !5
  %963 = fdiv float %962, %961
  store volatile float %963, ptr %6, align 4, !tbaa !5
  %964 = load volatile float, ptr %78, align 4, !tbaa !5
  %965 = fdiv float %964, %961
  store volatile float %965, ptr %78, align 4, !tbaa !5
  %966 = load volatile float, ptr %79, align 4, !tbaa !5
  %967 = fdiv float %966, %961
  store volatile float %967, ptr %79, align 4, !tbaa !5
  %968 = fdiv float %902, 0x41B1DE7840000000
  %969 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #3
  %970 = icmp eq ptr %969, null
  br i1 %970, label %971, label %80, !llvm.loop !15

971:                                              ; preds = %960, %65
  %972 = phi float [ undef, %65 ], [ %902, %960 ]
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %7) #3
  %973 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %7, i32 noundef 0, i32 noundef 3) #3
  %974 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #3
  %975 = icmp eq ptr %974, null
  br i1 %975, label %987, label %976

976:                                              ; preds = %971, %976
  %977 = phi ptr [ %985, %976 ], [ %974, %971 ]
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %9) #3
  %978 = load i64, ptr %977, align 8, !tbaa !9
  %979 = getelementptr inbounds [3 x float], ptr %4, i64 0, i64 %978
  %980 = load volatile float, ptr %979, align 4, !tbaa !5
  %981 = getelementptr inbounds [3 x float], ptr %6, i64 0, i64 %978
  %982 = load volatile float, ptr %981, align 4, !tbaa !5
  %983 = call float @llvm.fmuladd.f32(float %972, float %982, float %980)
  store float %983, ptr %9, align 4, !tbaa !5
  %984 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %11, ptr noundef nonnull %977, ptr noundef nonnull %9, i64 noundef 0) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %9) #3
  %985 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #3
  %986 = icmp eq ptr %985, null
  br i1 %986, label %987, label %976, !llvm.loop !16

987:                                              ; preds = %976, %971
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %7) #3
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %7) #3
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %6) #3
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %5) #3
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %4) #3
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %3) #3
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
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 3047ef595b8b4944540de771dcf86dc85a97ef76)"}
!3 = !{i64 2147511515}
!4 = !{i64 2147512027}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !12, !13}
!15 = distinct !{!15, !12, !13}
!16 = distinct !{!16, !12, !13}
