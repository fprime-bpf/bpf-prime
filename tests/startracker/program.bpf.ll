; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca [4 x float], align 4
  %13 = alloca [4 x float], align 4
  %14 = alloca [6 x float], align 4
  %15 = alloca float, align 4
  %16 = alloca [5 x i64], align 8
  %17 = alloca i64, align 8
  %18 = alloca i64, align 8
  %19 = alloca i64, align 8
  %20 = alloca float, align 4
  %21 = alloca float, align 4
  %22 = alloca i64, align 8
  %23 = alloca i64, align 8
  %24 = alloca i64, align 8
  store i32 0, ptr %1, align 4
  %25 = call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #3, !srcloc !3
  store ptr %25, ptr %3, align 8
  %26 = load ptr, ptr %3, align 8
  store ptr %26, ptr %4, align 8
  %27 = load ptr, ptr %4, align 8
  store ptr %27, ptr %2, align 8
  %28 = call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 1, i32 0, i32 0, i32 0) #3, !srcloc !4
  store ptr %28, ptr %6, align 8
  %29 = load ptr, ptr %6, align 8
  store ptr %29, ptr %7, align 8
  %30 = load ptr, ptr %7, align 8
  store ptr %30, ptr %5, align 8
  %31 = call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 2, i32 0, i32 0, i32 0) #3, !srcloc !5
  store ptr %31, ptr %9, align 8
  %32 = load ptr, ptr %9, align 8
  store ptr %32, ptr %10, align 8
  %33 = load ptr, ptr %10, align 8
  store ptr %33, ptr %8, align 8
  store i64 0, ptr %17, align 8
  br label %34

34:                                               ; preds = %50, %0
  %35 = load i64, ptr %17, align 8
  %36 = icmp slt i64 %35, 4
  br i1 %36, label %37, label %53

37:                                               ; preds = %34
  %38 = load ptr, ptr %2, align 8
  %39 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %38, ptr noundef %17)
  store ptr %39, ptr %11, align 8
  %40 = load ptr, ptr %11, align 8
  %41 = load float, ptr %40, align 4
  %42 = load i64, ptr %17, align 8
  %43 = getelementptr inbounds [4 x float], ptr %12, i64 0, i64 %42
  store float %41, ptr %43, align 4
  %44 = load ptr, ptr %5, align 8
  %45 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %44, ptr noundef %17)
  store ptr %45, ptr %11, align 8
  %46 = load ptr, ptr %11, align 8
  %47 = load float, ptr %46, align 4
  %48 = load i64, ptr %17, align 8
  %49 = getelementptr inbounds [4 x float], ptr %13, i64 0, i64 %48
  store float %47, ptr %49, align 4
  br label %50

50:                                               ; preds = %37
  %51 = load i64, ptr %17, align 8
  %52 = add nsw i64 %51, 1
  store i64 %52, ptr %17, align 8
  br label %34, !llvm.loop !6

