; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca [3 x float], align 4
  %2 = alloca [3 x float], align 4
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca float, align 4
  %9 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #4, !srcloc !3
  %10 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 2, i32 0, i32 0, i32 0) #4, !srcloc !4
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %1) #4
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %2) #4
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3) #4
  store i64 0, ptr %3, align 8, !tbaa !5
  br label %28

11:                                               ; preds = %28
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #4
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %4) #4
  store i64 3, ptr %4, align 8, !tbaa !5
  %12 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %9, ptr noundef nonnull %4) #4
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4) #4
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %4) #4
  store i64 4, ptr %4, align 8, !tbaa !5
  %13 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %9, ptr noundef nonnull %4) #4
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4) #4
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %4) #4
  store i64 5, ptr %4, align 8, !tbaa !5
  %14 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %9, ptr noundef nonnull %4) #4
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4) #4
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %5) #4
  store i64 6, ptr %5, align 8, !tbaa !5
  %15 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %9, ptr noundef nonnull %5) #4
  %16 = load float, ptr %15, align 4, !tbaa !9
  store i64 7, ptr %5, align 8, !tbaa !5
  %17 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %9, ptr noundef nonnull %5) #4
  %18 = load float, ptr %17, align 4, !tbaa !9
  store i64 8, ptr %5, align 8, !tbaa !5
  %19 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %9, ptr noundef nonnull %5) #4
  %20 = load float, ptr %19, align 4, !tbaa !9
  store i64 9, ptr %5, align 8, !tbaa !5
  %21 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %9, ptr noundef nonnull %5) #4
  %22 = load float, ptr %21, align 4, !tbaa !9
  %23 = fmul float %16, %22
  %24 = fneg float %20
  %25 = getelementptr inbounds nuw i8, ptr %1, i64 4
  %26 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %27 = getelementptr inbounds nuw i8, ptr %2, i64 4
  br label %37

28:                                               ; preds = %0, %28
  %29 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %9, ptr noundef nonnull %3) #4
  %30 = load float, ptr %29, align 4, !tbaa !9
  %31 = load i64, ptr %3, align 8, !tbaa !5
  %32 = getelementptr inbounds [3 x float], ptr %1, i64 0, i64 %31
  store float %30, ptr %32, align 4, !tbaa !9
  %33 = add nsw i64 %31, 1
  store i64 %33, ptr %3, align 8, !tbaa !5
  %34 = icmp slt i64 %31, 2
  br i1 %34, label %28, label %11, !llvm.loop !11

35:                                               ; preds = %851
  %36 = getelementptr inbounds nuw i8, ptr %2, i64 8
  store float 0x7FF8000000000000, ptr %27, align 4
  store float 0x7FF8000000000000, ptr %36, align 4
  store float 0x7FF8000000000000, ptr %2, align 4
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %7) #4
  store i64 0, ptr %7, align 8, !tbaa !5
  br label %952

37:                                               ; preds = %11, %851
  %38 = phi i64 [ 0, %11 ], [ %858, %851 ]
  br label %645

39:                                               ; preds = %848, %71
  %40 = phi i64 [ 0, %848 ], [ %76, %71 ]
  %41 = phi float [ 0.000000e+00, %848 ], [ %75, %71 ]
  switch i64 %40, label %42 [
    i64 0, label %61
    i64 1, label %51
  ]

42:                                               ; preds = %39, %42
  %43 = phi i64 [ %46, %42 ], [ 0, %39 ]
  %44 = phi float [ %45, %42 ], [ 1.000000e+00, %39 ]
  %45 = fneg float %44
  %46 = add nuw nsw i64 %43, 1
  %47 = icmp samesign ult i64 %46, %40
  br i1 %47, label %42, label %48, !llvm.loop !13

48:                                               ; preds = %42
  %49 = shl nuw nsw i64 %40, 1
  %50 = or disjoint i64 %49, 1
  br label %51

51:                                               ; preds = %48, %39
  %52 = phi i64 [ %50, %48 ], [ 3, %39 ]
  %53 = phi float [ %45, %48 ], [ -1.000000e+00, %39 ]
  %54 = call i64 @llvm.abs.i64(i64 range(i64 -9223372036854775808, 20) %52, i1 true)
  br label %55

55:                                               ; preds = %51, %55
  %56 = phi i64 [ 0, %51 ], [ %59, %55 ]
  %57 = phi float [ 1.000000e+00, %51 ], [ %58, %55 ]
  %58 = fmul float %850, %57
  %59 = add nuw nsw i64 %56, 1
  %60 = icmp samesign ult i64 %59, %54
  br i1 %60, label %55, label %61, !llvm.loop !13

61:                                               ; preds = %55, %39
  %62 = phi i64 [ 1, %39 ], [ %52, %55 ]
  %63 = phi float [ 1.000000e+00, %39 ], [ %53, %55 ]
  %64 = phi float [ %850, %39 ], [ %58, %55 ]
  br label %65

65:                                               ; preds = %61, %65
  %66 = phi i64 [ 1, %61 ], [ %69, %65 ]
  %67 = phi i64 [ 1, %61 ], [ %68, %65 ]
  %68 = mul nuw nsw i64 %66, %67
  %69 = add nuw nsw i64 %66, 1
  %70 = icmp ult i64 %66, %62
  br i1 %70, label %65, label %71, !llvm.loop !14

71:                                               ; preds = %65
  %72 = fmul float %63, %64
  %73 = uitofp nneg i64 %68 to float
  %74 = fdiv float %72, %73
  %75 = fadd float %41, %74
  %76 = add nuw nsw i64 %40, 1
  %77 = icmp eq i64 %76, 10
  br i1 %77, label %78, label %39, !llvm.loop !15

78:                                               ; preds = %71, %78
  %79 = phi i64 [ %82, %78 ], [ 0, %71 ]
  %80 = phi float [ %81, %78 ], [ 1.000000e+00, %71 ]
  %81 = fmul float %850, %80
  %82 = add nuw nsw i64 %79, 1
  %83 = icmp eq i64 %79, 0
  br i1 %83, label %78, label %84, !llvm.loop !13

84:                                               ; preds = %78
  %85 = fneg float %81
  br label %86

86:                                               ; preds = %86, %84
  %87 = phi i64 [ %90, %86 ], [ 1, %84 ]
  %88 = phi i64 [ %89, %86 ], [ 1, %84 ]
  %89 = mul nuw nsw i64 %87, %88
  %90 = add nuw nsw i64 %87, 1
  %91 = icmp samesign ult i64 %87, 2
  br i1 %91, label %86, label %92, !llvm.loop !14

92:                                               ; preds = %86
  %93 = uitofp nneg i64 %89 to float
  %94 = fdiv float %85, %93
  %95 = fadd float %94, 1.000000e+00
  br label %96

96:                                               ; preds = %96, %92
  %97 = phi i64 [ %100, %96 ], [ 0, %92 ]
  %98 = phi float [ %99, %96 ], [ 1.000000e+00, %92 ]
  %99 = fneg float %98
  %100 = add nuw nsw i64 %97, 1
  %101 = icmp eq i64 %97, 0
  br i1 %101, label %96, label %102, !llvm.loop !13

102:                                              ; preds = %96, %102
  %103 = phi i64 [ %106, %102 ], [ 0, %96 ]
  %104 = phi float [ %105, %102 ], [ 1.000000e+00, %96 ]
  %105 = fmul float %850, %104
  %106 = add nuw nsw i64 %103, 1
  %107 = icmp samesign ult i64 %103, 3
  br i1 %107, label %102, label %108, !llvm.loop !13

108:                                              ; preds = %102
  %109 = fmul float %99, %105
  br label %110

