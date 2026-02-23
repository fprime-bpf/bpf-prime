; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca [16 x i8], align 1
  %2 = alloca [256 x i8], align 1
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #3, !srcloc !3
  %7 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 1, i32 0, i32 0, i32 0) #3, !srcloc !4
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %1) #3
  call void @llvm.lifetime.start.p0(i64 256, ptr nonnull %2) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %3) #3
  store i32 0, ptr %3, align 4, !tbaa !5
  br label %9

8:                                                ; preds = %9
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %3) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #3
  store i32 0, ptr %4, align 4, !tbaa !5
  br label %33

9:                                                ; preds = %0, %9
  %10 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %6, ptr noundef nonnull %3) #3
  %11 = load i8, ptr %10, align 1, !tbaa !9
  %12 = load i32, ptr %3, align 4, !tbaa !5
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [16 x i8], ptr %1, i64 0, i64 %13
  store i8 %11, ptr %14, align 1, !tbaa !9
  %15 = add nsw i32 %12, 1
  store i32 %15, ptr %3, align 4, !tbaa !5
  %16 = icmp slt i32 %12, 15
  br i1 %16, label %9, label %8, !llvm.loop !10

17:                                               ; preds = %33
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #3
  %18 = getelementptr inbounds nuw i8, ptr %1, i64 1
  %19 = getelementptr inbounds nuw i8, ptr %1, i64 5
  %20 = getelementptr inbounds nuw i8, ptr %1, i64 9
  %21 = getelementptr inbounds nuw i8, ptr %1, i64 13
  %22 = getelementptr inbounds nuw i8, ptr %1, i64 2
  %23 = getelementptr inbounds nuw i8, ptr %1, i64 6
  %24 = getelementptr inbounds nuw i8, ptr %1, i64 10
  %25 = getelementptr inbounds nuw i8, ptr %1, i64 14
  %26 = getelementptr inbounds nuw i8, ptr %1, i64 15
  %27 = getelementptr inbounds nuw i8, ptr %1, i64 11
  %28 = getelementptr inbounds nuw i8, ptr %1, i64 7
  %29 = getelementptr inbounds nuw i8, ptr %1, i64 3
  %30 = getelementptr inbounds nuw i8, ptr %1, i64 4
  %31 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %32 = getelementptr inbounds nuw i8, ptr %1, i64 12
  br label %41

33:                                               ; preds = %8, %33
  %34 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %7, ptr noundef nonnull %4) #3
  %35 = load i8, ptr %34, align 1, !tbaa !9
  %36 = load i32, ptr %4, align 4, !tbaa !5
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %37
  store i8 %35, ptr %38, align 1, !tbaa !9
  %39 = add nsw i32 %36, 1
  store i32 %39, ptr %4, align 4, !tbaa !5
  %40 = icmp slt i32 %36, 255
  br i1 %40, label %33, label %17, !llvm.loop !12

41:                                               ; preds = %17, %224
  %42 = phi i32 [ 0, %17 ], [ %225, %224 ]
  %43 = load i8, ptr %1, align 1, !tbaa !9
  %44 = load i8, ptr %18, align 1, !tbaa !9
  %45 = load i8, ptr %22, align 1, !tbaa !9
  %46 = load i8, ptr %29, align 1, !tbaa !9
  %47 = load i8, ptr %30, align 1, !tbaa !9
  %48 = load i8, ptr %19, align 1, !tbaa !9
  %49 = load i8, ptr %23, align 1, !tbaa !9
  %50 = load i8, ptr %28, align 1, !tbaa !9
  %51 = load i8, ptr %31, align 1, !tbaa !9
  %52 = load i8, ptr %20, align 1, !tbaa !9
  %53 = load i8, ptr %24, align 1, !tbaa !9
  %54 = load i8, ptr %27, align 1, !tbaa !9
  %55 = load i8, ptr %32, align 1, !tbaa !9
  %56 = load i8, ptr %21, align 1, !tbaa !9
  %57 = load i8, ptr %25, align 1, !tbaa !9
  %58 = load i8, ptr %26, align 1, !tbaa !9
  %59 = icmp sgt i8 %43, -1
  %60 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %59)
  %61 = icmp slt i8 %43, 16
  %62 = select i1 %60, i1 %61, i1 false
  br i1 %62, label %227, label %231

