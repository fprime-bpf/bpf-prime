; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca [100 x float], align 4
  %2 = alloca [100 x float], align 4
  %3 = alloca [100 x float], align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "=r,i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #4, !srcloc !3
  %7 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "=r,i,i,i,i"(i32 1, i32 0, i32 0, i32 0) #4, !srcloc !4
  %8 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "=r,i,i,i,i"(i32 2, i32 0, i32 0, i32 0) #4, !srcloc !5
  call void @llvm.lifetime.start.p0(i64 400, ptr nonnull %1) #4
  call void @llvm.lifetime.start.p0(i64 400, ptr nonnull %2) #4
  call void @llvm.lifetime.start.p0(i64 400, ptr nonnull %3) #4
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #4
  store i32 0, ptr %4, align 4, !tbaa !6
  br label %209

9:                                                ; preds = %209
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #4
  %10 = load float, ptr %2, align 4, !tbaa !10
  %11 = getelementptr inbounds nuw i8, ptr %2, i64 40
  %12 = load float, ptr %11, align 4, !tbaa !10
  %13 = getelementptr inbounds nuw i8, ptr %2, i64 80
  %14 = load float, ptr %13, align 4, !tbaa !10
  %15 = getelementptr inbounds nuw i8, ptr %2, i64 120
  %16 = load float, ptr %15, align 4, !tbaa !10
  %17 = getelementptr inbounds nuw i8, ptr %2, i64 160
  %18 = load float, ptr %17, align 4, !tbaa !10
  %19 = getelementptr inbounds nuw i8, ptr %2, i64 200
  %20 = load float, ptr %19, align 4, !tbaa !10
  %21 = getelementptr inbounds nuw i8, ptr %2, i64 240
  %22 = load float, ptr %21, align 4, !tbaa !10
  %23 = getelementptr inbounds nuw i8, ptr %2, i64 280
  %24 = load float, ptr %23, align 4, !tbaa !10
  %25 = getelementptr inbounds nuw i8, ptr %2, i64 320
  %26 = load float, ptr %25, align 4, !tbaa !10
  %27 = getelementptr inbounds nuw i8, ptr %2, i64 360
  %28 = load float, ptr %27, align 4, !tbaa !10
  %29 = getelementptr inbounds nuw i8, ptr %2, i64 4
  %30 = load float, ptr %29, align 4, !tbaa !10
  %31 = getelementptr inbounds nuw i8, ptr %2, i64 44
  %32 = load float, ptr %31, align 4, !tbaa !10
  %33 = getelementptr inbounds nuw i8, ptr %2, i64 84
  %34 = load float, ptr %33, align 4, !tbaa !10
  %35 = getelementptr inbounds nuw i8, ptr %2, i64 124
  %36 = load float, ptr %35, align 4, !tbaa !10
  %37 = getelementptr inbounds nuw i8, ptr %2, i64 164
  %38 = load float, ptr %37, align 4, !tbaa !10
  %39 = getelementptr inbounds nuw i8, ptr %2, i64 204
  %40 = load float, ptr %39, align 4, !tbaa !10
  %41 = getelementptr inbounds nuw i8, ptr %2, i64 244
  %42 = load float, ptr %41, align 4, !tbaa !10
  %43 = getelementptr inbounds nuw i8, ptr %2, i64 284
  %44 = load float, ptr %43, align 4, !tbaa !10
  %45 = getelementptr inbounds nuw i8, ptr %2, i64 324
  %46 = load float, ptr %45, align 4, !tbaa !10
  %47 = getelementptr inbounds nuw i8, ptr %2, i64 364
  %48 = load float, ptr %47, align 4, !tbaa !10
  %49 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %50 = load float, ptr %49, align 4, !tbaa !10
  %51 = getelementptr inbounds nuw i8, ptr %2, i64 48
  %52 = load float, ptr %51, align 4, !tbaa !10
  %53 = getelementptr inbounds nuw i8, ptr %2, i64 88
  %54 = load float, ptr %53, align 4, !tbaa !10
  %55 = getelementptr inbounds nuw i8, ptr %2, i64 128
  %56 = load float, ptr %55, align 4, !tbaa !10
  %57 = getelementptr inbounds nuw i8, ptr %2, i64 168
  %58 = load float, ptr %57, align 4, !tbaa !10
  %59 = getelementptr inbounds nuw i8, ptr %2, i64 208
  %60 = load float, ptr %59, align 4, !tbaa !10
  %61 = getelementptr inbounds nuw i8, ptr %2, i64 248
  %62 = load float, ptr %61, align 4, !tbaa !10
  %63 = getelementptr inbounds nuw i8, ptr %2, i64 288
  %64 = load float, ptr %63, align 4, !tbaa !10
  %65 = getelementptr inbounds nuw i8, ptr %2, i64 328
  %66 = load float, ptr %65, align 4, !tbaa !10
  %67 = getelementptr inbounds nuw i8, ptr %2, i64 368
  %68 = load float, ptr %67, align 4, !tbaa !10
  %69 = getelementptr inbounds nuw i8, ptr %2, i64 12
  %70 = load float, ptr %69, align 4, !tbaa !10
  %71 = getelementptr inbounds nuw i8, ptr %2, i64 52
  %72 = load float, ptr %71, align 4, !tbaa !10
  %73 = getelementptr inbounds nuw i8, ptr %2, i64 92
  %74 = load float, ptr %73, align 4, !tbaa !10
  %75 = getelementptr inbounds nuw i8, ptr %2, i64 132
  %76 = load float, ptr %75, align 4, !tbaa !10
  %77 = getelementptr inbounds nuw i8, ptr %2, i64 172
  %78 = load float, ptr %77, align 4, !tbaa !10
  %79 = getelementptr inbounds nuw i8, ptr %2, i64 212
  %80 = load float, ptr %79, align 4, !tbaa !10
  %81 = getelementptr inbounds nuw i8, ptr %2, i64 252
  %82 = load float, ptr %81, align 4, !tbaa !10
  %83 = getelementptr inbounds nuw i8, ptr %2, i64 292
  %84 = load float, ptr %83, align 4, !tbaa !10
  %85 = getelementptr inbounds nuw i8, ptr %2, i64 332
  %86 = load float, ptr %85, align 4, !tbaa !10
  %87 = getelementptr inbounds nuw i8, ptr %2, i64 372
  %88 = load float, ptr %87, align 4, !tbaa !10
  %89 = getelementptr inbounds nuw i8, ptr %2, i64 16
  %90 = load float, ptr %89, align 4, !tbaa !10
  %91 = getelementptr inbounds nuw i8, ptr %2, i64 56
  %92 = load float, ptr %91, align 4, !tbaa !10
  %93 = getelementptr inbounds nuw i8, ptr %2, i64 96
  %94 = load float, ptr %93, align 4, !tbaa !10
  %95 = getelementptr inbounds nuw i8, ptr %2, i64 136
  %96 = load float, ptr %95, align 4, !tbaa !10
  %97 = getelementptr inbounds nuw i8, ptr %2, i64 176
  %98 = load float, ptr %97, align 4, !tbaa !10
  %99 = getelementptr inbounds nuw i8, ptr %2, i64 216
  %100 = load float, ptr %99, align 4, !tbaa !10
  %101 = getelementptr inbounds nuw i8, ptr %2, i64 256
  %102 = load float, ptr %101, align 4, !tbaa !10
  %103 = getelementptr inbounds nuw i8, ptr %2, i64 296
  %104 = load float, ptr %103, align 4, !tbaa !10
  %105 = getelementptr inbounds nuw i8, ptr %2, i64 336
  %106 = load float, ptr %105, align 4, !tbaa !10
  %107 = getelementptr inbounds nuw i8, ptr %2, i64 376
  %108 = load float, ptr %107, align 4, !tbaa !10
  %109 = getelementptr inbounds nuw i8, ptr %2, i64 20
  %110 = load float, ptr %109, align 4, !tbaa !10
  %111 = getelementptr inbounds nuw i8, ptr %2, i64 60
  %112 = load float, ptr %111, align 4, !tbaa !10
  %113 = getelementptr inbounds nuw i8, ptr %2, i64 100
  %114 = load float, ptr %113, align 4, !tbaa !10
  %115 = getelementptr inbounds nuw i8, ptr %2, i64 140
  %116 = load float, ptr %115, align 4, !tbaa !10
  %117 = getelementptr inbounds nuw i8, ptr %2, i64 180
  %118 = load float, ptr %117, align 4, !tbaa !10
  %119 = getelementptr inbounds nuw i8, ptr %2, i64 220
  %120 = load float, ptr %119, align 4, !tbaa !10
  %121 = getelementptr inbounds nuw i8, ptr %2, i64 260
  %122 = load float, ptr %121, align 4, !tbaa !10
  %123 = getelementptr inbounds nuw i8, ptr %2, i64 300
  %124 = load float, ptr %123, align 4, !tbaa !10
  %125 = getelementptr inbounds nuw i8, ptr %2, i64 340
  %126 = load float, ptr %125, align 4, !tbaa !10
  %127 = getelementptr inbounds nuw i8, ptr %2, i64 380
  %128 = load float, ptr %127, align 4, !tbaa !10
  %129 = getelementptr inbounds nuw i8, ptr %2, i64 24
  %130 = load float, ptr %129, align 4, !tbaa !10
  %131 = getelementptr inbounds nuw i8, ptr %2, i64 64
  %132 = load float, ptr %131, align 4, !tbaa !10
  %133 = getelementptr inbounds nuw i8, ptr %2, i64 104
  %134 = load float, ptr %133, align 4, !tbaa !10
  %135 = getelementptr inbounds nuw i8, ptr %2, i64 144
  %136 = load float, ptr %135, align 4, !tbaa !10
  %137 = getelementptr inbounds nuw i8, ptr %2, i64 184
  %138 = load float, ptr %137, align 4, !tbaa !10
  %139 = getelementptr inbounds nuw i8, ptr %2, i64 224
  %140 = load float, ptr %139, align 4, !tbaa !10
  %141 = getelementptr inbounds nuw i8, ptr %2, i64 264
  %142 = load float, ptr %141, align 4, !tbaa !10
  %143 = getelementptr inbounds nuw i8, ptr %2, i64 304
  %144 = load float, ptr %143, align 4, !tbaa !10
  %145 = getelementptr inbounds nuw i8, ptr %2, i64 344
  %146 = load float, ptr %145, align 4, !tbaa !10
  %147 = getelementptr inbounds nuw i8, ptr %2, i64 384
  %148 = load float, ptr %147, align 4, !tbaa !10
  %149 = getelementptr inbounds nuw i8, ptr %2, i64 28
  %150 = load float, ptr %149, align 4, !tbaa !10
  %151 = getelementptr inbounds nuw i8, ptr %2, i64 68
  %152 = load float, ptr %151, align 4, !tbaa !10
  %153 = getelementptr inbounds nuw i8, ptr %2, i64 108
  %154 = load float, ptr %153, align 4, !tbaa !10
  %155 = getelementptr inbounds nuw i8, ptr %2, i64 148
  %156 = load float, ptr %155, align 4, !tbaa !10
  %157 = getelementptr inbounds nuw i8, ptr %2, i64 188
  %158 = load float, ptr %157, align 4, !tbaa !10
  %159 = getelementptr inbounds nuw i8, ptr %2, i64 228
  %160 = load float, ptr %159, align 4, !tbaa !10
  %161 = getelementptr inbounds nuw i8, ptr %2, i64 268
  %162 = load float, ptr %161, align 4, !tbaa !10
  %163 = getelementptr inbounds nuw i8, ptr %2, i64 308
  %164 = load float, ptr %163, align 4, !tbaa !10
  %165 = getelementptr inbounds nuw i8, ptr %2, i64 348
  %166 = load float, ptr %165, align 4, !tbaa !10
  %167 = getelementptr inbounds nuw i8, ptr %2, i64 388
  %168 = load float, ptr %167, align 4, !tbaa !10
  %169 = getelementptr inbounds nuw i8, ptr %2, i64 32
  %170 = load float, ptr %169, align 4, !tbaa !10
  %171 = getelementptr inbounds nuw i8, ptr %2, i64 72
  %172 = load float, ptr %171, align 4, !tbaa !10
  %173 = getelementptr inbounds nuw i8, ptr %2, i64 112
  %174 = load float, ptr %173, align 4, !tbaa !10
  %175 = getelementptr inbounds nuw i8, ptr %2, i64 152
  %176 = load float, ptr %175, align 4, !tbaa !10
  %177 = getelementptr inbounds nuw i8, ptr %2, i64 192
  %178 = load float, ptr %177, align 4, !tbaa !10
  %179 = getelementptr inbounds nuw i8, ptr %2, i64 232
  %180 = load float, ptr %179, align 4, !tbaa !10
  %181 = getelementptr inbounds nuw i8, ptr %2, i64 272
  %182 = load float, ptr %181, align 4, !tbaa !10
  %183 = getelementptr inbounds nuw i8, ptr %2, i64 312
  %184 = load float, ptr %183, align 4, !tbaa !10
  %185 = getelementptr inbounds nuw i8, ptr %2, i64 352
  %186 = load float, ptr %185, align 4, !tbaa !10
  %187 = getelementptr inbounds nuw i8, ptr %2, i64 392
  %188 = load float, ptr %187, align 4, !tbaa !10
  %189 = getelementptr inbounds nuw i8, ptr %2, i64 36
  %190 = load float, ptr %189, align 4, !tbaa !10
  %191 = getelementptr inbounds nuw i8, ptr %2, i64 76
  %192 = load float, ptr %191, align 4, !tbaa !10
  %193 = getelementptr inbounds nuw i8, ptr %2, i64 116
  %194 = load float, ptr %193, align 4, !tbaa !10
  %195 = getelementptr inbounds nuw i8, ptr %2, i64 156
  %196 = load float, ptr %195, align 4, !tbaa !10
  %197 = getelementptr inbounds nuw i8, ptr %2, i64 196
  %198 = load float, ptr %197, align 4, !tbaa !10
  %199 = getelementptr inbounds nuw i8, ptr %2, i64 236
  %200 = load float, ptr %199, align 4, !tbaa !10
  %201 = getelementptr inbounds nuw i8, ptr %2, i64 276
  %202 = load float, ptr %201, align 4, !tbaa !10
  %203 = getelementptr inbounds nuw i8, ptr %2, i64 316
  %204 = load float, ptr %203, align 4, !tbaa !10
  %205 = getelementptr inbounds nuw i8, ptr %2, i64 356
  %206 = load float, ptr %205, align 4, !tbaa !10
  %207 = getelementptr inbounds nuw i8, ptr %2, i64 396
  %208 = load float, ptr %207, align 4, !tbaa !10
  br label %222