110:                                              ; preds = %110, %108
  %111 = phi i64 [ %114, %110 ], [ 1, %108 ]
  %112 = phi i64 [ %113, %110 ], [ 1, %108 ]
  %113 = mul nuw nsw i64 %111, %112
  %114 = add nuw nsw i64 %111, 1
  %115 = icmp samesign ult i64 %111, 4
  br i1 %115, label %110, label %116, !llvm.loop !14

116:                                              ; preds = %110
  %117 = uitofp nneg i64 %113 to float
  %118 = fdiv float %109, %117
  %119 = fadd float %95, %118
  br label %120

120:                                              ; preds = %120, %116
  %121 = phi i64 [ %124, %120 ], [ 0, %116 ]
  %122 = phi float [ %123, %120 ], [ 1.000000e+00, %116 ]
  %123 = fneg float %122
  %124 = add nuw nsw i64 %121, 1
  %125 = icmp samesign ult i64 %121, 2
  br i1 %125, label %120, label %126, !llvm.loop !13

126:                                              ; preds = %120, %126
  %127 = phi i64 [ %130, %126 ], [ 0, %120 ]
  %128 = phi float [ %129, %126 ], [ 1.000000e+00, %120 ]
  %129 = fmul float %850, %128
  %130 = add nuw nsw i64 %127, 1
  %131 = icmp samesign ult i64 %127, 5
  br i1 %131, label %126, label %132, !llvm.loop !13

132:                                              ; preds = %126
  %133 = fmul float %123, %129
  br label %134

134:                                              ; preds = %134, %132
  %135 = phi i64 [ %138, %134 ], [ 1, %132 ]
  %136 = phi i64 [ %137, %134 ], [ 1, %132 ]
  %137 = mul nuw nsw i64 %135, %136
  %138 = add nuw nsw i64 %135, 1
  %139 = icmp samesign ult i64 %135, 6
  br i1 %139, label %134, label %140, !llvm.loop !14

140:                                              ; preds = %134
  %141 = uitofp nneg i64 %137 to float
  %142 = fdiv float %133, %141
  %143 = fadd float %119, %142
  br label %144

144:                                              ; preds = %144, %140
  %145 = phi i64 [ %148, %144 ], [ 0, %140 ]
  %146 = phi float [ %147, %144 ], [ 1.000000e+00, %140 ]
  %147 = fneg float %146
  %148 = add nuw nsw i64 %145, 1
  %149 = icmp samesign ult i64 %145, 3
  br i1 %149, label %144, label %150, !llvm.loop !13

150:                                              ; preds = %144, %150
  %151 = phi i64 [ %154, %150 ], [ 0, %144 ]
  %152 = phi float [ %153, %150 ], [ 1.000000e+00, %144 ]
  %153 = fmul float %850, %152
  %154 = add nuw nsw i64 %151, 1
  %155 = icmp samesign ult i64 %151, 7
  br i1 %155, label %150, label %156, !llvm.loop !13

156:                                              ; preds = %150
  %157 = fmul float %147, %153
  br label %158

158:                                              ; preds = %158, %156
  %159 = phi i64 [ %162, %158 ], [ 1, %156 ]
  %160 = phi i64 [ %161, %158 ], [ 1, %156 ]
  %161 = mul nuw nsw i64 %159, %160
  %162 = add nuw nsw i64 %159, 1
  %163 = icmp samesign ult i64 %159, 8
  br i1 %163, label %158, label %164, !llvm.loop !14

164:                                              ; preds = %158
  %165 = uitofp nneg i64 %161 to float
  %166 = fdiv float %157, %165
  %167 = fadd float %143, %166
  br label %168

168:                                              ; preds = %168, %164
  %169 = phi i64 [ %172, %168 ], [ 0, %164 ]
  %170 = phi float [ %171, %168 ], [ 1.000000e+00, %164 ]
  %171 = fneg float %170
  %172 = add nuw nsw i64 %169, 1
  %173 = icmp samesign ult i64 %169, 4
  br i1 %173, label %168, label %174, !llvm.loop !13

174:                                              ; preds = %168, %174
  %175 = phi i64 [ %178, %174 ], [ 0, %168 ]
  %176 = phi float [ %177, %174 ], [ 1.000000e+00, %168 ]
  %177 = fmul float %850, %176
  %178 = add nuw nsw i64 %175, 1
  %179 = icmp samesign ult i64 %175, 9
  br i1 %179, label %174, label %180, !llvm.loop !13

180:                                              ; preds = %174
  %181 = fmul float %171, %177
  br label %182

182:                                              ; preds = %182, %180
  %183 = phi i64 [ %186, %182 ], [ 1, %180 ]
  %184 = phi i64 [ %185, %182 ], [ 1, %180 ]
  %185 = mul nuw nsw i64 %183, %184
  %186 = add nuw nsw i64 %183, 1
  %187 = icmp samesign ult i64 %183, 10
  br i1 %187, label %182, label %188, !llvm.loop !14

188:                                              ; preds = %182
  %189 = uitofp nneg i64 %185 to float
  %190 = fdiv float %181, %189
  %191 = fadd float %167, %190
  br label %192

192:                                              ; preds = %192, %188
  %193 = phi i64 [ %196, %192 ], [ 0, %188 ]
  %194 = phi float [ %195, %192 ], [ 1.000000e+00, %188 ]
  %195 = fneg float %194
  %196 = add nuw nsw i64 %193, 1
  %197 = icmp samesign ult i64 %193, 5
  br i1 %197, label %192, label %198, !llvm.loop !13

198:                                              ; preds = %192, %198
  %199 = phi i64 [ %202, %198 ], [ 0, %192 ]
  %200 = phi float [ %201, %198 ], [ 1.000000e+00, %192 ]
  %201 = fmul float %850, %200
  %202 = add nuw nsw i64 %199, 1
  %203 = icmp samesign ult i64 %199, 11
  br i1 %203, label %198, label %204, !llvm.loop !13

204:                                              ; preds = %198
  %205 = fmul float %195, %201
  br label %206

206:                                              ; preds = %206, %204
  %207 = phi i64 [ %210, %206 ], [ 1, %204 ]
  %208 = phi i64 [ %209, %206 ], [ 1, %204 ]
  %209 = mul nuw nsw i64 %207, %208
  %210 = add nuw nsw i64 %207, 1
  %211 = icmp samesign ult i64 %207, 12
  br i1 %211, label %206, label %212, !llvm.loop !14

212:                                              ; preds = %206
  %213 = uitofp nneg i64 %209 to float
  %214 = fdiv float %205, %213
  %215 = fadd float %191, %214
  br label %216

216:                                              ; preds = %216, %212
  %217 = phi i64 [ %220, %216 ], [ 0, %212 ]
  %218 = phi float [ %219, %216 ], [ 1.000000e+00, %212 ]
  %219 = fneg float %218
  %220 = add nuw nsw i64 %217, 1
  %221 = icmp samesign ult i64 %217, 6
  br i1 %221, label %216, label %222, !llvm.loop !13

222:                                              ; preds = %216, %222
  %223 = phi i64 [ %226, %222 ], [ 0, %216 ]
  %224 = phi float [ %225, %222 ], [ 1.000000e+00, %216 ]
  %225 = fmul float %850, %224
  %226 = add nuw nsw i64 %223, 1
  %227 = icmp samesign ult i64 %223, 13
  br i1 %227, label %222, label %228, !llvm.loop !13

228:                                              ; preds = %222
  %229 = fmul float %219, %225
  br label %230