63:                                               ; preds = %224
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %5) #3
  store i32 0, ptr %5, align 4, !tbaa !5
  br label %380

64:                                               ; preds = %377, %64
  %65 = phi i64 [ 0, %377 ], [ %222, %64 ]
  %66 = shl nuw nsw i64 %65, 2
  %67 = getelementptr inbounds nuw i8, ptr %1, i64 %66
  %68 = load i8, ptr %67, align 1, !tbaa !9
  %69 = and i8 %68, 1
  %70 = icmp eq i8 %69, 0
  %71 = and i8 %68, 2
  %72 = icmp eq i8 %71, 0
  %73 = and i8 %68, 4
  %74 = icmp eq i8 %73, 0
  %75 = and i8 %68, 8
  %76 = icmp eq i8 %75, 0
  %77 = and i8 %68, 16
  %78 = icmp eq i8 %77, 0
  %79 = and i8 %68, 32
  %80 = icmp eq i8 %79, 0
  %81 = and i8 %68, 64
  %82 = icmp eq i8 %81, 0
  %83 = icmp sgt i8 %68, -1
  %84 = select i1 %83, i8 0, i8 27
  %85 = or disjoint i64 %66, 1
  %86 = getelementptr inbounds nuw i8, ptr %1, i64 %85
  %87 = load i8, ptr %86, align 1, !tbaa !9
  %88 = and i8 %87, 1
  %89 = icmp eq i8 %88, 0
  %90 = and i8 %87, 2
  %91 = icmp eq i8 %90, 0
  %92 = select i1 %91, i8 0, i8 6
  %93 = and i8 %87, 4
  %94 = icmp eq i8 %93, 0
  %95 = select i1 %94, i8 0, i8 12
  %96 = and i8 %87, 8
  %97 = icmp eq i8 %96, 0
  %98 = select i1 %97, i8 0, i8 24
  %99 = and i8 %87, 16
  %100 = icmp eq i8 %99, 0
  %101 = select i1 %100, i8 0, i8 48
  %102 = and i8 %87, 32
  %103 = icmp eq i8 %102, 0
  %104 = select i1 %103, i8 0, i8 96
  %105 = and i8 %87, 64
  %106 = icmp eq i8 %105, 0
  %107 = select i1 %106, i8 0, i8 -64
  %108 = icmp sgt i8 %87, -1
  %109 = select i1 %108, i8 0, i8 -101
  %110 = shl i8 %68, 1
  %111 = xor i8 %84, %110
  %112 = or disjoint i64 %66, 2
  %113 = getelementptr inbounds nuw i8, ptr %1, i64 %112
  %114 = load i8, ptr %113, align 1, !tbaa !9
  %115 = or disjoint i64 %66, 3
  %116 = getelementptr inbounds nuw i8, ptr %1, i64 %115
  %117 = load i8, ptr %116, align 1, !tbaa !9
  %118 = select i1 %108, i8 0, i8 27
  %119 = select i1 %89, i8 0, i8 3
  %120 = xor i8 %92, %119
  %121 = xor i8 %95, %120
  %122 = xor i8 %98, %121
  %123 = xor i8 %101, %122
  %124 = xor i8 %104, %123
  %125 = xor i8 %107, %124
  %126 = xor i8 %109, %125
  %127 = xor i8 %126, %111
  %128 = xor i8 %127, %114
  %129 = and i8 %114, 1
  %130 = icmp eq i8 %129, 0
  %131 = select i1 %130, i8 0, i8 3
  %132 = and i8 %114, 2
  %133 = icmp eq i8 %132, 0
  %134 = select i1 %133, i8 0, i8 6
  %135 = xor i8 %134, %131
  %136 = and i8 %114, 4
  %137 = icmp eq i8 %136, 0
  %138 = select i1 %137, i8 0, i8 12
  %139 = xor i8 %138, %135
  %140 = and i8 %114, 8
  %141 = icmp eq i8 %140, 0
  %142 = select i1 %141, i8 0, i8 24
  %143 = xor i8 %142, %139
  %144 = and i8 %114, 16
  %145 = icmp eq i8 %144, 0
  %146 = select i1 %145, i8 0, i8 48
  %147 = xor i8 %146, %143
  %148 = and i8 %114, 32
  %149 = icmp eq i8 %148, 0
  %150 = select i1 %149, i8 0, i8 96
  %151 = xor i8 %150, %147
  %152 = and i8 %114, 64
  %153 = icmp eq i8 %152, 0
  %154 = select i1 %153, i8 0, i8 -64
  %155 = xor i8 %154, %151
  %156 = icmp sgt i8 %114, -1
  %157 = select i1 %156, i8 0, i8 -101
  %158 = xor i8 %157, %155
  %159 = shl i8 %87, 1
  %160 = xor i8 %118, %159
  %161 = xor i8 %160, %158
  %162 = xor i8 %161, %68
  %163 = xor i8 %162, %117
  %164 = shl i8 %114, 1
  %165 = select i1 %156, i8 0, i8 27
  %166 = xor i8 %165, %164
  %167 = and i8 %117, 1
  %168 = icmp eq i8 %167, 0
  %169 = select i1 %168, i8 0, i8 3
  %170 = and i8 %117, 2
  %171 = icmp eq i8 %170, 0
  %172 = select i1 %171, i8 0, i8 6
  %173 = xor i8 %172, %169
  %174 = and i8 %117, 4
  %175 = icmp eq i8 %174, 0
  %176 = select i1 %175, i8 0, i8 12
  %177 = xor i8 %176, %173
  %178 = and i8 %117, 8
  %179 = icmp eq i8 %178, 0
  %180 = select i1 %179, i8 0, i8 24
  %181 = xor i8 %180, %177
  %182 = and i8 %117, 16
  %183 = icmp eq i8 %182, 0
  %184 = select i1 %183, i8 0, i8 48
  %185 = xor i8 %184, %181
  %186 = and i8 %117, 32
  %187 = icmp eq i8 %186, 0
  %188 = select i1 %187, i8 0, i8 96
  %189 = xor i8 %188, %185
  %190 = and i8 %117, 64
  %191 = icmp eq i8 %190, 0
  %192 = select i1 %191, i8 0, i8 -64
  %193 = xor i8 %192, %189
  %194 = icmp sgt i8 %117, -1
  %195 = select i1 %194, i8 0, i8 -101
  %196 = xor i8 %195, %193
  %197 = select i1 %72, i8 0, i8 6
  %198 = select i1 %74, i8 0, i8 12
  %199 = select i1 %76, i8 0, i8 24
  %200 = select i1 %78, i8 0, i8 48
  %201 = select i1 %80, i8 0, i8 96
  %202 = select i1 %82, i8 0, i8 -64
  %203 = select i1 %83, i8 0, i8 -101
  %204 = xor i8 %128, %117
  %205 = shl i8 %117, 1
  %206 = select i1 %194, i8 0, i8 27
  %207 = xor i8 %206, %205
  %208 = select i1 %70, i8 0, i8 3
  %209 = xor i8 %197, %208
  %210 = xor i8 %198, %209
  %211 = xor i8 %199, %210
  %212 = xor i8 %200, %211
  %213 = xor i8 %201, %212
  %214 = xor i8 %202, %213
  %215 = xor i8 %203, %214
  %216 = xor i8 %166, %196
  %217 = xor i8 %216, %68
  %218 = xor i8 %217, %87
  %219 = xor i8 %215, %207
  %220 = xor i8 %219, %87
  %221 = xor i8 %220, %114
  store i8 %204, ptr %67, align 1, !tbaa !9
  store i8 %163, ptr %86, align 1, !tbaa !9
  store i8 %218, ptr %113, align 1, !tbaa !9
  store i8 %221, ptr %116, align 1, !tbaa !9
  %222 = add nuw nsw i64 %65, 1
  %223 = icmp eq i64 %222, 4
  br i1 %223, label %224, label %64, !llvm.loop !13