209:                                              ; preds = %0, %209
  %210 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %6, ptr noundef nonnull %4) #4
  %211 = load float, ptr %210, align 4, !tbaa !10
  %212 = load i32, ptr %4, align 4, !tbaa !6
  %213 = sext i32 %212 to i64
  %214 = getelementptr inbounds [100 x float], ptr %1, i64 0, i64 %213
  store float %211, ptr %214, align 4, !tbaa !10
  %215 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %7, ptr noundef nonnull %4) #4
  %216 = load float, ptr %215, align 4, !tbaa !10
  %217 = load i32, ptr %4, align 4, !tbaa !6
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds [100 x float], ptr %2, i64 0, i64 %218
  store float %216, ptr %219, align 4, !tbaa !10
  %220 = add nsw i32 %217, 1
  store i32 %220, ptr %4, align 4, !tbaa !6
  %221 = icmp slt i32 %217, 99
  br i1 %221, label %209, label %9, !llvm.loop !12

222:                                              ; preds = %9, %222
  %223 = phi i64 [ 0, %9 ], [ %394, %222 ]
  %224 = mul nuw nsw i64 %223, 10
  %225 = getelementptr inbounds nuw [100 x float], ptr %1, i64 0, i64 %224
  %226 = getelementptr inbounds nuw [100 x float], ptr %3, i64 0, i64 %224
  %227 = load float, ptr %225, align 4, !tbaa !10
  %228 = call float @llvm.fmuladd.f32(float %227, float %10, float 0.000000e+00)
  %229 = or disjoint i64 %224, 1
  %230 = getelementptr inbounds nuw [100 x float], ptr %1, i64 0, i64 %229
  %231 = load float, ptr %230, align 4, !tbaa !10
  %232 = call float @llvm.fmuladd.f32(float %231, float %12, float %228)
  %233 = add nuw nsw i64 %224, 2
  %234 = getelementptr inbounds nuw [100 x float], ptr %1, i64 0, i64 %233
  %235 = load float, ptr %234, align 4, !tbaa !10
  %236 = call float @llvm.fmuladd.f32(float %235, float %14, float %232)
  %237 = add nuw nsw i64 %224, 3
  %238 = getelementptr inbounds nuw [100 x float], ptr %1, i64 0, i64 %237
  %239 = load float, ptr %238, align 4, !tbaa !10
  %240 = call float @llvm.fmuladd.f32(float %239, float %16, float %236)
  %241 = add nuw nsw i64 %224, 4
  %242 = getelementptr inbounds nuw [100 x float], ptr %1, i64 0, i64 %241
  %243 = load float, ptr %242, align 4, !tbaa !10
  %244 = call float @llvm.fmuladd.f32(float %243, float %18, float %240)
  %245 = add nuw nsw i64 %224, 5
  %246 = getelementptr inbounds nuw [100 x float], ptr %1, i64 0, i64 %245
  %247 = load float, ptr %246, align 4, !tbaa !10
  %248 = call float @llvm.fmuladd.f32(float %247, float %20, float %244)
  %249 = add nuw nsw i64 %224, 6
  %250 = getelementptr inbounds nuw [100 x float], ptr %1, i64 0, i64 %249
  %251 = load float, ptr %250, align 4, !tbaa !10
  %252 = call float @llvm.fmuladd.f32(float %251, float %22, float %248)
  %253 = add nuw nsw i64 %224, 7
  %254 = getelementptr inbounds nuw [100 x float], ptr %1, i64 0, i64 %253
  %255 = load float, ptr %254, align 4, !tbaa !10
  %256 = call float @llvm.fmuladd.f32(float %255, float %24, float %252)
  %257 = add nuw nsw i64 %224, 8
  %258 = getelementptr inbounds nuw [100 x float], ptr %1, i64 0, i64 %257
  %259 = load float, ptr %258, align 4, !tbaa !10
  %260 = call float @llvm.fmuladd.f32(float %259, float %26, float %256)
  %261 = add nuw nsw i64 %224, 9
  %262 = getelementptr inbounds nuw [100 x float], ptr %1, i64 0, i64 %261
  %263 = load float, ptr %262, align 4, !tbaa !10
  %264 = call float @llvm.fmuladd.f32(float %263, float %28, float %260)
  store float %264, ptr %226, align 4, !tbaa !10
  %265 = getelementptr inbounds nuw [100 x float], ptr %3, i64 0, i64 %229
  %266 = call float @llvm.fmuladd.f32(float %227, float %30, float 0.000000e+00)
  %267 = call float @llvm.fmuladd.f32(float %231, float %32, float %266)
  %268 = call float @llvm.fmuladd.f32(float %235, float %34, float %267)
  %269 = call float @llvm.fmuladd.f32(float %239, float %36, float %268)
  %270 = call float @llvm.fmuladd.f32(float %243, float %38, float %269)
  %271 = call float @llvm.fmuladd.f32(float %247, float %40, float %270)
  %272 = call float @llvm.fmuladd.f32(float %251, float %42, float %271)
  %273 = call float @llvm.fmuladd.f32(float %255, float %44, float %272)
  %274 = call float @llvm.fmuladd.f32(float %259, float %46, float %273)
  %275 = call float @llvm.fmuladd.f32(float %263, float %48, float %274)
  store float %275, ptr %265, align 4, !tbaa !10
  %276 = getelementptr inbounds nuw [100 x float], ptr %3, i64 0, i64 %233
  %277 = call float @llvm.fmuladd.f32(float %227, float %50, float 0.000000e+00)
  %278 = call float @llvm.fmuladd.f32(float %231, float %52, float %277)
  %279 = call float @llvm.fmuladd.f32(float %235, float %54, float %278)
  %280 = call float @llvm.fmuladd.f32(float %239, float %56, float %279)
  %281 = call float @llvm.fmuladd.f32(float %243, float %58, float %280)
  %282 = call float @llvm.fmuladd.f32(float %247, float %60, float %281)
  %283 = call float @llvm.fmuladd.f32(float %251, float %62, float %282)
  %284 = call float @llvm.fmuladd.f32(float %255, float %64, float %283)
  %285 = call float @llvm.fmuladd.f32(float %259, float %66, float %284)
  %286 = call float @llvm.fmuladd.f32(float %263, float %68, float %285)
  store float %286, ptr %276, align 4, !tbaa !10
  %287 = getelementptr inbounds nuw [100 x float], ptr %3, i64 0, i64 %237
  %288 = load float, ptr %225, align 4, !tbaa !10
  %289 = call float @llvm.fmuladd.f32(float %288, float %70, float 0.000000e+00)
  %290 = load float, ptr %230, align 4, !tbaa !10
  %291 = call float @llvm.fmuladd.f32(float %290, float %72, float %289)
  %292 = load float, ptr %234, align 4, !tbaa !10
  %293 = call float @llvm.fmuladd.f32(float %292, float %74, float %291)
  %294 = load float, ptr %238, align 4, !tbaa !10
  %295 = call float @llvm.fmuladd.f32(float %294, float %76, float %293)
  %296 = load float, ptr %242, align 4, !tbaa !10
  %297 = call float @llvm.fmuladd.f32(float %296, float %78, float %295)
  %298 = load float, ptr %246, align 4, !tbaa !10
  %299 = call float @llvm.fmuladd.f32(float %298, float %80, float %297)
  %300 = load float, ptr %250, align 4, !tbaa !10
  %301 = call float @llvm.fmuladd.f32(float %300, float %82, float %299)
  %302 = load float, ptr %254, align 4, !tbaa !10
  %303 = call float @llvm.fmuladd.f32(float %302, float %84, float %301)
  %304 = load float, ptr %258, align 4, !tbaa !10
  %305 = call float @llvm.fmuladd.f32(float %304, float %86, float %303)
  %306 = load float, ptr %262, align 4, !tbaa !10
  %307 = call float @llvm.fmuladd.f32(float %306, float %88, float %305)
  store float %307, ptr %287, align 4, !tbaa !10
  %308 = getelementptr inbounds nuw [100 x float], ptr %3, i64 0, i64 %241
  %309 = call float @llvm.fmuladd.f32(float %288, float %90, float 0.000000e+00)
  %310 = call float @llvm.fmuladd.f32(float %290, float %92, float %309)
  %311 = call float @llvm.fmuladd.f32(float %292, float %94, float %310)
  %312 = call float @llvm.fmuladd.f32(float %294, float %96, float %311)
  %313 = call float @llvm.fmuladd.f32(float %296, float %98, float %312)
  %314 = call float @llvm.fmuladd.f32(float %298, float %100, float %313)
  %315 = call float @llvm.fmuladd.f32(float %300, float %102, float %314)
  %316 = call float @llvm.fmuladd.f32(float %302, float %104, float %315)
  %317 = call float @llvm.fmuladd.f32(float %304, float %106, float %316)
  %318 = call float @llvm.fmuladd.f32(float %306, float %108, float %317)
  store float %318, ptr %308, align 4, !tbaa !10
  %319 = getelementptr inbounds nuw [100 x float], ptr %3, i64 0, i64 %245
  %320 = call float @llvm.fmuladd.f32(float %288, float %110, float 0.000000e+00)
  %321 = call float @llvm.fmuladd.f32(float %290, float %112, float %320)
  %322 = call float @llvm.fmuladd.f32(float %292, float %114, float %321)
  %323 = call float @llvm.fmuladd.f32(float %294, float %116, float %322)
  %324 = call float @llvm.fmuladd.f32(float %296, float %118, float %323)
  %325 = call float @llvm.fmuladd.f32(float %298, float %120, float %324)
  %326 = call float @llvm.fmuladd.f32(float %300, float %122, float %325)
  %327 = call float @llvm.fmuladd.f32(float %302, float %124, float %326)
  %328 = call float @llvm.fmuladd.f32(float %304, float %126, float %327)
  %329 = call float @llvm.fmuladd.f32(float %306, float %128, float %328)
  store float %329, ptr %319, align 4, !tbaa !10
  %330 = getelementptr inbounds nuw [100 x float], ptr %3, i64 0, i64 %249
  %331 = load float, ptr %225, align 4, !tbaa !10
  %332 = call float @llvm.fmuladd.f32(float %331, float %130, float 0.000000e+00)
  %333 = load float, ptr %230, align 4, !tbaa !10
  %334 = call float @llvm.fmuladd.f32(float %333, float %132, float %332)
  %335 = load float, ptr %234, align 4, !tbaa !10
  %336 = call float @llvm.fmuladd.f32(float %335, float %134, float %334)
  %337 = load float, ptr %238, align 4, !tbaa !10
  %338 = call float @llvm.fmuladd.f32(float %337, float %136, float %336)
  %339 = load float, ptr %242, align 4, !tbaa !10
  %340 = call float @llvm.fmuladd.f32(float %339, float %138, float %338)
  %341 = load float, ptr %246, align 4, !tbaa !10
  %342 = call float @llvm.fmuladd.f32(float %341, float %140, float %340)
  %343 = load float, ptr %250, align 4, !tbaa !10
  %344 = call float @llvm.fmuladd.f32(float %343, float %142, float %342)
  %345 = load float, ptr %254, align 4, !tbaa !10
  %346 = call float @llvm.fmuladd.f32(float %345, float %144, float %344)
  %347 = load float, ptr %258, align 4, !tbaa !10
  %348 = call float @llvm.fmuladd.f32(float %347, float %146, float %346)
  %349 = load float, ptr %262, align 4, !tbaa !10
  %350 = call float @llvm.fmuladd.f32(float %349, float %148, float %348)
  store float %350, ptr %330, align 4, !tbaa !10
  %351 = getelementptr inbounds nuw [100 x float], ptr %3, i64 0, i64 %253
  %352 = call float @llvm.fmuladd.f32(float %331, float %150, float 0.000000e+00)
  %353 = call float @llvm.fmuladd.f32(float %333, float %152, float %352)
  %354 = call float @llvm.fmuladd.f32(float %335, float %154, float %353)
  %355 = call float @llvm.fmuladd.f32(float %337, float %156, float %354)
  %356 = call float @llvm.fmuladd.f32(float %339, float %158, float %355)
  %357 = call float @llvm.fmuladd.f32(float %341, float %160, float %356)
  %358 = call float @llvm.fmuladd.f32(float %343, float %162, float %357)
  %359 = call float @llvm.fmuladd.f32(float %345, float %164, float %358)
  %360 = call float @llvm.fmuladd.f32(float %347, float %166, float %359)
  %361 = call float @llvm.fmuladd.f32(float %349, float %168, float %360)
  store float %361, ptr %351, align 4, !tbaa !10
  %362 = getelementptr inbounds nuw [100 x float], ptr %3, i64 0, i64 %257
  %363 = call float @llvm.fmuladd.f32(float %331, float %170, float 0.000000e+00)
  %364 = call float @llvm.fmuladd.f32(float %333, float %172, float %363)
  %365 = call float @llvm.fmuladd.f32(float %335, float %174, float %364)
  %366 = call float @llvm.fmuladd.f32(float %337, float %176, float %365)
  %367 = call float @llvm.fmuladd.f32(float %339, float %178, float %366)
  %368 = call float @llvm.fmuladd.f32(float %341, float %180, float %367)
  %369 = call float @llvm.fmuladd.f32(float %343, float %182, float %368)
  %370 = call float @llvm.fmuladd.f32(float %345, float %184, float %369)
  %371 = call float @llvm.fmuladd.f32(float %347, float %186, float %370)
  %372 = call float @llvm.fmuladd.f32(float %349, float %188, float %371)
  store float %372, ptr %362, align 4, !tbaa !10
  %373 = getelementptr inbounds nuw [100 x float], ptr %3, i64 0, i64 %261
  %374 = load float, ptr %225, align 4, !tbaa !10
  %375 = call float @llvm.fmuladd.f32(float %374, float %190, float 0.000000e+00)
  %376 = load float, ptr %230, align 4, !tbaa !10
  %377 = call float @llvm.fmuladd.f32(float %376, float %192, float %375)
  %378 = load float, ptr %234, align 4, !tbaa !10
  %379 = call float @llvm.fmuladd.f32(float %378, float %194, float %377)
  %380 = load float, ptr %238, align 4, !tbaa !10
  %381 = call float @llvm.fmuladd.f32(float %380, float %196, float %379)
  %382 = load float, ptr %242, align 4, !tbaa !10
  %383 = call float @llvm.fmuladd.f32(float %382, float %198, float %381)
  %384 = load float, ptr %246, align 4, !tbaa !10
  %385 = call float @llvm.fmuladd.f32(float %384, float %200, float %383)
  %386 = load float, ptr %250, align 4, !tbaa !10
  %387 = call float @llvm.fmuladd.f32(float %386, float %202, float %385)
  %388 = load float, ptr %254, align 4, !tbaa !10
  %389 = call float @llvm.fmuladd.f32(float %388, float %204, float %387)
  %390 = load float, ptr %258, align 4, !tbaa !10
  %391 = call float @llvm.fmuladd.f32(float %390, float %206, float %389)
  %392 = load float, ptr %262, align 4, !tbaa !10
  %393 = call float @llvm.fmuladd.f32(float %392, float %208, float %391)
  store float %393, ptr %373, align 4, !tbaa !10
  %394 = add nuw nsw i64 %223, 1
  %395 = icmp eq i64 %394, 10
  br i1 %395, label %396, label %222, !llvm.loop !14

