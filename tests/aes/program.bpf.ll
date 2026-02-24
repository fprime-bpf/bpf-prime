; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

%struct.bpf_iter_num = type { i64, i64, i64, i64 }

@__const.main.block = private unnamed_addr constant <{ i8, [15 x i8] }> <{ i8 12, [15 x i8] zeroinitializer }>, align 1

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca [16 x i8], align 1
  %2 = alloca [256 x i8], align 1
  %3 = alloca %struct.bpf_iter_num, align 8
  %4 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 10, i32 0, i32 0, i32 0) #5, !srcloc !3
  %5 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 11, i32 0, i32 0, i32 0) #5, !srcloc !4
  %6 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 12, i32 0, i32 0, i32 0) #5, !srcloc !5
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %1) #5
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(16) %1, ptr noundef nonnull align 1 dereferenceable(16) @__const.main.block, i64 16, i1 false)
  call void @llvm.lifetime.start.p0(i64 256, ptr nonnull %2) #5
  %7 = getelementptr inbounds nuw i8, ptr %2, i64 1
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(256) %7, i8 0, i64 255, i1 false)
  store i8 13, ptr %2, align 1
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %3) #5
  %8 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %3, i32 noundef 0, i32 noundef 16) #5
  %9 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %3) #5
  %10 = icmp eq ptr %9, null
  br i1 %10, label %20, label %11

11:                                               ; preds = %0, %11
  %12 = phi ptr [ %18, %11 ], [ %9, %0 ]
  %13 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %4, ptr noundef nonnull %12) #5
  %14 = load i8, ptr %13, align 1, !tbaa !6
  %15 = load i32, ptr %12, align 4, !tbaa !9
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [16 x i8], ptr %1, i64 0, i64 %16
  store i8 %14, ptr %17, align 1, !tbaa !6
  %18 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %3) #5
  %19 = icmp eq ptr %18, null
  br i1 %19, label %20, label %11, !llvm.loop !11

20:                                               ; preds = %11, %0
  %21 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %3, i32 noundef 0, i32 noundef 256) #5
  %22 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %3) #5
  %23 = icmp eq ptr %22, null
  br i1 %23, label %33, label %24

24:                                               ; preds = %20, %24
  %25 = phi ptr [ %31, %24 ], [ %22, %20 ]
  %26 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %5, ptr noundef nonnull %25) #5
  %27 = load i8, ptr %26, align 1, !tbaa !6
  %28 = load i32, ptr %25, align 4, !tbaa !9
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %29
  store i8 %27, ptr %30, align 1, !tbaa !6
  %31 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %3) #5
  %32 = icmp eq ptr %31, null
  br i1 %32, label %33, label %24, !llvm.loop !13

33:                                               ; preds = %24, %20
  %34 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %3, i32 noundef 0, i32 noundef 128) #5
  %35 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %3) #5
  %36 = icmp eq ptr %35, null
  br i1 %36, label %856, label %37

37:                                               ; preds = %33
  %38 = getelementptr inbounds nuw i8, ptr %1, i64 1
  %39 = getelementptr inbounds nuw i8, ptr %1, i64 2
  %40 = getelementptr inbounds nuw i8, ptr %1, i64 3
  %41 = getelementptr inbounds nuw i8, ptr %1, i64 4
  %42 = getelementptr inbounds nuw i8, ptr %1, i64 5
  %43 = getelementptr inbounds nuw i8, ptr %1, i64 6
  %44 = getelementptr inbounds nuw i8, ptr %1, i64 7
  %45 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %46 = getelementptr inbounds nuw i8, ptr %1, i64 9
  %47 = getelementptr inbounds nuw i8, ptr %1, i64 10
  %48 = getelementptr inbounds nuw i8, ptr %1, i64 11
  %49 = getelementptr inbounds nuw i8, ptr %1, i64 12
  %50 = getelementptr inbounds nuw i8, ptr %1, i64 13
  %51 = getelementptr inbounds nuw i8, ptr %1, i64 14
  %52 = getelementptr inbounds nuw i8, ptr %1, i64 15
  br label %53

53:                                               ; preds = %37, %225
  %54 = load i8, ptr %1, align 1, !tbaa !6
  %55 = icmp sgt i8 %54, -1
  %56 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %55)
  %57 = icmp slt i8 %54, 16
  %58 = select i1 %56, i1 %57, i1 false
  br i1 %58, label %59, label %63

59:                                               ; preds = %53
  %60 = sext i8 %54 to i64
  %61 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %60
  %62 = load i8, ptr %61, align 1, !tbaa !6
  store i8 %62, ptr %1, align 1, !tbaa !6
  br label %63

63:                                               ; preds = %59, %53
  %64 = phi i8 [ %62, %59 ], [ %54, %53 ]
  %65 = load i8, ptr %38, align 1, !tbaa !6
  %66 = icmp sgt i8 %65, -1
  %67 = call i1 @llvm.bpf.passthrough.i1.i1(i32 1, i1 %66)
  %68 = icmp slt i8 %65, 16
  %69 = select i1 %67, i1 %68, i1 false
  br i1 %69, label %70, label %74

70:                                               ; preds = %63
  %71 = sext i8 %65 to i64
  %72 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %71
  %73 = load i8, ptr %72, align 1, !tbaa !6
  store i8 %73, ptr %38, align 1, !tbaa !6
  br label %74

74:                                               ; preds = %70, %63
  %75 = phi i8 [ %73, %70 ], [ %65, %63 ]
  %76 = load i8, ptr %39, align 1, !tbaa !6
  %77 = icmp sgt i8 %76, -1
  %78 = call i1 @llvm.bpf.passthrough.i1.i1(i32 2, i1 %77)
  %79 = icmp slt i8 %76, 16
  %80 = select i1 %78, i1 %79, i1 false
  br i1 %80, label %81, label %85