53:                                               ; preds = %34
  %54 = getelementptr inbounds [4 x float], ptr %12, i64 0, i64 0
  %55 = load float, ptr %54, align 4
  %56 = getelementptr inbounds [4 x float], ptr %12, i64 0, i64 1
  %57 = load float, ptr %56, align 4
  %58 = fsub float %55, %57
  %59 = getelementptr inbounds [4 x float], ptr %12, i64 0, i64 0
  %60 = load float, ptr %59, align 4
  %61 = getelementptr inbounds [4 x float], ptr %12, i64 0, i64 1
  %62 = load float, ptr %61, align 4
  %63 = fsub float %60, %62
  %64 = getelementptr inbounds [4 x float], ptr %13, i64 0, i64 0
  %65 = load float, ptr %64, align 4
  %66 = getelementptr inbounds [4 x float], ptr %13, i64 0, i64 1
  %67 = load float, ptr %66, align 4
  %68 = fsub float %65, %67
  %69 = getelementptr inbounds [4 x float], ptr %13, i64 0, i64 0
  %70 = load float, ptr %69, align 4
  %71 = getelementptr inbounds [4 x float], ptr %13, i64 0, i64 1
  %72 = load float, ptr %71, align 4
  %73 = fsub float %70, %72
  %74 = fmul float %68, %73
  %75 = call float @llvm.fmuladd.f32(float %58, float %63, float %74)
  %76 = call float @sqroot(float noundef %75)
  %77 = getelementptr inbounds [6 x float], ptr %14, i64 0, i64 0
  store float %76, ptr %77, align 4
  %78 = getelementptr inbounds [4 x float], ptr %12, i64 0, i64 1
  %79 = load float, ptr %78, align 4
  %80 = getelementptr inbounds [4 x float], ptr %12, i64 0, i64 2
  %81 = load float, ptr %80, align 4
  %82 = fsub float %79, %81
  %83 = getelementptr inbounds [4 x float], ptr %12, i64 0, i64 1
  %84 = load float, ptr %83, align 4
  %85 = getelementptr inbounds [4 x float], ptr %12, i64 0, i64 2
  %86 = load float, ptr %85, align 4
  %87 = fsub float %84, %86
  %88 = getelementptr inbounds [4 x float], ptr %13, i64 0, i64 1
  %89 = load float, ptr %88, align 4
  %90 = getelementptr inbounds [4 x float], ptr %13, i64 0, i64 2
  %91 = load float, ptr %90, align 4
  %92 = fsub float %89, %91
  %93 = getelementptr inbounds [4 x float], ptr %13, i64 0, i64 1
  %94 = load float, ptr %93, align 4
  %95 = getelementptr inbounds [4 x float], ptr %13, i64 0, i64 2
  %96 = load float, ptr %95, align 4
  %97 = fsub float %94, %96
  %98 = fmul float %92, %97
  %99 = call float @llvm.fmuladd.f32(float %82, float %87, float %98)
  %100 = call float @sqroot(float noundef %99)
  %101 = getelementptr inbounds [6 x float], ptr %14, i64 0, i64 1
  store float %100, ptr %101, align 4
  %102 = getelementptr inbounds [4 x float], ptr %12, i64 0, i64 2
  %103 = load float, ptr %102, align 4
  %104 = getelementptr inbounds [4 x float], ptr %12, i64 0, i64 3
  %105 = load float, ptr %104, align 4
  %106 = fsub float %103, %105
  %107 = getelementptr inbounds [4 x float], ptr %12, i64 0, i64 2
  %108 = load float, ptr %107, align 4
  %109 = getelementptr inbounds [4 x float], ptr %12, i64 0, i64 3
  %110 = load float, ptr %109, align 4
  %111 = fsub float %108, %110
  %112 = getelementptr inbounds [4 x float], ptr %13, i64 0, i64 2
  %113 = load float, ptr %112, align 4
  %114 = getelementptr inbounds [4 x float], ptr %13, i64 0, i64 3
  %115 = load float, ptr %114, align 4
  %116 = fsub float %113, %115
  %117 = getelementptr inbounds [4 x float], ptr %13, i64 0, i64 2
  %118 = load float, ptr %117, align 4
  %119 = getelementptr inbounds [4 x float], ptr %13, i64 0, i64 3
  %120 = load float, ptr %119, align 4
  %121 = fsub float %118, %120
  %122 = fmul float %116, %121
  %123 = call float @llvm.fmuladd.f32(float %106, float %111, float %122)
  %124 = call float @sqroot(float noundef %123)
  %125 = getelementptr inbounds [6 x float], ptr %14, i64 0, i64 2
  store float %124, ptr %125, align 4
  %126 = getelementptr inbounds [4 x float], ptr %12, i64 0, i64 1
  %127 = load float, ptr %126, align 4
  %128 = getelementptr inbounds [4 x float], ptr %12, i64 0, i64 3
  %129 = load float, ptr %128, align 4
  %130 = fsub float %127, %129
  %131 = getelementptr inbounds [4 x float], ptr %12, i64 0, i64 1
  %132 = load float, ptr %131, align 4
  %133 = getelementptr inbounds [4 x float], ptr %12, i64 0, i64 3
  %134 = load float, ptr %133, align 4
  %135 = fsub float %132, %134
  %136 = getelementptr inbounds [4 x float], ptr %13, i64 0, i64 1
  %137 = load float, ptr %136, align 4
  %138 = getelementptr inbounds [4 x float], ptr %13, i64 0, i64 3
  %139 = load float, ptr %138, align 4
  %140 = fsub float %137, %139
  %141 = getelementptr inbounds [4 x float], ptr %13, i64 0, i64 1
  %142 = load float, ptr %141, align 4
  %143 = getelementptr inbounds [4 x float], ptr %13, i64 0, i64 3
  %144 = load float, ptr %143, align 4
  %145 = fsub float %142, %144
  %146 = fmul float %140, %145
  %147 = call float @llvm.fmuladd.f32(float %130, float %135, float %146)
  %148 = call float @sqroot(float noundef %147)
  %149 = getelementptr inbounds [6 x float], ptr %14, i64 0, i64 3
  store float %148, ptr %149, align 4
  %150 = getelementptr inbounds [4 x float], ptr %12, i64 0, i64 0
  %151 = load float, ptr %150, align 4
  %152 = getelementptr inbounds [4 x float], ptr %12, i64 0, i64 2
  %153 = load float, ptr %152, align 4
  %154 = fsub float %151, %153
  %155 = getelementptr inbounds [4 x float], ptr %12, i64 0, i64 0
  %156 = load float, ptr %155, align 4
  %157 = getelementptr inbounds [4 x float], ptr %12, i64 0, i64 2
  %158 = load float, ptr %157, align 4
  %159 = fsub float %156, %158
  %160 = getelementptr inbounds [4 x float], ptr %13, i64 0, i64 0
  %161 = load float, ptr %160, align 4
  %162 = getelementptr inbounds [4 x float], ptr %13, i64 0, i64 2
  %163 = load float, ptr %162, align 4
  %164 = fsub float %161, %163
  %165 = getelementptr inbounds [4 x float], ptr %13, i64 0, i64 0
  %166 = load float, ptr %165, align 4
  %167 = getelementptr inbounds [4 x float], ptr %13, i64 0, i64 2
  %168 = load float, ptr %167, align 4
  %169 = fsub float %166, %168
  %170 = fmul float %164, %169
  %171 = call float @llvm.fmuladd.f32(float %154, float %159, float %170)
  %172 = call float @sqroot(float noundef %171)
  %173 = getelementptr inbounds [6 x float], ptr %14, i64 0, i64 4
  store float %172, ptr %173, align 4
  %174 = getelementptr inbounds [4 x float], ptr %12, i64 0, i64 0
  %175 = load float, ptr %174, align 4
  %176 = getelementptr inbounds [4 x float], ptr %12, i64 0, i64 3
  %177 = load float, ptr %176, align 4
  %178 = fsub float %175, %177
  %179 = getelementptr inbounds [4 x float], ptr %12, i64 0, i64 0
  %180 = load float, ptr %179, align 4
  %181 = getelementptr inbounds [4 x float], ptr %12, i64 0, i64 3
  %182 = load float, ptr %181, align 4
  %183 = fsub float %180, %182
  %184 = getelementptr inbounds [4 x float], ptr %13, i64 0, i64 0
  %185 = load float, ptr %184, align 4
  %186 = getelementptr inbounds [4 x float], ptr %13, i64 0, i64 3
  %187 = load float, ptr %186, align 4
  %188 = fsub float %185, %187
  %189 = getelementptr inbounds [4 x float], ptr %13, i64 0, i64 0
  %190 = load float, ptr %189, align 4
  %191 = getelementptr inbounds [4 x float], ptr %13, i64 0, i64 3
  %192 = load float, ptr %191, align 4
  %193 = fsub float %190, %192
  %194 = fmul float %188, %193
  %195 = call float @llvm.fmuladd.f32(float %178, float %183, float %194)
  %196 = call float @sqroot(float noundef %195)
  %197 = getelementptr inbounds [6 x float], ptr %14, i64 0, i64 5
  store float %196, ptr %197, align 4
  store i64 0, ptr %18, align 8
  store i64 0, ptr %19, align 8
  br label %198

