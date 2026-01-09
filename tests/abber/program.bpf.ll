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
  br label %12

11:                                               ; preds = %12
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #4
  br label %33

12:                                               ; preds = %0, %12
  %13 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %9, ptr noundef nonnull %3) #4
  %14 = load float, ptr %13, align 4, !tbaa !9
  %15 = load i64, ptr %3, align 8, !tbaa !5
  %16 = getelementptr inbounds [3 x float], ptr %1, i64 0, i64 %15
  store float %14, ptr %16, align 4, !tbaa !9
  %17 = add nsw i64 %15, 1
  store i64 %17, ptr %3, align 8, !tbaa !5
  %18 = icmp slt i64 %15, 2
  br i1 %18, label %12, label %11, !llvm.loop !11

19:                                               ; preds = %33
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %5) #4
  store i64 6, ptr %5, align 8, !tbaa !5
  %20 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %9, ptr noundef nonnull %5) #4
  %21 = load float, ptr %20, align 4, !tbaa !9
  store i64 7, ptr %5, align 8, !tbaa !5
  %22 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %9, ptr noundef nonnull %5) #4
  %23 = load float, ptr %22, align 4, !tbaa !9
  store i64 8, ptr %5, align 8, !tbaa !5
  %24 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %9, ptr noundef nonnull %5) #4
  %25 = load float, ptr %24, align 4, !tbaa !9
  store i64 9, ptr %5, align 8, !tbaa !5
  %26 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %9, ptr noundef nonnull %5) #4
  %27 = load float, ptr %26, align 4, !tbaa !9
  %28 = fmul float %21, %27
  %29 = fneg float %25
  %30 = getelementptr inbounds nuw i8, ptr %1, i64 4
  %31 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %32 = getelementptr inbounds nuw i8, ptr %2, i64 4
  br label %41

33:                                               ; preds = %11, %33
  %34 = phi i64 [ 0, %11 ], [ %37, %33 ]
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %4) #4
  %35 = add nuw nsw i64 %34, 3
  store i64 %35, ptr %4, align 8, !tbaa !5
  %36 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %9, ptr noundef nonnull %4) #4
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4) #4
  %37 = add nuw nsw i64 %34, 1
  %38 = icmp eq i64 %37, 3
  br i1 %38, label %19, label %33, !llvm.loop !14

39:                                               ; preds = %216
  %40 = getelementptr inbounds nuw i8, ptr %2, i64 8
  store float 0x7FF8000000000000, ptr %32, align 4
  store float 0x7FF8000000000000, ptr %40, align 4
  store float 0x7FF8000000000000, ptr %2, align 4
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %7) #4
  store i64 0, ptr %7, align 8, !tbaa !5
  br label %317

41:                                               ; preds = %19, %216
  %42 = phi i64 [ 0, %19 ], [ %223, %216 ]
  br label %43

43:                                               ; preds = %41, %212
  %44 = phi float [ %28, %41 ], [ %213, %212 ]
  %45 = phi i64 [ 0, %41 ], [ %214, %212 ]
  br label %173

46:                                               ; preds = %212
  %47 = fmul float %213, 5.000000e-01
  br label %48

48:                                               ; preds = %46, %80
  %49 = phi i64 [ 0, %46 ], [ %85, %80 ]
  %50 = phi float [ 0.000000e+00, %46 ], [ %84, %80 ]
  switch i64 %49, label %51 [
    i64 0, label %70
    i64 1, label %60
  ]

51:                                               ; preds = %48, %51
  %52 = phi i64 [ %55, %51 ], [ 0, %48 ]
  %53 = phi float [ %54, %51 ], [ 1.000000e+00, %48 ]
  %54 = fneg float %53
  %55 = add nuw nsw i64 %52, 1
  %56 = icmp samesign ult i64 %55, %49
  br i1 %56, label %51, label %57, !llvm.loop !15

