; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

%struct.bpf_iter_num = type { i64, i64, i64, i64 }

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca [16 x i8], align 1
  %2 = alloca [256 x i8], align 1
  %3 = alloca %struct.bpf_iter_num, align 8
  %4 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 10, i32 0, i32 0, i32 0) #3, !srcloc !3
  %5 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 11, i32 0, i32 0, i32 0) #3, !srcloc !4
  %6 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 12, i32 0, i32 0, i32 0) #3, !srcloc !5
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %1) #3
  call void @llvm.lifetime.start.p0(i64 256, ptr nonnull %2) #3
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %3) #3
  %7 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %3, i32 noundef 0, i32 noundef 16) #3
  %8 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %3) #3
  %9 = icmp eq ptr %8, null
  br i1 %9, label %18, label %10

10:                                               ; preds = %0, %10
  %11 = phi ptr [ %16, %10 ], [ %8, %0 ]
  %12 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %4, ptr noundef nonnull %11) #3
  %13 = load i8, ptr %12, align 1, !tbaa !6
  %14 = load i64, ptr %11, align 8, !tbaa !9
  %15 = getelementptr inbounds [16 x i8], ptr %1, i64 0, i64 %14
  store i8 %13, ptr %15, align 1, !tbaa !6
  %16 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %3) #3
  %17 = icmp eq ptr %16, null
  br i1 %17, label %18, label %10, !llvm.loop !11

18:                                               ; preds = %10, %0
  %19 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %3, i32 noundef 0, i32 noundef 256) #3
  %20 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %3) #3
  %21 = icmp eq ptr %20, null
  br i1 %21, label %30, label %22

22:                                               ; preds = %18, %22
  %23 = phi ptr [ %28, %22 ], [ %20, %18 ]
  %24 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %5, ptr noundef nonnull %23) #3
  %25 = load i8, ptr %24, align 1, !tbaa !6
  %26 = load i64, ptr %23, align 8, !tbaa !9
  %27 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %26
  store i8 %25, ptr %27, align 1, !tbaa !6
  %28 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %3) #3
  %29 = icmp eq ptr %28, null
  br i1 %29, label %30, label %22, !llvm.loop !14

30:                                               ; preds = %22, %18
  %31 = load i8, ptr %1, align 1, !tbaa !6
  %32 = getelementptr inbounds nuw i8, ptr %1, i64 1
  %33 = getelementptr inbounds nuw i8, ptr %1, i64 2
  %34 = getelementptr inbounds nuw i8, ptr %1, i64 3
  %35 = getelementptr inbounds nuw i8, ptr %1, i64 4
  %36 = getelementptr inbounds nuw i8, ptr %1, i64 5
  %37 = getelementptr inbounds nuw i8, ptr %1, i64 6
  %38 = getelementptr inbounds nuw i8, ptr %1, i64 7
  %39 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %40 = getelementptr inbounds nuw i8, ptr %1, i64 9
  %41 = getelementptr inbounds nuw i8, ptr %1, i64 10
  %42 = getelementptr inbounds nuw i8, ptr %1, i64 11
  %43 = getelementptr inbounds nuw i8, ptr %1, i64 12
  %44 = getelementptr inbounds nuw i8, ptr %1, i64 13
  %45 = getelementptr inbounds nuw i8, ptr %1, i64 14
  %46 = getelementptr inbounds nuw i8, ptr %1, i64 15
  %47 = icmp sgt i8 %31, -1
  %48 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %47)
  %49 = icmp slt i8 %31, 16
  %50 = select i1 %48, i1 %49, i1 false
  br i1 %50, label %51, label %55

51:                                               ; preds = %30
  %52 = sext i8 %31 to i64
  %53 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %52
  %54 = load i8, ptr %53, align 1, !tbaa !6
  store i8 %54, ptr %1, align 1, !tbaa !6
  br label %55

55:                                               ; preds = %51, %30
  %56 = phi i8 [ %54, %51 ], [ %31, %30 ]
  %57 = load i8, ptr %32, align 1, !tbaa !6
  %58 = icmp sgt i8 %57, -1
  %59 = call i1 @llvm.bpf.passthrough.i1.i1(i32 1, i1 %58)
  %60 = icmp slt i8 %57, 16
  %61 = select i1 %59, i1 %60, i1 false
  br i1 %61, label %62, label %66

62:                                               ; preds = %55
  %63 = sext i8 %57 to i64
  %64 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %63
  %65 = load i8, ptr %64, align 1, !tbaa !6
  store i8 %65, ptr %32, align 1, !tbaa !6
  br label %66

66:                                               ; preds = %62, %55
  %67 = phi i8 [ %65, %62 ], [ %57, %55 ]
  %68 = load i8, ptr %33, align 1, !tbaa !6
  %69 = icmp sgt i8 %68, -1
  %70 = call i1 @llvm.bpf.passthrough.i1.i1(i32 2, i1 %69)
  %71 = icmp slt i8 %68, 16
  %72 = select i1 %70, i1 %71, i1 false
  br i1 %72, label %73, label %77

73:                                               ; preds = %66
  %74 = sext i8 %68 to i64
  %75 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %74
  %76 = load i8, ptr %75, align 1, !tbaa !6
  store i8 %76, ptr %33, align 1, !tbaa !6
  br label %77

77:                                               ; preds = %73, %66
  %78 = phi i8 [ %76, %73 ], [ %68, %66 ]
  %79 = load i8, ptr %34, align 1, !tbaa !6
  %80 = icmp sgt i8 %79, -1
  %81 = call i1 @llvm.bpf.passthrough.i1.i1(i32 3, i1 %80)
  %82 = icmp slt i8 %79, 16
  %83 = select i1 %81, i1 %82, i1 false
  br i1 %83, label %84, label %88

