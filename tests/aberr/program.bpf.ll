; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca float, align 8
  %2 = alloca float, align 8
  %3 = alloca [3 x float], align 4
  %4 = alloca [3 x float], align 4
  %5 = alloca [3 x float], align 4
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca float, align 4
  %11 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #3, !srcloc !3
  %12 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 2, i32 0, i32 0, i32 0) #3, !srcloc !4
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %3) #3
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %4) #3
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %5) #3
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %6) #3
  store i64 0, ptr %6, align 8, !tbaa !5
  br label %14

13:                                               ; preds = %14
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %6) #3
  br label %90

14:                                               ; preds = %0, %14
  %15 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %11, ptr noundef nonnull %6) #3
  %16 = load float, ptr %15, align 4, !tbaa !9
  %17 = load i64, ptr %6, align 8, !tbaa !5
  %18 = getelementptr inbounds [3 x float], ptr %3, i64 0, i64 %17
  store volatile float %16, ptr %18, align 4, !tbaa !9
  %19 = add nsw i64 %17, 1
  store i64 %19, ptr %6, align 8, !tbaa !5
  %20 = icmp slt i64 %17, 2
  br i1 %20, label %14, label %13, !llvm.loop !11

21:                                               ; preds = %90
  %22 = load volatile float, ptr %4, align 4, !tbaa !9
  %23 = load volatile float, ptr %4, align 4, !tbaa !9
  %24 = getelementptr inbounds nuw i8, ptr %4, i64 4
  %25 = load volatile float, ptr %24, align 4, !tbaa !9
  %26 = load volatile float, ptr %24, align 4, !tbaa !9
  %27 = fmul float %25, %26
  %28 = call float @llvm.fmuladd.f32(float %22, float %23, float %27)
  %29 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %30 = load volatile float, ptr %29, align 4, !tbaa !9
  %31 = load volatile float, ptr %29, align 4, !tbaa !9
  %32 = call float @llvm.fmuladd.f32(float %30, float %31, float %28)
  %33 = fsub float 1.000000e+00, %32
  %34 = fcmp ugt float %33, 0.000000e+00
  br i1 %34, label %35, label %46

35:                                               ; preds = %21
  %36 = fmul float %33, 5.000000e-01
  %37 = bitcast float %33 to i32
  %38 = ashr i32 %37, 1
  %39 = sub nsw i32 1597463007, %38
  %40 = bitcast i32 %39 to float
  %41 = fneg float %40
  %42 = fmul float %36, %41
  %43 = call float @llvm.fmuladd.f32(float %42, float %40, float 1.500000e+00)
  %44 = fmul float %43, %40
  %45 = fdiv float 1.000000e+00, %44
  br label %46

46:                                               ; preds = %21, %35
  %47 = phi float [ %45, %35 ], [ 0.000000e+00, %21 ]
  %48 = fdiv float 1.000000e+00, %47
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %8) #3
  store i64 6, ptr %8, align 8, !tbaa !5
  %49 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %11, ptr noundef nonnull %8) #3
  %50 = load float, ptr %49, align 4, !tbaa !9
  store i64 7, ptr %8, align 8, !tbaa !5
  %51 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %11, ptr noundef nonnull %8) #3
  %52 = load float, ptr %51, align 4, !tbaa !9
  store i64 8, ptr %8, align 8, !tbaa !5
  %53 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %11, ptr noundef nonnull %8) #3
  %54 = load float, ptr %53, align 4, !tbaa !9
  store i64 9, ptr %8, align 8, !tbaa !5
  %55 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %11, ptr noundef nonnull %8) #3
  %56 = load float, ptr %55, align 4, !tbaa !9
  %57 = fadd float %54, 1.000000e+00
  %58 = fcmp ugt float %57, 0.000000e+00
  %59 = fsub float 1.000000e+00, %54
  %60 = fcmp ugt float %59, 0.000000e+00
  %61 = fneg float %54
  %62 = fmul float %57, 5.000000e-01
  %63 = bitcast float %57 to i32
  %64 = ashr i32 %63, 1
  %65 = sub nsw i32 1597463007, %64
  %66 = bitcast i32 %65 to float
  %67 = fneg float %66
  %68 = fmul float %62, %67
  %69 = call float @llvm.fmuladd.f32(float %68, float %66, float 1.500000e+00)
  %70 = fmul float %69, %66
  %71 = fdiv float 1.000000e+00, %70
  %72 = fmul float %59, 5.000000e-01
  %73 = bitcast float %59 to i32
  %74 = ashr i32 %73, 1
  %75 = sub nsw i32 1597463007, %74
  %76 = bitcast i32 %75 to float
  %77 = fneg float %76
  %78 = fmul float %72, %77
  %79 = call float @llvm.fmuladd.f32(float %78, float %76, float 1.500000e+00)
  %80 = fmul float %79, %76
  %81 = fdiv float 1.000000e+00, %80
  %82 = getelementptr inbounds nuw i8, ptr %3, i64 4
  %83 = getelementptr inbounds nuw i8, ptr %3, i64 8
  %84 = fadd float %48, 1.000000e+00
  %85 = fdiv float %48, %84
  %86 = getelementptr inbounds nuw i8, ptr %5, i64 4
  %87 = getelementptr inbounds nuw i8, ptr %5, i64 8
  %88 = select i1 %58, float %71, float 0.000000e+00
  %89 = select i1 %60, float %81, float 0.000000e+00
  br label %100

90:                                               ; preds = %13, %90
  %91 = phi i64 [ 0, %13 ], [ %97, %90 ]
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %7) #3
  %92 = add nuw nsw i64 %91, 3
  store i64 %92, ptr %7, align 8, !tbaa !5
  %93 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %11, ptr noundef nonnull %7) #3
  %94 = load float, ptr %93, align 4, !tbaa !9
  %95 = fdiv float %94, 0x41B1DE7840000000
  %96 = getelementptr inbounds nuw [3 x float], ptr %4, i64 0, i64 %91
  store volatile float %95, ptr %96, align 4, !tbaa !9
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %7) #3
  %97 = add nuw nsw i64 %91, 1
  %98 = icmp eq i64 %97, 3
  br i1 %98, label %21, label %90, !llvm.loop !14

99:                                               ; preds = %984
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %9) #3
  store i64 0, ptr %9, align 8, !tbaa !5
  br label %996