57:                                               ; preds = %51
  %58 = shl nuw nsw i64 %49, 1
  %59 = or disjoint i64 %58, 1
  br label %60

60:                                               ; preds = %57, %48
  %61 = phi i64 [ %59, %57 ], [ 3, %48 ]
  %62 = phi float [ %54, %57 ], [ -1.000000e+00, %48 ]
  %63 = call i64 @llvm.abs.i64(i64 range(i64 -9223372036854775808, 20) %61, i1 true)
  br label %64

64:                                               ; preds = %60, %64
  %65 = phi i64 [ 0, %60 ], [ %68, %64 ]
  %66 = phi float [ 1.000000e+00, %60 ], [ %67, %64 ]
  %67 = fmul float %47, %66
  %68 = add nuw nsw i64 %65, 1
  %69 = icmp samesign ult i64 %68, %63
  br i1 %69, label %64, label %70, !llvm.loop !15

70:                                               ; preds = %64, %48
  %71 = phi i64 [ 1, %48 ], [ %61, %64 ]
  %72 = phi float [ 1.000000e+00, %48 ], [ %62, %64 ]
  %73 = phi float [ %47, %48 ], [ %67, %64 ]
  br label %74

74:                                               ; preds = %70, %74
  %75 = phi i64 [ 1, %70 ], [ %78, %74 ]
  %76 = phi i64 [ 1, %70 ], [ %77, %74 ]
  %77 = mul nuw nsw i64 %75, %76
  %78 = add nuw nsw i64 %75, 1
  %79 = icmp ult i64 %75, %71
  br i1 %79, label %74, label %80, !llvm.loop !16

80:                                               ; preds = %74
  %81 = fmul float %72, %73
  %82 = uitofp nneg i64 %77 to float
  %83 = fdiv float %81, %82
  %84 = fadd float %50, %83
  %85 = add nuw nsw i64 %49, 1
  %86 = icmp eq i64 %85, 10
  br i1 %86, label %87, label %48, !llvm.loop !17

87:                                               ; preds = %80, %118
  %88 = phi i64 [ %123, %118 ], [ 0, %80 ]
  %89 = phi float [ %122, %118 ], [ 0.000000e+00, %80 ]
  switch i64 %88, label %90 [
    i64 0, label %118
    i64 1, label %98
  ]

90:                                               ; preds = %87, %90
  %91 = phi i64 [ %94, %90 ], [ 0, %87 ]
  %92 = phi float [ %93, %90 ], [ 1.000000e+00, %87 ]
  %93 = fneg float %92
  %94 = add nuw nsw i64 %91, 1
  %95 = icmp samesign ult i64 %94, %88
  br i1 %95, label %90, label %96, !llvm.loop !15

96:                                               ; preds = %90
  %97 = shl nuw nsw i64 %88, 1
  br label %98

98:                                               ; preds = %96, %87
  %99 = phi i64 [ %97, %96 ], [ 2, %87 ]
  %100 = phi float [ %93, %96 ], [ -1.000000e+00, %87 ]
  %101 = icmp eq i64 %99, 0
  br i1 %101, label %118, label %102

102:                                              ; preds = %98, %102
  %103 = phi i64 [ %106, %102 ], [ 0, %98 ]
  %104 = phi float [ %105, %102 ], [ 1.000000e+00, %98 ]
  %105 = fmul float %47, %104
  %106 = add nuw nsw i64 %103, 1
  %107 = icmp samesign ult i64 %106, %99
  br i1 %107, label %102, label %108, !llvm.loop !15

108:                                              ; preds = %102
  %109 = fmul float %100, %105
  br label %110

110:                                              ; preds = %108, %110
  %111 = phi i64 [ %114, %110 ], [ 1, %108 ]
  %112 = phi i64 [ %113, %110 ], [ 1, %108 ]
  %113 = mul nuw nsw i64 %111, %112
  %114 = add nuw nsw i64 %111, 1
  %115 = icmp samesign ult i64 %111, %99
  br i1 %115, label %110, label %116, !llvm.loop !16

