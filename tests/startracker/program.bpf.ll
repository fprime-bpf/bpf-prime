; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

%struct.bpf_iter_num = type { i64, i64, i64, i64 }

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca [4 x float], align 4
  %2 = alloca [4 x float], align 4
  %3 = alloca [6 x float], align 4
  %4 = alloca float, align 4
  %5 = alloca [5 x i64], align 8
  %6 = alloca i64, align 8
  %7 = alloca %struct.bpf_iter_num, align 8
  %8 = alloca float, align 8
  %9 = alloca float, align 8
  %10 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #3, !srcloc !3
  %11 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 1, i32 0, i32 0, i32 0) #3, !srcloc !4
  %12 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 2, i32 0, i32 0, i32 0) #3, !srcloc !5
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %1) #3
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %2) #3
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %3) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #3
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %5) #3
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %6) #3
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %7) #3
  %13 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %7, i32 noundef 0, i32 noundef 4) #3
  %14 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #3
  %15 = icmp eq ptr %14, null
  br i1 %15, label %28, label %16

16:                                               ; preds = %0, %16
  %17 = phi ptr [ %26, %16 ], [ %14, %0 ]
  %18 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %10, ptr noundef nonnull %17) #3
  %19 = load float, ptr %18, align 4, !tbaa !6
  %20 = load i64, ptr %17, align 8, !tbaa !10
  %21 = getelementptr inbounds [4 x float], ptr %1, i64 0, i64 %20
  store volatile float %19, ptr %21, align 4, !tbaa !6
  %22 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %11, ptr noundef nonnull %17) #3
  %23 = load float, ptr %22, align 4, !tbaa !6
  %24 = load i64, ptr %17, align 8, !tbaa !10
  %25 = getelementptr inbounds [4 x float], ptr %2, i64 0, i64 %24
  store volatile float %23, ptr %25, align 4, !tbaa !6
  %26 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #3
  %27 = icmp eq ptr %26, null
  br i1 %27, label %28, label %16, !llvm.loop !12

28:                                               ; preds = %16, %0
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %7) #3
  %29 = load volatile float, ptr %1, align 4, !tbaa !6
  %30 = getelementptr inbounds nuw i8, ptr %1, i64 4
  %31 = load volatile float, ptr %30, align 4, !tbaa !6
  %32 = fsub float %29, %31
  %33 = load volatile float, ptr %1, align 4, !tbaa !6
  %34 = load volatile float, ptr %30, align 4, !tbaa !6
  %35 = fsub float %33, %34
  %36 = load volatile float, ptr %2, align 4, !tbaa !6
  %37 = getelementptr inbounds nuw i8, ptr %2, i64 4
  %38 = load volatile float, ptr %37, align 4, !tbaa !6
  %39 = fsub float %36, %38
  %40 = load volatile float, ptr %2, align 4, !tbaa !6
  %41 = load volatile float, ptr %37, align 4, !tbaa !6
  %42 = fsub float %40, %41
  %43 = fmul float %39, %42
  %44 = call float @llvm.fmuladd.f32(float %32, float %35, float %43)
  %45 = fcmp ugt float %44, 0.000000e+00
  br i1 %45, label %46, label %57

46:                                               ; preds = %28
  %47 = fmul float %44, 5.000000e-01
  %48 = bitcast float %44 to i32
  %49 = ashr i32 %48, 1
  %50 = sub nsw i32 1597463007, %49
  %51 = bitcast i32 %50 to float
  %52 = fneg float %51
  %53 = fmul float %47, %52
  %54 = call float @llvm.fmuladd.f32(float %53, float %51, float 1.500000e+00)
  %55 = fmul float %54, %51
  %56 = fdiv float 1.000000e+00, %55
  br label %57