100:                                              ; preds = %46, %984
  %101 = phi float [ 0.000000e+00, %46 ], [ %992, %984 ]
  %102 = phi i64 [ 0, %46 ], [ %993, %984 ]
  %103 = fsub float %50, %101
  %104 = fmul float %56, %103
  %105 = fcmp olt float %104, 0.000000e+00
  %106 = fadd float %104, 0x401921FB60000000
  %107 = select i1 %105, float %106, float %104
  %108 = fcmp ult float %107, 0x401921FB60000000
  %109 = fadd float %107, 0xC01921FB60000000
  %110 = select i1 %108, float %107, float %109
  %111 = fcmp oge float %110, 0x3FD921FB60000000
  %112 = fadd float %110, 0xBFD921FB60000000
  %113 = select i1 %111, float %112, float %104
  %114 = select i1 %111, float 0x3FD87DE2A0000000, float 0.000000e+00
  %115 = select i1 %111, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %116 = fcmp oge float %110, 0x3FE921FB60000000
  %117 = fadd float %110, 0xBFE921FB60000000
  %118 = select i1 %116, float %117, float %113
  %119 = select i1 %116, float 0x3FE6A09E60000000, float %114
  %120 = select i1 %116, float 0x3FED906BC0000000, float %115
  %121 = fcmp oge float %110, 0x3FF2D97C80000000
  %122 = fadd float %110, 0xBFF2D97C80000000
  %123 = select i1 %121, float %122, float %118
  %124 = select i1 %121, float 0x3FED906BC0000000, float %119
  %125 = select i1 %121, float 1.000000e+00, float %120
  %126 = fcmp oge float %110, 0x3FF921FB60000000
  %127 = fadd float %110, 0xBFF921FB60000000
  %128 = select i1 %126, float %127, float %123
  %129 = select i1 %126, float 1.000000e+00, float %124
  %130 = select i1 %126, float 0x3FED906BC0000000, float %125
  %131 = fcmp oge float %110, 0x3FFF6A7A40000000
  %132 = fadd float %110, 0xBFFF6A7A40000000
  %133 = select i1 %131, float %132, float %128
  %134 = select i1 %131, float 0x3FED906BC0000000, float %129
  %135 = select i1 %131, float 0x3FE6A09E60000000, float %130
  %136 = fcmp oge float %110, 0x4002D97C80000000
  %137 = fadd float %110, 0xC002D97C80000000
  %138 = select i1 %136, float %137, float %133
  %139 = select i1 %136, float 0x3FE6A09E60000000, float %134
  %140 = select i1 %136, float 0x3FD87DE2A0000000, float %135
  %141 = fcmp oge float %110, 0x4005FDBC00000000
  %142 = fadd float %110, 0xC005FDBC00000000
  %143 = select i1 %141, float %142, float %138
  %144 = select i1 %141, float 0x3FD87DE2A0000000, float %139
  %145 = select i1 %141, float 0.000000e+00, float %140
  %146 = fcmp oge float %110, 0x400921FB60000000
  %147 = fadd float %110, 0xC00921FB60000000
  %148 = select i1 %146, float %147, float %143
  %149 = select i1 %146, float 0.000000e+00, float %144
  %150 = select i1 %146, float 0xBFD87DE2A0000000, float %145
  %151 = fcmp oge float %110, 0x400C463AC0000000
  %152 = fadd float %110, 0xC00C463AC0000000
  %153 = select i1 %151, float %152, float %148
  %154 = select i1 %151, float 0xBFD87DE2A0000000, float %149
  %155 = select i1 %151, float 0xBFE6A09E60000000, float %150
  %156 = fcmp oge float %110, 0x400F6A7A40000000
  %157 = fadd float %110, 0xC00F6A7A40000000
  %158 = select i1 %156, float %157, float %153
  %159 = select i1 %156, float 0xBFE6A09E60000000, float %154
  %160 = select i1 %156, float 0xBFED906BC0000000, float %155
  %161 = fcmp oge float %110, 0x4011475CE0000000
  %162 = fadd float %110, 0xC011475CE0000000
  %163 = select i1 %161, float %162, float %158
  %164 = select i1 %161, float 0xBFED906BC0000000, float %159
  %165 = select i1 %161, float -1.000000e+00, float %160
  %166 = fcmp oge float %110, 0x4012D97C80000000
  %167 = fadd float %110, 0xC012D97C80000000
  %168 = select i1 %166, float %167, float %163
  %169 = select i1 %166, float -1.000000e+00, float %164
  %170 = select i1 %166, float 0xBFED906BC0000000, float %165
  %171 = fcmp oge float %110, 0x40146B9C40000000
  %172 = fadd float %110, 0xC0146B9C40000000
  %173 = select i1 %171, float %172, float %168
  %174 = select i1 %171, float 0xBFED906BC0000000, float %169
  %175 = select i1 %171, float 0xBFE6A09E60000000, float %170
  %176 = fcmp oge float %110, 0x4015FDBC00000000
  %177 = fadd float %110, 0xC015FDBC00000000
  %178 = select i1 %176, float %177, float %173
  %179 = select i1 %176, float 0xBFE6A09E60000000, float %174
  %180 = select i1 %176, float 0xBFD87DE2A0000000, float %175
  %181 = fcmp oge float %110, 0x40178FDBA0000000
  %182 = fadd float %110, 0xC0178FDBA0000000
  %183 = select i1 %181, float %182, float %178
  %184 = select i1 %181, float 0xBFD87DE2A0000000, float %179
  %185 = select i1 %181, float 0.000000e+00, float %180
  %186 = fdiv float %183, 0x3FD921FB60000000
  %187 = fsub float %185, %184
  %188 = call float @llvm.fmuladd.f32(float %186, float %187, float %184)
  %189 = call float @llvm.fmuladd.f32(float %54, float %188, float %104)
  %190 = fcmp olt float %189, 0.000000e+00
  %191 = fadd float %189, 0x401921FB60000000
  %192 = select i1 %190, float %191, float %189
  %193 = fcmp ult float %192, 0x401921FB60000000
  %194 = fadd float %192, 0xC01921FB60000000
  %195 = select i1 %193, float %192, float %194
  %196 = fcmp oge float %195, 0x3FD921FB60000000
  %197 = fadd float %195, 0xBFD921FB60000000
  %198 = select i1 %196, float %197, float %189
  %199 = select i1 %196, float 0x3FD87DE2A0000000, float 0.000000e+00
  %200 = select i1 %196, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %201 = fcmp oge float %195, 0x3FE921FB60000000
  %202 = fadd float %195, 0xBFE921FB60000000
  %203 = select i1 %201, float %202, float %198
  %204 = select i1 %201, float 0x3FE6A09E60000000, float %199
  %205 = select i1 %201, float 0x3FED906BC0000000, float %200
  %206 = fcmp oge float %195, 0x3FF2D97C80000000
  %207 = fadd float %195, 0xBFF2D97C80000000
  %208 = select i1 %206, float %207, float %203
  %209 = select i1 %206, float 0x3FED906BC0000000, float %204
  %210 = select i1 %206, float 1.000000e+00, float %205
  %211 = fcmp oge float %195, 0x3FF921FB60000000
  %212 = fadd float %195, 0xBFF921FB60000000
  %213 = select i1 %211, float %212, float %208
  %214 = select i1 %211, float 1.000000e+00, float %209
  %215 = select i1 %211, float 0x3FED906BC0000000, float %210
  %216 = fcmp oge float %195, 0x3FFF6A7A40000000
  %217 = fadd float %195, 0xBFFF6A7A40000000
  %218 = select i1 %216, float %217, float %213
  %219 = select i1 %216, float 0x3FED906BC0000000, float %214
  %220 = select i1 %216, float 0x3FE6A09E60000000, float %215
  %221 = fcmp oge float %195, 0x4002D97C80000000
  %222 = fadd float %195, 0xC002D97C80000000
  %223 = select i1 %221, float %222, float %218
  %224 = select i1 %221, float 0x3FE6A09E60000000, float %219
  %225 = select i1 %221, float 0x3FD87DE2A0000000, float %220
  %226 = fcmp oge float %195, 0x4005FDBC00000000
  %227 = fadd float %195, 0xC005FDBC00000000
  %228 = select i1 %226, float %227, float %223
  %229 = select i1 %226, float 0x3FD87DE2A0000000, float %224
  %230 = select i1 %226, float 0.000000e+00, float %225
  %231 = fcmp oge float %195, 0x400921FB60000000
  %232 = fadd float %195, 0xC00921FB60000000
  %233 = select i1 %231, float %232, float %228
  %234 = select i1 %231, float 0.000000e+00, float %229
  %235 = select i1 %231, float 0xBFD87DE2A0000000, float %230
  %236 = fcmp oge float %195, 0x400C463AC0000000
  %237 = fadd float %195, 0xC00C463AC0000000
  %238 = select i1 %236, float %237, float %233
  %239 = select i1 %236, float 0xBFD87DE2A0000000, float %234
  %240 = select i1 %236, float 0xBFE6A09E60000000, float %235
  %241 = fcmp oge float %195, 0x400F6A7A40000000
  %242 = fadd float %195, 0xC00F6A7A40000000
  %243 = select i1 %241, float %242, float %238
  %244 = select i1 %241, float 0xBFE6A09E60000000, float %239
  %245 = select i1 %241, float 0xBFED906BC0000000, float %240
  %246 = fcmp oge float %195, 0x4011475CE0000000
  %247 = fadd float %195, 0xC011475CE0000000
  %248 = select i1 %246, float %247, float %243
  %249 = select i1 %246, float 0xBFED906BC0000000, float %244
  %250 = select i1 %246, float -1.000000e+00, float %245
  %251 = fcmp oge float %195, 0x4012D97C80000000
  %252 = fadd float %195, 0xC012D97C80000000
  %253 = select i1 %251, float %252, float %248
  %254 = select i1 %251, float -1.000000e+00, float %249
  %255 = select i1 %251, float 0xBFED906BC0000000, float %250
  %256 = fcmp oge float %195, 0x40146B9C40000000
  %257 = fadd float %195, 0xC0146B9C40000000
  %258 = select i1 %256, float %257, float %253
  %259 = select i1 %256, float 0xBFED906BC0000000, float %254
  %260 = select i1 %256, float 0xBFE6A09E60000000, float %255
  %261 = fcmp oge float %195, 0x4015FDBC00000000
  %262 = fadd float %195, 0xC015FDBC00000000
  %263 = select i1 %261, float %262, float %258
  %264 = select i1 %261, float 0xBFE6A09E60000000, float %259
  %265 = select i1 %261, float 0xBFD87DE2A0000000, float %260
  %266 = fcmp oge float %195, 0x40178FDBA0000000
  %267 = fadd float %195, 0xC0178FDBA0000000
  %268 = select i1 %266, float %267, float %263
  %269 = select i1 %266, float 0xBFD87DE2A0000000, float %264
  %270 = select i1 %266, float 0.000000e+00, float %265
  %271 = fdiv float %268, 0x3FD921FB60000000
  %272 = fsub float %270, %269
  %273 = call float @llvm.fmuladd.f32(float %271, float %272, float %269)
  %274 = call float @llvm.fmuladd.f32(float %54, float %273, float %104)
  %275 = fcmp olt float %274, 0.000000e+00
  %276 = fadd float %274, 0x401921FB60000000
  %277 = select i1 %275, float %276, float %274
  %278 = fcmp ult float %277, 0x401921FB60000000
  %279 = fadd float %277, 0xC01921FB60000000
  %280 = select i1 %278, float %277, float %279
  %281 = fcmp oge float %280, 0x3FD921FB60000000
  %282 = fadd float %280, 0xBFD921FB60000000
  %283 = select i1 %281, float %282, float %274
  %284 = select i1 %281, float 0x3FD87DE2A0000000, float 0.000000e+00
  %285 = select i1 %281, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %286 = fcmp oge float %280, 0x3FE921FB60000000
  %287 = fadd float %280, 0xBFE921FB60000000
  %288 = select i1 %286, float %287, float %283
  %289 = select i1 %286, float 0x3FE6A09E60000000, float %284
  %290 = select i1 %286, float 0x3FED906BC0000000, float %285
  %291 = fcmp oge float %280, 0x3FF2D97C80000000
  %292 = fadd float %280, 0xBFF2D97C80000000
  %293 = select i1 %291, float %292, float %288
  %294 = select i1 %291, float 0x3FED906BC0000000, float %289
  %295 = select i1 %291, float 1.000000e+00, float %290
  %296 = fcmp oge float %280, 0x3FF921FB60000000
  %297 = fadd float %280, 0xBFF921FB60000000
  %298 = select i1 %296, float %297, float %293
  %299 = select i1 %296, float 1.000000e+00, float %294
  %300 = select i1 %296, float 0x3FED906BC0000000, float %295
  %301 = fcmp oge float %280, 0x3FFF6A7A40000000
  %302 = fadd float %280, 0xBFFF6A7A40000000
  %303 = select i1 %301, float %302, float %298
  %304 = select i1 %301, float 0x3FED906BC0000000, float %299
  %305 = select i1 %301, float 0x3FE6A09E60000000, float %300
  %306 = fcmp oge float %280, 0x4002D97C80000000
  %307 = fadd float %280, 0xC002D97C80000000
  %308 = select i1 %306, float %307, float %303
  %309 = select i1 %306, float 0x3FE6A09E60000000, float %304
  %310 = select i1 %306, float 0x3FD87DE2A0000000, float %305
  %311 = fcmp oge float %280, 0x4005FDBC00000000
  %312 = fadd float %280, 0xC005FDBC00000000
  %313 = select i1 %311, float %312, float %308
  %314 = select i1 %311, float 0x3FD87DE2A0000000, float %309
  %315 = select i1 %311, float 0.000000e+00, float %310
  %316 = fcmp oge float %280, 0x400921FB60000000
  %317 = fadd float %280, 0xC00921FB60000000
  %318 = select i1 %316, float %317, float %313
  %319 = select i1 %316, float 0.000000e+00, float %314
  %320 = select i1 %316, float 0xBFD87DE2A0000000, float %315
  %321 = fcmp oge float %280, 0x400C463AC0000000
  %322 = fadd float %280, 0xC00C463AC0000000
  %323 = select i1 %321, float %322, float %318
  %324 = select i1 %321, float 0xBFD87DE2A0000000, float %319
  %325 = select i1 %321, float 0xBFE6A09E60000000, float %320
  %326 = fcmp oge float %280, 0x400F6A7A40000000
  %327 = fadd float %280, 0xC00F6A7A40000000
  %328 = select i1 %326, float %327, float %323
  %329 = select i1 %326, float 0xBFE6A09E60000000, float %324
  %330 = select i1 %326, float 0xBFED906BC0000000, float %325
  %331 = fcmp oge float %280, 0x4011475CE0000000
  %332 = fadd float %280, 0xC011475CE0000000
  %333 = select i1 %331, float %332, float %328
  %334 = select i1 %331, float 0xBFED906BC0000000, float %329
  %335 = select i1 %331, float -1.000000e+00, float %330
  %336 = fcmp oge float %280, 0x4012D97C80000000
  %337 = fadd float %280, 0xC012D97C80000000
  %338 = select i1 %336, float %337, float %333
  %339 = select i1 %336, float -1.000000e+00, float %334
  %340 = select i1 %336, float 0xBFED906BC0000000, float %335
  %341 = fcmp oge float %280, 0x40146B9C40000000
  %342 = fadd float %280, 0xC0146B9C40000000
  %343 = select i1 %341, float %342, float %338
  %344 = select i1 %341, float 0xBFED906BC0000000, float %339
  %345 = select i1 %341, float 0xBFE6A09E60000000, float %340
  %346 = fcmp oge float %280, 0x4015FDBC00000000
  %347 = fadd float %280, 0xC015FDBC00000000
  %348 = select i1 %346, float %347, float %343
  %349 = select i1 %346, float 0xBFE6A09E60000000, float %344
  %350 = select i1 %346, float 0xBFD87DE2A0000000, float %345
  %351 = fcmp oge float %280, 0x40178FDBA0000000
  %352 = fadd float %280, 0xC0178FDBA0000000
  %353 = select i1 %351, float %352, float %348
  %354 = select i1 %351, float 0xBFD87DE2A0000000, float %349
  %355 = select i1 %351, float 0.000000e+00, float %350
  %356 = fdiv float %353, 0x3FD921FB60000000
  %357 = fsub float %355, %354
  %358 = call float @llvm.fmuladd.f32(float %356, float %357, float %354)
  %359 = call float @llvm.fmuladd.f32(float %54, float %358, float %104)
  %360 = fcmp olt float %359, 0.000000e+00
  %361 = fadd float %359, 0x401921FB60000000
  %362 = select i1 %360, float %361, float %359
  %363 = fcmp ult float %362, 0x401921FB60000000
  %364 = fadd float %362, 0xC01921FB60000000
  %365 = select i1 %363, float %362, float %364
  %366 = fcmp oge float %365, 0x3FD921FB60000000
  %367 = fadd float %365, 0xBFD921FB60000000
  %368 = select i1 %366, float %367, float %359
  %369 = select i1 %366, float 0x3FD87DE2A0000000, float 0.000000e+00
  %370 = select i1 %366, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %371 = fcmp oge float %365, 0x3FE921FB60000000
  %372 = fadd float %365, 0xBFE921FB60000000
  %373 = select i1 %371, float %372, float %368
  %374 = select i1 %371, float 0x3FE6A09E60000000, float %369
  %375 = select i1 %371, float 0x3FED906BC0000000, float %370
  %376 = fcmp oge float %365, 0x3FF2D97C80000000
  %377 = fadd float %365, 0xBFF2D97C80000000
  %378 = select i1 %376, float %377, float %373
  %379 = select i1 %376, float 0x3FED906BC0000000, float %374
  %380 = select i1 %376, float 1.000000e+00, float %375
  %381 = fcmp oge float %365, 0x3FF921FB60000000
  %382 = fadd float %365, 0xBFF921FB60000000
  %383 = select i1 %381, float %382, float %378
  %384 = select i1 %381, float 1.000000e+00, float %379
  %385 = select i1 %381, float 0x3FED906BC0000000, float %380
  %386 = fcmp oge float %365, 0x3FFF6A7A40000000
  %387 = fadd float %365, 0xBFFF6A7A40000000
  %388 = select i1 %386, float %387, float %383
  %389 = select i1 %386, float 0x3FED906BC0000000, float %384
  %390 = select i1 %386, float 0x3FE6A09E60000000, float %385
  %391 = fcmp oge float %365, 0x4002D97C80000000
  %392 = fadd float %365, 0xC002D97C80000000
  %393 = select i1 %391, float %392, float %388
  %394 = select i1 %391, float 0x3FE6A09E60000000, float %389
  %395 = select i1 %391, float 0x3FD87DE2A0000000, float %390
  %396 = fcmp oge float %365, 0x4005FDBC00000000
  %397 = fadd float %365, 0xC005FDBC00000000
  %398 = select i1 %396, float %397, float %393
  %399 = select i1 %396, float 0x3FD87DE2A0000000, float %394
  %400 = select i1 %396, float 0.000000e+00, float %395
  %401 = fcmp oge float %365, 0x400921FB60000000
  %402 = fadd float %365, 0xC00921FB60000000
  %403 = select i1 %401, float %402, float %398
  %404 = select i1 %401, float 0.000000e+00, float %399
  %405 = select i1 %401, float 0xBFD87DE2A0000000, float %400
  %406 = fcmp oge float %365, 0x400C463AC0000000
  %407 = fadd float %365, 0xC00C463AC0000000
  %408 = select i1 %406, float %407, float %403
  %409 = select i1 %406, float 0xBFD87DE2A0000000, float %404
  %410 = select i1 %406, float 0xBFE6A09E60000000, float %405
  %411 = fcmp oge float %365, 0x400F6A7A40000000
  %412 = fadd float %365, 0xC00F6A7A40000000
  %413 = select i1 %411, float %412, float %408
  %414 = select i1 %411, float 0xBFE6A09E60000000, float %409
  %415 = select i1 %411, float 0xBFED906BC0000000, float %410
  %416 = fcmp oge float %365, 0x4011475CE0000000
  %417 = fadd float %365, 0xC011475CE0000000
  %418 = select i1 %416, float %417, float %413
  %419 = select i1 %416, float 0xBFED906BC0000000, float %414
  %420 = select i1 %416, float -1.000000e+00, float %415
  %421 = fcmp oge float %365, 0x4012D97C80000000
  %422 = fadd float %365, 0xC012D97C80000000
  %423 = select i1 %421, float %422, float %418
  %424 = select i1 %421, float -1.000000e+00, float %419
  %425 = select i1 %421, float 0xBFED906BC0000000, float %420
  %426 = fcmp oge float %365, 0x40146B9C40000000
  %427 = fadd float %365, 0xC0146B9C40000000
  %428 = select i1 %426, float %427, float %423
  %429 = select i1 %426, float 0xBFED906BC0000000, float %424
  %430 = select i1 %426, float 0xBFE6A09E60000000, float %425
  %431 = fcmp oge float %365, 0x4015FDBC00000000
  %432 = fadd float %365, 0xC015FDBC00000000
  %433 = select i1 %431, float %432, float %428
  %434 = select i1 %431, float 0xBFE6A09E60000000, float %429
  %435 = select i1 %431, float 0xBFD87DE2A0000000, float %430
  %436 = fcmp oge float %365, 0x40178FDBA0000000
  %437 = fadd float %365, 0xC0178FDBA0000000
  %438 = select i1 %436, float %437, float %433
  %439 = select i1 %436, float 0xBFD87DE2A0000000, float %434
  %440 = select i1 %436, float 0.000000e+00, float %435
  %441 = fdiv float %438, 0x3FD921FB60000000
  %442 = fsub float %440, %439
  %443 = call float @llvm.fmuladd.f32(float %441, float %442, float %439)
  %444 = call float @llvm.fmuladd.f32(float %54, float %443, float %104)
  %445 = fcmp olt float %444, 0.000000e+00
  %446 = fadd float %444, 0x401921FB60000000
  %447 = select i1 %445, float %446, float %444
  %448 = fcmp ult float %447, 0x401921FB60000000
  %449 = fadd float %447, 0xC01921FB60000000
  %450 = select i1 %448, float %447, float %449
  %451 = fcmp oge float %450, 0x3FD921FB60000000
  %452 = fadd float %450, 0xBFD921FB60000000
  %453 = select i1 %451, float %452, float %444
  %454 = select i1 %451, float 0x3FD87DE2A0000000, float 0.000000e+00
  %455 = select i1 %451, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %456 = fcmp oge float %450, 0x3FE921FB60000000
  %457 = fadd float %450, 0xBFE921FB60000000
  %458 = select i1 %456, float %457, float %453
  %459 = select i1 %456, float 0x3FE6A09E60000000, float %454
  %460 = select i1 %456, float 0x3FED906BC0000000, float %455
  %461 = fcmp oge float %450, 0x3FF2D97C80000000
  %462 = fadd float %450, 0xBFF2D97C80000000
  %463 = select i1 %461, float %462, float %458
  %464 = select i1 %461, float 0x3FED906BC0000000, float %459
  %465 = select i1 %461, float 1.000000e+00, float %460
  %466 = fcmp oge float %450, 0x3FF921FB60000000
  %467 = fadd float %450, 0xBFF921FB60000000
  %468 = select i1 %466, float %467, float %463
  %469 = select i1 %466, float 1.000000e+00, float %464
  %470 = select i1 %466, float 0x3FED906BC0000000, float %465
  %471 = fcmp oge float %450, 0x3FFF6A7A40000000
  %472 = fadd float %450, 0xBFFF6A7A40000000
  %473 = select i1 %471, float %472, float %468
  %474 = select i1 %471, float 0x3FED906BC0000000, float %469
  %475 = select i1 %471, float 0x3FE6A09E60000000, float %470
  %476 = fcmp oge float %450, 0x4002D97C80000000
  %477 = fadd float %450, 0xC002D97C80000000
  %478 = select i1 %476, float %477, float %473
  %479 = select i1 %476, float 0x3FE6A09E60000000, float %474
  %480 = select i1 %476, float 0x3FD87DE2A0000000, float %475
  %481 = fcmp oge float %450, 0x4005FDBC00000000
  %482 = fadd float %450, 0xC005FDBC00000000
  %483 = select i1 %481, float %482, float %478
  %484 = select i1 %481, float 0x3FD87DE2A0000000, float %479
  %485 = select i1 %481, float 0.000000e+00, float %480
  %486 = fcmp oge float %450, 0x400921FB60000000
  %487 = fadd float %450, 0xC00921FB60000000
  %488 = select i1 %486, float %487, float %483
  %489 = select i1 %486, float 0.000000e+00, float %484
  %490 = select i1 %486, float 0xBFD87DE2A0000000, float %485
  %491 = fcmp oge float %450, 0x400C463AC0000000
  %492 = fadd float %450, 0xC00C463AC0000000
  %493 = select i1 %491, float %492, float %488
  %494 = select i1 %491, float 0xBFD87DE2A0000000, float %489
  %495 = select i1 %491, float 0xBFE6A09E60000000, float %490
  %496 = fcmp oge float %450, 0x400F6A7A40000000
  %497 = fadd float %450, 0xC00F6A7A40000000
  %498 = select i1 %496, float %497, float %493
  %499 = select i1 %496, float 0xBFE6A09E60000000, float %494
  %500 = select i1 %496, float 0xBFED906BC0000000, float %495
  %501 = fcmp oge float %450, 0x4011475CE0000000
  %502 = fadd float %450, 0xC011475CE0000000
  %503 = select i1 %501, float %502, float %498
  %504 = select i1 %501, float 0xBFED906BC0000000, float %499
  %505 = select i1 %501, float -1.000000e+00, float %500
  %506 = fcmp oge float %450, 0x4012D97C80000000
  %507 = fadd float %450, 0xC012D97C80000000
  %508 = select i1 %506, float %507, float %503
  %509 = select i1 %506, float -1.000000e+00, float %504
  %510 = select i1 %506, float 0xBFED906BC0000000, float %505
  %511 = fcmp oge float %450, 0x40146B9C40000000
  %512 = fadd float %450, 0xC0146B9C40000000
  %513 = select i1 %511, float %512, float %508
  %514 = select i1 %511, float 0xBFED906BC0000000, float %509
  %515 = select i1 %511, float 0xBFE6A09E60000000, float %510
  %516 = fcmp oge float %450, 0x4015FDBC00000000
  %517 = fadd float %450, 0xC015FDBC00000000
  %518 = select i1 %516, float %517, float %513
  %519 = select i1 %516, float 0xBFE6A09E60000000, float %514
  %520 = select i1 %516, float 0xBFD87DE2A0000000, float %515
  %521 = fcmp oge float %450, 0x40178FDBA0000000
  %522 = fadd float %450, 0xC0178FDBA0000000
  %523 = select i1 %521, float %522, float %518
  %524 = select i1 %521, float 0xBFD87DE2A0000000, float %519
  %525 = select i1 %521, float 0.000000e+00, float %520
  %526 = fdiv float %523, 0x3FD921FB60000000
  %527 = fsub float %525, %524
  %528 = call float @llvm.fmuladd.f32(float %526, float %527, float %524)
  %529 = call float @llvm.fmuladd.f32(float %54, float %528, float %104)
  %530 = fmul float %529, 5.000000e-01
  %531 = fcmp olt float %530, 0.000000e+00
  %532 = fadd float %530, 0x401921FB60000000
  %533 = select i1 %531, float %532, float %530
  %534 = fcmp ult float %533, 0x401921FB60000000
  %535 = fadd float %533, 0xC01921FB60000000
  %536 = select i1 %534, float %533, float %535
  %537 = fcmp oge float %536, 0x3FD921FB60000000
  %538 = fadd float %536, 0xBFD921FB60000000
  %539 = select i1 %537, float %538, float %530
  %540 = select i1 %537, float 0x3FD87DE2A0000000, float 0.000000e+00
  %541 = select i1 %537, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %542 = fcmp oge float %536, 0x3FE921FB60000000
  %543 = fadd float %536, 0xBFE921FB60000000
  %544 = select i1 %542, float %543, float %539
  %545 = select i1 %542, float 0x3FE6A09E60000000, float %540
  %546 = select i1 %542, float 0x3FED906BC0000000, float %541
  %547 = fcmp oge float %536, 0x3FF2D97C80000000
  %548 = fadd float %536, 0xBFF2D97C80000000
  %549 = select i1 %547, float %548, float %544
  %550 = select i1 %547, float 0x3FED906BC0000000, float %545
  %551 = select i1 %547, float 1.000000e+00, float %546
  %552 = fcmp oge float %536, 0x3FF921FB60000000
  %553 = fadd float %536, 0xBFF921FB60000000
  %554 = select i1 %552, float %553, float %549
  %555 = select i1 %552, float 1.000000e+00, float %550
  %556 = select i1 %552, float 0x3FED906BC0000000, float %551
  %557 = fcmp oge float %536, 0x3FFF6A7A40000000
  %558 = fadd float %536, 0xBFFF6A7A40000000
  %559 = select i1 %557, float %558, float %554
  %560 = select i1 %557, float 0x3FED906BC0000000, float %555
  %561 = select i1 %557, float 0x3FE6A09E60000000, float %556
  %562 = fcmp oge float %536, 0x4002D97C80000000
  %563 = fadd float %536, 0xC002D97C80000000
  %564 = select i1 %562, float %563, float %559
  %565 = select i1 %562, float 0x3FE6A09E60000000, float %560
  %566 = select i1 %562, float 0x3FD87DE2A0000000, float %561
  %567 = fcmp oge float %536, 0x4005FDBC00000000
  %568 = fadd float %536, 0xC005FDBC00000000
  %569 = select i1 %567, float %568, float %564
  %570 = select i1 %567, float 0x3FD87DE2A0000000, float %565
  %571 = select i1 %567, float 0.000000e+00, float %566
  %572 = fcmp oge float %536, 0x400921FB60000000
  %573 = fadd float %536, 0xC00921FB60000000
  %574 = select i1 %572, float %573, float %569
  %575 = select i1 %572, float 0.000000e+00, float %570
  %576 = select i1 %572, float 0xBFD87DE2A0000000, float %571
  %577 = fcmp oge float %536, 0x400C463AC0000000
  %578 = fadd float %536, 0xC00C463AC0000000
  %579 = select i1 %577, float %578, float %574
  %580 = select i1 %577, float 0xBFD87DE2A0000000, float %575
  %581 = select i1 %577, float 0xBFE6A09E60000000, float %576
  %582 = fcmp oge float %536, 0x400F6A7A40000000
  %583 = fadd float %536, 0xC00F6A7A40000000
  %584 = select i1 %582, float %583, float %579
  %585 = select i1 %582, float 0xBFE6A09E60000000, float %580
  %586 = select i1 %582, float 0xBFED906BC0000000, float %581
  %587 = fcmp oge float %536, 0x4011475CE0000000
  %588 = fadd float %536, 0xC011475CE0000000
  %589 = select i1 %587, float %588, float %584
  %590 = select i1 %587, float 0xBFED906BC0000000, float %585
  %591 = select i1 %587, float -1.000000e+00, float %586
  %592 = fcmp oge float %536, 0x4012D97C80000000
  %593 = fadd float %536, 0xC012D97C80000000
  %594 = select i1 %592, float %593, float %589
  %595 = select i1 %592, float -1.000000e+00, float %590
  %596 = select i1 %592, float 0xBFED906BC0000000, float %591
  %597 = fcmp oge float %536, 0x40146B9C40000000
  %598 = fadd float %536, 0xC0146B9C40000000
  %599 = select i1 %597, float %598, float %594
  %600 = select i1 %597, float 0xBFED906BC0000000, float %595
  %601 = select i1 %597, float 0xBFE6A09E60000000, float %596
  %602 = fcmp oge float %536, 0x4015FDBC00000000
  %603 = fadd float %536, 0xC015FDBC00000000
  %604 = select i1 %602, float %603, float %599
  %605 = select i1 %602, float 0xBFE6A09E60000000, float %600
  %606 = select i1 %602, float 0xBFD87DE2A0000000, float %601
  %607 = fcmp oge float %536, 0x40178FDBA0000000
  %608 = fadd float %536, 0xC0178FDBA0000000
  %609 = select i1 %607, float %608, float %604
  %610 = select i1 %607, float 0xBFD87DE2A0000000, float %605
  %611 = select i1 %607, float 0.000000e+00, float %606
  %612 = fdiv float %609, 0x3FD921FB60000000
  %613 = fsub float %611, %610
  %614 = call float @llvm.fmuladd.f32(float %612, float %613, float %610)
  %615 = fmul float %614, %88
  %616 = select i1 %537, float 0x3FED906BC0000000, float 1.000000e+00
  %617 = select i1 %537, float 0x3FE6A09E60000000, float 0x3FED906BC0000000
  %618 = select i1 %542, float 0x3FE6A09E60000000, float %616
  %619 = select i1 %542, float 0x3FD87DE2A0000000, float %617
  %620 = select i1 %547, float 0x3FD87DE2A0000000, float %618
  %621 = select i1 %547, float 0.000000e+00, float %619
  %622 = select i1 %552, float 0.000000e+00, float %620
  %623 = select i1 %552, float 0xBFD87DE2A0000000, float %621
  %624 = select i1 %557, float 0xBFD87DE2A0000000, float %622
  %625 = select i1 %557, float 0xBFE6A09E60000000, float %623
  %626 = select i1 %562, float 0xBFE6A09E60000000, float %624
  %627 = select i1 %562, float 0xBFED906BC0000000, float %625
  %628 = select i1 %567, float 0xBFED906BC0000000, float %626
  %629 = select i1 %567, float -1.000000e+00, float %627
  %630 = select i1 %572, float -1.000000e+00, float %628
  %631 = select i1 %572, float 0xBFED906BC0000000, float %629
  %632 = select i1 %577, float 0xBFED906BC0000000, float %630
  %633 = select i1 %577, float 0xBFE6A09E60000000, float %631
  %634 = select i1 %582, float 0xBFE6A09E60000000, float %632
  %635 = select i1 %582, float 0xBFD87DE2A0000000, float %633
  %636 = select i1 %587, float 0xBFD87DE2A0000000, float %634
  %637 = select i1 %587, float 0.000000e+00, float %635
  %638 = select i1 %592, float 0.000000e+00, float %636
  %639 = select i1 %592, float 0x3FD87DE2A0000000, float %637
  %640 = select i1 %597, float 0x3FD87DE2A0000000, float %638
  %641 = select i1 %597, float 0x3FE6A09E60000000, float %639
  %642 = select i1 %602, float 0x3FE6A09E60000000, float %640
  %643 = select i1 %602, float 0x3FED906BC0000000, float %641
  %644 = select i1 %607, float 0x3FED906BC0000000, float %642
  %645 = select i1 %607, float 1.000000e+00, float %643
  %646 = fsub float %645, %644
  %647 = call float @llvm.fmuladd.f32(float %612, float %646, float %644)
  %648 = fmul float %647, %89
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %1)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2)
  store float %615, ptr %1, align 8, !tbaa !9
  store float %648, ptr %2, align 8, !tbaa !9
  %649 = load i64, ptr %1, align 8
  %650 = load i64, ptr %2, align 8
  %651 = icmp eq i64 %650, 0
  %652 = icmp eq i64 %649, 0
  %653 = select i1 %651, i1 %652, i1 false
  %654 = trunc i64 %650 to i32
  %655 = bitcast i32 %654 to float
  %656 = trunc i64 %649 to i32
  %657 = bitcast i32 %656 to float
  br i1 %653, label %694, label %658