81:                                               ; preds = %74
  %82 = sext i8 %76 to i64
  %83 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %82
  %84 = load i8, ptr %83, align 1, !tbaa !6
  store i8 %84, ptr %39, align 1, !tbaa !6
  br label %85

85:                                               ; preds = %81, %74
  %86 = phi i8 [ %84, %81 ], [ %76, %74 ]
  %87 = load i8, ptr %40, align 1, !tbaa !6
  %88 = icmp sgt i8 %87, -1
  %89 = call i1 @llvm.bpf.passthrough.i1.i1(i32 3, i1 %88)
  %90 = icmp slt i8 %87, 16
  %91 = select i1 %89, i1 %90, i1 false
  br i1 %91, label %92, label %96

92:                                               ; preds = %85
  %93 = sext i8 %87 to i64
  %94 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %93
  %95 = load i8, ptr %94, align 1, !tbaa !6
  store i8 %95, ptr %40, align 1, !tbaa !6
  br label %96

96:                                               ; preds = %92, %85
  %97 = phi i8 [ %95, %92 ], [ %87, %85 ]
  %98 = load i8, ptr %41, align 1, !tbaa !6
  %99 = icmp sgt i8 %98, -1
  %100 = call i1 @llvm.bpf.passthrough.i1.i1(i32 4, i1 %99)
  %101 = icmp slt i8 %98, 16
  %102 = select i1 %100, i1 %101, i1 false
  br i1 %102, label %103, label %107

103:                                              ; preds = %96
  %104 = sext i8 %98 to i64
  %105 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %104
  %106 = load i8, ptr %105, align 1, !tbaa !6
  store i8 %106, ptr %41, align 1, !tbaa !6
  br label %107

107:                                              ; preds = %103, %96
  %108 = load i8, ptr %42, align 1, !tbaa !6
  %109 = icmp sgt i8 %108, -1
  %110 = call i1 @llvm.bpf.passthrough.i1.i1(i32 5, i1 %109)
  %111 = icmp slt i8 %108, 16
  %112 = select i1 %110, i1 %111, i1 false
  br i1 %112, label %113, label %117

113:                                              ; preds = %107
  %114 = sext i8 %108 to i64
  %115 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %114
  %116 = load i8, ptr %115, align 1, !tbaa !6
  store i8 %116, ptr %42, align 1, !tbaa !6
  br label %117

117:                                              ; preds = %113, %107
  %118 = phi i8 [ %116, %113 ], [ %108, %107 ]
  %119 = load i8, ptr %43, align 1, !tbaa !6
  %120 = icmp sgt i8 %119, -1
  %121 = call i1 @llvm.bpf.passthrough.i1.i1(i32 6, i1 %120)
  %122 = icmp slt i8 %119, 16
  %123 = select i1 %121, i1 %122, i1 false
  br i1 %123, label %124, label %128

124:                                              ; preds = %117
  %125 = sext i8 %119 to i64
  %126 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %125
  %127 = load i8, ptr %126, align 1, !tbaa !6
  store i8 %127, ptr %43, align 1, !tbaa !6
  br label %128

128:                                              ; preds = %124, %117
  %129 = phi i8 [ %127, %124 ], [ %119, %117 ]
  %130 = load i8, ptr %44, align 1, !tbaa !6
  %131 = icmp sgt i8 %130, -1
  %132 = call i1 @llvm.bpf.passthrough.i1.i1(i32 7, i1 %131)
  %133 = icmp slt i8 %130, 16
  %134 = select i1 %132, i1 %133, i1 false
  br i1 %134, label %135, label %139

135:                                              ; preds = %128
  %136 = sext i8 %130 to i64
  %137 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %136
  %138 = load i8, ptr %137, align 1, !tbaa !6
  store i8 %138, ptr %44, align 1, !tbaa !6
  br label %139

139:                                              ; preds = %135, %128
  %140 = phi i8 [ %138, %135 ], [ %130, %128 ]
  %141 = load i8, ptr %45, align 1, !tbaa !6
  %142 = icmp sgt i8 %141, -1
  %143 = call i1 @llvm.bpf.passthrough.i1.i1(i32 8, i1 %142)
  %144 = icmp slt i8 %141, 16
  %145 = select i1 %143, i1 %144, i1 false
  br i1 %145, label %146, label %150

146:                                              ; preds = %139
  %147 = sext i8 %141 to i64
  %148 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %147
  %149 = load i8, ptr %148, align 1, !tbaa !6
  store i8 %149, ptr %45, align 1, !tbaa !6
  br label %150

150:                                              ; preds = %146, %139
  %151 = load i8, ptr %46, align 1, !tbaa !6
  %152 = icmp sgt i8 %151, -1
  %153 = call i1 @llvm.bpf.passthrough.i1.i1(i32 9, i1 %152)
  %154 = icmp slt i8 %151, 16
  %155 = select i1 %153, i1 %154, i1 false
  br i1 %155, label %156, label %160

156:                                              ; preds = %150
  %157 = sext i8 %151 to i64
  %158 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %157
  %159 = load i8, ptr %158, align 1, !tbaa !6
  br label %160

160:                                              ; preds = %156, %150
  %161 = phi i8 [ %159, %156 ], [ %151, %150 ]
  %162 = load i8, ptr %47, align 1, !tbaa !6
  %163 = icmp sgt i8 %162, -1
  %164 = call i1 @llvm.bpf.passthrough.i1.i1(i32 10, i1 %163)
  %165 = icmp slt i8 %162, 16
  %166 = select i1 %164, i1 %165, i1 false
  br i1 %166, label %167, label %171

167:                                              ; preds = %160
  %168 = sext i8 %162 to i64
  %169 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %168
  %170 = load i8, ptr %169, align 1, !tbaa !6
  br label %171