230:                                              ; preds = %230, %228
  %231 = phi i64 [ %234, %230 ], [ 1, %228 ]
  %232 = phi i64 [ %233, %230 ], [ 1, %228 ]
  %233 = mul nuw nsw i64 %231, %232
  %234 = add nuw nsw i64 %231, 1
  %235 = icmp samesign ult i64 %231, 14
  br i1 %235, label %230, label %236, !llvm.loop !14

236:                                              ; preds = %230
  %237 = uitofp nneg i64 %233 to float
  %238 = fdiv float %229, %237
  %239 = fadd float %215, %238
  br label %240

240:                                              ; preds = %240, %236
  %241 = phi i64 [ %244, %240 ], [ 0, %236 ]
  %242 = phi float [ %243, %240 ], [ 1.000000e+00, %236 ]
  %243 = fneg float %242
  %244 = add nuw nsw i64 %241, 1
  %245 = icmp samesign ult i64 %241, 7
  br i1 %245, label %240, label %246, !llvm.loop !13

246:                                              ; preds = %240, %246
  %247 = phi i64 [ %250, %246 ], [ 0, %240 ]
  %248 = phi float [ %249, %246 ], [ 1.000000e+00, %240 ]
  %249 = fmul float %850, %248
  %250 = add nuw nsw i64 %247, 1
  %251 = icmp samesign ult i64 %247, 15
  br i1 %251, label %246, label %252, !llvm.loop !13

252:                                              ; preds = %246
  %253 = fmul float %243, %249
  br label %254

254:                                              ; preds = %254, %252
  %255 = phi i64 [ %258, %254 ], [ 1, %252 ]
  %256 = phi i64 [ %257, %254 ], [ 1, %252 ]
  %257 = mul nuw nsw i64 %255, %256
  %258 = add nuw nsw i64 %255, 1
  %259 = icmp samesign ult i64 %255, 16
  br i1 %259, label %254, label %260, !llvm.loop !14

260:                                              ; preds = %254
  %261 = uitofp nneg i64 %257 to float
  %262 = fdiv float %253, %261
  %263 = fadd float %239, %262
  br label %264

264:                                              ; preds = %264, %260
  %265 = phi i64 [ %268, %264 ], [ 0, %260 ]
  %266 = phi float [ %267, %264 ], [ 1.000000e+00, %260 ]
  %267 = fneg float %266
  %268 = add nuw nsw i64 %265, 1
  %269 = icmp samesign ult i64 %265, 8
  br i1 %269, label %264, label %270, !llvm.loop !13

270:                                              ; preds = %264, %270
  %271 = phi i64 [ %274, %270 ], [ 0, %264 ]
  %272 = phi float [ %273, %270 ], [ 1.000000e+00, %264 ]
  %273 = fmul float %850, %272
  %274 = add nuw nsw i64 %271, 1
  %275 = icmp samesign ult i64 %271, 17
  br i1 %275, label %270, label %276, !llvm.loop !13

276:                                              ; preds = %270
  %277 = fmul float %267, %273
  br label %278

278:                                              ; preds = %278, %276
  %279 = phi i64 [ %282, %278 ], [ 1, %276 ]
  %280 = phi i64 [ %281, %278 ], [ 1, %276 ]
  %281 = mul nuw nsw i64 %279, %280
  %282 = add nuw nsw i64 %279, 1
  %283 = icmp samesign ult i64 %279, 18
  br i1 %283, label %278, label %284, !llvm.loop !14

284:                                              ; preds = %278
  %285 = uitofp nneg i64 %281 to float
  %286 = fdiv float %277, %285
  %287 = fadd float %263, %286
  %288 = fmul float %75, 0.000000e+00
  %289 = fmul float %287, 0.000000e+00
  %290 = fcmp olt float %289, 0.000000e+00
  %291 = fcmp oeq float %289, 0.000000e+00
  %292 = fcmp oeq float %288, 0.000000e+00
  %293 = and i1 %292, %291
  br i1 %293, label %430, label %294

294:                                              ; preds = %284
  %295 = fneg float %289
  %296 = select i1 %290, float %295, float %289
  %297 = fcmp olt float %288, 0.000000e+00
  %298 = fneg float %288
  %299 = select i1 %297, float %298, float %288
  %300 = fcmp ogt float %296, %299
  br i1 %300, label %301, label %366

301:                                              ; preds = %294
  %302 = fdiv float %288, %289
  %303 = fneg float %302
  %304 = fmul float %302, %303
  %305 = fmul float %304, %302
  %306 = fdiv float %305, 3.000000e+00
  %307 = fadd float %302, %306
  %308 = fmul float %304, %305
  %309 = fdiv float %308, 5.000000e+00
  %310 = fadd float %307, %309
  %311 = fmul float %304, %308
  %312 = fdiv float %311, 7.000000e+00
  %313 = fadd float %310, %312
  %314 = fmul float %304, %311
  %315 = fdiv float %314, 9.000000e+00
  %316 = fadd float %313, %315
  %317 = fmul float %304, %314
  %318 = fdiv float %317, 1.100000e+01
  %319 = fadd float %316, %318
  %320 = fmul float %304, %317
  %321 = fdiv float %320, 1.300000e+01
  %322 = fadd float %319, %321
  %323 = fmul float %304, %320
  %324 = fdiv float %323, 1.500000e+01
  %325 = fadd float %322, %324
  %326 = fmul float %304, %323
  %327 = fdiv float %326, 1.700000e+01
  %328 = fadd float %325, %327
  %329 = fmul float %304, %326
  %330 = fdiv float %329, 1.900000e+01
  %331 = fadd float %328, %330
  %332 = fmul float %304, %329
  %333 = fdiv float %332, 2.100000e+01
  %334 = fadd float %331, %333
  %335 = fmul float %304, %332
  %336 = fdiv float %335, 2.300000e+01
  %337 = fadd float %334, %336
  %338 = fmul float %304, %335
  %339 = fdiv float %338, 2.500000e+01
  %340 = fadd float %337, %339
  %341 = fmul float %304, %338
  %342 = fdiv float %341, 2.700000e+01
  %343 = fadd float %340, %342
  %344 = fmul float %304, %341
  %345 = fdiv float %344, 2.900000e+01
  %346 = fadd float %343, %345
  %347 = fmul float %304, %344
  %348 = fdiv float %347, 3.100000e+01
  %349 = fadd float %346, %348
  %350 = fmul float %304, %347
  %351 = fdiv float %350, 3.300000e+01
  %352 = fadd float %349, %351
  %353 = fmul float %304, %350
  %354 = fdiv float %353, 3.500000e+01
  %355 = fadd float %352, %354
  %356 = fmul float %304, %353
  %357 = fdiv float %356, 3.700000e+01
  %358 = fadd float %355, %357
  %359 = fmul float %304, %356
  %360 = fdiv float %359, 3.900000e+01
  %361 = fadd float %358, %360
  br i1 %290, label %362, label %430

362:                                              ; preds = %301
  %363 = fcmp oge float %288, 0.000000e+00
  %364 = select i1 %363, float 0x400921FB60000000, float 0xC00921FB60000000
  %365 = fadd float %364, %361
  br label %430