116:                                              ; preds = %110
  %117 = uitofp nneg i64 %113 to float
  br label %118

118:                                              ; preds = %98, %116, %87
  %119 = phi float [ 1.000000e+00, %87 ], [ %109, %116 ], [ %100, %98 ]
  %120 = phi float [ 1.000000e+00, %87 ], [ %117, %116 ], [ 1.000000e+00, %98 ]
  %121 = fdiv float %119, %120
  %122 = fadd float %89, %121
  %123 = add nuw nsw i64 %88, 1
  %124 = icmp eq i64 %123, 10
  br i1 %124, label %125, label %87, !llvm.loop !18

125:                                              ; preds = %118
  %126 = fmul float %84, 0.000000e+00
  %127 = fmul float %122, 0.000000e+00
  %128 = fcmp oeq float %127, 0.000000e+00
  %129 = fcmp oeq float %126, 0.000000e+00
  %130 = and i1 %129, %128
  %131 = select i1 %130, float 0.000000e+00, float 0x7FF8000000000000
  br label %132

132:                                              ; preds = %125, %163
  %133 = phi i64 [ 0, %125 ], [ %168, %163 ]
  %134 = phi float [ 0.000000e+00, %125 ], [ %167, %163 ]
  switch i64 %133, label %135 [
    i64 0, label %163
    i64 1, label %143
  ]

135:                                              ; preds = %132, %135
  %136 = phi i64 [ %139, %135 ], [ 0, %132 ]
  %137 = phi float [ %138, %135 ], [ 1.000000e+00, %132 ]
  %138 = fneg float %137
  %139 = add nuw nsw i64 %136, 1
  %140 = icmp samesign ult i64 %139, %133
  br i1 %140, label %135, label %141, !llvm.loop !15

141:                                              ; preds = %135
  %142 = shl nuw nsw i64 %133, 1
  br label %143

143:                                              ; preds = %141, %132
  %144 = phi i64 [ %142, %141 ], [ 2, %132 ]
  %145 = phi float [ %138, %141 ], [ -1.000000e+00, %132 ]
  %146 = icmp eq i64 %144, 0
  br i1 %146, label %163, label %147

147:                                              ; preds = %143, %147
  %148 = phi i64 [ %151, %147 ], [ 0, %143 ]
  %149 = phi float [ %150, %147 ], [ 1.000000e+00, %143 ]
  %150 = fmul float %213, %149
  %151 = add nuw nsw i64 %148, 1
  %152 = icmp samesign ult i64 %151, %144
  br i1 %152, label %147, label %153, !llvm.loop !15

153:                                              ; preds = %147
  %154 = fmul float %145, %150
  br label %155

155:                                              ; preds = %153, %155
  %156 = phi i64 [ %159, %155 ], [ 1, %153 ]
  %157 = phi i64 [ %158, %155 ], [ 1, %153 ]
  %158 = mul nuw nsw i64 %156, %157
  %159 = add nuw nsw i64 %156, 1
  %160 = icmp samesign ult i64 %156, %144
  br i1 %160, label %155, label %161, !llvm.loop !16

161:                                              ; preds = %155
  %162 = uitofp nneg i64 %158 to float
  br label %163

163:                                              ; preds = %143, %161, %132
  %164 = phi float [ 1.000000e+00, %132 ], [ %154, %161 ], [ %145, %143 ]
  %165 = phi float [ 1.000000e+00, %132 ], [ %162, %161 ], [ 1.000000e+00, %143 ]
  %166 = fdiv float %164, %165
  %167 = fadd float %134, %166
  %168 = add nuw nsw i64 %133, 1
  %169 = icmp eq i64 %168, 10
  br i1 %169, label %170, label %132, !llvm.loop !18

170:                                              ; preds = %163
  %171 = call float @llvm.fmuladd.f32(float %29, float %167, float 1.000000e+00)
  %172 = fmul float %23, %171
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %6) #4
  store i64 0, ptr %6, align 8, !tbaa !5
  br label %225