84:                                               ; preds = %77
  %85 = sext i8 %79 to i64
  %86 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %85
  %87 = load i8, ptr %86, align 1, !tbaa !6
  store i8 %87, ptr %34, align 1, !tbaa !6
  br label %88

88:                                               ; preds = %84, %77
  %89 = phi i8 [ %87, %84 ], [ %79, %77 ]
  %90 = load i8, ptr %35, align 1, !tbaa !6
  %91 = icmp sgt i8 %90, -1
  %92 = call i1 @llvm.bpf.passthrough.i1.i1(i32 4, i1 %91)
  %93 = icmp slt i8 %90, 16
  %94 = select i1 %92, i1 %93, i1 false
  br i1 %94, label %95, label %99

95:                                               ; preds = %88
  %96 = sext i8 %90 to i64
  %97 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %96
  %98 = load i8, ptr %97, align 1, !tbaa !6
  store i8 %98, ptr %35, align 1, !tbaa !6
  br label %99

99:                                               ; preds = %95, %88
  %100 = load i8, ptr %36, align 1, !tbaa !6
  %101 = icmp sgt i8 %100, -1
  %102 = call i1 @llvm.bpf.passthrough.i1.i1(i32 5, i1 %101)
  %103 = icmp slt i8 %100, 16
  %104 = select i1 %102, i1 %103, i1 false
  br i1 %104, label %105, label %109

105:                                              ; preds = %99
  %106 = sext i8 %100 to i64
  %107 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %106
  %108 = load i8, ptr %107, align 1, !tbaa !6
  store i8 %108, ptr %36, align 1, !tbaa !6
  br label %109

109:                                              ; preds = %105, %99
  %110 = phi i8 [ %108, %105 ], [ %100, %99 ]
  %111 = load i8, ptr %37, align 1, !tbaa !6
  %112 = icmp sgt i8 %111, -1
  %113 = call i1 @llvm.bpf.passthrough.i1.i1(i32 6, i1 %112)
  %114 = icmp slt i8 %111, 16
  %115 = select i1 %113, i1 %114, i1 false
  br i1 %115, label %116, label %120

116:                                              ; preds = %109
  %117 = sext i8 %111 to i64
  %118 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %117
  %119 = load i8, ptr %118, align 1, !tbaa !6
  store i8 %119, ptr %37, align 1, !tbaa !6
  br label %120

120:                                              ; preds = %116, %109
  %121 = phi i8 [ %119, %116 ], [ %111, %109 ]
  %122 = load i8, ptr %38, align 1, !tbaa !6
  %123 = icmp sgt i8 %122, -1
  %124 = call i1 @llvm.bpf.passthrough.i1.i1(i32 7, i1 %123)
  %125 = icmp slt i8 %122, 16
  %126 = select i1 %124, i1 %125, i1 false
  br i1 %126, label %127, label %131

127:                                              ; preds = %120
  %128 = sext i8 %122 to i64
  %129 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %128
  %130 = load i8, ptr %129, align 1, !tbaa !6
  store i8 %130, ptr %38, align 1, !tbaa !6
  br label %131

131:                                              ; preds = %127, %120
  %132 = phi i8 [ %130, %127 ], [ %122, %120 ]
  %133 = load i8, ptr %39, align 1, !tbaa !6
  %134 = icmp sgt i8 %133, -1
  %135 = call i1 @llvm.bpf.passthrough.i1.i1(i32 8, i1 %134)
  %136 = icmp slt i8 %133, 16
  %137 = select i1 %135, i1 %136, i1 false
  br i1 %137, label %138, label %142

138:                                              ; preds = %131
  %139 = sext i8 %133 to i64
  %140 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %139
  %141 = load i8, ptr %140, align 1, !tbaa !6
  store i8 %141, ptr %39, align 1, !tbaa !6
  br label %142

142:                                              ; preds = %138, %131
  %143 = load i8, ptr %40, align 1, !tbaa !6
  %144 = icmp sgt i8 %143, -1
  %145 = call i1 @llvm.bpf.passthrough.i1.i1(i32 9, i1 %144)
  %146 = icmp slt i8 %143, 16
  %147 = select i1 %145, i1 %146, i1 false
  br i1 %147, label %148, label %152

148:                                              ; preds = %142
  %149 = sext i8 %143 to i64
  %150 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %149
  %151 = load i8, ptr %150, align 1, !tbaa !6
  br label %152

152:                                              ; preds = %148, %142
  %153 = phi i8 [ %151, %148 ], [ %143, %142 ]
  %154 = load i8, ptr %41, align 1, !tbaa !6
  %155 = icmp sgt i8 %154, -1
  %156 = call i1 @llvm.bpf.passthrough.i1.i1(i32 10, i1 %155)
  %157 = icmp slt i8 %154, 16
  %158 = select i1 %156, i1 %157, i1 false
  br i1 %158, label %159, label %163

159:                                              ; preds = %152
  %160 = sext i8 %154 to i64
  %161 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %160
  %162 = load i8, ptr %161, align 1, !tbaa !6
  br label %163

163:                                              ; preds = %159, %152
  %164 = phi i8 [ %162, %159 ], [ %154, %152 ]
  %165 = load i8, ptr %42, align 1, !tbaa !6
  %166 = icmp sgt i8 %165, -1
  %167 = call i1 @llvm.bpf.passthrough.i1.i1(i32 11, i1 %166)
  %168 = icmp slt i8 %165, 16
  %169 = select i1 %167, i1 %168, i1 false
  br i1 %169, label %170, label %174

170:                                              ; preds = %163
  %171 = sext i8 %165 to i64
  %172 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %171
  %173 = load i8, ptr %172, align 1, !tbaa !6
  br label %174