396:                                              ; preds = %222
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %5) #4
  store i32 0, ptr %5, align 4, !tbaa !6
  br label %398

397:                                              ; preds = %398
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %5) #4
  call void @llvm.lifetime.end.p0(i64 400, ptr nonnull %3) #4
  call void @llvm.lifetime.end.p0(i64 400, ptr nonnull %2) #4
  call void @llvm.lifetime.end.p0(i64 400, ptr nonnull %1) #4
  ret i32 0

398:                                              ; preds = %396, %398
  %399 = phi i32 [ 0, %396 ], [ %405, %398 ]
  %400 = call i32 @llvm.bpf.passthrough.i32.i32(i32 0, i32 %399)
  %401 = sext i32 %400 to i64
  %402 = getelementptr inbounds [100 x float], ptr %3, i64 0, i64 %401
  %403 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %8, ptr noundef nonnull %5, ptr noundef nonnull %402, i64 noundef 0) #4
  %404 = load i32, ptr %5, align 4, !tbaa !6
  %405 = add nsw i32 %404, 1
  store i32 %405, ptr %5, align 4, !tbaa !6
  %406 = icmp slt i32 %404, 99
  br i1 %406, label %398, label %397, !llvm.loop !15
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: nounwind memory(none)
declare i32 @llvm.bpf.passthrough.i32.i32(i32, i32) #3

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="duotronic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nounwind memory(none) }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 755f040f24df9a74f4e5f7f7bdd64e3acd4e61b9)"}
!3 = !{i64 2147501834}
!4 = !{i64 2147502272}
!5 = !{i64 2147502710}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !8, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
!15 = distinct !{!15, !13}