173:                                              ; preds = %43, %205
  %174 = phi i64 [ 0, %43 ], [ %210, %205 ]
  %175 = phi float [ 0.000000e+00, %43 ], [ %209, %205 ]
  switch i64 %174, label %176 [
    i64 0, label %195
    i64 1, label %185
  ]

176:                                              ; preds = %173, %176
  %177 = phi i64 [ %180, %176 ], [ 0, %173 ]
  %178 = phi float [ %179, %176 ], [ 1.000000e+00, %173 ]
  %179 = fneg float %178
  %180 = add nuw nsw i64 %177, 1
  %181 = icmp samesign ult i64 %180, %174
  br i1 %181, label %176, label %182, !llvm.loop !15

182:                                              ; preds = %176
  %183 = shl nuw nsw i64 %174, 1
  %184 = or disjoint i64 %183, 1
  br label %185

185:                                              ; preds = %182, %173
  %186 = phi i64 [ %184, %182 ], [ 3, %173 ]
  %187 = phi float [ %179, %182 ], [ -1.000000e+00, %173 ]
  %188 = call i64 @llvm.abs.i64(i64 range(i64 -9223372036854775808, 20) %186, i1 true)
  br label %189

189:                                              ; preds = %185, %189
  %190 = phi i64 [ 0, %185 ], [ %193, %189 ]
  %191 = phi float [ 1.000000e+00, %185 ], [ %192, %189 ]
  %192 = fmul float %44, %191
  %193 = add nuw nsw i64 %190, 1
  %194 = icmp samesign ult i64 %193, %188
  br i1 %194, label %189, label %195, !llvm.loop !15

195:                                              ; preds = %189, %173
  %196 = phi i64 [ 1, %173 ], [ %186, %189 ]
  %197 = phi float [ 1.000000e+00, %173 ], [ %187, %189 ]
  %198 = phi float [ %44, %173 ], [ %192, %189 ]
  br label %199

199:                                              ; preds = %195, %199
  %200 = phi i64 [ 1, %195 ], [ %203, %199 ]
  %201 = phi i64 [ 1, %195 ], [ %202, %199 ]
  %202 = mul nuw nsw i64 %200, %201
  %203 = add nuw nsw i64 %200, 1
  %204 = icmp ult i64 %200, %196
  br i1 %204, label %199, label %205, !llvm.loop !16

205:                                              ; preds = %199
  %206 = fmul float %197, %198
  %207 = uitofp nneg i64 %202 to float
  %208 = fdiv float %206, %207
  %209 = fadd float %175, %208
  %210 = add nuw nsw i64 %174, 1
  %211 = icmp eq i64 %210, 10
  br i1 %211, label %212, label %173, !llvm.loop !17

212:                                              ; preds = %205
  %213 = call float @llvm.fmuladd.f32(float %25, float %209, float %28)
  %214 = add nuw nsw i64 %45, 1
  %215 = icmp eq i64 %214, 5
  br i1 %215, label %46, label %43, !llvm.loop !19

216:                                              ; preds = %310
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %6) #4
  %217 = load float, ptr %1, align 4, !tbaa !9
  %218 = fdiv float %217, 0.000000e+00
  store float %218, ptr %1, align 4, !tbaa !9
  %219 = load float, ptr %30, align 4, !tbaa !9
  %220 = fdiv float %219, 0.000000e+00
  store float %220, ptr %30, align 4, !tbaa !9
  %221 = load float, ptr %31, align 4, !tbaa !9
  %222 = fdiv float %221, 0.000000e+00
  store float %222, ptr %31, align 4, !tbaa !9
  %223 = add nuw nsw i64 %42, 1
  %224 = icmp eq i64 %223, 10
  br i1 %224, label %39, label %41, !llvm.loop !20