198:                                              ; preds = %216, %53
  %199 = load i64, ptr %19, align 8
  %200 = icmp slt i64 %199, 6
  br i1 %200, label %201, label %219

201:                                              ; preds = %198
  %202 = load i64, ptr %19, align 8
  %203 = getelementptr inbounds [6 x float], ptr %14, i64 0, i64 %202
  %204 = load float, ptr %203, align 4
  %205 = fmul float %204, 1.000000e+04
  store float %205, ptr %20, align 4
  %206 = load i64, ptr %18, align 8
  %207 = getelementptr inbounds [6 x float], ptr %14, i64 0, i64 %206
  %208 = load float, ptr %207, align 4
  %209 = fmul float %208, 1.000000e+04
  store float %209, ptr %21, align 4
  %210 = load i64, ptr %20, align 4
  %211 = load i64, ptr %21, align 4
  %212 = icmp sgt i64 %210, %211
  br i1 %212, label %213, label %215

213:                                              ; preds = %201
  %214 = load i64, ptr %19, align 8
  store i64 %214, ptr %18, align 8
  br label %215

215:                                              ; preds = %213, %201
  br label %216

216:                                              ; preds = %215
  %217 = load i64, ptr %19, align 8
  %218 = add nsw i64 %217, 1
  store i64 %218, ptr %19, align 8
  br label %198, !llvm.loop !8