366:                                              ; preds = %294
  %367 = fdiv float %289, %288
  %368 = fneg float %367
  %369 = fmul float %367, %368
  %370 = fmul float %369, %367
  %371 = fdiv float %370, 3.000000e+00
  %372 = fadd float %367, %371
  %373 = fmul float %369, %370
  %374 = fdiv float %373, 5.000000e+00
  %375 = fadd float %372, %374
  %376 = fmul float %369, %373
  %377 = fdiv float %376, 7.000000e+00
  %378 = fadd float %375, %377
  %379 = fmul float %369, %376
  %380 = fdiv float %379, 9.000000e+00
  %381 = fadd float %378, %380
  %382 = fmul float %369, %379
  %383 = fdiv float %382, 1.100000e+01
  %384 = fadd float %381, %383
  %385 = fmul float %369, %382
  %386 = fdiv float %385, 1.300000e+01
  %387 = fadd float %384, %386
  %388 = fmul float %369, %385
  %389 = fdiv float %388, 1.500000e+01
  %390 = fadd float %387, %389
  %391 = fmul float %369, %388
  %392 = fdiv float %391, 1.700000e+01
  %393 = fadd float %390, %392
  %394 = fmul float %369, %391
  %395 = fdiv float %394, 1.900000e+01
  %396 = fadd float %393, %395
  %397 = fmul float %369, %394
  %398 = fdiv float %397, 2.100000e+01
  %399 = fadd float %396, %398
  %400 = fmul float %369, %397
  %401 = fdiv float %400, 2.300000e+01
  %402 = fadd float %399, %401
  %403 = fmul float %369, %400
  %404 = fdiv float %403, 2.500000e+01
  %405 = fadd float %402, %404
  %406 = fmul float %369, %403
  %407 = fdiv float %406, 2.700000e+01
  %408 = fadd float %405, %407
  %409 = fmul float %369, %406
  %410 = fdiv float %409, 2.900000e+01
  %411 = fadd float %408, %410
  %412 = fmul float %369, %409
  %413 = fdiv float %412, 3.100000e+01
  %414 = fadd float %411, %413
  %415 = fmul float %369, %412
  %416 = fdiv float %415, 3.300000e+01
  %417 = fadd float %414, %416
  %418 = fmul float %369, %415
  %419 = fdiv float %418, 3.500000e+01
  %420 = fadd float %417, %419
  %421 = fmul float %369, %418
  %422 = fdiv float %421, 3.700000e+01
  %423 = fadd float %420, %422
  %424 = fmul float %369, %421
  %425 = fdiv float %424, 3.900000e+01
  %426 = fadd float %423, %425
  %427 = fcmp oge float %288, 0.000000e+00
  %428 = select i1 %427, float 0x3FF921FB60000000, float 0xBFF921FB60000000
  %429 = fsub float %428, %426
  br label %430

430:                                              ; preds = %284, %301, %362, %366
  %431 = phi float [ 0.000000e+00, %284 ], [ %365, %362 ], [ %361, %301 ], [ %429, %366 ]
  br label %432

432:                                              ; preds = %432, %430
  %433 = phi i64 [ %436, %432 ], [ 0, %430 ]
  %434 = phi float [ %435, %432 ], [ 1.000000e+00, %430 ]
  %435 = fmul float %849, %434
  %436 = add nuw nsw i64 %433, 1
  %437 = icmp eq i64 %433, 0
  br i1 %437, label %432, label %438, !llvm.loop !13

438:                                              ; preds = %432
  %439 = fneg float %435
  br label %440

440:                                              ; preds = %440, %438
  %441 = phi i64 [ %444, %440 ], [ 1, %438 ]
  %442 = phi i64 [ %443, %440 ], [ 1, %438 ]
  %443 = mul nuw nsw i64 %441, %442
  %444 = add nuw nsw i64 %441, 1
  %445 = icmp samesign ult i64 %441, 2
  br i1 %445, label %440, label %446, !llvm.loop !14

446:                                              ; preds = %440
  %447 = uitofp nneg i64 %443 to float
  %448 = fdiv float %439, %447
  %449 = fadd float %448, 1.000000e+00
  br label %450

450:                                              ; preds = %450, %446
  %451 = phi i64 [ %454, %450 ], [ 0, %446 ]
  %452 = phi float [ %453, %450 ], [ 1.000000e+00, %446 ]
  %453 = fneg float %452
  %454 = add nuw nsw i64 %451, 1
  %455 = icmp eq i64 %451, 0
  br i1 %455, label %450, label %456, !llvm.loop !13

456:                                              ; preds = %450, %456
  %457 = phi i64 [ %460, %456 ], [ 0, %450 ]
  %458 = phi float [ %459, %456 ], [ 1.000000e+00, %450 ]
  %459 = fmul float %849, %458
  %460 = add nuw nsw i64 %457, 1
  %461 = icmp samesign ult i64 %457, 3
  br i1 %461, label %456, label %462, !llvm.loop !13

462:                                              ; preds = %456
  %463 = fmul float %453, %459
  br label %464

464:                                              ; preds = %464, %462
  %465 = phi i64 [ %468, %464 ], [ 1, %462 ]
  %466 = phi i64 [ %467, %464 ], [ 1, %462 ]
  %467 = mul nuw nsw i64 %465, %466
  %468 = add nuw nsw i64 %465, 1
  %469 = icmp samesign ult i64 %465, 4
  br i1 %469, label %464, label %470, !llvm.loop !14

470:                                              ; preds = %464
  %471 = uitofp nneg i64 %467 to float
  %472 = fdiv float %463, %471
  %473 = fadd float %449, %472
  br label %474

474:                                              ; preds = %474, %470
  %475 = phi i64 [ %478, %474 ], [ 0, %470 ]
  %476 = phi float [ %477, %474 ], [ 1.000000e+00, %470 ]
  %477 = fneg float %476
  %478 = add nuw nsw i64 %475, 1
  %479 = icmp samesign ult i64 %475, 2
  br i1 %479, label %474, label %480, !llvm.loop !13

480:                                              ; preds = %474, %480
  %481 = phi i64 [ %484, %480 ], [ 0, %474 ]
  %482 = phi float [ %483, %480 ], [ 1.000000e+00, %474 ]
  %483 = fmul float %849, %482
  %484 = add nuw nsw i64 %481, 1
  %485 = icmp samesign ult i64 %481, 5
  br i1 %485, label %480, label %486, !llvm.loop !13

486:                                              ; preds = %480
  %487 = fmul float %477, %483
  br label %488

488:                                              ; preds = %488, %486
  %489 = phi i64 [ %492, %488 ], [ 1, %486 ]
  %490 = phi i64 [ %491, %488 ], [ 1, %486 ]
  %491 = mul nuw nsw i64 %489, %490
  %492 = add nuw nsw i64 %489, 1
  %493 = icmp samesign ult i64 %489, 6
  br i1 %493, label %488, label %494, !llvm.loop !14

494:                                              ; preds = %488
  %495 = uitofp nneg i64 %491 to float
  %496 = fdiv float %487, %495
  %497 = fadd float %473, %496
  br label %498

498:                                              ; preds = %498, %494
  %499 = phi i64 [ %502, %498 ], [ 0, %494 ]
  %500 = phi float [ %501, %498 ], [ 1.000000e+00, %494 ]
  %501 = fneg float %500
  %502 = add nuw nsw i64 %499, 1
  %503 = icmp samesign ult i64 %499, 3
  br i1 %503, label %498, label %504, !llvm.loop !13

504:                                              ; preds = %498, %504
  %505 = phi i64 [ %508, %504 ], [ 0, %498 ]
  %506 = phi float [ %507, %504 ], [ 1.000000e+00, %498 ]
  %507 = fmul float %849, %506
  %508 = add nuw nsw i64 %505, 1
  %509 = icmp samesign ult i64 %505, 7
  br i1 %509, label %504, label %510, !llvm.loop !13

510:                                              ; preds = %504
  %511 = fmul float %501, %507
  br label %512

512:                                              ; preds = %512, %510
  %513 = phi i64 [ %516, %512 ], [ 1, %510 ]
  %514 = phi i64 [ %515, %512 ], [ 1, %510 ]
  %515 = mul nuw nsw i64 %513, %514
  %516 = add nuw nsw i64 %513, 1
  %517 = icmp samesign ult i64 %513, 8
  br i1 %517, label %512, label %518, !llvm.loop !14

