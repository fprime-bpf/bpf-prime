; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

%struct.bpf_iter_num = type { i64, i64, i64, i64 }

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca [256 x i8], align 1
  %2 = alloca %struct.bpf_iter_num, align 8
  call void @llvm.lifetime.start.p0(i64 256, ptr nonnull %1) #4
  %3 = getelementptr inbounds nuw i8, ptr %1, i64 1
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(256) %3, i8 0, i64 255, i1 false)
  store i8 13, ptr %1, align 1
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %2) #4
  %4 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %2, i32 noundef 0, i32 noundef 1000) #4
  %5 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %2) #4
  %6 = icmp eq ptr %5, null
  br i1 %6, label %810, label %7

7:                                                ; preds = %0, %182
  %8 = phi i8 [ %237, %182 ], [ 12, %0 ]
  %9 = phi i8 [ %276, %182 ], [ 0, %0 ]
  %10 = phi i8 [ %315, %182 ], [ 0, %0 ]
  %11 = phi i8 [ %339, %182 ], [ 0, %0 ]
  %12 = phi i8 [ %393, %182 ], [ 0, %0 ]
  %13 = phi i8 [ %432, %182 ], [ 0, %0 ]
  %14 = phi i8 [ %471, %182 ], [ 0, %0 ]
  %15 = phi i8 [ %495, %182 ], [ 0, %0 ]
  %16 = phi i8 [ %549, %182 ], [ 0, %0 ]
  %17 = phi i8 [ %588, %182 ], [ 0, %0 ]
  %18 = phi i8 [ %627, %182 ], [ 0, %0 ]
  %19 = phi i8 [ %651, %182 ], [ 0, %0 ]
  %20 = phi i8 [ %705, %182 ], [ 0, %0 ]
  %21 = phi i8 [ %744, %182 ], [ 0, %0 ]
  %22 = phi i8 [ %783, %182 ], [ 0, %0 ]
  %23 = phi i8 [ %807, %182 ], [ 0, %0 ]
  %24 = icmp sgt i8 %8, -1
  %25 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %24)
  %26 = icmp slt i8 %8, 16
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %32

28:                                               ; preds = %7
  %29 = sext i8 %8 to i64
  %30 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 %29
  %31 = load i8, ptr %30, align 1, !tbaa !3
  br label %32

32:                                               ; preds = %28, %7
  %33 = phi i8 [ %31, %28 ], [ %8, %7 ]
  %34 = icmp sgt i8 %9, -1
  %35 = call i1 @llvm.bpf.passthrough.i1.i1(i32 1, i1 %34)
  %36 = icmp slt i8 %9, 16
  %37 = select i1 %35, i1 %36, i1 false
  br i1 %37, label %38, label %42

38:                                               ; preds = %32
  %39 = sext i8 %9 to i64
  %40 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 %39
  %41 = load i8, ptr %40, align 1, !tbaa !3
  br label %42

42:                                               ; preds = %38, %32
  %43 = phi i8 [ %41, %38 ], [ %9, %32 ]
  %44 = icmp sgt i8 %10, -1
  %45 = call i1 @llvm.bpf.passthrough.i1.i1(i32 2, i1 %44)
  %46 = icmp slt i8 %10, 16
  %47 = select i1 %45, i1 %46, i1 false
  br i1 %47, label %48, label %52

48:                                               ; preds = %42
  %49 = sext i8 %10 to i64
  %50 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 %49
  %51 = load i8, ptr %50, align 1, !tbaa !3
  br label %52

52:                                               ; preds = %48, %42
  %53 = phi i8 [ %51, %48 ], [ %10, %42 ]
  %54 = icmp sgt i8 %11, -1
  %55 = call i1 @llvm.bpf.passthrough.i1.i1(i32 3, i1 %54)
  %56 = icmp slt i8 %11, 16
  %57 = select i1 %55, i1 %56, i1 false
  br i1 %57, label %58, label %62

58:                                               ; preds = %52
  %59 = sext i8 %11 to i64
  %60 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 %59
  %61 = load i8, ptr %60, align 1, !tbaa !3
  br label %62

62:                                               ; preds = %58, %52
  %63 = phi i8 [ %61, %58 ], [ %11, %52 ]
  %64 = icmp sgt i8 %12, -1
  %65 = call i1 @llvm.bpf.passthrough.i1.i1(i32 4, i1 %64)
  %66 = icmp slt i8 %12, 16
  %67 = select i1 %65, i1 %66, i1 false
  br i1 %67, label %68, label %72

68:                                               ; preds = %62
  %69 = sext i8 %12 to i64
  %70 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 %69
  %71 = load i8, ptr %70, align 1, !tbaa !3
  br label %72

72:                                               ; preds = %68, %62
  %73 = phi i8 [ %71, %68 ], [ %12, %62 ]
  %74 = icmp sgt i8 %13, -1
  %75 = call i1 @llvm.bpf.passthrough.i1.i1(i32 5, i1 %74)
  %76 = icmp slt i8 %13, 16
  %77 = select i1 %75, i1 %76, i1 false
  br i1 %77, label %78, label %82