219:                                              ; preds = %198
  store i64 0, ptr %22, align 8
  br label %220

220:                                              ; preds = %233, %219
  %221 = load i64, ptr %22, align 8
  %222 = icmp slt i64 %221, 6
  br i1 %222, label %223, label %236

223:                                              ; preds = %220
  %224 = load i64, ptr %22, align 8
  %225 = getelementptr inbounds [6 x float], ptr %14, i64 0, i64 %224
  %226 = load float, ptr %225, align 4
  %227 = load i64, ptr %18, align 8
  %228 = getelementptr inbounds [6 x float], ptr %14, i64 0, i64 %227
  %229 = load float, ptr %228, align 4
  %230 = fdiv float %226, %229
  %231 = load i64, ptr %22, align 8
  %232 = getelementptr inbounds [6 x float], ptr %14, i64 0, i64 %231
  store float %230, ptr %232, align 4
  br label %233

233:                                              ; preds = %223
  %234 = load i64, ptr %22, align 8
  %235 = add nsw i64 %234, 1
  store i64 %235, ptr %22, align 8
  br label %220, !llvm.loop !9

236:                                              ; preds = %220
  %237 = load i64, ptr %18, align 8
  switch i64 %237, label %259 [
    i64 0, label %238
    i64 1, label %242
    i64 2, label %246
    i64 3, label %250
    i64 4, label %254
    i64 5, label %258
  ]

238:                                              ; preds = %236
  %239 = getelementptr inbounds [6 x float], ptr %14, i64 0, i64 1
  %240 = load float, ptr %239, align 4
  %241 = getelementptr inbounds [6 x float], ptr %14, i64 0, i64 0
  store float %240, ptr %241, align 4
  br label %242

242:                                              ; preds = %236, %238
  %243 = getelementptr inbounds [6 x float], ptr %14, i64 0, i64 2
  %244 = load float, ptr %243, align 4
  %245 = getelementptr inbounds [6 x float], ptr %14, i64 0, i64 1
  store float %244, ptr %245, align 4
  br label %246

246:                                              ; preds = %236, %242
  %247 = getelementptr inbounds [6 x float], ptr %14, i64 0, i64 3
  %248 = load float, ptr %247, align 4
  %249 = getelementptr inbounds [6 x float], ptr %14, i64 0, i64 2
  store float %248, ptr %249, align 4
  br label %250

250:                                              ; preds = %236, %246
  %251 = getelementptr inbounds [6 x float], ptr %14, i64 0, i64 4
  %252 = load float, ptr %251, align 4
  %253 = getelementptr inbounds [6 x float], ptr %14, i64 0, i64 3
  store float %252, ptr %253, align 4
  br label %254

254:                                              ; preds = %236, %250
  %255 = getelementptr inbounds [6 x float], ptr %14, i64 0, i64 5
  %256 = load float, ptr %255, align 4
  %257 = getelementptr inbounds [6 x float], ptr %14, i64 0, i64 4
  store float %256, ptr %257, align 4
  br label %258

258:                                              ; preds = %236, %254
  br label %259

259:                                              ; preds = %236, %258
  br label %260

260:                                              ; preds = %259
  store i64 0, ptr %23, align 8
  br label %261