518:                                              ; preds = %512
  %519 = uitofp nneg i64 %515 to float
  %520 = fdiv float %511, %519
  %521 = fadd float %497, %520
  br label %522

522:                                              ; preds = %522, %518
  %523 = phi i64 [ %526, %522 ], [ 0, %518 ]
  %524 = phi float [ %525, %522 ], [ 1.000000e+00, %518 ]
  %525 = fneg float %524
  %526 = add nuw nsw i64 %523, 1
  %527 = icmp samesign ult i64 %523, 4
  br i1 %527, label %522, label %528, !llvm.loop !13

528:                                              ; preds = %522, %528
  %529 = phi i64 [ %532, %528 ], [ 0, %522 ]
  %530 = phi float [ %531, %528 ], [ 1.000000e+00, %522 ]
  %531 = fmul float %849, %530
  %532 = add nuw nsw i64 %529, 1
  %533 = icmp samesign ult i64 %529, 9
  br i1 %533, label %528, label %534, !llvm.loop !13

534:                                              ; preds = %528
  %535 = fmul float %525, %531
  br label %536

536:                                              ; preds = %536, %534
  %537 = phi i64 [ %540, %536 ], [ 1, %534 ]
  %538 = phi i64 [ %539, %536 ], [ 1, %534 ]
  %539 = mul nuw nsw i64 %537, %538
  %540 = add nuw nsw i64 %537, 1
  %541 = icmp samesign ult i64 %537, 10
  br i1 %541, label %536, label %542, !llvm.loop !14

542:                                              ; preds = %536
  %543 = uitofp nneg i64 %539 to float
  %544 = fdiv float %535, %543
  %545 = fadd float %521, %544
  br label %546

546:                                              ; preds = %546, %542
  %547 = phi i64 [ %550, %546 ], [ 0, %542 ]
  %548 = phi float [ %549, %546 ], [ 1.000000e+00, %542 ]
  %549 = fneg float %548
  %550 = add nuw nsw i64 %547, 1
  %551 = icmp samesign ult i64 %547, 5
  br i1 %551, label %546, label %552, !llvm.loop !13

552:                                              ; preds = %546, %552
  %553 = phi i64 [ %556, %552 ], [ 0, %546 ]
  %554 = phi float [ %555, %552 ], [ 1.000000e+00, %546 ]
  %555 = fmul float %849, %554
  %556 = add nuw nsw i64 %553, 1
  %557 = icmp samesign ult i64 %553, 11
  br i1 %557, label %552, label %558, !llvm.loop !13

558:                                              ; preds = %552
  %559 = fmul float %549, %555
  br label %560

560:                                              ; preds = %560, %558
  %561 = phi i64 [ %564, %560 ], [ 1, %558 ]
  %562 = phi i64 [ %563, %560 ], [ 1, %558 ]
  %563 = mul nuw nsw i64 %561, %562
  %564 = add nuw nsw i64 %561, 1
  %565 = icmp samesign ult i64 %561, 12
  br i1 %565, label %560, label %566, !llvm.loop !14

566:                                              ; preds = %560
  %567 = uitofp nneg i64 %563 to float
  %568 = fdiv float %559, %567
  %569 = fadd float %545, %568
  br label %570

570:                                              ; preds = %570, %566
  %571 = phi i64 [ %574, %570 ], [ 0, %566 ]
  %572 = phi float [ %573, %570 ], [ 1.000000e+00, %566 ]
  %573 = fneg float %572
  %574 = add nuw nsw i64 %571, 1
  %575 = icmp samesign ult i64 %571, 6
  br i1 %575, label %570, label %576, !llvm.loop !13

576:                                              ; preds = %570, %576
  %577 = phi i64 [ %580, %576 ], [ 0, %570 ]
  %578 = phi float [ %579, %576 ], [ 1.000000e+00, %570 ]
  %579 = fmul float %849, %578
  %580 = add nuw nsw i64 %577, 1
  %581 = icmp samesign ult i64 %577, 13
  br i1 %581, label %576, label %582, !llvm.loop !13

582:                                              ; preds = %576
  %583 = fmul float %573, %579
  br label %584

584:                                              ; preds = %584, %582
  %585 = phi i64 [ %588, %584 ], [ 1, %582 ]
  %586 = phi i64 [ %587, %584 ], [ 1, %582 ]
  %587 = mul nuw nsw i64 %585, %586
  %588 = add nuw nsw i64 %585, 1
  %589 = icmp samesign ult i64 %585, 14
  br i1 %589, label %584, label %590, !llvm.loop !14

590:                                              ; preds = %584
  %591 = uitofp nneg i64 %587 to float
  %592 = fdiv float %583, %591
  %593 = fadd float %569, %592
  br label %594

594:                                              ; preds = %594, %590
  %595 = phi i64 [ %598, %594 ], [ 0, %590 ]
  %596 = phi float [ %597, %594 ], [ 1.000000e+00, %590 ]
  %597 = fneg float %596
  %598 = add nuw nsw i64 %595, 1
  %599 = icmp samesign ult i64 %595, 7
  br i1 %599, label %594, label %600, !llvm.loop !13

600:                                              ; preds = %594, %600
  %601 = phi i64 [ %604, %600 ], [ 0, %594 ]
  %602 = phi float [ %603, %600 ], [ 1.000000e+00, %594 ]
  %603 = fmul float %849, %602
  %604 = add nuw nsw i64 %601, 1
  %605 = icmp samesign ult i64 %601, 15
  br i1 %605, label %600, label %606, !llvm.loop !13

606:                                              ; preds = %600
  %607 = fmul float %597, %603
  br label %608

608:                                              ; preds = %608, %606
  %609 = phi i64 [ %612, %608 ], [ 1, %606 ]
  %610 = phi i64 [ %611, %608 ], [ 1, %606 ]
  %611 = mul nuw nsw i64 %609, %610
  %612 = add nuw nsw i64 %609, 1
  %613 = icmp samesign ult i64 %609, 16
  br i1 %613, label %608, label %614, !llvm.loop !14

614:                                              ; preds = %608
  %615 = uitofp nneg i64 %611 to float
  %616 = fdiv float %607, %615
  %617 = fadd float %593, %616
  br label %618

618:                                              ; preds = %618, %614
  %619 = phi i64 [ %622, %618 ], [ 0, %614 ]
  %620 = phi float [ %621, %618 ], [ 1.000000e+00, %614 ]
  %621 = fneg float %620
  %622 = add nuw nsw i64 %619, 1
  %623 = icmp samesign ult i64 %619, 8
  br i1 %623, label %618, label %624, !llvm.loop !13

624:                                              ; preds = %618, %624
  %625 = phi i64 [ %628, %624 ], [ 0, %618 ]
  %626 = phi float [ %627, %624 ], [ 1.000000e+00, %618 ]
  %627 = fmul float %849, %626
  %628 = add nuw nsw i64 %625, 1
  %629 = icmp samesign ult i64 %625, 17
  br i1 %629, label %624, label %630, !llvm.loop !13

630:                                              ; preds = %624
  %631 = fmul float %621, %627
  br label %632

632:                                              ; preds = %632, %630
  %633 = phi i64 [ %636, %632 ], [ 1, %630 ]
  %634 = phi i64 [ %635, %632 ], [ 1, %630 ]
  %635 = mul nuw nsw i64 %633, %634
  %636 = add nuw nsw i64 %633, 1
  %637 = icmp samesign ult i64 %633, 18
  br i1 %637, label %632, label %638, !llvm.loop !14