224:                                              ; preds = %64
  %225 = add nuw nsw i32 %42, 1
  %226 = icmp eq i32 %225, 1000
  br i1 %226, label %63, label %41, !llvm.loop !14

227:                                              ; preds = %41
  %228 = sext i8 %43 to i64
  %229 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %228
  %230 = load i8, ptr %229, align 1, !tbaa !9
  store i8 %230, ptr %1, align 1, !tbaa !9
  br label %231

231:                                              ; preds = %227, %41
  %232 = icmp sgt i8 %44, -1
  %233 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %232)
  %234 = icmp slt i8 %44, 16
  %235 = select i1 %233, i1 %234, i1 false
  br i1 %235, label %236, label %240

236:                                              ; preds = %231
  %237 = sext i8 %44 to i64
  %238 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %237
  %239 = load i8, ptr %238, align 1, !tbaa !9
  store i8 %239, ptr %18, align 1, !tbaa !9
  br label %240

240:                                              ; preds = %236, %231
  %241 = phi i8 [ %239, %236 ], [ %44, %231 ]
  %242 = icmp sgt i8 %45, -1
  %243 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %242)
  %244 = icmp slt i8 %45, 16
  %245 = select i1 %243, i1 %244, i1 false
  br i1 %245, label %246, label %250

246:                                              ; preds = %240
  %247 = sext i8 %45 to i64
  %248 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %247
  %249 = load i8, ptr %248, align 1, !tbaa !9
  store i8 %249, ptr %22, align 1, !tbaa !9
  br label %250