78:                                               ; preds = %72
  %79 = sext i8 %13 to i64
  %80 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 %79
  %81 = load i8, ptr %80, align 1, !tbaa !3
  br label %82

82:                                               ; preds = %78, %72
  %83 = phi i8 [ %81, %78 ], [ %13, %72 ]
  %84 = icmp sgt i8 %14, -1
  %85 = call i1 @llvm.bpf.passthrough.i1.i1(i32 6, i1 %84)
  %86 = icmp slt i8 %14, 16
  %87 = select i1 %85, i1 %86, i1 false
  br i1 %87, label %88, label %92

88:                                               ; preds = %82
  %89 = sext i8 %14 to i64
  %90 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 %89
  %91 = load i8, ptr %90, align 1, !tbaa !3
  br label %92

92:                                               ; preds = %88, %82
  %93 = phi i8 [ %91, %88 ], [ %14, %82 ]
  %94 = icmp sgt i8 %15, -1
  %95 = call i1 @llvm.bpf.passthrough.i1.i1(i32 7, i1 %94)
  %96 = icmp slt i8 %15, 16
  %97 = select i1 %95, i1 %96, i1 false
  br i1 %97, label %98, label %102

98:                                               ; preds = %92
  %99 = sext i8 %15 to i64
  %100 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 %99
  %101 = load i8, ptr %100, align 1, !tbaa !3
  br label %102

102:                                              ; preds = %98, %92
  %103 = phi i8 [ %101, %98 ], [ %15, %92 ]
  %104 = icmp sgt i8 %16, -1
  %105 = call i1 @llvm.bpf.passthrough.i1.i1(i32 8, i1 %104)
  %106 = icmp slt i8 %16, 16
  %107 = select i1 %105, i1 %106, i1 false
  br i1 %107, label %108, label %112

108:                                              ; preds = %102
  %109 = sext i8 %16 to i64
  %110 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 %109
  %111 = load i8, ptr %110, align 1, !tbaa !3
  br label %112

112:                                              ; preds = %108, %102
  %113 = phi i8 [ %111, %108 ], [ %16, %102 ]
  %114 = icmp sgt i8 %17, -1
  %115 = call i1 @llvm.bpf.passthrough.i1.i1(i32 9, i1 %114)
  %116 = icmp slt i8 %17, 16
  %117 = select i1 %115, i1 %116, i1 false
  br i1 %117, label %118, label %122

118:                                              ; preds = %112
  %119 = sext i8 %17 to i64
  %120 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 %119
  %121 = load i8, ptr %120, align 1, !tbaa !3
  br label %122

122:                                              ; preds = %118, %112
  %123 = phi i8 [ %121, %118 ], [ %17, %112 ]
  %124 = icmp sgt i8 %18, -1
  %125 = call i1 @llvm.bpf.passthrough.i1.i1(i32 10, i1 %124)
  %126 = icmp slt i8 %18, 16
  %127 = select i1 %125, i1 %126, i1 false
  br i1 %127, label %128, label %132

128:                                              ; preds = %122
  %129 = sext i8 %18 to i64
  %130 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 %129
  %131 = load i8, ptr %130, align 1, !tbaa !3
  br label %132

132:                                              ; preds = %128, %122
  %133 = phi i8 [ %131, %128 ], [ %18, %122 ]
  %134 = icmp sgt i8 %19, -1
  %135 = call i1 @llvm.bpf.passthrough.i1.i1(i32 11, i1 %134)
  %136 = icmp slt i8 %19, 16
  %137 = select i1 %135, i1 %136, i1 false
  br i1 %137, label %138, label %142

138:                                              ; preds = %132
  %139 = sext i8 %19 to i64
  %140 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 %139
  %141 = load i8, ptr %140, align 1, !tbaa !3
  br label %142

142:                                              ; preds = %138, %132
  %143 = phi i8 [ %141, %138 ], [ %19, %132 ]
  %144 = icmp sgt i8 %20, -1
  %145 = call i1 @llvm.bpf.passthrough.i1.i1(i32 12, i1 %144)
  %146 = icmp slt i8 %20, 16
  %147 = select i1 %145, i1 %146, i1 false
  br i1 %147, label %148, label %152

148:                                              ; preds = %142
  %149 = sext i8 %20 to i64
  %150 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 %149
  %151 = load i8, ptr %150, align 1, !tbaa !3
  br label %152

152:                                              ; preds = %148, %142
  %153 = phi i8 [ %151, %148 ], [ %20, %142 ]
  %154 = icmp sgt i8 %21, -1
  %155 = call i1 @llvm.bpf.passthrough.i1.i1(i32 13, i1 %154)
  %156 = icmp slt i8 %21, 16
  %157 = select i1 %155, i1 %156, i1 false
  br i1 %157, label %158, label %162

158:                                              ; preds = %152
  %159 = sext i8 %21 to i64
  %160 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 %159
  %161 = load i8, ptr %160, align 1, !tbaa !3
  br label %162