225:                                              ; preds = %170, %310
  %226 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %9, ptr noundef nonnull %6) #4
  %227 = load float, ptr %226, align 4, !tbaa !9
  %228 = load i64, ptr %6, align 8, !tbaa !5
  switch i64 %228, label %310 [
    i64 0, label %229
    i64 1, label %269
  ]

229:                                              ; preds = %225, %260
  %230 = phi i64 [ %265, %260 ], [ %228, %225 ]
  %231 = phi float [ %264, %260 ], [ 0.000000e+00, %225 ]
  switch i64 %230, label %232 [
    i64 0, label %260
    i64 1, label %240
  ]

232:                                              ; preds = %229, %232
  %233 = phi i64 [ %236, %232 ], [ 0, %229 ]
  %234 = phi float [ %235, %232 ], [ 1.000000e+00, %229 ]
  %235 = fneg float %234
  %236 = add nuw nsw i64 %233, 1
  %237 = icmp samesign ult i64 %236, %230
  br i1 %237, label %232, label %238, !llvm.loop !15

238:                                              ; preds = %232
  %239 = shl nuw nsw i64 %230, 1
  br label %240

240:                                              ; preds = %238, %229
  %241 = phi i64 [ %239, %238 ], [ 2, %229 ]
  %242 = phi float [ %235, %238 ], [ -1.000000e+00, %229 ]
  %243 = icmp eq i64 %241, 0
  br i1 %243, label %260, label %244

244:                                              ; preds = %240, %244
  %245 = phi i64 [ %248, %244 ], [ 0, %240 ]
  %246 = phi float [ %247, %244 ], [ 1.000000e+00, %240 ]
  %247 = fmul float %131, %246
  %248 = add nuw nsw i64 %245, 1
  %249 = icmp samesign ult i64 %248, %241
  br i1 %249, label %244, label %250, !llvm.loop !15

250:                                              ; preds = %244
  %251 = fmul float %242, %247
  br label %252

252:                                              ; preds = %250, %252
  %253 = phi i64 [ %256, %252 ], [ 1, %250 ]
  %254 = phi i64 [ %255, %252 ], [ 1, %250 ]
  %255 = mul nuw nsw i64 %253, %254
  %256 = add nuw nsw i64 %253, 1
  %257 = icmp samesign ult i64 %253, %241
  br i1 %257, label %252, label %258, !llvm.loop !16

258:                                              ; preds = %252
  %259 = uitofp nneg i64 %255 to float
  br label %260

260:                                              ; preds = %240, %258, %229
  %261 = phi float [ 1.000000e+00, %229 ], [ %251, %258 ], [ %242, %240 ]
  %262 = phi float [ 1.000000e+00, %229 ], [ %259, %258 ], [ 1.000000e+00, %240 ]
  %263 = fdiv float %261, %262
  %264 = fadd float %231, %263
  %265 = add nuw nsw i64 %230, 1
  %266 = icmp eq i64 %265, 10
  br i1 %266, label %267, label %229, !llvm.loop !18

267:                                              ; preds = %260
  %268 = fmul float %172, %264
  br label %310

269:                                              ; preds = %225, %301
  %270 = phi i64 [ %306, %301 ], [ 0, %225 ]
  %271 = phi float [ %305, %301 ], [ 0.000000e+00, %225 ]
  switch i64 %270, label %272 [
    i64 0, label %291
    i64 1, label %281
  ]

272:                                              ; preds = %269, %272
  %273 = phi i64 [ %276, %272 ], [ 0, %269 ]
  %274 = phi float [ %275, %272 ], [ 1.000000e+00, %269 ]
  %275 = fneg float %274
  %276 = add nuw nsw i64 %273, 1
  %277 = icmp samesign ult i64 %276, %270
  br i1 %277, label %272, label %278, !llvm.loop !15

278:                                              ; preds = %272
  %279 = shl nuw nsw i64 %270, 1
  %280 = or disjoint i64 %279, 1
  br label %281