250:                                              ; preds = %246, %240
  %251 = phi i8 [ %249, %246 ], [ %45, %240 ]
  %252 = icmp sgt i8 %46, -1
  %253 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %252)
  %254 = icmp slt i8 %46, 16
  %255 = select i1 %253, i1 %254, i1 false
  br i1 %255, label %256, label %260

256:                                              ; preds = %250
  %257 = sext i8 %46 to i64
  %258 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %257
  %259 = load i8, ptr %258, align 1, !tbaa !9
  store i8 %259, ptr %29, align 1, !tbaa !9
  br label %260

260:                                              ; preds = %256, %250
  %261 = phi i8 [ %259, %256 ], [ %46, %250 ]
  %262 = icmp sgt i8 %47, -1
  %263 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %262)
  %264 = icmp slt i8 %47, 16
  %265 = select i1 %263, i1 %264, i1 false
  br i1 %265, label %266, label %270

266:                                              ; preds = %260
  %267 = sext i8 %47 to i64
  %268 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %267
  %269 = load i8, ptr %268, align 1, !tbaa !9
  store i8 %269, ptr %30, align 1, !tbaa !9
  br label %270

270:                                              ; preds = %266, %260
  %271 = icmp sgt i8 %48, -1
  %272 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %271)
  %273 = icmp slt i8 %48, 16
  %274 = select i1 %272, i1 %273, i1 false
  br i1 %274, label %275, label %279

275:                                              ; preds = %270
  %276 = sext i8 %48 to i64
  %277 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %276
  %278 = load i8, ptr %277, align 1, !tbaa !9
  store i8 %278, ptr %19, align 1, !tbaa !9
  br label %279