658:                                              ; preds = %100
  %659 = and i64 %649, 2147483647
  %660 = and i64 %650, 2147483647
  %661 = icmp samesign ugt i64 %660, %659
  br i1 %661, label %662, label %664

662:                                              ; preds = %658
  %663 = fdiv float %657, %655
  br label %666

664:                                              ; preds = %658
  %665 = fdiv float %655, %657
  br label %666

666:                                              ; preds = %664, %662
  %667 = phi float [ %663, %662 ], [ %665, %664 ]
  %668 = fneg float %667
  %669 = fmul float %667, %668
  %670 = fmul float %667, %669
  %671 = fdiv float %670, 3.000000e+00
  %672 = fmul float %669, %671
  %673 = fdiv float %672, 5.000000e+00
  %674 = fmul float %669, %673
  %675 = fdiv float %674, 7.000000e+00
  %676 = fmul float %669, %675
  %677 = fdiv float %676, 9.000000e+00
  %678 = fadd float %667, %671
  %679 = fadd float %678, %673
  %680 = fadd float %679, %675
  %681 = fadd float %680, %677
  br i1 %661, label %686, label %682

682:                                              ; preds = %666
  %683 = icmp sgt i64 %649, -1
  %684 = select i1 %683, float 0x3FF921FB40000000, float 0xBFF921FB40000000
  %685 = fsub float %684, %681
  br label %694