261:                                              ; preds = %270, %260
  %262 = load i64, ptr %23, align 8
  %263 = icmp slt i64 %262, 5
  br i1 %263, label %264, label %273

264:                                              ; preds = %261
  %265 = load i64, ptr %23, align 8
  %266 = getelementptr inbounds [6 x float], ptr %14, i64 0, i64 %265
  %267 = load i64, ptr %266, align 4
  %268 = load i64, ptr %23, align 8
  %269 = getelementptr inbounds [5 x i64], ptr %16, i64 0, i64 %268
  store i64 %267, ptr %269, align 8
  br label %270

270:                                              ; preds = %264
  %271 = load i64, ptr %23, align 8
  %272 = add nsw i64 %271, 1
  store i64 %272, ptr %23, align 8
  br label %261, !llvm.loop !10

273:                                              ; preds = %261
  %274 = getelementptr inbounds [5 x i64], ptr %16, i64 0, i64 0
  %275 = load i64, ptr %274, align 8
  %276 = getelementptr inbounds [5 x i64], ptr %16, i64 0, i64 1
  %277 = load i64, ptr %276, align 8
  %278 = and i64 %275, %277
  %279 = getelementptr inbounds [5 x i64], ptr %16, i64 0, i64 0
  %280 = load i64, ptr %279, align 8
  %281 = xor i64 %280, -1
  %282 = getelementptr inbounds [5 x i64], ptr %16, i64 0, i64 2
  %283 = load i64, ptr %282, align 8
  %284 = and i64 %281, %283
  %285 = or i64 %278, %284
  %286 = getelementptr inbounds [5 x i64], ptr %16, i64 0, i64 0
  store i64 %285, ptr %286, align 8
  %287 = getelementptr inbounds [5 x i64], ptr %16, i64 0, i64 1
  %288 = load i64, ptr %287, align 8
  %289 = getelementptr inbounds [5 x i64], ptr %16, i64 0, i64 3
  %290 = load i64, ptr %289, align 8
  %291 = and i64 %288, %290
  %292 = getelementptr inbounds [5 x i64], ptr %16, i64 0, i64 2
  %293 = load i64, ptr %292, align 8
  %294 = getelementptr inbounds [5 x i64], ptr %16, i64 0, i64 3
  %295 = load i64, ptr %294, align 8
  %296 = xor i64 %295, -1
  %297 = and i64 %293, %296
  %298 = or i64 %291, %297
  %299 = getelementptr inbounds [5 x i64], ptr %16, i64 0, i64 1
  store i64 %298, ptr %299, align 8
  %300 = getelementptr inbounds [5 x i64], ptr %16, i64 0, i64 3
  %301 = load i64, ptr %300, align 8
  %302 = getelementptr inbounds [5 x i64], ptr %16, i64 0, i64 2
  %303 = load i64, ptr %302, align 8
  %304 = getelementptr inbounds [5 x i64], ptr %16, i64 0, i64 4
  %305 = load i64, ptr %304, align 8
  %306 = xor i64 %305, -1
  %307 = and i64 %303, %306
  %308 = xor i64 %301, %307
  %309 = getelementptr inbounds [5 x i64], ptr %16, i64 0, i64 2
  store i64 %308, ptr %309, align 8
  %310 = getelementptr inbounds [5 x i64], ptr %16, i64 0, i64 0
  %311 = load i64, ptr %310, align 8
  %312 = getelementptr inbounds [5 x i64], ptr %16, i64 0, i64 1
  %313 = load i64, ptr %312, align 8
  %314 = xor i64 %311, %313
  %315 = getelementptr inbounds [5 x i64], ptr %16, i64 0, i64 2
  %316 = load i64, ptr %315, align 8
  %317 = xor i64 %314, %316
  store i64 %317, ptr %24, align 8
  %318 = load ptr, ptr %8, align 8
  %319 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %318, ptr noundef %24, ptr noundef %15, i64 noundef 0)
  %320 = load i32, ptr %1, align 4
  ret i32 %320
}

declare dso_local float @sqroot(float noundef) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #2

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="duotronic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="duotronic" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 755f040f24df9a74f4e5f7f7bdd64e3acd4e61b9)"}
!3 = !{i64 2147504684}
!4 = !{i64 2147505196}
!5 = !{i64 2147505708}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