638:                                              ; preds = %632
  %639 = uitofp nneg i64 %635 to float
  %640 = fdiv float %631, %639
  %641 = fadd float %617, %640
  %642 = fmul float %431, 2.000000e+00
  %643 = call float @llvm.fmuladd.f32(float %24, float %641, float 1.000000e+00)
  %644 = fmul float %18, %643
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %6) #4
  store i64 0, ptr %6, align 8, !tbaa !5
  br label %860

645:                                              ; preds = %37, %677
  %646 = phi i64 [ 0, %37 ], [ %682, %677 ]
  %647 = phi float [ 0.000000e+00, %37 ], [ %681, %677 ]
  switch i64 %646, label %648 [
    i64 0, label %667
    i64 1, label %657
  ]

648:                                              ; preds = %645, %648
  %649 = phi i64 [ %652, %648 ], [ 0, %645 ]
  %650 = phi float [ %651, %648 ], [ 1.000000e+00, %645 ]
  %651 = fneg float %650
  %652 = add nuw nsw i64 %649, 1
  %653 = icmp samesign ult i64 %652, %646
  br i1 %653, label %648, label %654, !llvm.loop !13

654:                                              ; preds = %648
  %655 = shl nuw nsw i64 %646, 1
  %656 = or disjoint i64 %655, 1
  br label %657

657:                                              ; preds = %654, %645
  %658 = phi i64 [ %656, %654 ], [ 3, %645 ]
  %659 = phi float [ %651, %654 ], [ -1.000000e+00, %645 ]
  %660 = call i64 @llvm.abs.i64(i64 range(i64 -9223372036854775808, 20) %658, i1 true)
  br label %661

661:                                              ; preds = %657, %661
  %662 = phi i64 [ 0, %657 ], [ %665, %661 ]
  %663 = phi float [ 1.000000e+00, %657 ], [ %664, %661 ]
  %664 = fmul float %23, %663
  %665 = add nuw nsw i64 %662, 1
  %666 = icmp samesign ult i64 %665, %660
  br i1 %666, label %661, label %667, !llvm.loop !13

667:                                              ; preds = %661, %645
  %668 = phi i64 [ 1, %645 ], [ %658, %661 ]
  %669 = phi float [ 1.000000e+00, %645 ], [ %659, %661 ]
  %670 = phi float [ %23, %645 ], [ %664, %661 ]
  br label %671

671:                                              ; preds = %667, %671
  %672 = phi i64 [ 1, %667 ], [ %675, %671 ]
  %673 = phi i64 [ 1, %667 ], [ %674, %671 ]
  %674 = mul nuw nsw i64 %672, %673
  %675 = add nuw nsw i64 %672, 1
  %676 = icmp ult i64 %672, %668
  br i1 %676, label %671, label %677, !llvm.loop !14

677:                                              ; preds = %671
  %678 = fmul float %669, %670
  %679 = uitofp nneg i64 %674 to float
  %680 = fdiv float %678, %679
  %681 = fadd float %647, %680
  %682 = add nuw nsw i64 %646, 1
  %683 = icmp eq i64 %682, 10
  br i1 %683, label %684, label %645, !llvm.loop !15

684:                                              ; preds = %677
  %685 = call float @llvm.fmuladd.f32(float %20, float %681, float %23)
  br label %686

686:                                              ; preds = %718, %684
  %687 = phi i64 [ 0, %684 ], [ %723, %718 ]
  %688 = phi float [ 0.000000e+00, %684 ], [ %722, %718 ]
  switch i64 %687, label %689 [
    i64 0, label %708
    i64 1, label %698
  ]

689:                                              ; preds = %686, %689
  %690 = phi i64 [ %693, %689 ], [ 0, %686 ]
  %691 = phi float [ %692, %689 ], [ 1.000000e+00, %686 ]
  %692 = fneg float %691
  %693 = add nuw nsw i64 %690, 1
  %694 = icmp samesign ult i64 %693, %687
  br i1 %694, label %689, label %695, !llvm.loop !13

695:                                              ; preds = %689
  %696 = shl nuw nsw i64 %687, 1
  %697 = or disjoint i64 %696, 1
  br label %698

698:                                              ; preds = %695, %686
  %699 = phi i64 [ %697, %695 ], [ 3, %686 ]
  %700 = phi float [ %692, %695 ], [ -1.000000e+00, %686 ]
  %701 = call i64 @llvm.abs.i64(i64 range(i64 -9223372036854775808, 20) %699, i1 true)
  br label %702

702:                                              ; preds = %702, %698
  %703 = phi i64 [ 0, %698 ], [ %706, %702 ]
  %704 = phi float [ 1.000000e+00, %698 ], [ %705, %702 ]
  %705 = fmul float %685, %704
  %706 = add nuw nsw i64 %703, 1
  %707 = icmp samesign ult i64 %706, %701
  br i1 %707, label %702, label %708, !llvm.loop !13

708:                                              ; preds = %702, %686
  %709 = phi i64 [ 1, %686 ], [ %699, %702 ]
  %710 = phi float [ 1.000000e+00, %686 ], [ %700, %702 ]
  %711 = phi float [ %685, %686 ], [ %705, %702 ]
  br label %712

712:                                              ; preds = %712, %708
  %713 = phi i64 [ 1, %708 ], [ %716, %712 ]
  %714 = phi i64 [ 1, %708 ], [ %715, %712 ]
  %715 = mul nuw nsw i64 %713, %714
  %716 = add nuw nsw i64 %713, 1
  %717 = icmp ult i64 %713, %709
  br i1 %717, label %712, label %718, !llvm.loop !14

718:                                              ; preds = %712
  %719 = fmul float %710, %711
  %720 = uitofp nneg i64 %715 to float
  %721 = fdiv float %719, %720
  %722 = fadd float %688, %721
  %723 = add nuw nsw i64 %687, 1
  %724 = icmp eq i64 %723, 10
  br i1 %724, label %725, label %686, !llvm.loop !15

725:                                              ; preds = %718
  %726 = call float @llvm.fmuladd.f32(float %20, float %722, float %23)
  br label %727

727:                                              ; preds = %759, %725
  %728 = phi i64 [ 0, %725 ], [ %764, %759 ]
  %729 = phi float [ 0.000000e+00, %725 ], [ %763, %759 ]
  switch i64 %728, label %730 [
    i64 0, label %749
    i64 1, label %739
  ]

730:                                              ; preds = %727, %730
  %731 = phi i64 [ %734, %730 ], [ 0, %727 ]
  %732 = phi float [ %733, %730 ], [ 1.000000e+00, %727 ]
  %733 = fneg float %732
  %734 = add nuw nsw i64 %731, 1
  %735 = icmp samesign ult i64 %734, %728
  br i1 %735, label %730, label %736, !llvm.loop !13

736:                                              ; preds = %730
  %737 = shl nuw nsw i64 %728, 1
  %738 = or disjoint i64 %737, 1
  br label %739

739:                                              ; preds = %736, %727
  %740 = phi i64 [ %738, %736 ], [ 3, %727 ]
  %741 = phi float [ %733, %736 ], [ -1.000000e+00, %727 ]
  %742 = call i64 @llvm.abs.i64(i64 range(i64 -9223372036854775808, 20) %740, i1 true)
  br label %743

743:                                              ; preds = %743, %739
  %744 = phi i64 [ 0, %739 ], [ %747, %743 ]
  %745 = phi float [ 1.000000e+00, %739 ], [ %746, %743 ]
  %746 = fmul float %726, %745
  %747 = add nuw nsw i64 %744, 1
  %748 = icmp samesign ult i64 %747, %742
  br i1 %748, label %743, label %749, !llvm.loop !13

749:                                              ; preds = %743, %727
  %750 = phi i64 [ 1, %727 ], [ %740, %743 ]
  %751 = phi float [ 1.000000e+00, %727 ], [ %741, %743 ]
  %752 = phi float [ %726, %727 ], [ %746, %743 ]
  br label %753