57:                                               ; preds = %28, %46
  %58 = phi float [ %56, %46 ], [ 0.000000e+00, %28 ]
  store volatile float %58, ptr %3, align 4, !tbaa !6
  %59 = load volatile float, ptr %30, align 4, !tbaa !6
  %60 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %61 = load volatile float, ptr %60, align 4, !tbaa !6
  %62 = fsub float %59, %61
  %63 = load volatile float, ptr %30, align 4, !tbaa !6
  %64 = load volatile float, ptr %60, align 4, !tbaa !6
  %65 = fsub float %63, %64
  %66 = load volatile float, ptr %37, align 4, !tbaa !6
  %67 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %68 = load volatile float, ptr %67, align 4, !tbaa !6
  %69 = fsub float %66, %68
  %70 = load volatile float, ptr %37, align 4, !tbaa !6
  %71 = load volatile float, ptr %67, align 4, !tbaa !6
  %72 = fsub float %70, %71
  %73 = fmul float %69, %72
  %74 = call float @llvm.fmuladd.f32(float %62, float %65, float %73)
  %75 = fcmp ugt float %74, 0.000000e+00
  br i1 %75, label %76, label %87

76:                                               ; preds = %57
  %77 = fmul float %74, 5.000000e-01
  %78 = bitcast float %74 to i32
  %79 = ashr i32 %78, 1
  %80 = sub nsw i32 1597463007, %79
  %81 = bitcast i32 %80 to float
  %82 = fneg float %81
  %83 = fmul float %77, %82
  %84 = call float @llvm.fmuladd.f32(float %83, float %81, float 1.500000e+00)
  %85 = fmul float %84, %81
  %86 = fdiv float 1.000000e+00, %85
  br label %87

87:                                               ; preds = %57, %76
  %88 = phi float [ %86, %76 ], [ 0.000000e+00, %57 ]
  %89 = getelementptr inbounds nuw i8, ptr %3, i64 4
  store volatile float %88, ptr %89, align 4, !tbaa !6
  %90 = load volatile float, ptr %60, align 4, !tbaa !6
  %91 = getelementptr inbounds nuw i8, ptr %1, i64 12
  %92 = load volatile float, ptr %91, align 4, !tbaa !6
  %93 = fsub float %90, %92
  %94 = load volatile float, ptr %60, align 4, !tbaa !6
  %95 = load volatile float, ptr %91, align 4, !tbaa !6
  %96 = fsub float %94, %95
  %97 = load volatile float, ptr %67, align 4, !tbaa !6
  %98 = getelementptr inbounds nuw i8, ptr %2, i64 12
  %99 = load volatile float, ptr %98, align 4, !tbaa !6
  %100 = fsub float %97, %99
  %101 = load volatile float, ptr %67, align 4, !tbaa !6
  %102 = load volatile float, ptr %98, align 4, !tbaa !6
  %103 = fsub float %101, %102
  %104 = fmul float %100, %103
  %105 = call float @llvm.fmuladd.f32(float %93, float %96, float %104)
  %106 = fcmp ugt float %105, 0.000000e+00
  br i1 %106, label %107, label %118

107:                                              ; preds = %87
  %108 = fmul float %105, 5.000000e-01
  %109 = bitcast float %105 to i32
  %110 = ashr i32 %109, 1
  %111 = sub nsw i32 1597463007, %110
  %112 = bitcast i32 %111 to float
  %113 = fneg float %112
  %114 = fmul float %108, %113
  %115 = call float @llvm.fmuladd.f32(float %114, float %112, float 1.500000e+00)
  %116 = fmul float %115, %112
  %117 = fdiv float 1.000000e+00, %116
  br label %118

118:                                              ; preds = %87, %107
  %119 = phi float [ %117, %107 ], [ 0.000000e+00, %87 ]
  %120 = getelementptr inbounds nuw i8, ptr %3, i64 8
  store volatile float %119, ptr %120, align 4, !tbaa !6
  %121 = load volatile float, ptr %30, align 4, !tbaa !6
  %122 = load volatile float, ptr %91, align 4, !tbaa !6
  %123 = fsub float %121, %122
  %124 = load volatile float, ptr %30, align 4, !tbaa !6
  %125 = load volatile float, ptr %91, align 4, !tbaa !6
  %126 = fsub float %124, %125
  %127 = load volatile float, ptr %37, align 4, !tbaa !6
  %128 = load volatile float, ptr %98, align 4, !tbaa !6
  %129 = fsub float %127, %128
  %130 = load volatile float, ptr %37, align 4, !tbaa !6
  %131 = load volatile float, ptr %98, align 4, !tbaa !6
  %132 = fsub float %130, %131
  %133 = fmul float %129, %132
  %134 = call float @llvm.fmuladd.f32(float %123, float %126, float %133)
  %135 = fcmp ugt float %134, 0.000000e+00
  br i1 %135, label %136, label %147