281:                                              ; preds = %278, %269
  %282 = phi i64 [ %280, %278 ], [ 3, %269 ]
  %283 = phi float [ %275, %278 ], [ -1.000000e+00, %269 ]
  %284 = call i64 @llvm.abs.i64(i64 range(i64 -9223372036854775808, 20) %282, i1 true)
  br label %285

285:                                              ; preds = %281, %285
  %286 = phi i64 [ 0, %281 ], [ %289, %285 ]
  %287 = phi float [ 1.000000e+00, %281 ], [ %288, %285 ]
  %288 = fmul float %131, %287
  %289 = add nuw nsw i64 %286, 1
  %290 = icmp samesign ult i64 %289, %284
  br i1 %290, label %285, label %291, !llvm.loop !15

291:                                              ; preds = %285, %269
  %292 = phi i64 [ 1, %269 ], [ %282, %285 ]
  %293 = phi float [ 1.000000e+00, %269 ], [ %283, %285 ]
  %294 = phi float [ %131, %269 ], [ %288, %285 ]
  br label %295

295:                                              ; preds = %291, %295
  %296 = phi i64 [ 1, %291 ], [ %299, %295 ]
  %297 = phi i64 [ 1, %291 ], [ %298, %295 ]
  %298 = mul nuw nsw i64 %296, %297
  %299 = add nuw nsw i64 %296, 1
  %300 = icmp ult i64 %296, %292
  br i1 %300, label %295, label %301, !llvm.loop !16

301:                                              ; preds = %295
  %302 = fmul float %293, %294
  %303 = uitofp nneg i64 %298 to float
  %304 = fdiv float %302, %303
  %305 = fadd float %271, %304
  %306 = add nuw nsw i64 %270, 1
  %307 = icmp eq i64 %306, 10
  br i1 %307, label %308, label %269, !llvm.loop !17

308:                                              ; preds = %301
  %309 = fmul float %172, %305
  br label %310

310:                                              ; preds = %225, %308, %267
  %311 = phi float [ %268, %267 ], [ %309, %308 ], [ 0.000000e+00, %225 ]
  %312 = fsub float %311, %227
  %313 = getelementptr inbounds [3 x float], ptr %1, i64 0, i64 %228
  store float %312, ptr %313, align 4, !tbaa !9
  %314 = add nsw i64 %228, 1
  store i64 %314, ptr %6, align 8, !tbaa !5
  %315 = icmp slt i64 %228, 2
  br i1 %315, label %225, label %216, !llvm.loop !21

316:                                              ; preds = %317
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %7) #4
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %5) #4
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %2) #4
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %1) #4
  ret i32 0

317:                                              ; preds = %39, %317
  %318 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %9, ptr noundef nonnull %7) #4
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %8) #4
  %319 = load float, ptr %318, align 4, !tbaa !9
  %320 = load i64, ptr %7, align 8, !tbaa !5
  %321 = getelementptr inbounds [3 x float], ptr %2, i64 0, i64 %320
  %322 = load float, ptr %321, align 4, !tbaa !9
  %323 = call float @llvm.fmuladd.f32(float %322, float 0.000000e+00, float %319)
  store float %323, ptr %8, align 4, !tbaa !9
  %324 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %10, ptr noundef nonnull %7, ptr noundef nonnull %8, i64 noundef 0) #4
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %8) #4
  %325 = load i64, ptr %7, align 8, !tbaa !5
  %326 = add nsw i64 %325, 1
  store i64 %326, ptr %7, align 8, !tbaa !5
  %327 = icmp slt i64 %325, 2
  br i1 %327, label %317, label %316, !llvm.loop !22
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
!3 = !{i64 2147506359}
!4 = !{i64 2147506871}
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
!17 = distinct !{!17, !12, !13}
!18 = distinct !{!18, !12, !13}
!19 = distinct !{!19, !12, !13}
!20 = distinct !{!20, !12, !13}
!21 = distinct !{!21, !12, !13}
!22 = distinct !{!22, !12, !13}