753:                                              ; preds = %753, %749
  %754 = phi i64 [ 1, %749 ], [ %757, %753 ]
  %755 = phi i64 [ 1, %749 ], [ %756, %753 ]
  %756 = mul nuw nsw i64 %754, %755
  %757 = add nuw nsw i64 %754, 1
  %758 = icmp ult i64 %754, %750
  br i1 %758, label %753, label %759, !llvm.loop !14

759:                                              ; preds = %753
  %760 = fmul float %751, %752
  %761 = uitofp nneg i64 %756 to float
  %762 = fdiv float %760, %761
  %763 = fadd float %729, %762
  %764 = add nuw nsw i64 %728, 1
  %765 = icmp eq i64 %764, 10
  br i1 %765, label %766, label %727, !llvm.loop !15

766:                                              ; preds = %759
  %767 = call float @llvm.fmuladd.f32(float %20, float %763, float %23)
  br label %768

768:                                              ; preds = %800, %766
  %769 = phi i64 [ 0, %766 ], [ %805, %800 ]
  %770 = phi float [ 0.000000e+00, %766 ], [ %804, %800 ]
  switch i64 %769, label %771 [
    i64 0, label %790
    i64 1, label %780
  ]

771:                                              ; preds = %768, %771
  %772 = phi i64 [ %775, %771 ], [ 0, %768 ]
  %773 = phi float [ %774, %771 ], [ 1.000000e+00, %768 ]
  %774 = fneg float %773
  %775 = add nuw nsw i64 %772, 1
  %776 = icmp samesign ult i64 %775, %769
  br i1 %776, label %771, label %777, !llvm.loop !13

777:                                              ; preds = %771
  %778 = shl nuw nsw i64 %769, 1
  %779 = or disjoint i64 %778, 1
  br label %780

780:                                              ; preds = %777, %768
  %781 = phi i64 [ %779, %777 ], [ 3, %768 ]
  %782 = phi float [ %774, %777 ], [ -1.000000e+00, %768 ]
  %783 = call i64 @llvm.abs.i64(i64 range(i64 -9223372036854775808, 20) %781, i1 true)
  br label %784

784:                                              ; preds = %784, %780
  %785 = phi i64 [ 0, %780 ], [ %788, %784 ]
  %786 = phi float [ 1.000000e+00, %780 ], [ %787, %784 ]
  %787 = fmul float %767, %786
  %788 = add nuw nsw i64 %785, 1
  %789 = icmp samesign ult i64 %788, %783
  br i1 %789, label %784, label %790, !llvm.loop !13

790:                                              ; preds = %784, %768
  %791 = phi i64 [ 1, %768 ], [ %781, %784 ]
  %792 = phi float [ 1.000000e+00, %768 ], [ %782, %784 ]
  %793 = phi float [ %767, %768 ], [ %787, %784 ]
  br label %794

794:                                              ; preds = %794, %790
  %795 = phi i64 [ 1, %790 ], [ %798, %794 ]
  %796 = phi i64 [ 1, %790 ], [ %797, %794 ]
  %797 = mul nuw nsw i64 %795, %796
  %798 = add nuw nsw i64 %795, 1
  %799 = icmp ult i64 %795, %791
  br i1 %799, label %794, label %800, !llvm.loop !14

800:                                              ; preds = %794
  %801 = fmul float %792, %793
  %802 = uitofp nneg i64 %797 to float
  %803 = fdiv float %801, %802
  %804 = fadd float %770, %803
  %805 = add nuw nsw i64 %769, 1
  %806 = icmp eq i64 %805, 10
  br i1 %806, label %807, label %768, !llvm.loop !15

807:                                              ; preds = %800
  %808 = call float @llvm.fmuladd.f32(float %20, float %804, float %23)
  br label %809

809:                                              ; preds = %841, %807
  %810 = phi i64 [ 0, %807 ], [ %846, %841 ]
  %811 = phi float [ 0.000000e+00, %807 ], [ %845, %841 ]
  switch i64 %810, label %812 [
    i64 0, label %831
    i64 1, label %821
  ]

812:                                              ; preds = %809, %812
  %813 = phi i64 [ %816, %812 ], [ 0, %809 ]
  %814 = phi float [ %815, %812 ], [ 1.000000e+00, %809 ]
  %815 = fneg float %814
  %816 = add nuw nsw i64 %813, 1
  %817 = icmp samesign ult i64 %816, %810
  br i1 %817, label %812, label %818, !llvm.loop !13

818:                                              ; preds = %812
  %819 = shl nuw nsw i64 %810, 1
  %820 = or disjoint i64 %819, 1
  br label %821

821:                                              ; preds = %818, %809
  %822 = phi i64 [ %820, %818 ], [ 3, %809 ]
  %823 = phi float [ %815, %818 ], [ -1.000000e+00, %809 ]
  %824 = call i64 @llvm.abs.i64(i64 range(i64 -9223372036854775808, 20) %822, i1 true)
  br label %825

825:                                              ; preds = %825, %821
  %826 = phi i64 [ 0, %821 ], [ %829, %825 ]
  %827 = phi float [ 1.000000e+00, %821 ], [ %828, %825 ]
  %828 = fmul float %808, %827
  %829 = add nuw nsw i64 %826, 1
  %830 = icmp samesign ult i64 %829, %824
  br i1 %830, label %825, label %831, !llvm.loop !13

831:                                              ; preds = %825, %809
  %832 = phi i64 [ 1, %809 ], [ %822, %825 ]
  %833 = phi float [ 1.000000e+00, %809 ], [ %823, %825 ]
  %834 = phi float [ %808, %809 ], [ %828, %825 ]
  br label %835

835:                                              ; preds = %835, %831
  %836 = phi i64 [ 1, %831 ], [ %839, %835 ]
  %837 = phi i64 [ 1, %831 ], [ %838, %835 ]
  %838 = mul nuw nsw i64 %836, %837
  %839 = add nuw nsw i64 %836, 1
  %840 = icmp ult i64 %836, %832
  br i1 %840, label %835, label %841, !llvm.loop !14

841:                                              ; preds = %835
  %842 = fmul float %833, %834
  %843 = uitofp nneg i64 %838 to float
  %844 = fdiv float %842, %843
  %845 = fadd float %811, %844
  %846 = add nuw nsw i64 %810, 1
  %847 = icmp eq i64 %846, 10
  br i1 %847, label %848, label %809, !llvm.loop !15

848:                                              ; preds = %841
  %849 = call float @llvm.fmuladd.f32(float %20, float %845, float %23)
  %850 = fmul float %849, 5.000000e-01
  br label %39

851:                                              ; preds = %945
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %6) #4
  %852 = load float, ptr %1, align 4, !tbaa !9
  %853 = fdiv float %852, 0.000000e+00
  store float %853, ptr %1, align 4, !tbaa !9
  %854 = load float, ptr %25, align 4, !tbaa !9
  %855 = fdiv float %854, 0.000000e+00
  store float %855, ptr %25, align 4, !tbaa !9
  %856 = load float, ptr %26, align 4, !tbaa !9
  %857 = fdiv float %856, 0.000000e+00
  store float %857, ptr %26, align 4, !tbaa !9
  %858 = add nuw nsw i64 %38, 1
  %859 = icmp eq i64 %858, 10
  br i1 %859, label %35, label %37, !llvm.loop !16

860:                                              ; preds = %638, %945
  %861 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %9, ptr noundef nonnull %6) #4
  %862 = load float, ptr %861, align 4, !tbaa !9
  %863 = load i64, ptr %6, align 8, !tbaa !5
  switch i64 %863, label %945 [
    i64 0, label %864
    i64 1, label %904
  ]