174:                                              ; preds = %170, %163
  %175 = phi i8 [ %173, %170 ], [ %165, %163 ]
  %176 = load i8, ptr %43, align 1, !tbaa !6
  %177 = icmp sgt i8 %176, -1
  %178 = call i1 @llvm.bpf.passthrough.i1.i1(i32 12, i1 %177)
  %179 = icmp slt i8 %176, 16
  %180 = select i1 %178, i1 %179, i1 false
  br i1 %180, label %181, label %185

181:                                              ; preds = %174
  %182 = sext i8 %176 to i64
  %183 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %182
  %184 = load i8, ptr %183, align 1, !tbaa !6
  store i8 %184, ptr %43, align 1, !tbaa !6
  br label %185

185:                                              ; preds = %181, %174
  %186 = load i8, ptr %44, align 1, !tbaa !6
  %187 = icmp sgt i8 %186, -1
  %188 = call i1 @llvm.bpf.passthrough.i1.i1(i32 13, i1 %187)
  %189 = icmp slt i8 %186, 16
  %190 = select i1 %188, i1 %189, i1 false
  br i1 %190, label %191, label %195

191:                                              ; preds = %185
  %192 = sext i8 %186 to i64
  %193 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %192
  %194 = load i8, ptr %193, align 1, !tbaa !6
  br label %195

195:                                              ; preds = %191, %185
  %196 = phi i8 [ %194, %191 ], [ %186, %185 ]
  %197 = load i8, ptr %45, align 1, !tbaa !6
  %198 = icmp sgt i8 %197, -1
  %199 = call i1 @llvm.bpf.passthrough.i1.i1(i32 14, i1 %198)
  %200 = icmp slt i8 %197, 16
  %201 = select i1 %199, i1 %200, i1 false
  br i1 %201, label %202, label %206

202:                                              ; preds = %195
  %203 = sext i8 %197 to i64
  %204 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %203
  %205 = load i8, ptr %204, align 1, !tbaa !6
  br label %206

206:                                              ; preds = %202, %195
  %207 = phi i8 [ %205, %202 ], [ %197, %195 ]
  %208 = load i8, ptr %46, align 1, !tbaa !6
  %209 = icmp sgt i8 %208, -1
  %210 = call i1 @llvm.bpf.passthrough.i1.i1(i32 15, i1 %209)
  %211 = icmp slt i8 %208, 16
  %212 = select i1 %210, i1 %211, i1 false
  br i1 %212, label %213, label %217

213:                                              ; preds = %206
  %214 = sext i8 %208 to i64
  %215 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %214
  %216 = load i8, ptr %215, align 1, !tbaa !6
  br label %217