136:                                              ; preds = %118
  %137 = fmul float %134, 5.000000e-01
  %138 = bitcast float %134 to i32
  %139 = ashr i32 %138, 1
  %140 = sub nsw i32 1597463007, %139
  %141 = bitcast i32 %140 to float
  %142 = fneg float %141
  %143 = fmul float %137, %142
  %144 = call float @llvm.fmuladd.f32(float %143, float %141, float 1.500000e+00)
  %145 = fmul float %144, %141
  %146 = fdiv float 1.000000e+00, %145
  br label %147

147:                                              ; preds = %118, %136
  %148 = phi float [ %146, %136 ], [ 0.000000e+00, %118 ]
  %149 = getelementptr inbounds nuw i8, ptr %3, i64 12
  store volatile float %148, ptr %149, align 4, !tbaa !6
  %150 = load volatile float, ptr %1, align 4, !tbaa !6
  %151 = load volatile float, ptr %60, align 4, !tbaa !6
  %152 = fsub float %150, %151
  %153 = load volatile float, ptr %1, align 4, !tbaa !6
  %154 = load volatile float, ptr %60, align 4, !tbaa !6
  %155 = fsub float %153, %154
  %156 = load volatile float, ptr %2, align 4, !tbaa !6
  %157 = load volatile float, ptr %67, align 4, !tbaa !6
  %158 = fsub float %156, %157
  %159 = load volatile float, ptr %2, align 4, !tbaa !6
  %160 = load volatile float, ptr %67, align 4, !tbaa !6
  %161 = fsub float %159, %160
  %162 = fmul float %158, %161
  %163 = call float @llvm.fmuladd.f32(float %152, float %155, float %162)
  %164 = fcmp ugt float %163, 0.000000e+00
  br i1 %164, label %165, label %176

165:                                              ; preds = %147
  %166 = fmul float %163, 5.000000e-01
  %167 = bitcast float %163 to i32
  %168 = ashr i32 %167, 1
  %169 = sub nsw i32 1597463007, %168
  %170 = bitcast i32 %169 to float
  %171 = fneg float %170
  %172 = fmul float %166, %171
  %173 = call float @llvm.fmuladd.f32(float %172, float %170, float 1.500000e+00)
  %174 = fmul float %173, %170
  %175 = fdiv float 1.000000e+00, %174
  br label %176

176:                                              ; preds = %147, %165
  %177 = phi float [ %175, %165 ], [ 0.000000e+00, %147 ]
  %178 = getelementptr inbounds nuw i8, ptr %3, i64 16
  store volatile float %177, ptr %178, align 4, !tbaa !6
  %179 = load volatile float, ptr %1, align 4, !tbaa !6
  %180 = load volatile float, ptr %91, align 4, !tbaa !6
  %181 = fsub float %179, %180
  %182 = load volatile float, ptr %1, align 4, !tbaa !6
  %183 = load volatile float, ptr %91, align 4, !tbaa !6
  %184 = fsub float %182, %183
  %185 = load volatile float, ptr %2, align 4, !tbaa !6
  %186 = load volatile float, ptr %98, align 4, !tbaa !6
  %187 = fsub float %185, %186
  %188 = load volatile float, ptr %2, align 4, !tbaa !6
  %189 = load volatile float, ptr %98, align 4, !tbaa !6
  %190 = fsub float %188, %189
  %191 = fmul float %187, %190
  %192 = call float @llvm.fmuladd.f32(float %181, float %184, float %191)
  %193 = fcmp ugt float %192, 0.000000e+00
  br i1 %193, label %194, label %205