864:                                              ; preds = %860, %895
  %865 = phi i64 [ %900, %895 ], [ %863, %860 ]
  %866 = phi float [ %899, %895 ], [ 0.000000e+00, %860 ]
  switch i64 %865, label %867 [
    i64 0, label %895
    i64 1, label %875
  ]

867:                                              ; preds = %864, %867
  %868 = phi i64 [ %871, %867 ], [ 0, %864 ]
  %869 = phi float [ %870, %867 ], [ 1.000000e+00, %864 ]
  %870 = fneg float %869
  %871 = add nuw nsw i64 %868, 1
  %872 = icmp samesign ult i64 %871, %865
  br i1 %872, label %867, label %873, !llvm.loop !13

873:                                              ; preds = %867
  %874 = shl nuw nsw i64 %865, 1
  br label %875

875:                                              ; preds = %873, %864
  %876 = phi i64 [ %874, %873 ], [ 2, %864 ]
  %877 = phi float [ %870, %873 ], [ -1.000000e+00, %864 ]
  %878 = icmp eq i64 %876, 0
  br i1 %878, label %895, label %879

879:                                              ; preds = %875, %879
  %880 = phi i64 [ %883, %879 ], [ 0, %875 ]
  %881 = phi float [ %882, %879 ], [ 1.000000e+00, %875 ]
  %882 = fmul float %642, %881
  %883 = add nuw nsw i64 %880, 1
  %884 = icmp samesign ult i64 %883, %876
  br i1 %884, label %879, label %885, !llvm.loop !13

885:                                              ; preds = %879
  %886 = fmul float %877, %882
  br label %887

887:                                              ; preds = %885, %887
  %888 = phi i64 [ %891, %887 ], [ 1, %885 ]
  %889 = phi i64 [ %890, %887 ], [ 1, %885 ]
  %890 = mul nuw nsw i64 %888, %889
  %891 = add nuw nsw i64 %888, 1
  %892 = icmp samesign ult i64 %888, %876
  br i1 %892, label %887, label %893, !llvm.loop !14

893:                                              ; preds = %887
  %894 = uitofp nneg i64 %890 to float
  br label %895

895:                                              ; preds = %875, %893, %864
  %896 = phi float [ 1.000000e+00, %864 ], [ %886, %893 ], [ %877, %875 ]
  %897 = phi float [ 1.000000e+00, %864 ], [ %894, %893 ], [ 1.000000e+00, %875 ]
  %898 = fdiv float %896, %897
  %899 = fadd float %866, %898
  %900 = add nuw nsw i64 %865, 1
  %901 = icmp eq i64 %900, 10
  br i1 %901, label %902, label %864, !llvm.loop !17

902:                                              ; preds = %895
  %903 = fmul float %644, %899
  br label %945

904:                                              ; preds = %860, %936
  %905 = phi i64 [ %941, %936 ], [ 0, %860 ]
  %906 = phi float [ %940, %936 ], [ 0.000000e+00, %860 ]
  switch i64 %905, label %907 [
    i64 0, label %926
    i64 1, label %916
  ]

907:                                              ; preds = %904, %907
  %908 = phi i64 [ %911, %907 ], [ 0, %904 ]
  %909 = phi float [ %910, %907 ], [ 1.000000e+00, %904 ]
  %910 = fneg float %909
  %911 = add nuw nsw i64 %908, 1
  %912 = icmp samesign ult i64 %911, %905
  br i1 %912, label %907, label %913, !llvm.loop !13

913:                                              ; preds = %907
  %914 = shl nuw nsw i64 %905, 1
  %915 = or disjoint i64 %914, 1
  br label %916

916:                                              ; preds = %913, %904
  %917 = phi i64 [ %915, %913 ], [ 3, %904 ]
  %918 = phi float [ %910, %913 ], [ -1.000000e+00, %904 ]
  %919 = call i64 @llvm.abs.i64(i64 range(i64 -9223372036854775808, 20) %917, i1 true)
  br label %920

920:                                              ; preds = %916, %920
  %921 = phi i64 [ 0, %916 ], [ %924, %920 ]
  %922 = phi float [ 1.000000e+00, %916 ], [ %923, %920 ]
  %923 = fmul float %642, %922
  %924 = add nuw nsw i64 %921, 1
  %925 = icmp samesign ult i64 %924, %919
  br i1 %925, label %920, label %926, !llvm.loop !13

926:                                              ; preds = %920, %904
  %927 = phi i64 [ 1, %904 ], [ %917, %920 ]
  %928 = phi float [ 1.000000e+00, %904 ], [ %918, %920 ]
  %929 = phi float [ %642, %904 ], [ %923, %920 ]
  br label %930

930:                                              ; preds = %926, %930
  %931 = phi i64 [ 1, %926 ], [ %934, %930 ]
  %932 = phi i64 [ 1, %926 ], [ %933, %930 ]
  %933 = mul nuw nsw i64 %931, %932
  %934 = add nuw nsw i64 %931, 1
  %935 = icmp ult i64 %931, %927
  br i1 %935, label %930, label %936, !llvm.loop !14

936:                                              ; preds = %930
  %937 = fmul float %928, %929
  %938 = uitofp nneg i64 %933 to float
  %939 = fdiv float %937, %938
  %940 = fadd float %906, %939
  %941 = add nuw nsw i64 %905, 1
  %942 = icmp eq i64 %941, 10
  br i1 %942, label %943, label %904, !llvm.loop !15

943:                                              ; preds = %936
  %944 = fmul float %644, %940
  br label %945

945:                                              ; preds = %860, %943, %902
  %946 = phi float [ %903, %902 ], [ %944, %943 ], [ 0.000000e+00, %860 ]
  %947 = fsub float %946, %862
  %948 = getelementptr inbounds [3 x float], ptr %1, i64 0, i64 %863
  store float %947, ptr %948, align 4, !tbaa !9
  %949 = add nsw i64 %863, 1
  store i64 %949, ptr %6, align 8, !tbaa !5
  %950 = icmp slt i64 %863, 2
  br i1 %950, label %860, label %851, !llvm.loop !18

951:                                              ; preds = %952
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %7) #4
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %5) #4
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %2) #4
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %1) #4
  ret i32 0

952:                                              ; preds = %35, %952
  %953 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %9, ptr noundef nonnull %7) #4
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %8) #4
  %954 = load float, ptr %953, align 4, !tbaa !9
  %955 = load i64, ptr %7, align 8, !tbaa !5
  %956 = getelementptr inbounds [3 x float], ptr %2, i64 0, i64 %955
  %957 = load float, ptr %956, align 4, !tbaa !9
  %958 = call float @llvm.fmuladd.f32(float %957, float 0.000000e+00, float %954)
  store float %958, ptr %8, align 4, !tbaa !9
  %959 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %10, ptr noundef nonnull %7, ptr noundef nonnull %8, i64 noundef 0) #4
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %8) #4
  %960 = load i64, ptr %7, align 8, !tbaa !5
  %961 = add nsw i64 %960, 1
  store i64 %961, ptr %7, align 8, !tbaa !5
  %962 = icmp slt i64 %960, 2
  br i1 %962, label %952, label %951, !llvm.loop !19
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.abs.i64(i64, i1 immarg) #3

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="duotronic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 755f040f24df9a74f4e5f7f7bdd64e3acd4e61b9)"}
!3 = !{i64 2147506620}
!4 = !{i64 2147507132}
!5 = !{!6, !6, i64 0}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !7, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}
!17 = distinct !{!17, !12}
!18 = distinct !{!18, !12}
!19 = distinct !{!19, !12}