162:                                              ; preds = %158, %152
  %163 = phi i8 [ %161, %158 ], [ %21, %152 ]
  %164 = icmp sgt i8 %22, -1
  %165 = call i1 @llvm.bpf.passthrough.i1.i1(i32 14, i1 %164)
  %166 = icmp slt i8 %22, 16
  %167 = select i1 %165, i1 %166, i1 false
  br i1 %167, label %168, label %172

168:                                              ; preds = %162
  %169 = sext i8 %22 to i64
  %170 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 %169
  %171 = load i8, ptr %170, align 1, !tbaa !3
  br label %172

172:                                              ; preds = %168, %162
  %173 = phi i8 [ %171, %168 ], [ %22, %162 ]
  %174 = icmp sgt i8 %23, -1
  %175 = call i1 @llvm.bpf.passthrough.i1.i1(i32 15, i1 %174)
  %176 = icmp slt i8 %23, 16
  %177 = select i1 %175, i1 %176, i1 false
  br i1 %177, label %178, label %182

178:                                              ; preds = %172
  %179 = sext i8 %23 to i64
  %180 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 %179
  %181 = load i8, ptr %180, align 1, !tbaa !3
  br label %182

182:                                              ; preds = %178, %172
  %183 = phi i8 [ %181, %178 ], [ %23, %172 ]
  %184 = and i8 %33, 1
  %185 = icmp eq i8 %184, 0
  %186 = and i8 %33, 2
  %187 = icmp eq i8 %186, 0
  %188 = and i8 %33, 4
  %189 = icmp eq i8 %188, 0
  %190 = and i8 %33, 8
  %191 = icmp eq i8 %190, 0
  %192 = and i8 %33, 16
  %193 = icmp eq i8 %192, 0
  %194 = and i8 %33, 32
  %195 = icmp eq i8 %194, 0
  %196 = shl i8 %33, 1
  %197 = and i8 %196, 126
  %198 = and i8 %33, 64
  %199 = icmp eq i8 %198, 0
  %200 = or i8 %196, -128
  %201 = select i1 %199, i8 %197, i8 %200
  %202 = icmp sgt i8 %33, -1
  %203 = xor i8 %201, 27
  %204 = select i1 %202, i8 %201, i8 %203
  %205 = and i8 %83, 1
  %206 = icmp eq i8 %205, 0
  %207 = select i1 %206, i8 0, i8 3
  %208 = and i8 %83, 2
  %209 = icmp eq i8 %208, 0
  %210 = xor i8 %207, 6
  %211 = select i1 %209, i8 %207, i8 %210
  %212 = and i8 %83, 4
  %213 = icmp eq i8 %212, 0
  %214 = xor i8 %211, 12
  %215 = select i1 %213, i8 %211, i8 %214
  %216 = and i8 %83, 8
  %217 = icmp eq i8 %216, 0
  %218 = xor i8 %215, 24
  %219 = select i1 %217, i8 %215, i8 %218
  %220 = and i8 %83, 16
  %221 = icmp eq i8 %220, 0
  %222 = xor i8 %219, 48
  %223 = select i1 %221, i8 %219, i8 %222
  %224 = and i8 %83, 32
  %225 = icmp eq i8 %224, 0
  %226 = xor i8 %223, 96
  %227 = select i1 %225, i8 %223, i8 %226
  %228 = and i8 %83, 64
  %229 = icmp eq i8 %228, 0
  %230 = xor i8 %227, -64
  %231 = select i1 %229, i8 %227, i8 %230
  %232 = icmp sgt i8 %83, -1
  %233 = xor i8 %231, -101
  %234 = select i1 %232, i8 %231, i8 %233
  %235 = xor i8 %234, %204
  %236 = xor i8 %235, %133
  %237 = xor i8 %236, %183
  %238 = shl i8 %83, 1
  %239 = and i8 %238, 126
  %240 = or i8 %238, -128
  %241 = select i1 %229, i8 %239, i8 %240
  %242 = xor i8 %241, 27
  %243 = select i1 %232, i8 %241, i8 %242
  %244 = and i8 %133, 1
  %245 = icmp eq i8 %244, 0
  %246 = select i1 %245, i8 0, i8 3
  %247 = and i8 %133, 2
  %248 = icmp eq i8 %247, 0
  %249 = xor i8 %246, 6
  %250 = select i1 %248, i8 %246, i8 %249
  %251 = and i8 %133, 4
  %252 = icmp eq i8 %251, 0
  %253 = xor i8 %250, 12
  %254 = select i1 %252, i8 %250, i8 %253
  %255 = and i8 %133, 8
  %256 = icmp eq i8 %255, 0
  %257 = xor i8 %254, 24
  %258 = select i1 %256, i8 %254, i8 %257
  %259 = and i8 %133, 16
  %260 = icmp eq i8 %259, 0
  %261 = xor i8 %258, 48
  %262 = select i1 %260, i8 %258, i8 %261
  %263 = and i8 %133, 32
  %264 = icmp eq i8 %263, 0
  %265 = xor i8 %262, 96
  %266 = select i1 %264, i8 %262, i8 %265
  %267 = and i8 %133, 64
  %268 = icmp eq i8 %267, 0
  %269 = xor i8 %266, -64
  %270 = select i1 %268, i8 %266, i8 %269
  %271 = icmp sgt i8 %133, -1
  %272 = xor i8 %270, -101
  %273 = select i1 %271, i8 %270, i8 %272
  %274 = xor i8 %243, %273
  %275 = xor i8 %274, %33
  %276 = xor i8 %275, %183
  %277 = shl i8 %133, 1
  %278 = and i8 %277, 126
  %279 = or i8 %277, -128
  %280 = select i1 %268, i8 %278, i8 %279
  %281 = xor i8 %280, 27
  %282 = select i1 %271, i8 %280, i8 %281
  %283 = and i8 %183, 1
  %284 = icmp eq i8 %283, 0
  %285 = select i1 %284, i8 0, i8 3
  %286 = and i8 %183, 2
  %287 = icmp eq i8 %286, 0
  %288 = xor i8 %285, 6
  %289 = select i1 %287, i8 %285, i8 %288
  %290 = and i8 %183, 4
  %291 = icmp eq i8 %290, 0
  %292 = xor i8 %289, 12
  %293 = select i1 %291, i8 %289, i8 %292
  %294 = and i8 %183, 8
  %295 = icmp eq i8 %294, 0
  %296 = xor i8 %293, 24
  %297 = select i1 %295, i8 %293, i8 %296
  %298 = and i8 %183, 16
  %299 = icmp eq i8 %298, 0
  %300 = xor i8 %297, 48
  %301 = select i1 %299, i8 %297, i8 %300
  %302 = and i8 %183, 32
  %303 = icmp eq i8 %302, 0
  %304 = xor i8 %301, 96
  %305 = select i1 %303, i8 %301, i8 %304
  %306 = and i8 %183, 64
  %307 = icmp eq i8 %306, 0
  %308 = xor i8 %305, -64
  %309 = select i1 %307, i8 %305, i8 %308
  %310 = icmp sgt i8 %183, -1
  %311 = xor i8 %309, -101
  %312 = select i1 %310, i8 %309, i8 %311
  %313 = xor i8 %282, %312
  %314 = xor i8 %313, %33
  %315 = xor i8 %314, %83
  %316 = select i1 %185, i8 0, i8 3
  %317 = xor i8 %316, 6
  %318 = select i1 %187, i8 %316, i8 %317
  %319 = xor i8 %318, 12
  %320 = select i1 %189, i8 %318, i8 %319
  %321 = xor i8 %320, 24
  %322 = select i1 %191, i8 %320, i8 %321
  %323 = xor i8 %322, 48
  %324 = select i1 %193, i8 %322, i8 %323
  %325 = xor i8 %324, 96
  %326 = select i1 %195, i8 %324, i8 %325
  %327 = xor i8 %326, -64
  %328 = select i1 %199, i8 %326, i8 %327
  %329 = xor i8 %328, -101
  %330 = select i1 %202, i8 %328, i8 %329
  %331 = shl i8 %183, 1
  %332 = and i8 %331, 126
  %333 = or i8 %331, -128
  %334 = select i1 %307, i8 %332, i8 %333
  %335 = xor i8 %334, 27
  %336 = select i1 %310, i8 %334, i8 %335
  %337 = xor i8 %330, %336
  %338 = xor i8 %337, %83
  %339 = xor i8 %338, %133
  %340 = and i8 %73, 1
  %341 = icmp eq i8 %340, 0
  %342 = and i8 %73, 2
  %343 = icmp eq i8 %342, 0
  %344 = and i8 %73, 4
  %345 = icmp eq i8 %344, 0
  %346 = and i8 %73, 8
  %347 = icmp eq i8 %346, 0
  %348 = and i8 %73, 16
  %349 = icmp eq i8 %348, 0
  %350 = and i8 %73, 32
  %351 = icmp eq i8 %350, 0
  %352 = shl i8 %73, 1
  %353 = and i8 %352, 126
  %354 = and i8 %73, 64
  %355 = icmp eq i8 %354, 0
  %356 = or i8 %352, -128
  %357 = select i1 %355, i8 %353, i8 %356
  %358 = icmp sgt i8 %73, -1
  %359 = xor i8 %357, 27
  %360 = select i1 %358, i8 %357, i8 %359
  %361 = and i8 %123, 1
  %362 = icmp eq i8 %361, 0
  %363 = select i1 %362, i8 0, i8 3
  %364 = and i8 %123, 2
  %365 = icmp eq i8 %364, 0
  %366 = xor i8 %363, 6
  %367 = select i1 %365, i8 %363, i8 %366
  %368 = and i8 %123, 4
  %369 = icmp eq i8 %368, 0
  %370 = xor i8 %367, 12
  %371 = select i1 %369, i8 %367, i8 %370
  %372 = and i8 %123, 8
  %373 = icmp eq i8 %372, 0
  %374 = xor i8 %371, 24
  %375 = select i1 %373, i8 %371, i8 %374
  %376 = and i8 %123, 16
  %377 = icmp eq i8 %376, 0
  %378 = xor i8 %375, 48
  %379 = select i1 %377, i8 %375, i8 %378
  %380 = and i8 %123, 32
  %381 = icmp eq i8 %380, 0
  %382 = xor i8 %379, 96
  %383 = select i1 %381, i8 %379, i8 %382
  %384 = and i8 %123, 64
  %385 = icmp eq i8 %384, 0
  %386 = xor i8 %383, -64
  %387 = select i1 %385, i8 %383, i8 %386
  %388 = icmp sgt i8 %123, -1
  %389 = xor i8 %387, -101
  %390 = select i1 %388, i8 %387, i8 %389
  %391 = xor i8 %360, %390
  %392 = xor i8 %391, %63
  %393 = xor i8 %392, %173
  %394 = shl i8 %123, 1
  %395 = and i8 %394, 126
  %396 = or i8 %394, -128
  %397 = select i1 %385, i8 %395, i8 %396
  %398 = xor i8 %397, 27
  %399 = select i1 %388, i8 %397, i8 %398
  %400 = and i8 %173, 1
  %401 = icmp eq i8 %400, 0
  %402 = select i1 %401, i8 0, i8 3
  %403 = and i8 %173, 2
  %404 = icmp eq i8 %403, 0
  %405 = xor i8 %402, 6
  %406 = select i1 %404, i8 %402, i8 %405
  %407 = and i8 %173, 4
  %408 = icmp eq i8 %407, 0
  %409 = xor i8 %406, 12
  %410 = select i1 %408, i8 %406, i8 %409
  %411 = and i8 %173, 8
  %412 = icmp eq i8 %411, 0
  %413 = xor i8 %410, 24
  %414 = select i1 %412, i8 %410, i8 %413
  %415 = and i8 %173, 16
  %416 = icmp eq i8 %415, 0
  %417 = xor i8 %414, 48
  %418 = select i1 %416, i8 %414, i8 %417
  %419 = and i8 %173, 32
  %420 = icmp eq i8 %419, 0
  %421 = xor i8 %418, 96
  %422 = select i1 %420, i8 %418, i8 %421
  %423 = and i8 %173, 64
  %424 = icmp eq i8 %423, 0
  %425 = xor i8 %422, -64
  %426 = select i1 %424, i8 %422, i8 %425
  %427 = icmp sgt i8 %173, -1
  %428 = xor i8 %426, -101
  %429 = select i1 %427, i8 %426, i8 %428
  %430 = xor i8 %399, %429
  %431 = xor i8 %430, %63
  %432 = xor i8 %431, %73
  %433 = shl i8 %173, 1
  %434 = and i8 %433, 126
  %435 = or i8 %433, -128
  %436 = select i1 %424, i8 %434, i8 %435
  %437 = xor i8 %436, 27
  %438 = select i1 %427, i8 %436, i8 %437
  %439 = and i8 %63, 1
  %440 = icmp eq i8 %439, 0
  %441 = select i1 %440, i8 0, i8 3
  %442 = and i8 %63, 2
  %443 = icmp eq i8 %442, 0
  %444 = xor i8 %441, 6
  %445 = select i1 %443, i8 %441, i8 %444
  %446 = and i8 %63, 4
  %447 = icmp eq i8 %446, 0
  %448 = xor i8 %445, 12
  %449 = select i1 %447, i8 %445, i8 %448
  %450 = and i8 %63, 8
  %451 = icmp eq i8 %450, 0
  %452 = xor i8 %449, 24
  %453 = select i1 %451, i8 %449, i8 %452
  %454 = and i8 %63, 16
  %455 = icmp eq i8 %454, 0
  %456 = xor i8 %453, 48
  %457 = select i1 %455, i8 %453, i8 %456
  %458 = and i8 %63, 32
  %459 = icmp eq i8 %458, 0
  %460 = xor i8 %457, 96
  %461 = select i1 %459, i8 %457, i8 %460
  %462 = and i8 %63, 64
  %463 = icmp eq i8 %462, 0
  %464 = xor i8 %461, -64
  %465 = select i1 %463, i8 %461, i8 %464
  %466 = icmp sgt i8 %63, -1
  %467 = xor i8 %465, -101
  %468 = select i1 %466, i8 %465, i8 %467
  %469 = xor i8 %468, %438
  %470 = xor i8 %469, %73
  %471 = xor i8 %470, %123
  %472 = select i1 %341, i8 0, i8 3
  %473 = xor i8 %472, 6
  %474 = select i1 %343, i8 %472, i8 %473
  %475 = xor i8 %474, 12
  %476 = select i1 %345, i8 %474, i8 %475
  %477 = xor i8 %476, 24
  %478 = select i1 %347, i8 %476, i8 %477
  %479 = xor i8 %478, 48
  %480 = select i1 %349, i8 %478, i8 %479
  %481 = xor i8 %480, 96
  %482 = select i1 %351, i8 %480, i8 %481
  %483 = xor i8 %482, -64
  %484 = select i1 %355, i8 %482, i8 %483
  %485 = xor i8 %484, -101
  %486 = select i1 %358, i8 %484, i8 %485
  %487 = shl i8 %63, 1
  %488 = and i8 %487, 126
  %489 = or i8 %487, -128
  %490 = select i1 %463, i8 %488, i8 %489
  %491 = xor i8 %490, 27
  %492 = select i1 %466, i8 %490, i8 %491
  %493 = xor i8 %486, %492
  %494 = xor i8 %493, %123
  %495 = xor i8 %494, %173
  %496 = and i8 %113, 1
  %497 = icmp eq i8 %496, 0
  %498 = and i8 %113, 2
  %499 = icmp eq i8 %498, 0
  %500 = and i8 %113, 4
  %501 = icmp eq i8 %500, 0
  %502 = and i8 %113, 8
  %503 = icmp eq i8 %502, 0
  %504 = and i8 %113, 16
  %505 = icmp eq i8 %504, 0
  %506 = and i8 %113, 32
  %507 = icmp eq i8 %506, 0
  %508 = shl i8 %113, 1
  %509 = and i8 %508, 126
  %510 = and i8 %113, 64
  %511 = icmp eq i8 %510, 0
  %512 = or i8 %508, -128
  %513 = select i1 %511, i8 %509, i8 %512
  %514 = icmp sgt i8 %113, -1
  %515 = xor i8 %513, 27
  %516 = select i1 %514, i8 %513, i8 %515
  %517 = and i8 %163, 1
  %518 = icmp eq i8 %517, 0
  %519 = select i1 %518, i8 0, i8 3
  %520 = and i8 %163, 2
  %521 = icmp eq i8 %520, 0
  %522 = xor i8 %519, 6
  %523 = select i1 %521, i8 %519, i8 %522
  %524 = and i8 %163, 4
  %525 = icmp eq i8 %524, 0
  %526 = xor i8 %523, 12
  %527 = select i1 %525, i8 %523, i8 %526
  %528 = and i8 %163, 8
  %529 = icmp eq i8 %528, 0
  %530 = xor i8 %527, 24
  %531 = select i1 %529, i8 %527, i8 %530
  %532 = and i8 %163, 16
  %533 = icmp eq i8 %532, 0
  %534 = xor i8 %531, 48
  %535 = select i1 %533, i8 %531, i8 %534
  %536 = and i8 %163, 32
  %537 = icmp eq i8 %536, 0
  %538 = xor i8 %535, 96
  %539 = select i1 %537, i8 %535, i8 %538
  %540 = and i8 %163, 64
  %541 = icmp eq i8 %540, 0
  %542 = xor i8 %539, -64
  %543 = select i1 %541, i8 %539, i8 %542
  %544 = icmp sgt i8 %163, -1
  %545 = xor i8 %543, -101
  %546 = select i1 %544, i8 %543, i8 %545
  %547 = xor i8 %516, %546
  %548 = xor i8 %547, %53
  %549 = xor i8 %548, %103
  %550 = shl i8 %163, 1
  %551 = and i8 %550, 126
  %552 = or i8 %550, -128
  %553 = select i1 %541, i8 %551, i8 %552
  %554 = xor i8 %553, 27
  %555 = select i1 %544, i8 %553, i8 %554
  %556 = and i8 %53, 1
  %557 = icmp eq i8 %556, 0
  %558 = select i1 %557, i8 0, i8 3
  %559 = and i8 %53, 2
  %560 = icmp eq i8 %559, 0
  %561 = xor i8 %558, 6
  %562 = select i1 %560, i8 %558, i8 %561
  %563 = and i8 %53, 4
  %564 = icmp eq i8 %563, 0
  %565 = xor i8 %562, 12
  %566 = select i1 %564, i8 %562, i8 %565
  %567 = and i8 %53, 8
  %568 = icmp eq i8 %567, 0
  %569 = xor i8 %566, 24
  %570 = select i1 %568, i8 %566, i8 %569
  %571 = and i8 %53, 16
  %572 = icmp eq i8 %571, 0
  %573 = xor i8 %570, 48
  %574 = select i1 %572, i8 %570, i8 %573
  %575 = and i8 %53, 32
  %576 = icmp eq i8 %575, 0
  %577 = xor i8 %574, 96
  %578 = select i1 %576, i8 %574, i8 %577
  %579 = and i8 %53, 64
  %580 = icmp eq i8 %579, 0
  %581 = xor i8 %578, -64
  %582 = select i1 %580, i8 %578, i8 %581
  %583 = icmp sgt i8 %53, -1
  %584 = xor i8 %582, -101
  %585 = select i1 %583, i8 %582, i8 %584
  %586 = xor i8 %585, %555
  %587 = xor i8 %586, %103
  %588 = xor i8 %587, %113
  %589 = shl i8 %53, 1
  %590 = and i8 %589, 126
  %591 = or i8 %589, -128
  %592 = select i1 %580, i8 %590, i8 %591
  %593 = xor i8 %592, 27
  %594 = select i1 %583, i8 %592, i8 %593
  %595 = and i8 %103, 1
  %596 = icmp eq i8 %595, 0
  %597 = select i1 %596, i8 0, i8 3
  %598 = and i8 %103, 2
  %599 = icmp eq i8 %598, 0
  %600 = xor i8 %597, 6
  %601 = select i1 %599, i8 %597, i8 %600
  %602 = and i8 %103, 4
  %603 = icmp eq i8 %602, 0
  %604 = xor i8 %601, 12
  %605 = select i1 %603, i8 %601, i8 %604
  %606 = and i8 %103, 8
  %607 = icmp eq i8 %606, 0
  %608 = xor i8 %605, 24
  %609 = select i1 %607, i8 %605, i8 %608
  %610 = and i8 %103, 16
  %611 = icmp eq i8 %610, 0
  %612 = xor i8 %609, 48
  %613 = select i1 %611, i8 %609, i8 %612
  %614 = and i8 %103, 32
  %615 = icmp eq i8 %614, 0
  %616 = xor i8 %613, 96
  %617 = select i1 %615, i8 %613, i8 %616
  %618 = and i8 %103, 64
  %619 = icmp eq i8 %618, 0
  %620 = xor i8 %617, -64
  %621 = select i1 %619, i8 %617, i8 %620
  %622 = icmp sgt i8 %103, -1
  %623 = xor i8 %621, -101
  %624 = select i1 %622, i8 %621, i8 %623
  %625 = xor i8 %624, %594
  %626 = xor i8 %625, %113
  %627 = xor i8 %626, %163
  %628 = select i1 %497, i8 0, i8 3
  %629 = xor i8 %628, 6
  %630 = select i1 %499, i8 %628, i8 %629
  %631 = xor i8 %630, 12
  %632 = select i1 %501, i8 %630, i8 %631
  %633 = xor i8 %632, 24
  %634 = select i1 %503, i8 %632, i8 %633
  %635 = xor i8 %634, 48
  %636 = select i1 %505, i8 %634, i8 %635
  %637 = xor i8 %636, 96
  %638 = select i1 %507, i8 %636, i8 %637
  %639 = xor i8 %638, -64
  %640 = select i1 %511, i8 %638, i8 %639
  %641 = xor i8 %640, -101
  %642 = select i1 %514, i8 %640, i8 %641
  %643 = shl i8 %103, 1
  %644 = and i8 %643, 126
  %645 = or i8 %643, -128
  %646 = select i1 %619, i8 %644, i8 %645
  %647 = xor i8 %646, 27
  %648 = select i1 %622, i8 %646, i8 %647
  %649 = xor i8 %648, %642
  %650 = xor i8 %649, %53
  %651 = xor i8 %650, %163
  %652 = and i8 %153, 1
  %653 = icmp eq i8 %652, 0
  %654 = and i8 %153, 2
  %655 = icmp eq i8 %654, 0
  %656 = and i8 %153, 4
  %657 = icmp eq i8 %656, 0
  %658 = and i8 %153, 8
  %659 = icmp eq i8 %658, 0
  %660 = and i8 %153, 16
  %661 = icmp eq i8 %660, 0
  %662 = and i8 %153, 32
  %663 = icmp eq i8 %662, 0
  %664 = shl i8 %153, 1
  %665 = and i8 %664, 126
  %666 = and i8 %153, 64
  %667 = icmp eq i8 %666, 0
  %668 = or i8 %664, -128
  %669 = select i1 %667, i8 %665, i8 %668
  %670 = icmp sgt i8 %153, -1
  %671 = xor i8 %669, 27
  %672 = select i1 %670, i8 %669, i8 %671
  %673 = and i8 %43, 1
  %674 = icmp eq i8 %673, 0
  %675 = select i1 %674, i8 0, i8 3
  %676 = and i8 %43, 2
  %677 = icmp eq i8 %676, 0
  %678 = xor i8 %675, 6
  %679 = select i1 %677, i8 %675, i8 %678
  %680 = and i8 %43, 4
  %681 = icmp eq i8 %680, 0
  %682 = xor i8 %679, 12
  %683 = select i1 %681, i8 %679, i8 %682
  %684 = and i8 %43, 8
  %685 = icmp eq i8 %684, 0
  %686 = xor i8 %683, 24
  %687 = select i1 %685, i8 %683, i8 %686
  %688 = and i8 %43, 16
  %689 = icmp eq i8 %688, 0
  %690 = xor i8 %687, 48
  %691 = select i1 %689, i8 %687, i8 %690
  %692 = and i8 %43, 32
  %693 = icmp eq i8 %692, 0
  %694 = xor i8 %691, 96
  %695 = select i1 %693, i8 %691, i8 %694
  %696 = and i8 %43, 64
  %697 = icmp eq i8 %696, 0
  %698 = xor i8 %695, -64
  %699 = select i1 %697, i8 %695, i8 %698
  %700 = icmp sgt i8 %43, -1
  %701 = xor i8 %699, -101
  %702 = select i1 %700, i8 %699, i8 %701
  %703 = xor i8 %702, %672
  %704 = xor i8 %703, %93
  %705 = xor i8 %704, %143
  %706 = shl i8 %43, 1
  %707 = and i8 %706, 126
  %708 = or i8 %706, -128
  %709 = select i1 %697, i8 %707, i8 %708
  %710 = xor i8 %709, 27
  %711 = select i1 %700, i8 %709, i8 %710
  %712 = and i8 %93, 1
  %713 = icmp eq i8 %712, 0
  %714 = select i1 %713, i8 0, i8 3
  %715 = and i8 %93, 2
  %716 = icmp eq i8 %715, 0
  %717 = xor i8 %714, 6
  %718 = select i1 %716, i8 %714, i8 %717
  %719 = and i8 %93, 4
  %720 = icmp eq i8 %719, 0
  %721 = xor i8 %718, 12
  %722 = select i1 %720, i8 %718, i8 %721
  %723 = and i8 %93, 8
  %724 = icmp eq i8 %723, 0
  %725 = xor i8 %722, 24
  %726 = select i1 %724, i8 %722, i8 %725
  %727 = and i8 %93, 16
  %728 = icmp eq i8 %727, 0
  %729 = xor i8 %726, 48
  %730 = select i1 %728, i8 %726, i8 %729
  %731 = and i8 %93, 32
  %732 = icmp eq i8 %731, 0
  %733 = xor i8 %730, 96
  %734 = select i1 %732, i8 %730, i8 %733
  %735 = and i8 %93, 64
  %736 = icmp eq i8 %735, 0
  %737 = xor i8 %734, -64
  %738 = select i1 %736, i8 %734, i8 %737
  %739 = icmp sgt i8 %93, -1
  %740 = xor i8 %738, -101
  %741 = select i1 %739, i8 %738, i8 %740
  %742 = xor i8 %741, %711
  %743 = xor i8 %742, %143
  %744 = xor i8 %743, %153
  %745 = shl i8 %93, 1
  %746 = and i8 %745, 126
  %747 = or i8 %745, -128
  %748 = select i1 %736, i8 %746, i8 %747
  %749 = xor i8 %748, 27
  %750 = select i1 %739, i8 %748, i8 %749
  %751 = and i8 %143, 1
  %752 = icmp eq i8 %751, 0
  %753 = select i1 %752, i8 0, i8 3
  %754 = and i8 %143, 2
  %755 = icmp eq i8 %754, 0
  %756 = xor i8 %753, 6
  %757 = select i1 %755, i8 %753, i8 %756
  %758 = and i8 %143, 4
  %759 = icmp eq i8 %758, 0
  %760 = xor i8 %757, 12
  %761 = select i1 %759, i8 %757, i8 %760
  %762 = and i8 %143, 8
  %763 = icmp eq i8 %762, 0
  %764 = xor i8 %761, 24
  %765 = select i1 %763, i8 %761, i8 %764
  %766 = and i8 %143, 16
  %767 = icmp eq i8 %766, 0
  %768 = xor i8 %765, 48
  %769 = select i1 %767, i8 %765, i8 %768
  %770 = and i8 %143, 32
  %771 = icmp eq i8 %770, 0
  %772 = xor i8 %769, 96
  %773 = select i1 %771, i8 %769, i8 %772
  %774 = and i8 %143, 64
  %775 = icmp eq i8 %774, 0
  %776 = xor i8 %773, -64
  %777 = select i1 %775, i8 %773, i8 %776
  %778 = icmp sgt i8 %143, -1
  %779 = xor i8 %777, -101
  %780 = select i1 %778, i8 %777, i8 %779
  %781 = xor i8 %750, %780
  %782 = xor i8 %781, %43
  %783 = xor i8 %782, %153
  %784 = select i1 %653, i8 0, i8 3
  %785 = xor i8 %784, 6
  %786 = select i1 %655, i8 %784, i8 %785
  %787 = xor i8 %786, 12
  %788 = select i1 %657, i8 %786, i8 %787
  %789 = xor i8 %788, 24
  %790 = select i1 %659, i8 %788, i8 %789
  %791 = xor i8 %790, 48
  %792 = select i1 %661, i8 %790, i8 %791
  %793 = xor i8 %792, 96
  %794 = select i1 %663, i8 %792, i8 %793
  %795 = xor i8 %794, -64
  %796 = select i1 %667, i8 %794, i8 %795
  %797 = xor i8 %796, -101
  %798 = select i1 %670, i8 %796, i8 %797
  %799 = shl i8 %143, 1
  %800 = and i8 %799, 126
  %801 = or i8 %799, -128
  %802 = select i1 %775, i8 %800, i8 %801
  %803 = xor i8 %802, 27
  %804 = select i1 %778, i8 %802, i8 %803
  %805 = xor i8 %804, %798
  %806 = xor i8 %805, %43
  %807 = xor i8 %806, %93
  %808 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %2) #4
  %809 = icmp eq ptr %808, null
  br i1 %809, label %810, label %7, !llvm.loop !6

810:                                              ; preds = %182, %0
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %2) #4
  call void @llvm.lifetime.end.p0(i64 256, ptr nonnull %1) #4
  ret i32 0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind memory(none)
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #3

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="duotronic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { nounwind memory(none) }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 3047ef595b8b4944540de771dcf86dc85a97ef76)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.mustprogress"}
!8 = !{!"llvm.loop.unroll.disable"}