194:                                              ; preds = %176
  %195 = fmul float %192, 5.000000e-01
  %196 = bitcast float %192 to i32
  %197 = ashr i32 %196, 1
  %198 = sub nsw i32 1597463007, %197
  %199 = bitcast i32 %198 to float
  %200 = fneg float %199
  %201 = fmul float %195, %200
  %202 = call float @llvm.fmuladd.f32(float %201, float %199, float 1.500000e+00)
  %203 = fmul float %202, %199
  %204 = fdiv float 1.000000e+00, %203
  br label %205

205:                                              ; preds = %176, %194
  %206 = phi float [ %204, %194 ], [ 0.000000e+00, %176 ]
  %207 = getelementptr inbounds nuw i8, ptr %3, i64 20
  store volatile float %206, ptr %207, align 4, !tbaa !6
  %208 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %7, i32 noundef 0, i32 noundef 6) #3
  %209 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #3
  %210 = icmp eq ptr %209, null
  br i1 %210, label %227, label %211

211:                                              ; preds = %205, %211
  %212 = phi ptr [ %225, %211 ], [ %209, %205 ]
  %213 = phi i64 [ %224, %211 ], [ 0, %205 ]
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %8)
  %214 = load i64, ptr %212, align 8, !tbaa !10
  %215 = getelementptr inbounds [6 x float], ptr %3, i64 0, i64 %214
  %216 = load volatile float, ptr %215, align 4, !tbaa !6
  %217 = fmul float %216, 1.000000e+04
  store float %217, ptr %8, align 8, !tbaa !6
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %9)
  %218 = getelementptr inbounds [6 x float], ptr %3, i64 0, i64 %213
  %219 = load volatile float, ptr %218, align 4, !tbaa !6
  %220 = fmul float %219, 1.000000e+04
  store float %220, ptr %9, align 8, !tbaa !6
  %221 = load i64, ptr %8, align 8, !tbaa !15
  %222 = load i64, ptr %9, align 8, !tbaa !15
  %223 = icmp sgt i64 %221, %222
  %224 = select i1 %223, i64 %214, i64 %213
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %9)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %8)
  %225 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #3
  %226 = icmp eq ptr %225, null
  br i1 %226, label %227, label %211, !llvm.loop !17

227:                                              ; preds = %211, %205
  %228 = phi i64 [ 0, %205 ], [ %224, %211 ]
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %7) #3
  %229 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %7, i32 noundef 0, i32 noundef 6) #3
  %230 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #3
  %231 = icmp eq ptr %230, null
  br i1 %231, label %243, label %232

232:                                              ; preds = %227
  %233 = getelementptr inbounds [6 x float], ptr %3, i64 0, i64 %228
  br label %234

234:                                              ; preds = %232, %234
  %235 = phi ptr [ %230, %232 ], [ %241, %234 ]
  %236 = load i64, ptr %235, align 8, !tbaa !10
  %237 = getelementptr inbounds [6 x float], ptr %3, i64 0, i64 %236
  %238 = load volatile float, ptr %237, align 4, !tbaa !6
  %239 = load volatile float, ptr %233, align 4, !tbaa !6
  %240 = fdiv float %238, %239
  store volatile float %240, ptr %237, align 4, !tbaa !6
  %241 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #3
  %242 = icmp eq ptr %241, null
  br i1 %242, label %243, label %234, !llvm.loop !18

243:                                              ; preds = %234, %227
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %7) #3
  switch i64 %228, label %254 [
    i64 0, label %244
    i64 1, label %246
    i64 2, label %248
    i64 3, label %250
    i64 4, label %252
  ]

244:                                              ; preds = %243
  %245 = load volatile float, ptr %89, align 4, !tbaa !6
  store volatile float %245, ptr %3, align 4, !tbaa !6
  br label %246

246:                                              ; preds = %243, %244
  %247 = load volatile float, ptr %120, align 4, !tbaa !6
  store volatile float %247, ptr %89, align 4, !tbaa !6
  br label %248