171:                                              ; preds = %167, %160
  %172 = phi i8 [ %170, %167 ], [ %162, %160 ]
  %173 = load i8, ptr %48, align 1, !tbaa !6
  %174 = icmp sgt i8 %173, -1
  %175 = call i1 @llvm.bpf.passthrough.i1.i1(i32 11, i1 %174)
  %176 = icmp slt i8 %173, 16
  %177 = select i1 %175, i1 %176, i1 false
  br i1 %177, label %178, label %182

178:                                              ; preds = %171
  %179 = sext i8 %173 to i64
  %180 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %179
  %181 = load i8, ptr %180, align 1, !tbaa !6
  br label %182

182:                                              ; preds = %178, %171
  %183 = phi i8 [ %181, %178 ], [ %173, %171 ]
  %184 = load i8, ptr %49, align 1, !tbaa !6
  %185 = icmp sgt i8 %184, -1
  %186 = call i1 @llvm.bpf.passthrough.i1.i1(i32 12, i1 %185)
  %187 = icmp slt i8 %184, 16
  %188 = select i1 %186, i1 %187, i1 false
  br i1 %188, label %189, label %193

189:                                              ; preds = %182
  %190 = sext i8 %184 to i64
  %191 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %190
  %192 = load i8, ptr %191, align 1, !tbaa !6
  store i8 %192, ptr %49, align 1, !tbaa !6
  br label %193

193:                                              ; preds = %189, %182
  %194 = load i8, ptr %50, align 1, !tbaa !6
  %195 = icmp sgt i8 %194, -1
  %196 = call i1 @llvm.bpf.passthrough.i1.i1(i32 13, i1 %195)
  %197 = icmp slt i8 %194, 16
  %198 = select i1 %196, i1 %197, i1 false
  br i1 %198, label %199, label %203

199:                                              ; preds = %193
  %200 = sext i8 %194 to i64
  %201 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %200
  %202 = load i8, ptr %201, align 1, !tbaa !6
  br label %203

203:                                              ; preds = %199, %193
  %204 = phi i8 [ %202, %199 ], [ %194, %193 ]
  %205 = load i8, ptr %51, align 1, !tbaa !6
  %206 = icmp sgt i8 %205, -1
  %207 = call i1 @llvm.bpf.passthrough.i1.i1(i32 14, i1 %206)
  %208 = icmp slt i8 %205, 16
  %209 = select i1 %207, i1 %208, i1 false
  br i1 %209, label %210, label %214

210:                                              ; preds = %203
  %211 = sext i8 %205 to i64
  %212 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %211
  %213 = load i8, ptr %212, align 1, !tbaa !6
  br label %214

214:                                              ; preds = %210, %203
  %215 = phi i8 [ %213, %210 ], [ %205, %203 ]
  %216 = load i8, ptr %52, align 1, !tbaa !6
  %217 = icmp sgt i8 %216, -1
  %218 = call i1 @llvm.bpf.passthrough.i1.i1(i32 15, i1 %217)
  %219 = icmp slt i8 %216, 16
  %220 = select i1 %218, i1 %219, i1 false
  br i1 %220, label %221, label %225

221:                                              ; preds = %214
  %222 = sext i8 %216 to i64
  %223 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %222
  %224 = load i8, ptr %223, align 1, !tbaa !6
  br label %225