279:                                              ; preds = %275, %270
  %280 = phi i8 [ %278, %275 ], [ %48, %270 ]
  %281 = icmp sgt i8 %49, -1
  %282 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %281)
  %283 = icmp slt i8 %49, 16
  %284 = select i1 %282, i1 %283, i1 false
  br i1 %284, label %285, label %289

285:                                              ; preds = %279
  %286 = sext i8 %49 to i64
  %287 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %286
  %288 = load i8, ptr %287, align 1, !tbaa !9
  store i8 %288, ptr %23, align 1, !tbaa !9
  br label %289

289:                                              ; preds = %285, %279
  %290 = phi i8 [ %288, %285 ], [ %49, %279 ]
  %291 = icmp sgt i8 %50, -1
  %292 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %291)
  %293 = icmp slt i8 %50, 16
  %294 = select i1 %292, i1 %293, i1 false
  br i1 %294, label %295, label %299

295:                                              ; preds = %289
  %296 = sext i8 %50 to i64
  %297 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %296
  %298 = load i8, ptr %297, align 1, !tbaa !9
  store i8 %298, ptr %28, align 1, !tbaa !9
  br label %299

299:                                              ; preds = %295, %289
  %300 = phi i8 [ %298, %295 ], [ %50, %289 ]
  %301 = icmp sgt i8 %51, -1
  %302 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %301)
  %303 = icmp slt i8 %51, 16
  %304 = select i1 %302, i1 %303, i1 false
  br i1 %304, label %305, label %309

305:                                              ; preds = %299
  %306 = sext i8 %51 to i64
  %307 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %306
  %308 = load i8, ptr %307, align 1, !tbaa !9
  store i8 %308, ptr %31, align 1, !tbaa !9
  br label %309

309:                                              ; preds = %305, %299
  %310 = icmp sgt i8 %52, -1
  %311 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %310)
  %312 = icmp slt i8 %52, 16
  %313 = select i1 %311, i1 %312, i1 false
  br i1 %313, label %314, label %318

314:                                              ; preds = %309
  %315 = sext i8 %52 to i64
  %316 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %315
  %317 = load i8, ptr %316, align 1, !tbaa !9
  store i8 %317, ptr %20, align 1, !tbaa !9
  br label %318

318:                                              ; preds = %314, %309
  %319 = phi i8 [ %317, %314 ], [ %52, %309 ]
  %320 = icmp sgt i8 %53, -1
  %321 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %320)
  %322 = icmp slt i8 %53, 16
  %323 = select i1 %321, i1 %322, i1 false
  br i1 %323, label %324, label %328

324:                                              ; preds = %318
  %325 = sext i8 %53 to i64
  %326 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %325
  %327 = load i8, ptr %326, align 1, !tbaa !9
  br label %328

328:                                              ; preds = %324, %318
  %329 = phi i8 [ %327, %324 ], [ %53, %318 ]
  %330 = icmp sgt i8 %54, -1
  %331 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %330)
  %332 = icmp slt i8 %54, 16
  %333 = select i1 %331, i1 %332, i1 false
  br i1 %333, label %334, label %338

334:                                              ; preds = %328
  %335 = sext i8 %54 to i64
  %336 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %335
  %337 = load i8, ptr %336, align 1, !tbaa !9
  br label %338

338:                                              ; preds = %334, %328
  %339 = phi i8 [ %337, %334 ], [ %54, %328 ]
  %340 = icmp sgt i8 %55, -1
  %341 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %340)
  %342 = icmp slt i8 %55, 16
  %343 = select i1 %341, i1 %342, i1 false
  br i1 %343, label %344, label %348

344:                                              ; preds = %338
  %345 = sext i8 %55 to i64
  %346 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %345
  %347 = load i8, ptr %346, align 1, !tbaa !9
  store i8 %347, ptr %32, align 1, !tbaa !9
  br label %348