248:                                              ; preds = %243, %246
  %249 = load volatile float, ptr %149, align 4, !tbaa !6
  store volatile float %249, ptr %120, align 4, !tbaa !6
  br label %250

250:                                              ; preds = %243, %248
  %251 = load volatile float, ptr %178, align 4, !tbaa !6
  store volatile float %251, ptr %149, align 4, !tbaa !6
  br label %252

252:                                              ; preds = %243, %250
  %253 = load volatile float, ptr %207, align 4, !tbaa !6
  store volatile float %253, ptr %178, align 4, !tbaa !6
  br label %254

254:                                              ; preds = %243, %252
  %255 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %7, i32 noundef 0, i32 noundef 5) #3
  %256 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #3
  %257 = icmp eq ptr %256, null
  br i1 %257, label %277, label %258

258:                                              ; preds = %254, %258
  %259 = phi ptr [ %264, %258 ], [ %256, %254 ]
  %260 = load i64, ptr %259, align 8, !tbaa !10
  %261 = getelementptr inbounds [6 x float], ptr %3, i64 0, i64 %260
  %262 = load i64, ptr %261, align 4, !tbaa !15
  %263 = getelementptr inbounds [5 x i64], ptr %5, i64 0, i64 %260
  store i64 %262, ptr %263, align 8, !tbaa !15
  %264 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #3
  %265 = icmp eq ptr %264, null
  br i1 %265, label %266, label %258, !llvm.loop !19

266:                                              ; preds = %258
  %267 = load i64, ptr %5, align 8, !tbaa !15
  %268 = getelementptr inbounds nuw i8, ptr %5, i64 8
  %269 = load i64, ptr %268, align 8, !tbaa !15
  %270 = getelementptr inbounds nuw i8, ptr %5, i64 16
  %271 = load i64, ptr %270, align 8, !tbaa !15
  %272 = getelementptr inbounds nuw i8, ptr %5, i64 24
  %273 = load i64, ptr %272, align 8, !tbaa !15
  %274 = getelementptr inbounds nuw i8, ptr %5, i64 32
  %275 = load i64, ptr %274, align 8, !tbaa !15
  %276 = xor i64 %275, -1
  br label %277

277:                                              ; preds = %266, %254
  %278 = phi i64 [ %276, %266 ], [ undef, %254 ]
  %279 = phi i64 [ %273, %266 ], [ undef, %254 ]
  %280 = phi i64 [ %271, %266 ], [ undef, %254 ]
  %281 = phi i64 [ %269, %266 ], [ undef, %254 ]
  %282 = phi i64 [ %267, %266 ], [ undef, %254 ]
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %7) #3
  %283 = and i64 %281, %282
  %284 = xor i64 %282, -1
  %285 = and i64 %280, %284
  %286 = or i64 %285, %283
  %287 = and i64 %279, %281
  %288 = xor i64 %279, -1
  %289 = and i64 %280, %288
  %290 = or i64 %287, %289
  %291 = and i64 %280, %278
  %292 = xor i64 %291, %279
  %293 = xor i64 %290, %286
  %294 = xor i64 %293, %292
  store i64 %294, ptr %6, align 8, !tbaa !15
  %295 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %12, ptr noundef nonnull %6, ptr noundef nonnull %4, i64 noundef 0) #3
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %7) #3
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %6) #3
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %5) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #3
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3) #3
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %2) #3
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %1) #3
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
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 03a843fe2f5c0023ee1e6ee21d74290f4387a642)"}
!3 = !{i64 2147510824}
!4 = !{i64 2147511336}
!5 = !{i64 2147511848}
!6 = !{!7, !7, i64 0}
!7 = !{!"float", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"long long", !8, i64 0}
!12 = distinct !{!12, !13, !14}
!13 = !{!"llvm.loop.mustprogress"}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = !{!16, !16, i64 0}
!16 = !{!"long", !8, i64 0}
!17 = distinct !{!17, !13, !14}
!18 = distinct !{!18, !13, !14}
!19 = distinct !{!19, !13, !14}