686:                                              ; preds = %666
  %687 = icmp slt i64 %650, 0
  br i1 %687, label %688, label %694

688:                                              ; preds = %686
  %689 = icmp sgt i64 %649, -1
  br i1 %689, label %690, label %692

690:                                              ; preds = %688
  %691 = fadd float %681, 0x400921FB60000000
  br label %694

692:                                              ; preds = %688
  %693 = fadd float %681, 0xC00921FB60000000
  br label %694

694:                                              ; preds = %100, %682, %686, %690, %692
  %695 = phi float [ 0.000000e+00, %100 ], [ %685, %682 ], [ %691, %690 ], [ %693, %692 ], [ %681, %686 ]
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %1)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2)
  %696 = fmul float %695, 2.000000e+00
  %697 = fcmp olt float %529, 0.000000e+00
  %698 = fadd float %529, 0x401921FB60000000
  %699 = select i1 %697, float %698, float %529
  %700 = fcmp ult float %699, 0x401921FB60000000
  %701 = fadd float %699, 0xC01921FB60000000
  %702 = select i1 %700, float %699, float %701
  %703 = fcmp oge float %702, 0x3FD921FB60000000
  %704 = fadd float %702, 0xBFD921FB60000000
  %705 = select i1 %703, float %704, float %529
  %706 = select i1 %703, float 0x3FED906BC0000000, float 1.000000e+00
  %707 = select i1 %703, float 0x3FE6A09E60000000, float 0x3FED906BC0000000
  %708 = fcmp oge float %702, 0x3FE921FB60000000
  %709 = fadd float %702, 0xBFE921FB60000000
  %710 = select i1 %708, float %709, float %705
  %711 = select i1 %708, float 0x3FE6A09E60000000, float %706
  %712 = select i1 %708, float 0x3FD87DE2A0000000, float %707
  %713 = fcmp oge float %702, 0x3FF2D97C80000000
  %714 = fadd float %702, 0xBFF2D97C80000000
  %715 = select i1 %713, float %714, float %710
  %716 = select i1 %713, float 0x3FD87DE2A0000000, float %711
  %717 = select i1 %713, float 0.000000e+00, float %712
  %718 = fcmp oge float %702, 0x3FF921FB60000000
  %719 = fadd float %702, 0xBFF921FB60000000
  %720 = select i1 %718, float %719, float %715
  %721 = select i1 %718, float 0.000000e+00, float %716
  %722 = select i1 %718, float 0xBFD87DE2A0000000, float %717
  %723 = fcmp oge float %702, 0x3FFF6A7A40000000
  %724 = fadd float %702, 0xBFFF6A7A40000000
  %725 = select i1 %723, float %724, float %720
  %726 = select i1 %723, float 0xBFD87DE2A0000000, float %721
  %727 = select i1 %723, float 0xBFE6A09E60000000, float %722
  %728 = fcmp oge float %702, 0x4002D97C80000000
  %729 = fadd float %702, 0xC002D97C80000000
  %730 = select i1 %728, float %729, float %725
  %731 = select i1 %728, float 0xBFE6A09E60000000, float %726
  %732 = select i1 %728, float 0xBFED906BC0000000, float %727
  %733 = fcmp oge float %702, 0x4005FDBC00000000
  %734 = fadd float %702, 0xC005FDBC00000000
  %735 = select i1 %733, float %734, float %730
  %736 = select i1 %733, float 0xBFED906BC0000000, float %731
  %737 = select i1 %733, float -1.000000e+00, float %732
  %738 = fcmp oge float %702, 0x400921FB60000000
  %739 = fadd float %702, 0xC00921FB60000000
  %740 = select i1 %738, float %739, float %735
  %741 = select i1 %738, float -1.000000e+00, float %736
  %742 = select i1 %738, float 0xBFED906BC0000000, float %737
  %743 = fcmp oge float %702, 0x400C463AC0000000
  %744 = fadd float %702, 0xC00C463AC0000000
  %745 = select i1 %743, float %744, float %740
  %746 = select i1 %743, float 0xBFED906BC0000000, float %741
  %747 = select i1 %743, float 0xBFE6A09E60000000, float %742
  %748 = fcmp oge float %702, 0x400F6A7A40000000
  %749 = fadd float %702, 0xC00F6A7A40000000
  %750 = select i1 %748, float %749, float %745
  %751 = select i1 %748, float 0xBFE6A09E60000000, float %746
  %752 = select i1 %748, float 0xBFD87DE2A0000000, float %747
  %753 = fcmp oge float %702, 0x4011475CE0000000
  %754 = fadd float %702, 0xC011475CE0000000
  %755 = select i1 %753, float %754, float %750
  %756 = select i1 %753, float 0xBFD87DE2A0000000, float %751
  %757 = select i1 %753, float 0.000000e+00, float %752
  %758 = fcmp oge float %702, 0x4012D97C80000000
  %759 = fadd float %702, 0xC012D97C80000000
  %760 = select i1 %758, float %759, float %755
  %761 = select i1 %758, float 0.000000e+00, float %756
  %762 = select i1 %758, float 0x3FD87DE2A0000000, float %757
  %763 = fcmp oge float %702, 0x40146B9C40000000
  %764 = fadd float %702, 0xC0146B9C40000000
  %765 = select i1 %763, float %764, float %760
  %766 = select i1 %763, float 0x3FD87DE2A0000000, float %761
  %767 = select i1 %763, float 0x3FE6A09E60000000, float %762
  %768 = fcmp oge float %702, 0x4015FDBC00000000
  %769 = fadd float %702, 0xC015FDBC00000000
  %770 = select i1 %768, float %769, float %765
  %771 = select i1 %768, float 0x3FE6A09E60000000, float %766
  %772 = select i1 %768, float 0x3FED906BC0000000, float %767
  %773 = fcmp oge float %702, 0x40178FDBA0000000
  %774 = fadd float %702, 0xC0178FDBA0000000
  %775 = select i1 %773, float %774, float %770
  %776 = select i1 %773, float 0x3FED906BC0000000, float %771
  %777 = select i1 %773, float 1.000000e+00, float %772
  %778 = fdiv float %775, 0x3FD921FB60000000
  %779 = fsub float %777, %776
  %780 = call float @llvm.fmuladd.f32(float %778, float %779, float %776)
  %781 = call float @llvm.fmuladd.f32(float %61, float %780, float 1.000000e+00)
  %782 = fmul float %52, %781
  %783 = fcmp olt float %696, 0.000000e+00
  %784 = fadd float %696, 0x401921FB60000000
  %785 = select i1 %783, float %784, float %696
  %786 = fcmp ult float %785, 0x401921FB60000000
  %787 = fadd float %785, 0xC01921FB60000000
  %788 = select i1 %786, float %785, float %787
  %789 = fcmp oge float %788, 0x3FD921FB60000000
  %790 = fadd float %788, 0xBFD921FB60000000
  %791 = select i1 %789, float %790, float %696
  %792 = select i1 %789, float 0x3FED906BC0000000, float 1.000000e+00
  %793 = select i1 %789, float 0x3FE6A09E60000000, float 0x3FED906BC0000000
  %794 = fcmp oge float %788, 0x3FE921FB60000000
  %795 = fadd float %788, 0xBFE921FB60000000
  %796 = select i1 %794, float %795, float %791
  %797 = select i1 %794, float 0x3FE6A09E60000000, float %792
  %798 = select i1 %794, float 0x3FD87DE2A0000000, float %793
  %799 = fcmp oge float %788, 0x3FF2D97C80000000
  %800 = fadd float %788, 0xBFF2D97C80000000
  %801 = select i1 %799, float %800, float %796
  %802 = select i1 %799, float 0x3FD87DE2A0000000, float %797
  %803 = select i1 %799, float 0.000000e+00, float %798
  %804 = fcmp oge float %788, 0x3FF921FB60000000
  %805 = fadd float %788, 0xBFF921FB60000000
  %806 = select i1 %804, float %805, float %801
  %807 = select i1 %804, float 0.000000e+00, float %802
  %808 = select i1 %804, float 0xBFD87DE2A0000000, float %803
  %809 = fcmp oge float %788, 0x3FFF6A7A40000000
  %810 = fadd float %788, 0xBFFF6A7A40000000
  %811 = select i1 %809, float %810, float %806
  %812 = select i1 %809, float 0xBFD87DE2A0000000, float %807
  %813 = select i1 %809, float 0xBFE6A09E60000000, float %808
  %814 = fcmp oge float %788, 0x4002D97C80000000
  %815 = fadd float %788, 0xC002D97C80000000
  %816 = select i1 %814, float %815, float %811
  %817 = select i1 %814, float 0xBFE6A09E60000000, float %812
  %818 = select i1 %814, float 0xBFED906BC0000000, float %813
  %819 = fcmp oge float %788, 0x4005FDBC00000000
  %820 = fadd float %788, 0xC005FDBC00000000
  %821 = select i1 %819, float %820, float %816
  %822 = select i1 %819, float 0xBFED906BC0000000, float %817
  %823 = select i1 %819, float -1.000000e+00, float %818
  %824 = fcmp oge float %788, 0x400921FB60000000
  %825 = fadd float %788, 0xC00921FB60000000
  %826 = select i1 %824, float %825, float %821
  %827 = select i1 %824, float -1.000000e+00, float %822
  %828 = select i1 %824, float 0xBFED906BC0000000, float %823
  %829 = fcmp oge float %788, 0x400C463AC0000000
  %830 = fadd float %788, 0xC00C463AC0000000
  %831 = select i1 %829, float %830, float %826
  %832 = select i1 %829, float 0xBFED906BC0000000, float %827
  %833 = select i1 %829, float 0xBFE6A09E60000000, float %828
  %834 = fcmp oge float %788, 0x400F6A7A40000000
  %835 = fadd float %788, 0xC00F6A7A40000000
  %836 = select i1 %834, float %835, float %831
  %837 = select i1 %834, float 0xBFE6A09E60000000, float %832
  %838 = select i1 %834, float 0xBFD87DE2A0000000, float %833
  %839 = fcmp oge float %788, 0x4011475CE0000000
  %840 = fadd float %788, 0xC011475CE0000000
  %841 = select i1 %839, float %840, float %836
  %842 = select i1 %839, float 0xBFD87DE2A0000000, float %837
  %843 = select i1 %839, float 0.000000e+00, float %838
  %844 = fcmp oge float %788, 0x4012D97C80000000
  %845 = fadd float %788, 0xC012D97C80000000
  %846 = select i1 %844, float %845, float %841
  %847 = select i1 %844, float 0.000000e+00, float %842
  %848 = select i1 %844, float 0x3FD87DE2A0000000, float %843
  %849 = fcmp oge float %788, 0x40146B9C40000000
  %850 = fadd float %788, 0xC0146B9C40000000
  %851 = select i1 %849, float %850, float %846
  %852 = select i1 %849, float 0x3FD87DE2A0000000, float %847
  %853 = select i1 %849, float 0x3FE6A09E60000000, float %848
  %854 = fcmp oge float %788, 0x4015FDBC00000000
  %855 = fadd float %788, 0xC015FDBC00000000
  %856 = select i1 %854, float %855, float %851
  %857 = select i1 %854, float 0x3FE6A09E60000000, float %852
  %858 = select i1 %854, float 0x3FED906BC0000000, float %853
  %859 = fcmp oge float %788, 0x40178FDBA0000000
  %860 = fadd float %788, 0xC0178FDBA0000000
  %861 = select i1 %859, float %860, float %856
  %862 = select i1 %859, float 0x3FED906BC0000000, float %857
  %863 = select i1 %859, float 1.000000e+00, float %858
  %864 = fdiv float %861, 0x3FD921FB60000000
  %865 = fsub float %863, %862
  %866 = call float @llvm.fmuladd.f32(float %864, float %865, float %862)
  %867 = select i1 %789, float 0x3FD87DE2A0000000, float 0.000000e+00
  %868 = select i1 %789, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %869 = select i1 %794, float 0x3FE6A09E60000000, float %867
  %870 = select i1 %794, float 0x3FED906BC0000000, float %868
  %871 = select i1 %799, float 0x3FED906BC0000000, float %869
  %872 = select i1 %799, float 1.000000e+00, float %870
  %873 = select i1 %804, float 1.000000e+00, float %871
  %874 = select i1 %804, float 0x3FED906BC0000000, float %872
  %875 = select i1 %809, float 0x3FED906BC0000000, float %873
  %876 = select i1 %809, float 0x3FE6A09E60000000, float %874
  %877 = select i1 %814, float 0x3FE6A09E60000000, float %875
  %878 = select i1 %814, float 0x3FD87DE2A0000000, float %876
  %879 = select i1 %819, float 0x3FD87DE2A0000000, float %877
  %880 = select i1 %819, float 0.000000e+00, float %878
  %881 = select i1 %824, float 0.000000e+00, float %879
  %882 = select i1 %824, float 0xBFD87DE2A0000000, float %880
  %883 = select i1 %829, float 0xBFD87DE2A0000000, float %881
  %884 = select i1 %829, float 0xBFE6A09E60000000, float %882
  %885 = select i1 %834, float 0xBFE6A09E60000000, float %883
  %886 = select i1 %834, float 0xBFED906BC0000000, float %884
  %887 = select i1 %839, float 0xBFED906BC0000000, float %885
  %888 = select i1 %839, float -1.000000e+00, float %886
  %889 = select i1 %844, float -1.000000e+00, float %887
  %890 = select i1 %844, float 0xBFED906BC0000000, float %888
  %891 = select i1 %849, float 0xBFED906BC0000000, float %889
  %892 = select i1 %849, float 0xBFE6A09E60000000, float %890
  %893 = select i1 %854, float 0xBFE6A09E60000000, float %891
  %894 = select i1 %854, float 0xBFD87DE2A0000000, float %892
  %895 = select i1 %859, float 0xBFD87DE2A0000000, float %893
  %896 = select i1 %859, float 0.000000e+00, float %894
  %897 = fsub float %896, %895
  %898 = call float @llvm.fmuladd.f32(float %864, float %897, float %895)
  store i64 0, ptr %8, align 8, !tbaa !5
  %899 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %11, ptr noundef nonnull %8) #3
  %900 = load float, ptr %899, align 4, !tbaa !9
  %901 = fneg float %900
  %902 = call float @llvm.fmuladd.f32(float %782, float %866, float %901)
  store volatile float %902, ptr %3, align 4, !tbaa !9
  store i64 1, ptr %8, align 8, !tbaa !5
  %903 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %11, ptr noundef nonnull %8) #3
  %904 = load float, ptr %903, align 4, !tbaa !9
  %905 = fneg float %904
  %906 = call float @llvm.fmuladd.f32(float %782, float %898, float %905)
  store volatile float %906, ptr %82, align 4, !tbaa !9
  store i64 2, ptr %8, align 8, !tbaa !5
  %907 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %11, ptr noundef nonnull %8) #3
  %908 = load float, ptr %907, align 4, !tbaa !9
  %909 = fsub float 0.000000e+00, %908
  store volatile float %909, ptr %83, align 4, !tbaa !9
  %910 = fmul float %906, %906
  %911 = call float @llvm.fmuladd.f32(float %902, float %902, float %910)
  %912 = call float @llvm.fmuladd.f32(float %909, float %909, float %911)
  %913 = fcmp ugt float %912, 0.000000e+00
  br i1 %913, label %914, label %925