225:                                              ; preds = %221, %214
  %226 = phi i8 [ %224, %221 ], [ %216, %214 ]
  %227 = and i8 %64, 1
  %228 = icmp eq i8 %227, 0
  %229 = and i8 %64, 2
  %230 = icmp eq i8 %229, 0
  %231 = and i8 %64, 4
  %232 = icmp eq i8 %231, 0
  %233 = and i8 %64, 8
  %234 = icmp eq i8 %233, 0
  %235 = and i8 %64, 16
  %236 = icmp eq i8 %235, 0
  %237 = and i8 %64, 32
  %238 = icmp eq i8 %237, 0
  %239 = shl i8 %64, 1
  %240 = and i8 %239, 126
  %241 = and i8 %64, 64
  %242 = icmp eq i8 %241, 0
  %243 = or i8 %239, -128
  %244 = select i1 %242, i8 %240, i8 %243
  %245 = icmp sgt i8 %64, -1
  %246 = xor i8 %244, 27
  %247 = select i1 %245, i8 %244, i8 %246
  %248 = and i8 %118, 1
  %249 = icmp eq i8 %248, 0
  %250 = select i1 %249, i8 0, i8 3
  %251 = and i8 %118, 2
  %252 = icmp eq i8 %251, 0
  %253 = xor i8 %250, 6
  %254 = select i1 %252, i8 %250, i8 %253
  %255 = and i8 %118, 4
  %256 = icmp eq i8 %255, 0
  %257 = xor i8 %254, 12
  %258 = select i1 %256, i8 %254, i8 %257
  %259 = and i8 %118, 8
  %260 = icmp eq i8 %259, 0
  %261 = xor i8 %258, 24
  %262 = select i1 %260, i8 %258, i8 %261
  %263 = and i8 %118, 16
  %264 = icmp eq i8 %263, 0
  %265 = xor i8 %262, 48
  %266 = select i1 %264, i8 %262, i8 %265
  %267 = and i8 %118, 32
  %268 = icmp eq i8 %267, 0
  %269 = xor i8 %266, 96
  %270 = select i1 %268, i8 %266, i8 %269
  %271 = and i8 %118, 64
  %272 = icmp eq i8 %271, 0
  %273 = xor i8 %270, -64
  %274 = select i1 %272, i8 %270, i8 %273
  %275 = icmp sgt i8 %118, -1
  %276 = xor i8 %274, -101
  %277 = select i1 %275, i8 %274, i8 %276
  %278 = xor i8 %277, %247
  %279 = xor i8 %278, %172
  %280 = xor i8 %279, %226
  %281 = shl i8 %118, 1
  %282 = and i8 %281, 126
  %283 = or i8 %281, -128
  %284 = select i1 %272, i8 %282, i8 %283
  %285 = xor i8 %284, 27
  %286 = select i1 %275, i8 %284, i8 %285
  %287 = and i8 %172, 1
  %288 = icmp eq i8 %287, 0
  %289 = select i1 %288, i8 0, i8 3
  %290 = and i8 %172, 2
  %291 = icmp eq i8 %290, 0
  %292 = xor i8 %289, 6
  %293 = select i1 %291, i8 %289, i8 %292
  %294 = and i8 %172, 4
  %295 = icmp eq i8 %294, 0
  %296 = xor i8 %293, 12
  %297 = select i1 %295, i8 %293, i8 %296
  %298 = and i8 %172, 8
  %299 = icmp eq i8 %298, 0
  %300 = xor i8 %297, 24
  %301 = select i1 %299, i8 %297, i8 %300
  %302 = and i8 %172, 16
  %303 = icmp eq i8 %302, 0
  %304 = xor i8 %301, 48
  %305 = select i1 %303, i8 %301, i8 %304
  %306 = and i8 %172, 32
  %307 = icmp eq i8 %306, 0
  %308 = xor i8 %305, 96
  %309 = select i1 %307, i8 %305, i8 %308
  %310 = and i8 %172, 64
  %311 = icmp eq i8 %310, 0
  %312 = xor i8 %309, -64
  %313 = select i1 %311, i8 %309, i8 %312
  %314 = icmp sgt i8 %172, -1
  %315 = xor i8 %313, -101
  %316 = select i1 %314, i8 %313, i8 %315
  %317 = xor i8 %286, %316
  %318 = xor i8 %317, %226
  %319 = xor i8 %318, %64
  %320 = shl i8 %172, 1
  %321 = and i8 %320, 126
  %322 = or i8 %320, -128
  %323 = select i1 %311, i8 %321, i8 %322
  %324 = xor i8 %323, 27
  %325 = select i1 %314, i8 %323, i8 %324
  %326 = and i8 %226, 1
  %327 = icmp eq i8 %326, 0
  %328 = select i1 %327, i8 0, i8 3
  %329 = and i8 %226, 2
  %330 = icmp eq i8 %329, 0
  %331 = xor i8 %328, 6
  %332 = select i1 %330, i8 %328, i8 %331
  %333 = and i8 %226, 4
  %334 = icmp eq i8 %333, 0
  %335 = xor i8 %332, 12
  %336 = select i1 %334, i8 %332, i8 %335
  %337 = and i8 %226, 8
  %338 = icmp eq i8 %337, 0
  %339 = xor i8 %336, 24
  %340 = select i1 %338, i8 %336, i8 %339
  %341 = and i8 %226, 16
  %342 = icmp eq i8 %341, 0
  %343 = xor i8 %340, 48
  %344 = select i1 %342, i8 %340, i8 %343
  %345 = and i8 %226, 32
  %346 = icmp eq i8 %345, 0
  %347 = xor i8 %344, 96
  %348 = select i1 %346, i8 %344, i8 %347
  %349 = and i8 %226, 64
  %350 = icmp eq i8 %349, 0
  %351 = xor i8 %348, -64
  %352 = select i1 %350, i8 %348, i8 %351
  %353 = icmp sgt i8 %226, -1
  %354 = xor i8 %352, -101
  %355 = select i1 %353, i8 %352, i8 %354
  %356 = xor i8 %325, %355
  %357 = xor i8 %356, %118
  %358 = xor i8 %357, %64
  %359 = select i1 %228, i8 0, i8 3
  %360 = xor i8 %359, 6
  %361 = select i1 %230, i8 %359, i8 %360
  %362 = xor i8 %361, 12
  %363 = select i1 %232, i8 %361, i8 %362
  %364 = xor i8 %363, 24
  %365 = select i1 %234, i8 %363, i8 %364
  %366 = xor i8 %365, 48
  %367 = select i1 %236, i8 %365, i8 %366
  %368 = xor i8 %367, 96
  %369 = select i1 %238, i8 %367, i8 %368
  %370 = xor i8 %369, -64
  %371 = select i1 %242, i8 %369, i8 %370
  %372 = xor i8 %371, -101
  %373 = select i1 %245, i8 %371, i8 %372
  %374 = shl i8 %226, 1
  %375 = and i8 %374, 126
  %376 = or i8 %374, -128
  %377 = select i1 %350, i8 %375, i8 %376
  %378 = xor i8 %377, 27
  %379 = select i1 %353, i8 %377, i8 %378
  %380 = xor i8 %379, %373
  %381 = xor i8 %380, %118
  %382 = xor i8 %381, %172
  store i8 %280, ptr %1, align 1, !tbaa !6
  store i8 %319, ptr %38, align 1, !tbaa !6
  store i8 %358, ptr %39, align 1, !tbaa !6
  store i8 %382, ptr %40, align 1, !tbaa !6
  %383 = load i8, ptr %41, align 1, !tbaa !6
  %384 = and i8 %383, 1
  %385 = icmp eq i8 %384, 0
  %386 = and i8 %383, 2
  %387 = icmp eq i8 %386, 0
  %388 = and i8 %383, 4
  %389 = icmp eq i8 %388, 0
  %390 = and i8 %383, 8
  %391 = icmp eq i8 %390, 0
  %392 = and i8 %383, 16
  %393 = icmp eq i8 %392, 0
  %394 = and i8 %383, 32
  %395 = icmp eq i8 %394, 0
  %396 = shl i8 %383, 1
  %397 = and i8 %396, 126
  %398 = and i8 %383, 64
  %399 = icmp eq i8 %398, 0
  %400 = or i8 %396, -128
  %401 = select i1 %399, i8 %397, i8 %400
  %402 = icmp sgt i8 %383, -1
  %403 = xor i8 %401, 27
  %404 = select i1 %402, i8 %401, i8 %403
  %405 = and i8 %161, 1
  %406 = icmp eq i8 %405, 0
  %407 = select i1 %406, i8 0, i8 3
  %408 = and i8 %161, 2
  %409 = icmp eq i8 %408, 0
  %410 = xor i8 %407, 6
  %411 = select i1 %409, i8 %407, i8 %410
  %412 = and i8 %161, 4
  %413 = icmp eq i8 %412, 0
  %414 = xor i8 %411, 12
  %415 = select i1 %413, i8 %411, i8 %414
  %416 = and i8 %161, 8
  %417 = icmp eq i8 %416, 0
  %418 = xor i8 %415, 24
  %419 = select i1 %417, i8 %415, i8 %418
  %420 = and i8 %161, 16
  %421 = icmp eq i8 %420, 0
  %422 = xor i8 %419, 48
  %423 = select i1 %421, i8 %419, i8 %422
  %424 = and i8 %161, 32
  %425 = icmp eq i8 %424, 0
  %426 = xor i8 %423, 96
  %427 = select i1 %425, i8 %423, i8 %426
  %428 = and i8 %161, 64
  %429 = icmp eq i8 %428, 0
  %430 = xor i8 %427, -64
  %431 = select i1 %429, i8 %427, i8 %430
  %432 = icmp sgt i8 %161, -1
  %433 = xor i8 %431, -101
  %434 = select i1 %432, i8 %431, i8 %433
  %435 = xor i8 %434, %404
  %436 = xor i8 %435, %215
  %437 = xor i8 %436, %97
  %438 = shl i8 %161, 1
  %439 = and i8 %438, 126
  %440 = or i8 %438, -128
  %441 = select i1 %429, i8 %439, i8 %440
  %442 = xor i8 %441, 27
  %443 = select i1 %432, i8 %441, i8 %442
  %444 = and i8 %215, 1
  %445 = icmp eq i8 %444, 0
  %446 = select i1 %445, i8 0, i8 3
  %447 = and i8 %215, 2
  %448 = icmp eq i8 %447, 0
  %449 = xor i8 %446, 6
  %450 = select i1 %448, i8 %446, i8 %449
  %451 = and i8 %215, 4
  %452 = icmp eq i8 %451, 0
  %453 = xor i8 %450, 12
  %454 = select i1 %452, i8 %450, i8 %453
  %455 = and i8 %215, 8
  %456 = icmp eq i8 %455, 0
  %457 = xor i8 %454, 24
  %458 = select i1 %456, i8 %454, i8 %457
  %459 = and i8 %215, 16
  %460 = icmp eq i8 %459, 0
  %461 = xor i8 %458, 48
  %462 = select i1 %460, i8 %458, i8 %461
  %463 = and i8 %215, 32
  %464 = icmp eq i8 %463, 0
  %465 = xor i8 %462, 96
  %466 = select i1 %464, i8 %462, i8 %465
  %467 = and i8 %215, 64
  %468 = icmp eq i8 %467, 0
  %469 = xor i8 %466, -64
  %470 = select i1 %468, i8 %466, i8 %469
  %471 = icmp sgt i8 %215, -1
  %472 = xor i8 %470, -101
  %473 = select i1 %471, i8 %470, i8 %472
  %474 = xor i8 %443, %473
  %475 = xor i8 %474, %97
  %476 = xor i8 %475, %383
  %477 = shl i8 %215, 1
  %478 = and i8 %477, 126
  %479 = or i8 %477, -128
  %480 = select i1 %468, i8 %478, i8 %479
  %481 = xor i8 %480, 27
  %482 = select i1 %471, i8 %480, i8 %481
  %483 = and i8 %97, 1
  %484 = icmp eq i8 %483, 0
  %485 = select i1 %484, i8 0, i8 3
  %486 = and i8 %97, 2
  %487 = icmp eq i8 %486, 0
  %488 = xor i8 %485, 6
  %489 = select i1 %487, i8 %485, i8 %488
  %490 = and i8 %97, 4
  %491 = icmp eq i8 %490, 0
  %492 = xor i8 %489, 12
  %493 = select i1 %491, i8 %489, i8 %492
  %494 = and i8 %97, 8
  %495 = icmp eq i8 %494, 0
  %496 = xor i8 %493, 24
  %497 = select i1 %495, i8 %493, i8 %496
  %498 = and i8 %97, 16
  %499 = icmp eq i8 %498, 0
  %500 = xor i8 %497, 48
  %501 = select i1 %499, i8 %497, i8 %500
  %502 = and i8 %97, 32
  %503 = icmp eq i8 %502, 0
  %504 = xor i8 %501, 96
  %505 = select i1 %503, i8 %501, i8 %504
  %506 = and i8 %97, 64
  %507 = icmp eq i8 %506, 0
  %508 = xor i8 %505, -64
  %509 = select i1 %507, i8 %505, i8 %508
  %510 = icmp sgt i8 %97, -1
  %511 = xor i8 %509, -101
  %512 = select i1 %510, i8 %509, i8 %511
  %513 = xor i8 %482, %512
  %514 = xor i8 %513, %161
  %515 = xor i8 %514, %383
  %516 = select i1 %385, i8 0, i8 3
  %517 = xor i8 %516, 6
  %518 = select i1 %387, i8 %516, i8 %517
  %519 = xor i8 %518, 12
  %520 = select i1 %389, i8 %518, i8 %519
  %521 = xor i8 %520, 24
  %522 = select i1 %391, i8 %520, i8 %521
  %523 = xor i8 %522, 48
  %524 = select i1 %393, i8 %522, i8 %523
  %525 = xor i8 %524, 96
  %526 = select i1 %395, i8 %524, i8 %525
  %527 = xor i8 %526, -64
  %528 = select i1 %399, i8 %526, i8 %527
  %529 = xor i8 %528, -101
  %530 = select i1 %402, i8 %528, i8 %529
  %531 = shl i8 %97, 1
  %532 = and i8 %531, 126
  %533 = or i8 %531, -128
  %534 = select i1 %507, i8 %532, i8 %533
  %535 = xor i8 %534, 27
  %536 = select i1 %510, i8 %534, i8 %535
  %537 = xor i8 %536, %530
  %538 = xor i8 %537, %161
  %539 = xor i8 %538, %215
  store i8 %437, ptr %41, align 1, !tbaa !6
  store i8 %476, ptr %42, align 1, !tbaa !6
  store i8 %515, ptr %43, align 1, !tbaa !6
  store i8 %539, ptr %44, align 1, !tbaa !6
  %540 = load i8, ptr %45, align 1, !tbaa !6
  %541 = and i8 %540, 1
  %542 = icmp eq i8 %541, 0
  %543 = and i8 %540, 2
  %544 = icmp eq i8 %543, 0
  %545 = and i8 %540, 4
  %546 = icmp eq i8 %545, 0
  %547 = and i8 %540, 8
  %548 = icmp eq i8 %547, 0
  %549 = and i8 %540, 16
  %550 = icmp eq i8 %549, 0
  %551 = and i8 %540, 32
  %552 = icmp eq i8 %551, 0
  %553 = shl i8 %540, 1
  %554 = and i8 %553, 126
  %555 = and i8 %540, 64
  %556 = icmp eq i8 %555, 0
  %557 = or i8 %553, -128
  %558 = select i1 %556, i8 %554, i8 %557
  %559 = icmp sgt i8 %540, -1
  %560 = xor i8 %558, 27
  %561 = select i1 %559, i8 %558, i8 %560
  %562 = and i8 %204, 1
  %563 = icmp eq i8 %562, 0
  %564 = select i1 %563, i8 0, i8 3
  %565 = and i8 %204, 2
  %566 = icmp eq i8 %565, 0
  %567 = xor i8 %564, 6
  %568 = select i1 %566, i8 %564, i8 %567
  %569 = and i8 %204, 4
  %570 = icmp eq i8 %569, 0
  %571 = xor i8 %568, 12
  %572 = select i1 %570, i8 %568, i8 %571
  %573 = and i8 %204, 8
  %574 = icmp eq i8 %573, 0
  %575 = xor i8 %572, 24
  %576 = select i1 %574, i8 %572, i8 %575
  %577 = and i8 %204, 16
  %578 = icmp eq i8 %577, 0
  %579 = xor i8 %576, 48
  %580 = select i1 %578, i8 %576, i8 %579
  %581 = and i8 %204, 32
  %582 = icmp eq i8 %581, 0
  %583 = xor i8 %580, 96
  %584 = select i1 %582, i8 %580, i8 %583
  %585 = and i8 %204, 64
  %586 = icmp eq i8 %585, 0
  %587 = xor i8 %584, -64
  %588 = select i1 %586, i8 %584, i8 %587
  %589 = icmp sgt i8 %204, -1
  %590 = xor i8 %588, -101
  %591 = select i1 %589, i8 %588, i8 %590
  %592 = xor i8 %591, %561
  %593 = xor i8 %592, %86
  %594 = xor i8 %593, %140
  %595 = shl i8 %204, 1
  %596 = and i8 %595, 126
  %597 = or i8 %595, -128
  %598 = select i1 %586, i8 %596, i8 %597
  %599 = xor i8 %598, 27
  %600 = select i1 %589, i8 %598, i8 %599
  %601 = and i8 %86, 1
  %602 = icmp eq i8 %601, 0
  %603 = select i1 %602, i8 0, i8 3
  %604 = and i8 %86, 2
  %605 = icmp eq i8 %604, 0
  %606 = xor i8 %603, 6
  %607 = select i1 %605, i8 %603, i8 %606
  %608 = and i8 %86, 4
  %609 = icmp eq i8 %608, 0
  %610 = xor i8 %607, 12
  %611 = select i1 %609, i8 %607, i8 %610
  %612 = and i8 %86, 8
  %613 = icmp eq i8 %612, 0
  %614 = xor i8 %611, 24
  %615 = select i1 %613, i8 %611, i8 %614
  %616 = and i8 %86, 16
  %617 = icmp eq i8 %616, 0
  %618 = xor i8 %615, 48
  %619 = select i1 %617, i8 %615, i8 %618
  %620 = and i8 %86, 32
  %621 = icmp eq i8 %620, 0
  %622 = xor i8 %619, 96
  %623 = select i1 %621, i8 %619, i8 %622
  %624 = and i8 %86, 64
  %625 = icmp eq i8 %624, 0
  %626 = xor i8 %623, -64
  %627 = select i1 %625, i8 %623, i8 %626
  %628 = icmp sgt i8 %86, -1
  %629 = xor i8 %627, -101
  %630 = select i1 %628, i8 %627, i8 %629
  %631 = xor i8 %600, %630
  %632 = xor i8 %631, %140
  %633 = xor i8 %632, %540
  %634 = shl i8 %86, 1
  %635 = and i8 %634, 126
  %636 = or i8 %634, -128
  %637 = select i1 %625, i8 %635, i8 %636
  %638 = xor i8 %637, 27
  %639 = select i1 %628, i8 %637, i8 %638
  %640 = and i8 %140, 1
  %641 = icmp eq i8 %640, 0
  %642 = select i1 %641, i8 0, i8 3
  %643 = and i8 %140, 2
  %644 = icmp eq i8 %643, 0
  %645 = xor i8 %642, 6
  %646 = select i1 %644, i8 %642, i8 %645
  %647 = and i8 %140, 4
  %648 = icmp eq i8 %647, 0
  %649 = xor i8 %646, 12
  %650 = select i1 %648, i8 %646, i8 %649
  %651 = and i8 %140, 8
  %652 = icmp eq i8 %651, 0
  %653 = xor i8 %650, 24
  %654 = select i1 %652, i8 %650, i8 %653
  %655 = and i8 %140, 16
  %656 = icmp eq i8 %655, 0
  %657 = xor i8 %654, 48
  %658 = select i1 %656, i8 %654, i8 %657
  %659 = and i8 %140, 32
  %660 = icmp eq i8 %659, 0
  %661 = xor i8 %658, 96
  %662 = select i1 %660, i8 %658, i8 %661
  %663 = and i8 %140, 64
  %664 = icmp eq i8 %663, 0
  %665 = xor i8 %662, -64
  %666 = select i1 %664, i8 %662, i8 %665
  %667 = icmp sgt i8 %140, -1
  %668 = xor i8 %666, -101
  %669 = select i1 %667, i8 %666, i8 %668
  %670 = xor i8 %639, %669
  %671 = xor i8 %670, %204
  %672 = xor i8 %671, %540
  %673 = select i1 %542, i8 0, i8 3
  %674 = xor i8 %673, 6
  %675 = select i1 %544, i8 %673, i8 %674
  %676 = xor i8 %675, 12
  %677 = select i1 %546, i8 %675, i8 %676
  %678 = xor i8 %677, 24
  %679 = select i1 %548, i8 %677, i8 %678
  %680 = xor i8 %679, 48
  %681 = select i1 %550, i8 %679, i8 %680
  %682 = xor i8 %681, 96
  %683 = select i1 %552, i8 %681, i8 %682
  %684 = xor i8 %683, -64
  %685 = select i1 %556, i8 %683, i8 %684
  %686 = xor i8 %685, -101
  %687 = select i1 %559, i8 %685, i8 %686
  %688 = shl i8 %140, 1
  %689 = and i8 %688, 126
  %690 = or i8 %688, -128
  %691 = select i1 %664, i8 %689, i8 %690
  %692 = xor i8 %691, 27
  %693 = select i1 %667, i8 %691, i8 %692
  %694 = xor i8 %693, %687
  %695 = xor i8 %694, %204
  %696 = xor i8 %695, %86
  store i8 %594, ptr %45, align 1, !tbaa !6
  store i8 %633, ptr %46, align 1, !tbaa !6
  store i8 %672, ptr %47, align 1, !tbaa !6
  store i8 %696, ptr %48, align 1, !tbaa !6
  %697 = load i8, ptr %49, align 1, !tbaa !6
  %698 = and i8 %697, 1
  %699 = icmp eq i8 %698, 0
  %700 = and i8 %697, 2
  %701 = icmp eq i8 %700, 0
  %702 = and i8 %697, 4
  %703 = icmp eq i8 %702, 0
  %704 = and i8 %697, 8
  %705 = icmp eq i8 %704, 0
  %706 = and i8 %697, 16
  %707 = icmp eq i8 %706, 0
  %708 = and i8 %697, 32
  %709 = icmp eq i8 %708, 0
  %710 = shl i8 %697, 1
  %711 = and i8 %710, 126
  %712 = and i8 %697, 64
  %713 = icmp eq i8 %712, 0
  %714 = or i8 %710, -128
  %715 = select i1 %713, i8 %711, i8 %714
  %716 = icmp sgt i8 %697, -1
  %717 = xor i8 %715, 27
  %718 = select i1 %716, i8 %715, i8 %717
  %719 = and i8 %75, 1
  %720 = icmp eq i8 %719, 0
  %721 = select i1 %720, i8 0, i8 3
  %722 = and i8 %75, 2
  %723 = icmp eq i8 %722, 0
  %724 = xor i8 %721, 6
  %725 = select i1 %723, i8 %721, i8 %724
  %726 = and i8 %75, 4
  %727 = icmp eq i8 %726, 0
  %728 = xor i8 %725, 12
  %729 = select i1 %727, i8 %725, i8 %728
  %730 = and i8 %75, 8
  %731 = icmp eq i8 %730, 0
  %732 = xor i8 %729, 24
  %733 = select i1 %731, i8 %729, i8 %732
  %734 = and i8 %75, 16
  %735 = icmp eq i8 %734, 0
  %736 = xor i8 %733, 48
  %737 = select i1 %735, i8 %733, i8 %736
  %738 = and i8 %75, 32
  %739 = icmp eq i8 %738, 0
  %740 = xor i8 %737, 96
  %741 = select i1 %739, i8 %737, i8 %740
  %742 = and i8 %75, 64
  %743 = icmp eq i8 %742, 0
  %744 = xor i8 %741, -64
  %745 = select i1 %743, i8 %741, i8 %744
  %746 = icmp sgt i8 %75, -1
  %747 = xor i8 %745, -101
  %748 = select i1 %746, i8 %745, i8 %747
  %749 = xor i8 %748, %718
  %750 = xor i8 %749, %129
  %751 = xor i8 %750, %183
  %752 = shl i8 %75, 1
  %753 = and i8 %752, 126
  %754 = or i8 %752, -128
  %755 = select i1 %743, i8 %753, i8 %754
  %756 = xor i8 %755, 27
  %757 = select i1 %746, i8 %755, i8 %756
  %758 = and i8 %129, 1
  %759 = icmp eq i8 %758, 0
  %760 = select i1 %759, i8 0, i8 3
  %761 = and i8 %129, 2
  %762 = icmp eq i8 %761, 0
  %763 = xor i8 %760, 6
  %764 = select i1 %762, i8 %760, i8 %763
  %765 = and i8 %129, 4
  %766 = icmp eq i8 %765, 0
  %767 = xor i8 %764, 12
  %768 = select i1 %766, i8 %764, i8 %767
  %769 = and i8 %129, 8
  %770 = icmp eq i8 %769, 0
  %771 = xor i8 %768, 24
  %772 = select i1 %770, i8 %768, i8 %771
  %773 = and i8 %129, 16
  %774 = icmp eq i8 %773, 0
  %775 = xor i8 %772, 48
  %776 = select i1 %774, i8 %772, i8 %775
  %777 = and i8 %129, 32
  %778 = icmp eq i8 %777, 0
  %779 = xor i8 %776, 96
  %780 = select i1 %778, i8 %776, i8 %779
  %781 = and i8 %129, 64
  %782 = icmp eq i8 %781, 0
  %783 = xor i8 %780, -64
  %784 = select i1 %782, i8 %780, i8 %783
  %785 = icmp sgt i8 %129, -1
  %786 = xor i8 %784, -101
  %787 = select i1 %785, i8 %784, i8 %786
  %788 = xor i8 %757, %787
  %789 = xor i8 %788, %183
  %790 = xor i8 %789, %697
  %791 = shl i8 %129, 1
  %792 = and i8 %791, 126
  %793 = or i8 %791, -128
  %794 = select i1 %782, i8 %792, i8 %793
  %795 = xor i8 %794, 27
  %796 = select i1 %785, i8 %794, i8 %795
  %797 = and i8 %183, 1
  %798 = icmp eq i8 %797, 0
  %799 = select i1 %798, i8 0, i8 3
  %800 = and i8 %183, 2
  %801 = icmp eq i8 %800, 0
  %802 = xor i8 %799, 6
  %803 = select i1 %801, i8 %799, i8 %802
  %804 = and i8 %183, 4
  %805 = icmp eq i8 %804, 0
  %806 = xor i8 %803, 12
  %807 = select i1 %805, i8 %803, i8 %806
  %808 = and i8 %183, 8
  %809 = icmp eq i8 %808, 0
  %810 = xor i8 %807, 24
  %811 = select i1 %809, i8 %807, i8 %810
  %812 = and i8 %183, 16
  %813 = icmp eq i8 %812, 0
  %814 = xor i8 %811, 48
  %815 = select i1 %813, i8 %811, i8 %814
  %816 = and i8 %183, 32
  %817 = icmp eq i8 %816, 0
  %818 = xor i8 %815, 96
  %819 = select i1 %817, i8 %815, i8 %818
  %820 = and i8 %183, 64
  %821 = icmp eq i8 %820, 0
  %822 = xor i8 %819, -64
  %823 = select i1 %821, i8 %819, i8 %822
  %824 = icmp sgt i8 %183, -1
  %825 = xor i8 %823, -101
  %826 = select i1 %824, i8 %823, i8 %825
  %827 = xor i8 %796, %826
  %828 = xor i8 %827, %75
  %829 = xor i8 %828, %697
  %830 = select i1 %699, i8 0, i8 3
  %831 = xor i8 %830, 6
  %832 = select i1 %701, i8 %830, i8 %831
  %833 = xor i8 %832, 12
  %834 = select i1 %703, i8 %832, i8 %833
  %835 = xor i8 %834, 24
  %836 = select i1 %705, i8 %834, i8 %835
  %837 = xor i8 %836, 48
  %838 = select i1 %707, i8 %836, i8 %837
  %839 = xor i8 %838, 96
  %840 = select i1 %709, i8 %838, i8 %839
  %841 = xor i8 %840, -64
  %842 = select i1 %713, i8 %840, i8 %841
  %843 = xor i8 %842, -101
  %844 = select i1 %716, i8 %842, i8 %843
  %845 = shl i8 %183, 1
  %846 = and i8 %845, 126
  %847 = or i8 %845, -128
  %848 = select i1 %821, i8 %846, i8 %847
  %849 = xor i8 %848, 27
  %850 = select i1 %824, i8 %848, i8 %849
  %851 = xor i8 %850, %844
  %852 = xor i8 %851, %75
  %853 = xor i8 %852, %129
  store i8 %751, ptr %49, align 1, !tbaa !6
  store i8 %790, ptr %50, align 1, !tbaa !6
  store i8 %829, ptr %51, align 1, !tbaa !6
  store i8 %853, ptr %52, align 1, !tbaa !6
  %854 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %3) #5
  %855 = icmp eq ptr %854, null
  br i1 %855, label %856, label %53, !llvm.loop !14