348:                                              ; preds = %344, %338
  %349 = icmp sgt i8 %56, -1
  %350 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %349)
  %351 = icmp slt i8 %56, 16
  %352 = select i1 %350, i1 %351, i1 false
  br i1 %352, label %353, label %357

353:                                              ; preds = %348
  %354 = sext i8 %56 to i64
  %355 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %354
  %356 = load i8, ptr %355, align 1, !tbaa !9
  br label %357

357:                                              ; preds = %353, %348
  %358 = phi i8 [ %356, %353 ], [ %56, %348 ]
  %359 = icmp sgt i8 %57, -1
  %360 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %359)
  %361 = icmp slt i8 %57, 16
  %362 = select i1 %360, i1 %361, i1 false
  br i1 %362, label %363, label %367

363:                                              ; preds = %357
  %364 = sext i8 %57 to i64
  %365 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %364
  %366 = load i8, ptr %365, align 1, !tbaa !9
  br label %367

367:                                              ; preds = %363, %357
  %368 = phi i8 [ %366, %363 ], [ %57, %357 ]
  %369 = icmp sgt i8 %58, -1
  %370 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %369)
  %371 = icmp slt i8 %58, 16
  %372 = select i1 %370, i1 %371, i1 false
  br i1 %372, label %373, label %377

373:                                              ; preds = %367
  %374 = sext i8 %58 to i64
  %375 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %374
  %376 = load i8, ptr %375, align 1, !tbaa !9
  br label %377

377:                                              ; preds = %373, %367
  %378 = phi i8 [ %376, %373 ], [ %58, %367 ]
  store i8 %280, ptr %18, align 1, !tbaa !9
  store i8 %319, ptr %19, align 1, !tbaa !9
  store i8 %358, ptr %20, align 1, !tbaa !9
  store i8 %241, ptr %21, align 1, !tbaa !9
  store i8 %329, ptr %22, align 1, !tbaa !9
  store i8 %368, ptr %23, align 1, !tbaa !9
  store i8 %251, ptr %24, align 1, !tbaa !9
  store i8 %290, ptr %25, align 1, !tbaa !9
  store i8 %339, ptr %26, align 1, !tbaa !9
  store i8 %300, ptr %27, align 1, !tbaa !9
  store i8 %261, ptr %28, align 1, !tbaa !9
  store i8 %378, ptr %29, align 1, !tbaa !9
  br label %64

379:                                              ; preds = %380
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %5) #3
  call void @llvm.lifetime.end.p0(i64 256, ptr nonnull %2) #3
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %1) #3
  ret i32 0

380:                                              ; preds = %63, %380
  %381 = phi i32 [ 0, %63 ], [ %387, %380 ]
  %382 = call i32 @llvm.bpf.passthrough.i32.i32(i32 1, i32 %381)
  %383 = sext i32 %382 to i64
  %384 = getelementptr inbounds [16 x i8], ptr %1, i64 0, i64 %383
  %385 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %7, ptr noundef nonnull %5, ptr noundef nonnull %384, i64 noundef 0) #3
  %386 = load i32, ptr %5, align 4, !tbaa !5
  %387 = add nsw i32 %386, 1
  store i32 %387, ptr %5, align 4, !tbaa !5
  %388 = icmp slt i32 %386, 15
  br i1 %388, label %380, label %379, !llvm.loop !15
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind memory(none)
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #2

; Function Attrs: nounwind memory(none)
declare i32 @llvm.bpf.passthrough.i32.i32(i32, i32) #2

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="duotronic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind memory(none) }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 20.1.0 (https://github.com/fprime-bpf/llvm-project.git 3047ef595b8b4944540de771dcf86dc85a97ef76)"}
!3 = !{i64 2147505040}
!4 = !{i64 2147505552}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!7, !7, i64 0}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !11}
!14 = distinct !{!14, !11}
!15 = distinct !{!15, !11}