914:                                              ; preds = %694
  %915 = fmul float %912, 5.000000e-01
  %916 = bitcast float %912 to i32
  %917 = ashr i32 %916, 1
  %918 = sub nsw i32 1597463007, %917
  %919 = bitcast i32 %918 to float
  %920 = fneg float %919
  %921 = fmul float %915, %920
  %922 = call float @llvm.fmuladd.f32(float %921, float %919, float 1.500000e+00)
  %923 = fmul float %922, %919
  %924 = fdiv float 1.000000e+00, %923
  br label %925

925:                                              ; preds = %694, %914
  %926 = phi float [ %924, %914 ], [ 0.000000e+00, %694 ]
  %927 = load volatile float, ptr %3, align 4, !tbaa !9
  %928 = fdiv float %927, %926
  store volatile float %928, ptr %3, align 4, !tbaa !9
  %929 = load volatile float, ptr %82, align 4, !tbaa !9
  %930 = fdiv float %929, %926
  store volatile float %930, ptr %82, align 4, !tbaa !9
  %931 = load volatile float, ptr %83, align 4, !tbaa !9
  %932 = fdiv float %931, %926
  store volatile float %932, ptr %83, align 4, !tbaa !9
  %933 = load volatile float, ptr %4, align 4, !tbaa !9
  %934 = load volatile float, ptr %3, align 4, !tbaa !9
  %935 = load volatile float, ptr %24, align 4, !tbaa !9
  %936 = load volatile float, ptr %82, align 4, !tbaa !9
  %937 = fmul float %935, %936
  %938 = call float @llvm.fmuladd.f32(float %933, float %934, float %937)
  %939 = load volatile float, ptr %29, align 4, !tbaa !9
  %940 = load volatile float, ptr %83, align 4, !tbaa !9
  %941 = call float @llvm.fmuladd.f32(float %939, float %940, float %938)
  %942 = fadd float %941, 1.000000e+00
  %943 = fmul float %48, %942
  %944 = fmul float %85, %941
  %945 = load volatile float, ptr %3, align 4, !tbaa !9
  %946 = load volatile float, ptr %4, align 4, !tbaa !9
  %947 = call float @llvm.fmuladd.f32(float %944, float %946, float %945)
  %948 = load volatile float, ptr %4, align 4, !tbaa !9
  %949 = fadd float %947, %948
  %950 = fdiv float %949, %943
  store volatile float %950, ptr %5, align 4, !tbaa !9
  %951 = load volatile float, ptr %82, align 4, !tbaa !9
  %952 = load volatile float, ptr %24, align 4, !tbaa !9
  %953 = call float @llvm.fmuladd.f32(float %944, float %952, float %951)
  %954 = load volatile float, ptr %24, align 4, !tbaa !9
  %955 = fadd float %953, %954
  %956 = fdiv float %955, %943
  store volatile float %956, ptr %86, align 4, !tbaa !9
  %957 = load volatile float, ptr %83, align 4, !tbaa !9
  %958 = load volatile float, ptr %29, align 4, !tbaa !9
  %959 = call float @llvm.fmuladd.f32(float %944, float %958, float %957)
  %960 = load volatile float, ptr %29, align 4, !tbaa !9
  %961 = fadd float %959, %960
  %962 = fdiv float %961, %943
  store volatile float %962, ptr %87, align 4, !tbaa !9
  %963 = load volatile float, ptr %5, align 4, !tbaa !9
  %964 = load volatile float, ptr %5, align 4, !tbaa !9
  %965 = load volatile float, ptr %86, align 4, !tbaa !9
  %966 = load volatile float, ptr %86, align 4, !tbaa !9
  %967 = fmul float %965, %966
  %968 = call float @llvm.fmuladd.f32(float %963, float %964, float %967)
  %969 = load volatile float, ptr %87, align 4, !tbaa !9
  %970 = load volatile float, ptr %87, align 4, !tbaa !9
  %971 = call float @llvm.fmuladd.f32(float %969, float %970, float %968)
  %972 = fcmp ugt float %971, 0.000000e+00
  br i1 %972, label %973, label %984