217:                                              ; preds = %213, %206
  %218 = phi i8 [ %216, %213 ], [ %208, %206 ]
  %219 = and i8 %56, 1
  %220 = icmp eq i8 %219, 0
  %221 = and i8 %56, 2
  %222 = icmp eq i8 %221, 0
  %223 = and i8 %56, 4
  %224 = icmp eq i8 %223, 0
  %225 = and i8 %56, 8
  %226 = icmp eq i8 %225, 0
  %227 = and i8 %56, 16
  %228 = icmp eq i8 %227, 0
  %229 = and i8 %56, 32
  %230 = icmp eq i8 %229, 0
  %231 = shl i8 %56, 1
  %232 = and i8 %231, 126
  %233 = and i8 %56, 64
  %234 = icmp eq i8 %233, 0
  %235 = or i8 %231, -128
  %236 = select i1 %234, i8 %232, i8 %235
  %237 = icmp sgt i8 %56, -1
  %238 = xor i8 %236, 27
  %239 = select i1 %237, i8 %236, i8 %238
  %240 = and i8 %110, 1
  %241 = icmp eq i8 %240, 0
  %242 = select i1 %241, i8 0, i8 3
  %243 = and i8 %110, 2
  %244 = icmp eq i8 %243, 0
  %245 = xor i8 %242, 6
  %246 = select i1 %244, i8 %242, i8 %245
  %247 = and i8 %110, 4
  %248 = icmp eq i8 %247, 0
  %249 = xor i8 %246, 12
  %250 = select i1 %248, i8 %246, i8 %249
  %251 = and i8 %110, 8
  %252 = icmp eq i8 %251, 0
  %253 = xor i8 %250, 24
  %254 = select i1 %252, i8 %250, i8 %253
  %255 = and i8 %110, 16
  %256 = icmp eq i8 %255, 0
  %257 = xor i8 %254, 48
  %258 = select i1 %256, i8 %254, i8 %257
  %259 = and i8 %110, 32
  %260 = icmp eq i8 %259, 0
  %261 = xor i8 %258, 96
  %262 = select i1 %260, i8 %258, i8 %261
  %263 = and i8 %110, 64
  %264 = icmp eq i8 %263, 0
  %265 = xor i8 %262, -64
  %266 = select i1 %264, i8 %262, i8 %265
  %267 = icmp sgt i8 %110, -1
  %268 = xor i8 %266, -101
  %269 = select i1 %267, i8 %266, i8 %268
  %270 = xor i8 %269, %239
  %271 = xor i8 %270, %164
  %272 = xor i8 %271, %218
  %273 = shl i8 %110, 1
  %274 = and i8 %273, 126
  %275 = or i8 %273, -128
  %276 = select i1 %264, i8 %274, i8 %275
  %277 = xor i8 %276, 27
  %278 = select i1 %267, i8 %276, i8 %277
  %279 = and i8 %164, 1
  %280 = icmp eq i8 %279, 0
  %281 = select i1 %280, i8 0, i8 3
  %282 = and i8 %164, 2
  %283 = icmp eq i8 %282, 0
  %284 = xor i8 %281, 6
  %285 = select i1 %283, i8 %281, i8 %284
  %286 = and i8 %164, 4
  %287 = icmp eq i8 %286, 0
  %288 = xor i8 %285, 12
  %289 = select i1 %287, i8 %285, i8 %288
  %290 = and i8 %164, 8
  %291 = icmp eq i8 %290, 0
  %292 = xor i8 %289, 24
  %293 = select i1 %291, i8 %289, i8 %292
  %294 = and i8 %164, 16
  %295 = icmp eq i8 %294, 0
  %296 = xor i8 %293, 48
  %297 = select i1 %295, i8 %293, i8 %296
  %298 = and i8 %164, 32
  %299 = icmp eq i8 %298, 0
  %300 = xor i8 %297, 96
  %301 = select i1 %299, i8 %297, i8 %300
  %302 = and i8 %164, 64
  %303 = icmp eq i8 %302, 0
  %304 = xor i8 %301, -64
  %305 = select i1 %303, i8 %301, i8 %304
  %306 = icmp sgt i8 %164, -1
  %307 = xor i8 %305, -101
  %308 = select i1 %306, i8 %305, i8 %307
  %309 = xor i8 %278, %308
  %310 = xor i8 %309, %218
  %311 = xor i8 %310, %56
  %312 = shl i8 %164, 1
  %313 = and i8 %312, 126
  %314 = or i8 %312, -128
  %315 = select i1 %303, i8 %313, i8 %314
  %316 = xor i8 %315, 27
  %317 = select i1 %306, i8 %315, i8 %316
  %318 = and i8 %218, 1
  %319 = icmp eq i8 %318, 0
  %320 = select i1 %319, i8 0, i8 3
  %321 = and i8 %218, 2
  %322 = icmp eq i8 %321, 0
  %323 = xor i8 %320, 6
  %324 = select i1 %322, i8 %320, i8 %323
  %325 = and i8 %218, 4
  %326 = icmp eq i8 %325, 0
  %327 = xor i8 %324, 12
  %328 = select i1 %326, i8 %324, i8 %327
  %329 = and i8 %218, 8
  %330 = icmp eq i8 %329, 0
  %331 = xor i8 %328, 24
  %332 = select i1 %330, i8 %328, i8 %331
  %333 = and i8 %218, 16
  %334 = icmp eq i8 %333, 0
  %335 = xor i8 %332, 48
  %336 = select i1 %334, i8 %332, i8 %335
  %337 = and i8 %218, 32
  %338 = icmp eq i8 %337, 0
  %339 = xor i8 %336, 96
  %340 = select i1 %338, i8 %336, i8 %339
  %341 = and i8 %218, 64
  %342 = icmp eq i8 %341, 0
  %343 = xor i8 %340, -64
  %344 = select i1 %342, i8 %340, i8 %343
  %345 = icmp sgt i8 %218, -1
  %346 = xor i8 %344, -101
  %347 = select i1 %345, i8 %344, i8 %346
  %348 = xor i8 %317, %347
  %349 = xor i8 %348, %110
  %350 = xor i8 %349, %56
  %351 = select i1 %220, i8 0, i8 3
  %352 = xor i8 %351, 6
  %353 = select i1 %222, i8 %351, i8 %352
  %354 = xor i8 %353, 12
  %355 = select i1 %224, i8 %353, i8 %354
  %356 = xor i8 %355, 24
  %357 = select i1 %226, i8 %355, i8 %356
  %358 = xor i8 %357, 48
  %359 = select i1 %228, i8 %357, i8 %358
  %360 = xor i8 %359, 96
  %361 = select i1 %230, i8 %359, i8 %360
  %362 = xor i8 %361, -64
  %363 = select i1 %234, i8 %361, i8 %362
  %364 = xor i8 %363, -101
  %365 = select i1 %237, i8 %363, i8 %364
  %366 = shl i8 %218, 1
  %367 = and i8 %366, 126
  %368 = or i8 %366, -128
  %369 = select i1 %342, i8 %367, i8 %368
  %370 = xor i8 %369, 27
  %371 = select i1 %345, i8 %369, i8 %370
  %372 = xor i8 %371, %365
  %373 = xor i8 %372, %110
  %374 = xor i8 %373, %164
  store i8 %272, ptr %1, align 1, !tbaa !6
  store i8 %311, ptr %32, align 1, !tbaa !6
  store i8 %350, ptr %33, align 1, !tbaa !6
  store i8 %374, ptr %34, align 1, !tbaa !6
  %375 = load i8, ptr %35, align 1, !tbaa !6
  %376 = and i8 %375, 1
  %377 = icmp eq i8 %376, 0
  %378 = and i8 %375, 2
  %379 = icmp eq i8 %378, 0
  %380 = and i8 %375, 4
  %381 = icmp eq i8 %380, 0
  %382 = and i8 %375, 8
  %383 = icmp eq i8 %382, 0
  %384 = and i8 %375, 16
  %385 = icmp eq i8 %384, 0
  %386 = and i8 %375, 32
  %387 = icmp eq i8 %386, 0
  %388 = shl i8 %375, 1
  %389 = and i8 %388, 126
  %390 = and i8 %375, 64
  %391 = icmp eq i8 %390, 0
  %392 = or i8 %388, -128
  %393 = select i1 %391, i8 %389, i8 %392
  %394 = icmp sgt i8 %375, -1
  %395 = xor i8 %393, 27
  %396 = select i1 %394, i8 %393, i8 %395
  %397 = and i8 %153, 1
  %398 = icmp eq i8 %397, 0
  %399 = select i1 %398, i8 0, i8 3
  %400 = and i8 %153, 2
  %401 = icmp eq i8 %400, 0
  %402 = xor i8 %399, 6
  %403 = select i1 %401, i8 %399, i8 %402
  %404 = and i8 %153, 4
  %405 = icmp eq i8 %404, 0
  %406 = xor i8 %403, 12
  %407 = select i1 %405, i8 %403, i8 %406
  %408 = and i8 %153, 8
  %409 = icmp eq i8 %408, 0
  %410 = xor i8 %407, 24
  %411 = select i1 %409, i8 %407, i8 %410
  %412 = and i8 %153, 16
  %413 = icmp eq i8 %412, 0
  %414 = xor i8 %411, 48
  %415 = select i1 %413, i8 %411, i8 %414
  %416 = and i8 %153, 32
  %417 = icmp eq i8 %416, 0
  %418 = xor i8 %415, 96
  %419 = select i1 %417, i8 %415, i8 %418
  %420 = and i8 %153, 64
  %421 = icmp eq i8 %420, 0
  %422 = xor i8 %419, -64
  %423 = select i1 %421, i8 %419, i8 %422
  %424 = icmp sgt i8 %153, -1
  %425 = xor i8 %423, -101
  %426 = select i1 %424, i8 %423, i8 %425
  %427 = xor i8 %426, %396
  %428 = xor i8 %427, %207
  %429 = xor i8 %428, %89
  %430 = shl i8 %153, 1
  %431 = and i8 %430, 126
  %432 = or i8 %430, -128
  %433 = select i1 %421, i8 %431, i8 %432
  %434 = xor i8 %433, 27
  %435 = select i1 %424, i8 %433, i8 %434
  %436 = and i8 %207, 1
  %437 = icmp eq i8 %436, 0
  %438 = select i1 %437, i8 0, i8 3
  %439 = and i8 %207, 2
  %440 = icmp eq i8 %439, 0
  %441 = xor i8 %438, 6
  %442 = select i1 %440, i8 %438, i8 %441
  %443 = and i8 %207, 4
  %444 = icmp eq i8 %443, 0
  %445 = xor i8 %442, 12
  %446 = select i1 %444, i8 %442, i8 %445
  %447 = and i8 %207, 8
  %448 = icmp eq i8 %447, 0
  %449 = xor i8 %446, 24
  %450 = select i1 %448, i8 %446, i8 %449
  %451 = and i8 %207, 16
  %452 = icmp eq i8 %451, 0
  %453 = xor i8 %450, 48
  %454 = select i1 %452, i8 %450, i8 %453
  %455 = and i8 %207, 32
  %456 = icmp eq i8 %455, 0
  %457 = xor i8 %454, 96
  %458 = select i1 %456, i8 %454, i8 %457
  %459 = and i8 %207, 64
  %460 = icmp eq i8 %459, 0
  %461 = xor i8 %458, -64
  %462 = select i1 %460, i8 %458, i8 %461
  %463 = icmp sgt i8 %207, -1
  %464 = xor i8 %462, -101
  %465 = select i1 %463, i8 %462, i8 %464
  %466 = xor i8 %435, %465
  %467 = xor i8 %466, %89
  %468 = xor i8 %467, %375
  %469 = shl i8 %207, 1
  %470 = and i8 %469, 126
  %471 = or i8 %469, -128
  %472 = select i1 %460, i8 %470, i8 %471
  %473 = xor i8 %472, 27
  %474 = select i1 %463, i8 %472, i8 %473
  %475 = and i8 %89, 1
  %476 = icmp eq i8 %475, 0
  %477 = select i1 %476, i8 0, i8 3
  %478 = and i8 %89, 2
  %479 = icmp eq i8 %478, 0
  %480 = xor i8 %477, 6
  %481 = select i1 %479, i8 %477, i8 %480
  %482 = and i8 %89, 4
  %483 = icmp eq i8 %482, 0
  %484 = xor i8 %481, 12
  %485 = select i1 %483, i8 %481, i8 %484
  %486 = and i8 %89, 8
  %487 = icmp eq i8 %486, 0
  %488 = xor i8 %485, 24
  %489 = select i1 %487, i8 %485, i8 %488
  %490 = and i8 %89, 16
  %491 = icmp eq i8 %490, 0
  %492 = xor i8 %489, 48
  %493 = select i1 %491, i8 %489, i8 %492
  %494 = and i8 %89, 32
  %495 = icmp eq i8 %494, 0
  %496 = xor i8 %493, 96
  %497 = select i1 %495, i8 %493, i8 %496
  %498 = and i8 %89, 64
  %499 = icmp eq i8 %498, 0
  %500 = xor i8 %497, -64
  %501 = select i1 %499, i8 %497, i8 %500
  %502 = icmp sgt i8 %89, -1
  %503 = xor i8 %501, -101
  %504 = select i1 %502, i8 %501, i8 %503
  %505 = xor i8 %474, %504
  %506 = xor i8 %505, %153
  %507 = xor i8 %506, %375
  %508 = select i1 %377, i8 0, i8 3
  %509 = xor i8 %508, 6
  %510 = select i1 %379, i8 %508, i8 %509
  %511 = xor i8 %510, 12
  %512 = select i1 %381, i8 %510, i8 %511
  %513 = xor i8 %512, 24
  %514 = select i1 %383, i8 %512, i8 %513
  %515 = xor i8 %514, 48
  %516 = select i1 %385, i8 %514, i8 %515
  %517 = xor i8 %516, 96
  %518 = select i1 %387, i8 %516, i8 %517
  %519 = xor i8 %518, -64
  %520 = select i1 %391, i8 %518, i8 %519
  %521 = xor i8 %520, -101
  %522 = select i1 %394, i8 %520, i8 %521
  %523 = shl i8 %89, 1
  %524 = and i8 %523, 126
  %525 = or i8 %523, -128
  %526 = select i1 %499, i8 %524, i8 %525
  %527 = xor i8 %526, 27
  %528 = select i1 %502, i8 %526, i8 %527
  %529 = xor i8 %528, %522
  %530 = xor i8 %529, %153
  %531 = xor i8 %530, %207
  store i8 %429, ptr %35, align 1, !tbaa !6
  store i8 %468, ptr %36, align 1, !tbaa !6
  store i8 %507, ptr %37, align 1, !tbaa !6
  store i8 %531, ptr %38, align 1, !tbaa !6
  %532 = load i8, ptr %39, align 1, !tbaa !6
  %533 = and i8 %532, 1
  %534 = icmp eq i8 %533, 0
  %535 = and i8 %532, 2
  %536 = icmp eq i8 %535, 0
  %537 = and i8 %532, 4
  %538 = icmp eq i8 %537, 0
  %539 = and i8 %532, 8
  %540 = icmp eq i8 %539, 0
  %541 = and i8 %532, 16
  %542 = icmp eq i8 %541, 0
  %543 = and i8 %532, 32
  %544 = icmp eq i8 %543, 0
  %545 = shl i8 %532, 1
  %546 = and i8 %545, 126
  %547 = and i8 %532, 64
  %548 = icmp eq i8 %547, 0
  %549 = or i8 %545, -128
  %550 = select i1 %548, i8 %546, i8 %549
  %551 = icmp sgt i8 %532, -1
  %552 = xor i8 %550, 27
  %553 = select i1 %551, i8 %550, i8 %552
  %554 = and i8 %196, 1
  %555 = icmp eq i8 %554, 0
  %556 = select i1 %555, i8 0, i8 3
  %557 = and i8 %196, 2
  %558 = icmp eq i8 %557, 0
  %559 = xor i8 %556, 6
  %560 = select i1 %558, i8 %556, i8 %559
  %561 = and i8 %196, 4
  %562 = icmp eq i8 %561, 0
  %563 = xor i8 %560, 12
  %564 = select i1 %562, i8 %560, i8 %563
  %565 = and i8 %196, 8
  %566 = icmp eq i8 %565, 0
  %567 = xor i8 %564, 24
  %568 = select i1 %566, i8 %564, i8 %567
  %569 = and i8 %196, 16
  %570 = icmp eq i8 %569, 0
  %571 = xor i8 %568, 48
  %572 = select i1 %570, i8 %568, i8 %571
  %573 = and i8 %196, 32
  %574 = icmp eq i8 %573, 0
  %575 = xor i8 %572, 96
  %576 = select i1 %574, i8 %572, i8 %575
  %577 = and i8 %196, 64
  %578 = icmp eq i8 %577, 0
  %579 = xor i8 %576, -64
  %580 = select i1 %578, i8 %576, i8 %579
  %581 = icmp sgt i8 %196, -1
  %582 = xor i8 %580, -101
  %583 = select i1 %581, i8 %580, i8 %582
  %584 = xor i8 %583, %553
  %585 = xor i8 %584, %78
  %586 = xor i8 %585, %132
  %587 = shl i8 %196, 1
  %588 = and i8 %587, 126
  %589 = or i8 %587, -128
  %590 = select i1 %578, i8 %588, i8 %589
  %591 = xor i8 %590, 27
  %592 = select i1 %581, i8 %590, i8 %591
  %593 = and i8 %78, 1
  %594 = icmp eq i8 %593, 0
  %595 = select i1 %594, i8 0, i8 3
  %596 = and i8 %78, 2
  %597 = icmp eq i8 %596, 0
  %598 = xor i8 %595, 6
  %599 = select i1 %597, i8 %595, i8 %598
  %600 = and i8 %78, 4
  %601 = icmp eq i8 %600, 0
  %602 = xor i8 %599, 12
  %603 = select i1 %601, i8 %599, i8 %602
  %604 = and i8 %78, 8
  %605 = icmp eq i8 %604, 0
  %606 = xor i8 %603, 24
  %607 = select i1 %605, i8 %603, i8 %606
  %608 = and i8 %78, 16
  %609 = icmp eq i8 %608, 0
  %610 = xor i8 %607, 48
  %611 = select i1 %609, i8 %607, i8 %610
  %612 = and i8 %78, 32
  %613 = icmp eq i8 %612, 0
  %614 = xor i8 %611, 96
  %615 = select i1 %613, i8 %611, i8 %614
  %616 = and i8 %78, 64
  %617 = icmp eq i8 %616, 0
  %618 = xor i8 %615, -64
  %619 = select i1 %617, i8 %615, i8 %618
  %620 = icmp sgt i8 %78, -1
  %621 = xor i8 %619, -101
  %622 = select i1 %620, i8 %619, i8 %621
  %623 = xor i8 %592, %622
  %624 = xor i8 %623, %132
  %625 = xor i8 %624, %532
  %626 = shl i8 %78, 1
  %627 = and i8 %626, 126
  %628 = or i8 %626, -128
  %629 = select i1 %617, i8 %627, i8 %628
  %630 = xor i8 %629, 27
  %631 = select i1 %620, i8 %629, i8 %630
  %632 = and i8 %132, 1
  %633 = icmp eq i8 %632, 0
  %634 = select i1 %633, i8 0, i8 3
  %635 = and i8 %132, 2
  %636 = icmp eq i8 %635, 0
  %637 = xor i8 %634, 6
  %638 = select i1 %636, i8 %634, i8 %637
  %639 = and i8 %132, 4
  %640 = icmp eq i8 %639, 0
  %641 = xor i8 %638, 12
  %642 = select i1 %640, i8 %638, i8 %641
  %643 = and i8 %132, 8
  %644 = icmp eq i8 %643, 0
  %645 = xor i8 %642, 24
  %646 = select i1 %644, i8 %642, i8 %645
  %647 = and i8 %132, 16
  %648 = icmp eq i8 %647, 0
  %649 = xor i8 %646, 48
  %650 = select i1 %648, i8 %646, i8 %649
  %651 = and i8 %132, 32
  %652 = icmp eq i8 %651, 0
  %653 = xor i8 %650, 96
  %654 = select i1 %652, i8 %650, i8 %653
  %655 = and i8 %132, 64
  %656 = icmp eq i8 %655, 0
  %657 = xor i8 %654, -64
  %658 = select i1 %656, i8 %654, i8 %657
  %659 = icmp sgt i8 %132, -1
  %660 = xor i8 %658, -101
  %661 = select i1 %659, i8 %658, i8 %660
  %662 = xor i8 %631, %661
  %663 = xor i8 %662, %196
  %664 = xor i8 %663, %532
  %665 = select i1 %534, i8 0, i8 3
  %666 = xor i8 %665, 6
  %667 = select i1 %536, i8 %665, i8 %666
  %668 = xor i8 %667, 12
  %669 = select i1 %538, i8 %667, i8 %668
  %670 = xor i8 %669, 24
  %671 = select i1 %540, i8 %669, i8 %670
  %672 = xor i8 %671, 48
  %673 = select i1 %542, i8 %671, i8 %672
  %674 = xor i8 %673, 96
  %675 = select i1 %544, i8 %673, i8 %674
  %676 = xor i8 %675, -64
  %677 = select i1 %548, i8 %675, i8 %676
  %678 = xor i8 %677, -101
  %679 = select i1 %551, i8 %677, i8 %678
  %680 = shl i8 %132, 1
  %681 = and i8 %680, 126
  %682 = or i8 %680, -128
  %683 = select i1 %656, i8 %681, i8 %682
  %684 = xor i8 %683, 27
  %685 = select i1 %659, i8 %683, i8 %684
  %686 = xor i8 %685, %679
  %687 = xor i8 %686, %196
  %688 = xor i8 %687, %78
  store i8 %586, ptr %39, align 1, !tbaa !6
  store i8 %625, ptr %40, align 1, !tbaa !6
  store i8 %664, ptr %41, align 1, !tbaa !6
  store i8 %688, ptr %42, align 1, !tbaa !6
  %689 = load i8, ptr %43, align 1, !tbaa !6
  %690 = and i8 %689, 1
  %691 = icmp eq i8 %690, 0
  %692 = and i8 %689, 2
  %693 = icmp eq i8 %692, 0
  %694 = and i8 %689, 4
  %695 = icmp eq i8 %694, 0
  %696 = and i8 %689, 8
  %697 = icmp eq i8 %696, 0
  %698 = and i8 %689, 16
  %699 = icmp eq i8 %698, 0
  %700 = and i8 %689, 32
  %701 = icmp eq i8 %700, 0
  %702 = shl i8 %689, 1
  %703 = and i8 %702, 126
  %704 = and i8 %689, 64
  %705 = icmp eq i8 %704, 0
  %706 = or i8 %702, -128
  %707 = select i1 %705, i8 %703, i8 %706
  %708 = icmp sgt i8 %689, -1
  %709 = xor i8 %707, 27
  %710 = select i1 %708, i8 %707, i8 %709
  %711 = and i8 %67, 1
  %712 = icmp eq i8 %711, 0
  %713 = select i1 %712, i8 0, i8 3
  %714 = and i8 %67, 2
  %715 = icmp eq i8 %714, 0
  %716 = xor i8 %713, 6
  %717 = select i1 %715, i8 %713, i8 %716
  %718 = and i8 %67, 4
  %719 = icmp eq i8 %718, 0
  %720 = xor i8 %717, 12
  %721 = select i1 %719, i8 %717, i8 %720
  %722 = and i8 %67, 8
  %723 = icmp eq i8 %722, 0
  %724 = xor i8 %721, 24
  %725 = select i1 %723, i8 %721, i8 %724
  %726 = and i8 %67, 16
  %727 = icmp eq i8 %726, 0
  %728 = xor i8 %725, 48
  %729 = select i1 %727, i8 %725, i8 %728
  %730 = and i8 %67, 32
  %731 = icmp eq i8 %730, 0
  %732 = xor i8 %729, 96
  %733 = select i1 %731, i8 %729, i8 %732
  %734 = and i8 %67, 64
  %735 = icmp eq i8 %734, 0
  %736 = xor i8 %733, -64
  %737 = select i1 %735, i8 %733, i8 %736
  %738 = icmp sgt i8 %67, -1
  %739 = xor i8 %737, -101
  %740 = select i1 %738, i8 %737, i8 %739
  %741 = xor i8 %740, %710
  %742 = xor i8 %741, %121
  %743 = xor i8 %742, %175
  %744 = shl i8 %67, 1
  %745 = and i8 %744, 126
  %746 = or i8 %744, -128
  %747 = select i1 %735, i8 %745, i8 %746
  %748 = xor i8 %747, 27
  %749 = select i1 %738, i8 %747, i8 %748
  %750 = and i8 %121, 1
  %751 = icmp eq i8 %750, 0
  %752 = select i1 %751, i8 0, i8 3
  %753 = and i8 %121, 2
  %754 = icmp eq i8 %753, 0
  %755 = xor i8 %752, 6
  %756 = select i1 %754, i8 %752, i8 %755
  %757 = and i8 %121, 4
  %758 = icmp eq i8 %757, 0
  %759 = xor i8 %756, 12
  %760 = select i1 %758, i8 %756, i8 %759
  %761 = and i8 %121, 8
  %762 = icmp eq i8 %761, 0
  %763 = xor i8 %760, 24
  %764 = select i1 %762, i8 %760, i8 %763
  %765 = and i8 %121, 16
  %766 = icmp eq i8 %765, 0
  %767 = xor i8 %764, 48
  %768 = select i1 %766, i8 %764, i8 %767
  %769 = and i8 %121, 32
  %770 = icmp eq i8 %769, 0
  %771 = xor i8 %768, 96
  %772 = select i1 %770, i8 %768, i8 %771
  %773 = and i8 %121, 64
  %774 = icmp eq i8 %773, 0
  %775 = xor i8 %772, -64
  %776 = select i1 %774, i8 %772, i8 %775
  %777 = icmp sgt i8 %121, -1
  %778 = xor i8 %776, -101
  %779 = select i1 %777, i8 %776, i8 %778
  %780 = xor i8 %749, %779
  %781 = xor i8 %780, %175
  %782 = xor i8 %781, %689
  %783 = shl i8 %121, 1
  %784 = and i8 %783, 126
  %785 = or i8 %783, -128
  %786 = select i1 %774, i8 %784, i8 %785
  %787 = xor i8 %786, 27
  %788 = select i1 %777, i8 %786, i8 %787
  %789 = and i8 %175, 1
  %790 = icmp eq i8 %789, 0
  %791 = select i1 %790, i8 0, i8 3
  %792 = and i8 %175, 2
  %793 = icmp eq i8 %792, 0
  %794 = xor i8 %791, 6
  %795 = select i1 %793, i8 %791, i8 %794
  %796 = and i8 %175, 4
  %797 = icmp eq i8 %796, 0
  %798 = xor i8 %795, 12
  %799 = select i1 %797, i8 %795, i8 %798
  %800 = and i8 %175, 8
  %801 = icmp eq i8 %800, 0
  %802 = xor i8 %799, 24
  %803 = select i1 %801, i8 %799, i8 %802
  %804 = and i8 %175, 16
  %805 = icmp eq i8 %804, 0
  %806 = xor i8 %803, 48
  %807 = select i1 %805, i8 %803, i8 %806
  %808 = and i8 %175, 32
  %809 = icmp eq i8 %808, 0
  %810 = xor i8 %807, 96
  %811 = select i1 %809, i8 %807, i8 %810
  %812 = and i8 %175, 64
  %813 = icmp eq i8 %812, 0
  %814 = xor i8 %811, -64
  %815 = select i1 %813, i8 %811, i8 %814
  %816 = icmp sgt i8 %175, -1
  %817 = xor i8 %815, -101
  %818 = select i1 %816, i8 %815, i8 %817
  %819 = xor i8 %788, %818
  %820 = xor i8 %819, %67
  %821 = xor i8 %820, %689
  %822 = select i1 %691, i8 0, i8 3
  %823 = xor i8 %822, 6
  %824 = select i1 %693, i8 %822, i8 %823
  %825 = xor i8 %824, 12
  %826 = select i1 %695, i8 %824, i8 %825
  %827 = xor i8 %826, 24
  %828 = select i1 %697, i8 %826, i8 %827
  %829 = xor i8 %828, 48
  %830 = select i1 %699, i8 %828, i8 %829
  %831 = xor i8 %830, 96
  %832 = select i1 %701, i8 %830, i8 %831
  %833 = xor i8 %832, -64
  %834 = select i1 %705, i8 %832, i8 %833
  %835 = xor i8 %834, -101
  %836 = select i1 %708, i8 %834, i8 %835
  %837 = shl i8 %175, 1
  %838 = and i8 %837, 126
  %839 = or i8 %837, -128
  %840 = select i1 %813, i8 %838, i8 %839
  %841 = xor i8 %840, 27
  %842 = select i1 %816, i8 %840, i8 %841
  %843 = xor i8 %842, %836
  %844 = xor i8 %843, %67
  %845 = xor i8 %844, %121
  store i8 %743, ptr %43, align 1, !tbaa !6
  store i8 %782, ptr %44, align 1, !tbaa !6
  store i8 %821, ptr %45, align 1, !tbaa !6
  store i8 %845, ptr %46, align 1, !tbaa !6
  %846 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %3, i32 noundef 0, i32 noundef 16) #3
  %847 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %3) #3
  %848 = icmp eq ptr %847, null
  br i1 %848, label %856, label %849

849:                                              ; preds = %217, %849
  %850 = phi ptr [ %854, %849 ], [ %847, %217 ]
  %851 = load i64, ptr %850, align 8, !tbaa !9
  %852 = getelementptr inbounds [16 x i8], ptr %1, i64 0, i64 %851
  %853 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %6, ptr noundef nonnull %850, ptr noundef nonnull %852, i64 noundef 0) #3
  %854 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %3) #3
  %855 = icmp eq ptr %854, null
  br i1 %855, label %856, label %849, !llvm.loop !15

856:                                              ; preds = %849, %217
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %3) #3
  call void @llvm.lifetime.end.p0(i64 256, ptr nonnull %2) #3
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %1) #3
  ret i32 0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind memory(none)
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #2

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="duotronic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind memory(none) }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 03a843fe2f5c0023ee1e6ee21d74290f4387a642)"}
!3 = !{i64 2147510378}
!4 = !{i64 2147510894}
!5 = !{i64 2147511410}
!6 = !{!7, !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"long long", !7, i64 0}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !12, !13}
!15 = distinct !{!15, !12, !13}