856:                                              ; preds = %225, %33
  %857 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %3, i32 noundef 0, i32 noundef 16) #5
  %858 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %3) #5
  %859 = icmp eq ptr %858, null
  br i1 %859, label %868, label %860

860:                                              ; preds = %856, %860
  %861 = phi ptr [ %866, %860 ], [ %858, %856 ]
  %862 = load i32, ptr %861, align 4, !tbaa !9
  %863 = sext i32 %862 to i64
  %864 = getelementptr inbounds [16 x i8], ptr %1, i64 0, i64 %863
  %865 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %6, ptr noundef nonnull %861, ptr noundef nonnull %864, i64 noundef 0) #5
  %866 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %3) #5
  %867 = icmp eq ptr %866, null
  br i1 %867, label %868, label %860, !llvm.loop !15

868:                                              ; preds = %860, %856
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %3) #5
  call void @llvm.lifetime.end.p0(i64 256, ptr nonnull %2) #5
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %1) #5
  ret i32 0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind memory(none)
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #4

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="duotronic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #4 = { nounwind memory(none) }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 20.1.0 (https://github.com/fprime-bpf/llvm-project.git 3047ef595b8b4944540de771dcf86dc85a97ef76)"}
!3 = !{i64 2147510015}
!4 = !{i64 2147510531}
!5 = !{i64 2147511047}
!6 = !{!7, !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !7, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !12}