973:                                              ; preds = %925
  %974 = fmul float %971, 5.000000e-01
  %975 = bitcast float %971 to i32
  %976 = ashr i32 %975, 1
  %977 = sub nsw i32 1597463007, %976
  %978 = bitcast i32 %977 to float
  %979 = fneg float %978
  %980 = fmul float %974, %979
  %981 = call float @llvm.fmuladd.f32(float %980, float %978, float 1.500000e+00)
  %982 = fmul float %981, %978
  %983 = fdiv float 1.000000e+00, %982
  br label %984

984:                                              ; preds = %925, %973
  %985 = phi float [ %983, %973 ], [ 0.000000e+00, %925 ]
  %986 = load volatile float, ptr %5, align 4, !tbaa !9
  %987 = fdiv float %986, %985
  store volatile float %987, ptr %5, align 4, !tbaa !9
  %988 = load volatile float, ptr %86, align 4, !tbaa !9
  %989 = fdiv float %988, %985
  store volatile float %989, ptr %86, align 4, !tbaa !9
  %990 = load volatile float, ptr %87, align 4, !tbaa !9
  %991 = fdiv float %990, %985
  store volatile float %991, ptr %87, align 4, !tbaa !9
  %992 = fdiv float %926, 0x41B1DE7840000000
  %993 = add nuw nsw i64 %102, 1
  %994 = icmp eq i64 %993, 5
  br i1 %994, label %99, label %100, !llvm.loop !15

995:                                              ; preds = %996
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %9) #3
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %8) #3
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %5) #3
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %4) #3
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %3) #3
  ret i32 0

996:                                              ; preds = %99, %996
  %997 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %11, ptr noundef nonnull %9) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %10) #3
  %998 = load float, ptr %997, align 4, !tbaa !9
  %999 = load i64, ptr %9, align 8, !tbaa !5
  %1000 = getelementptr inbounds [3 x float], ptr %5, i64 0, i64 %999
  %1001 = load volatile float, ptr %1000, align 4, !tbaa !9
  %1002 = call float @llvm.fmuladd.f32(float %926, float %1001, float %998)
  store float %1002, ptr %10, align 4, !tbaa !9
  %1003 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %12, ptr noundef nonnull %9, ptr noundef nonnull %10, i64 noundef 0) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %10) #3
  %1004 = load i64, ptr %9, align 8, !tbaa !5
  %1005 = add nsw i64 %1004, 1
  store i64 %1005, ptr %9, align 8, !tbaa !5
  %1006 = icmp slt i64 %1004, 2
  br i1 %1006, label %996, label %995, !llvm.loop !16
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
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 755f040f24df9a74f4e5f7f7bdd64e3acd4e61b9)"}
!3 = !{i64 2147511707}
!4 = !{i64 2147512219}
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
