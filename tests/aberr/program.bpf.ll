; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

%struct.bpf_iter_num = type { i64, i64, i64, i64 }

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca float, align 8
  %2 = alloca float, align 8
  %3 = alloca [3 x float], align 4
  %4 = alloca [3 x float], align 4
  %5 = alloca [3 x float], align 4
  %6 = alloca [3 x float], align 4
  %7 = alloca float, align 4
  %8 = alloca float, align 4
  %9 = alloca float, align 4
  %10 = alloca float, align 4
  %11 = alloca float, align 4
  %12 = alloca float, align 4
  %13 = alloca float, align 4
  %14 = alloca float, align 4
  %15 = alloca float, align 4
  %16 = alloca float, align 4
  %17 = alloca float, align 4
  %18 = alloca float, align 4
  %19 = alloca float, align 4
  %20 = alloca float, align 4
  %21 = alloca float, align 4
  %22 = alloca float, align 4
  %23 = alloca float, align 4
  %24 = alloca %struct.bpf_iter_num, align 8
  %25 = alloca i64, align 8
  %26 = alloca float, align 4
  %27 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 8, i32 0, i32 0, i32 0) #3, !srcloc !3
  %28 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 9, i32 0, i32 0, i32 0) #3, !srcloc !4
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %3) #3
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %4) #3
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %5) #3
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %6) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %7)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %8)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %9)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %10)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %11)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %12)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %13)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %14)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %15)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %16)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %17)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %18)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %19)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %20)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %21)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %22)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %23)
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %24) #3
  store volatile float 0.000000e+00, ptr %11, align 4, !tbaa !5
  %29 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %24, i32 noundef 0, i32 noundef 3) #3
  %30 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %24) #3
  %31 = icmp eq ptr %30, null
  br i1 %31, label %42, label %32

32:                                               ; preds = %0, %32
  %33 = phi ptr [ %40, %32 ], [ %30, %0 ]
  %34 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %27, ptr noundef nonnull %33) #3
  %35 = load float, ptr %34, align 4, !tbaa !5
  %36 = load i64, ptr %33, align 8, !tbaa !9
  %37 = getelementptr inbounds [3 x float], ptr %3, i64 0, i64 %36
  store volatile float %35, ptr %37, align 4, !tbaa !5
  %38 = load volatile float, ptr %37, align 4, !tbaa !5
  %39 = getelementptr inbounds [3 x float], ptr %4, i64 0, i64 %36
  store volatile float %38, ptr %39, align 4, !tbaa !5
  %40 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %24) #3
  %41 = icmp eq ptr %40, null
  br i1 %41, label %42, label %32, !llvm.loop !11

42:                                               ; preds = %32, %0
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %24) #3
  %43 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %24, i32 noundef 0, i32 noundef 3) #3
  %44 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %24) #3
  %45 = icmp eq ptr %44, null
  br i1 %45, label %57, label %46

46:                                               ; preds = %42, %46
  %47 = phi ptr [ %55, %46 ], [ %44, %42 ]
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %25) #3
  %48 = load i64, ptr %47, align 8, !tbaa !9
  %49 = add nsw i64 %48, 3
  store i64 %49, ptr %25, align 8, !tbaa !14
  %50 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %27, ptr noundef nonnull %25) #3
  %51 = load float, ptr %50, align 4, !tbaa !5
  %52 = fdiv float %51, 0x41B1DE7840000000
  %53 = load i64, ptr %47, align 8, !tbaa !9
  %54 = getelementptr inbounds [3 x float], ptr %5, i64 0, i64 %53
  store volatile float %52, ptr %54, align 4, !tbaa !5
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %25) #3
  %55 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %24) #3
  %56 = icmp eq ptr %55, null
  br i1 %56, label %57, label %46, !llvm.loop !16

57:                                               ; preds = %46, %42
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %24) #3
  %58 = load volatile float, ptr %5, align 4, !tbaa !5
  %59 = load volatile float, ptr %5, align 4, !tbaa !5
  %60 = getelementptr inbounds nuw i8, ptr %5, i64 4
  %61 = load volatile float, ptr %60, align 4, !tbaa !5
  %62 = load volatile float, ptr %60, align 4, !tbaa !5
  %63 = fmul float %61, %62
  %64 = call float @llvm.fmuladd.f32(float %58, float %59, float %63)
  %65 = getelementptr inbounds nuw i8, ptr %5, i64 8
  %66 = load volatile float, ptr %65, align 4, !tbaa !5
  %67 = load volatile float, ptr %65, align 4, !tbaa !5
  %68 = call float @llvm.fmuladd.f32(float %66, float %67, float %64)
  store volatile float %68, ptr %13, align 4, !tbaa !5
  %69 = load volatile float, ptr %13, align 4, !tbaa !5
  %70 = fsub float 1.000000e+00, %69
  %71 = fcmp ugt float %70, 0.000000e+00
  br i1 %71, label %72, label %83

72:                                               ; preds = %57
  %73 = fmul float %70, 5.000000e-01
  %74 = bitcast float %70 to i32
  %75 = ashr i32 %74, 1
  %76 = sub nsw i32 1597463007, %75
  %77 = bitcast i32 %76 to float
  %78 = fneg float %77
  %79 = fmul float %73, %78
  %80 = call float @llvm.fmuladd.f32(float %79, float %77, float 1.500000e+00)
  %81 = fmul float %80, %77
  %82 = fdiv float 1.000000e+00, %81
  br label %83

83:                                               ; preds = %57, %72
  %84 = phi float [ %82, %72 ], [ 0.000000e+00, %57 ]
  %85 = fdiv float 1.000000e+00, %84
  store volatile float %85, ptr %14, align 4, !tbaa !5
  store volatile float 0x40101EB860000000, ptr %7, align 4, !tbaa !5
  store volatile float 0x404F3C2900000000, ptr %8, align 4, !tbaa !5
  store volatile float 0x3FA47AE140000000, ptr %9, align 4, !tbaa !5
  store volatile float 1.000000e+02, ptr %10, align 4, !tbaa !5
  %86 = load volatile float, ptr %7, align 4, !tbaa !5
  %87 = load volatile float, ptr %11, align 4, !tbaa !5
  %88 = fsub float %86, %87
  store volatile float %88, ptr %15, align 4, !tbaa !5
  %89 = load volatile float, ptr %10, align 4, !tbaa !5
  %90 = load volatile float, ptr %15, align 4, !tbaa !5
  %91 = fmul float %89, %90
  store volatile float %91, ptr %16, align 4, !tbaa !5
  %92 = load volatile float, ptr %16, align 4, !tbaa !5
  store volatile float %92, ptr %17, align 4, !tbaa !5
  %93 = load volatile float, ptr %16, align 4, !tbaa !5
  %94 = load volatile float, ptr %9, align 4, !tbaa !5
  %95 = load volatile float, ptr %17, align 4, !tbaa !5
  %96 = fcmp olt float %95, 0.000000e+00
  %97 = fadd float %95, 0x401921FB60000000
  %98 = select i1 %96, float %97, float %95
  %99 = fcmp ult float %98, 0x401921FB60000000
  %100 = fadd float %98, 0xC01921FB60000000
  %101 = select i1 %99, float %98, float %100
  %102 = fcmp oge float %101, 0x3FD921FB60000000
  %103 = fadd float %101, 0xBFD921FB60000000
  %104 = select i1 %102, float %103, float %95
  %105 = select i1 %102, float 0x3FD87DE2A0000000, float 0.000000e+00
  %106 = select i1 %102, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %107 = fcmp oge float %101, 0x3FE921FB60000000
  %108 = fadd float %101, 0xBFE921FB60000000
  %109 = select i1 %107, float %108, float %104
  %110 = select i1 %107, float 0x3FE6A09E60000000, float %105
  %111 = select i1 %107, float 0x3FED906BC0000000, float %106
  %112 = fcmp oge float %101, 0x3FF2D97C80000000
  %113 = fadd float %101, 0xBFF2D97C80000000
  %114 = select i1 %112, float %113, float %109
  %115 = select i1 %112, float 0x3FED906BC0000000, float %110
  %116 = select i1 %112, float 1.000000e+00, float %111
  %117 = fcmp oge float %101, 0x3FF921FB60000000
  %118 = fadd float %101, 0xBFF921FB60000000
  %119 = select i1 %117, float %118, float %114
  %120 = select i1 %117, float 1.000000e+00, float %115
  %121 = select i1 %117, float 0x3FED906BC0000000, float %116
  %122 = fcmp oge float %101, 0x3FFF6A7A40000000
  %123 = fadd float %101, 0xBFFF6A7A40000000
  %124 = select i1 %122, float %123, float %119
  %125 = select i1 %122, float 0x3FED906BC0000000, float %120
  %126 = select i1 %122, float 0x3FE6A09E60000000, float %121
  %127 = fcmp oge float %101, 0x4002D97C80000000
  %128 = fadd float %101, 0xC002D97C80000000
  %129 = select i1 %127, float %128, float %124
  %130 = select i1 %127, float 0x3FE6A09E60000000, float %125
  %131 = select i1 %127, float 0x3FD87DE2A0000000, float %126
  %132 = fcmp oge float %101, 0x4005FDBC00000000
  %133 = fadd float %101, 0xC005FDBC00000000
  %134 = select i1 %132, float %133, float %129
  %135 = select i1 %132, float 0x3FD87DE2A0000000, float %130
  %136 = select i1 %132, float 0.000000e+00, float %131
  %137 = fcmp oge float %101, 0x400921FB60000000
  %138 = fadd float %101, 0xC00921FB60000000
  %139 = select i1 %137, float %138, float %134
  %140 = select i1 %137, float 0.000000e+00, float %135
  %141 = select i1 %137, float 0xBFD87DE2A0000000, float %136
  %142 = fcmp oge float %101, 0x400C463AC0000000
  %143 = fadd float %101, 0xC00C463AC0000000
  %144 = select i1 %142, float %143, float %139
  %145 = select i1 %142, float 0xBFD87DE2A0000000, float %140
  %146 = select i1 %142, float 0xBFE6A09E60000000, float %141
  %147 = fcmp oge float %101, 0x400F6A7A40000000
  %148 = fadd float %101, 0xC00F6A7A40000000
  %149 = select i1 %147, float %148, float %144
  %150 = select i1 %147, float 0xBFE6A09E60000000, float %145
  %151 = select i1 %147, float 0xBFED906BC0000000, float %146
  %152 = fcmp oge float %101, 0x4011475CE0000000
  %153 = fadd float %101, 0xC011475CE0000000
  %154 = select i1 %152, float %153, float %149
  %155 = select i1 %152, float 0xBFED906BC0000000, float %150
  %156 = select i1 %152, float -1.000000e+00, float %151
  %157 = fcmp oge float %101, 0x4012D97C80000000
  %158 = fadd float %101, 0xC012D97C80000000
  %159 = select i1 %157, float %158, float %154
  %160 = select i1 %157, float -1.000000e+00, float %155
  %161 = select i1 %157, float 0xBFED906BC0000000, float %156
  %162 = fcmp oge float %101, 0x40146B9C40000000
  %163 = fadd float %101, 0xC0146B9C40000000
  %164 = select i1 %162, float %163, float %159
  %165 = select i1 %162, float 0xBFED906BC0000000, float %160
  %166 = select i1 %162, float 0xBFE6A09E60000000, float %161
  %167 = fcmp oge float %101, 0x4015FDBC00000000
  %168 = fadd float %101, 0xC015FDBC00000000
  %169 = select i1 %167, float %168, float %164
  %170 = select i1 %167, float 0xBFE6A09E60000000, float %165
  %171 = select i1 %167, float 0xBFD87DE2A0000000, float %166
  %172 = fcmp oge float %101, 0x40178FDBA0000000
  %173 = fadd float %101, 0xC0178FDBA0000000
  %174 = select i1 %172, float %173, float %169
  %175 = select i1 %172, float 0xBFD87DE2A0000000, float %170
  %176 = select i1 %172, float 0.000000e+00, float %171
  %177 = fdiv float %174, 0x3FD921FB60000000
  %178 = fsub float %176, %175
  %179 = call float @llvm.fmuladd.f32(float %177, float %178, float %175)
  %180 = call float @llvm.fmuladd.f32(float %94, float %179, float %93)
  store volatile float %180, ptr %17, align 4, !tbaa !5
  %181 = load volatile float, ptr %16, align 4, !tbaa !5
  %182 = load volatile float, ptr %9, align 4, !tbaa !5
  %183 = load volatile float, ptr %17, align 4, !tbaa !5
  %184 = fcmp olt float %183, 0.000000e+00
  %185 = fadd float %183, 0x401921FB60000000
  %186 = select i1 %184, float %185, float %183
  %187 = fcmp ult float %186, 0x401921FB60000000
  %188 = fadd float %186, 0xC01921FB60000000
  %189 = select i1 %187, float %186, float %188
  %190 = fcmp oge float %189, 0x3FD921FB60000000
  %191 = fadd float %189, 0xBFD921FB60000000
  %192 = select i1 %190, float %191, float %183
  %193 = select i1 %190, float 0x3FD87DE2A0000000, float 0.000000e+00
  %194 = select i1 %190, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %195 = fcmp oge float %189, 0x3FE921FB60000000
  %196 = fadd float %189, 0xBFE921FB60000000
  %197 = select i1 %195, float %196, float %192
  %198 = select i1 %195, float 0x3FE6A09E60000000, float %193
  %199 = select i1 %195, float 0x3FED906BC0000000, float %194
  %200 = fcmp oge float %189, 0x3FF2D97C80000000
  %201 = fadd float %189, 0xBFF2D97C80000000
  %202 = select i1 %200, float %201, float %197
  %203 = select i1 %200, float 0x3FED906BC0000000, float %198
  %204 = select i1 %200, float 1.000000e+00, float %199
  %205 = fcmp oge float %189, 0x3FF921FB60000000
  %206 = fadd float %189, 0xBFF921FB60000000
  %207 = select i1 %205, float %206, float %202
  %208 = select i1 %205, float 1.000000e+00, float %203
  %209 = select i1 %205, float 0x3FED906BC0000000, float %204
  %210 = fcmp oge float %189, 0x3FFF6A7A40000000
  %211 = fadd float %189, 0xBFFF6A7A40000000
  %212 = select i1 %210, float %211, float %207
  %213 = select i1 %210, float 0x3FED906BC0000000, float %208
  %214 = select i1 %210, float 0x3FE6A09E60000000, float %209
  %215 = fcmp oge float %189, 0x4002D97C80000000
  %216 = fadd float %189, 0xC002D97C80000000
  %217 = select i1 %215, float %216, float %212
  %218 = select i1 %215, float 0x3FE6A09E60000000, float %213
  %219 = select i1 %215, float 0x3FD87DE2A0000000, float %214
  %220 = fcmp oge float %189, 0x4005FDBC00000000
  %221 = fadd float %189, 0xC005FDBC00000000
  %222 = select i1 %220, float %221, float %217
  %223 = select i1 %220, float 0x3FD87DE2A0000000, float %218
  %224 = select i1 %220, float 0.000000e+00, float %219
  %225 = fcmp oge float %189, 0x400921FB60000000
  %226 = fadd float %189, 0xC00921FB60000000
  %227 = select i1 %225, float %226, float %222
  %228 = select i1 %225, float 0.000000e+00, float %223
  %229 = select i1 %225, float 0xBFD87DE2A0000000, float %224
  %230 = fcmp oge float %189, 0x400C463AC0000000
  %231 = fadd float %189, 0xC00C463AC0000000
  %232 = select i1 %230, float %231, float %227
  %233 = select i1 %230, float 0xBFD87DE2A0000000, float %228
  %234 = select i1 %230, float 0xBFE6A09E60000000, float %229
  %235 = fcmp oge float %189, 0x400F6A7A40000000
  %236 = fadd float %189, 0xC00F6A7A40000000
  %237 = select i1 %235, float %236, float %232
  %238 = select i1 %235, float 0xBFE6A09E60000000, float %233
  %239 = select i1 %235, float 0xBFED906BC0000000, float %234
  %240 = fcmp oge float %189, 0x4011475CE0000000
  %241 = fadd float %189, 0xC011475CE0000000
  %242 = select i1 %240, float %241, float %237
  %243 = select i1 %240, float 0xBFED906BC0000000, float %238
  %244 = select i1 %240, float -1.000000e+00, float %239
  %245 = fcmp oge float %189, 0x4012D97C80000000
  %246 = fadd float %189, 0xC012D97C80000000
  %247 = select i1 %245, float %246, float %242
  %248 = select i1 %245, float -1.000000e+00, float %243
  %249 = select i1 %245, float 0xBFED906BC0000000, float %244
  %250 = fcmp oge float %189, 0x40146B9C40000000
  %251 = fadd float %189, 0xC0146B9C40000000
  %252 = select i1 %250, float %251, float %247
  %253 = select i1 %250, float 0xBFED906BC0000000, float %248
  %254 = select i1 %250, float 0xBFE6A09E60000000, float %249
  %255 = fcmp oge float %189, 0x4015FDBC00000000
  %256 = fadd float %189, 0xC015FDBC00000000
  %257 = select i1 %255, float %256, float %252
  %258 = select i1 %255, float 0xBFE6A09E60000000, float %253
  %259 = select i1 %255, float 0xBFD87DE2A0000000, float %254
  %260 = fcmp oge float %189, 0x40178FDBA0000000
  %261 = fadd float %189, 0xC0178FDBA0000000
  %262 = select i1 %260, float %261, float %257
  %263 = select i1 %260, float 0xBFD87DE2A0000000, float %258
  %264 = select i1 %260, float 0.000000e+00, float %259
  %265 = fdiv float %262, 0x3FD921FB60000000
  %266 = fsub float %264, %263
  %267 = call float @llvm.fmuladd.f32(float %265, float %266, float %263)
  %268 = call float @llvm.fmuladd.f32(float %182, float %267, float %181)
  store volatile float %268, ptr %17, align 4, !tbaa !5
  %269 = load volatile float, ptr %16, align 4, !tbaa !5
  %270 = load volatile float, ptr %9, align 4, !tbaa !5
  %271 = load volatile float, ptr %17, align 4, !tbaa !5
  %272 = fcmp olt float %271, 0.000000e+00
  %273 = fadd float %271, 0x401921FB60000000
  %274 = select i1 %272, float %273, float %271
  %275 = fcmp ult float %274, 0x401921FB60000000
  %276 = fadd float %274, 0xC01921FB60000000
  %277 = select i1 %275, float %274, float %276
  %278 = fcmp oge float %277, 0x3FD921FB60000000
  %279 = fadd float %277, 0xBFD921FB60000000
  %280 = select i1 %278, float %279, float %271
  %281 = select i1 %278, float 0x3FD87DE2A0000000, float 0.000000e+00
  %282 = select i1 %278, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %283 = fcmp oge float %277, 0x3FE921FB60000000
  %284 = fadd float %277, 0xBFE921FB60000000
  %285 = select i1 %283, float %284, float %280
  %286 = select i1 %283, float 0x3FE6A09E60000000, float %281
  %287 = select i1 %283, float 0x3FED906BC0000000, float %282
  %288 = fcmp oge float %277, 0x3FF2D97C80000000
  %289 = fadd float %277, 0xBFF2D97C80000000
  %290 = select i1 %288, float %289, float %285
  %291 = select i1 %288, float 0x3FED906BC0000000, float %286
  %292 = select i1 %288, float 1.000000e+00, float %287
  %293 = fcmp oge float %277, 0x3FF921FB60000000
  %294 = fadd float %277, 0xBFF921FB60000000
  %295 = select i1 %293, float %294, float %290
  %296 = select i1 %293, float 1.000000e+00, float %291
  %297 = select i1 %293, float 0x3FED906BC0000000, float %292
  %298 = fcmp oge float %277, 0x3FFF6A7A40000000
  %299 = fadd float %277, 0xBFFF6A7A40000000
  %300 = select i1 %298, float %299, float %295
  %301 = select i1 %298, float 0x3FED906BC0000000, float %296
  %302 = select i1 %298, float 0x3FE6A09E60000000, float %297
  %303 = fcmp oge float %277, 0x4002D97C80000000
  %304 = fadd float %277, 0xC002D97C80000000
  %305 = select i1 %303, float %304, float %300
  %306 = select i1 %303, float 0x3FE6A09E60000000, float %301
  %307 = select i1 %303, float 0x3FD87DE2A0000000, float %302
  %308 = fcmp oge float %277, 0x4005FDBC00000000
  %309 = fadd float %277, 0xC005FDBC00000000
  %310 = select i1 %308, float %309, float %305
  %311 = select i1 %308, float 0x3FD87DE2A0000000, float %306
  %312 = select i1 %308, float 0.000000e+00, float %307
  %313 = fcmp oge float %277, 0x400921FB60000000
  %314 = fadd float %277, 0xC00921FB60000000
  %315 = select i1 %313, float %314, float %310
  %316 = select i1 %313, float 0.000000e+00, float %311
  %317 = select i1 %313, float 0xBFD87DE2A0000000, float %312
  %318 = fcmp oge float %277, 0x400C463AC0000000
  %319 = fadd float %277, 0xC00C463AC0000000
  %320 = select i1 %318, float %319, float %315
  %321 = select i1 %318, float 0xBFD87DE2A0000000, float %316
  %322 = select i1 %318, float 0xBFE6A09E60000000, float %317
  %323 = fcmp oge float %277, 0x400F6A7A40000000
  %324 = fadd float %277, 0xC00F6A7A40000000
  %325 = select i1 %323, float %324, float %320
  %326 = select i1 %323, float 0xBFE6A09E60000000, float %321
  %327 = select i1 %323, float 0xBFED906BC0000000, float %322
  %328 = fcmp oge float %277, 0x4011475CE0000000
  %329 = fadd float %277, 0xC011475CE0000000
  %330 = select i1 %328, float %329, float %325
  %331 = select i1 %328, float 0xBFED906BC0000000, float %326
  %332 = select i1 %328, float -1.000000e+00, float %327
  %333 = fcmp oge float %277, 0x4012D97C80000000
  %334 = fadd float %277, 0xC012D97C80000000
  %335 = select i1 %333, float %334, float %330
  %336 = select i1 %333, float -1.000000e+00, float %331
  %337 = select i1 %333, float 0xBFED906BC0000000, float %332
  %338 = fcmp oge float %277, 0x40146B9C40000000
  %339 = fadd float %277, 0xC0146B9C40000000
  %340 = select i1 %338, float %339, float %335
  %341 = select i1 %338, float 0xBFED906BC0000000, float %336
  %342 = select i1 %338, float 0xBFE6A09E60000000, float %337
  %343 = fcmp oge float %277, 0x4015FDBC00000000
  %344 = fadd float %277, 0xC015FDBC00000000
  %345 = select i1 %343, float %344, float %340
  %346 = select i1 %343, float 0xBFE6A09E60000000, float %341
  %347 = select i1 %343, float 0xBFD87DE2A0000000, float %342
  %348 = fcmp oge float %277, 0x40178FDBA0000000
  %349 = fadd float %277, 0xC0178FDBA0000000
  %350 = select i1 %348, float %349, float %345
  %351 = select i1 %348, float 0xBFD87DE2A0000000, float %346
  %352 = select i1 %348, float 0.000000e+00, float %347
  %353 = fdiv float %350, 0x3FD921FB60000000
  %354 = fsub float %352, %351
  %355 = call float @llvm.fmuladd.f32(float %353, float %354, float %351)
  %356 = call float @llvm.fmuladd.f32(float %270, float %355, float %269)
  store volatile float %356, ptr %17, align 4, !tbaa !5
  %357 = load volatile float, ptr %16, align 4, !tbaa !5
  %358 = load volatile float, ptr %9, align 4, !tbaa !5
  %359 = load volatile float, ptr %17, align 4, !tbaa !5
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
  %444 = call float @llvm.fmuladd.f32(float %358, float %443, float %357)
  store volatile float %444, ptr %17, align 4, !tbaa !5
  %445 = load volatile float, ptr %16, align 4, !tbaa !5
  %446 = load volatile float, ptr %9, align 4, !tbaa !5
  %447 = load volatile float, ptr %17, align 4, !tbaa !5
  %448 = fcmp olt float %447, 0.000000e+00
  %449 = fadd float %447, 0x401921FB60000000
  %450 = select i1 %448, float %449, float %447
  %451 = fcmp ult float %450, 0x401921FB60000000
  %452 = fadd float %450, 0xC01921FB60000000
  %453 = select i1 %451, float %450, float %452
  %454 = fcmp oge float %453, 0x3FD921FB60000000
  %455 = fadd float %453, 0xBFD921FB60000000
  %456 = select i1 %454, float %455, float %447
  %457 = select i1 %454, float 0x3FD87DE2A0000000, float 0.000000e+00
  %458 = select i1 %454, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %459 = fcmp oge float %453, 0x3FE921FB60000000
  %460 = fadd float %453, 0xBFE921FB60000000
  %461 = select i1 %459, float %460, float %456
  %462 = select i1 %459, float 0x3FE6A09E60000000, float %457
  %463 = select i1 %459, float 0x3FED906BC0000000, float %458
  %464 = fcmp oge float %453, 0x3FF2D97C80000000
  %465 = fadd float %453, 0xBFF2D97C80000000
  %466 = select i1 %464, float %465, float %461
  %467 = select i1 %464, float 0x3FED906BC0000000, float %462
  %468 = select i1 %464, float 1.000000e+00, float %463
  %469 = fcmp oge float %453, 0x3FF921FB60000000
  %470 = fadd float %453, 0xBFF921FB60000000
  %471 = select i1 %469, float %470, float %466
  %472 = select i1 %469, float 1.000000e+00, float %467
  %473 = select i1 %469, float 0x3FED906BC0000000, float %468
  %474 = fcmp oge float %453, 0x3FFF6A7A40000000
  %475 = fadd float %453, 0xBFFF6A7A40000000
  %476 = select i1 %474, float %475, float %471
  %477 = select i1 %474, float 0x3FED906BC0000000, float %472
  %478 = select i1 %474, float 0x3FE6A09E60000000, float %473
  %479 = fcmp oge float %453, 0x4002D97C80000000
  %480 = fadd float %453, 0xC002D97C80000000
  %481 = select i1 %479, float %480, float %476
  %482 = select i1 %479, float 0x3FE6A09E60000000, float %477
  %483 = select i1 %479, float 0x3FD87DE2A0000000, float %478
  %484 = fcmp oge float %453, 0x4005FDBC00000000
  %485 = fadd float %453, 0xC005FDBC00000000
  %486 = select i1 %484, float %485, float %481
  %487 = select i1 %484, float 0x3FD87DE2A0000000, float %482
  %488 = select i1 %484, float 0.000000e+00, float %483
  %489 = fcmp oge float %453, 0x400921FB60000000
  %490 = fadd float %453, 0xC00921FB60000000
  %491 = select i1 %489, float %490, float %486
  %492 = select i1 %489, float 0.000000e+00, float %487
  %493 = select i1 %489, float 0xBFD87DE2A0000000, float %488
  %494 = fcmp oge float %453, 0x400C463AC0000000
  %495 = fadd float %453, 0xC00C463AC0000000
  %496 = select i1 %494, float %495, float %491
  %497 = select i1 %494, float 0xBFD87DE2A0000000, float %492
  %498 = select i1 %494, float 0xBFE6A09E60000000, float %493
  %499 = fcmp oge float %453, 0x400F6A7A40000000
  %500 = fadd float %453, 0xC00F6A7A40000000
  %501 = select i1 %499, float %500, float %496
  %502 = select i1 %499, float 0xBFE6A09E60000000, float %497
  %503 = select i1 %499, float 0xBFED906BC0000000, float %498
  %504 = fcmp oge float %453, 0x4011475CE0000000
  %505 = fadd float %453, 0xC011475CE0000000
  %506 = select i1 %504, float %505, float %501
  %507 = select i1 %504, float 0xBFED906BC0000000, float %502
  %508 = select i1 %504, float -1.000000e+00, float %503
  %509 = fcmp oge float %453, 0x4012D97C80000000
  %510 = fadd float %453, 0xC012D97C80000000
  %511 = select i1 %509, float %510, float %506
  %512 = select i1 %509, float -1.000000e+00, float %507
  %513 = select i1 %509, float 0xBFED906BC0000000, float %508
  %514 = fcmp oge float %453, 0x40146B9C40000000
  %515 = fadd float %453, 0xC0146B9C40000000
  %516 = select i1 %514, float %515, float %511
  %517 = select i1 %514, float 0xBFED906BC0000000, float %512
  %518 = select i1 %514, float 0xBFE6A09E60000000, float %513
  %519 = fcmp oge float %453, 0x4015FDBC00000000
  %520 = fadd float %453, 0xC015FDBC00000000
  %521 = select i1 %519, float %520, float %516
  %522 = select i1 %519, float 0xBFE6A09E60000000, float %517
  %523 = select i1 %519, float 0xBFD87DE2A0000000, float %518
  %524 = fcmp oge float %453, 0x40178FDBA0000000
  %525 = fadd float %453, 0xC0178FDBA0000000
  %526 = select i1 %524, float %525, float %521
  %527 = select i1 %524, float 0xBFD87DE2A0000000, float %522
  %528 = select i1 %524, float 0.000000e+00, float %523
  %529 = fdiv float %526, 0x3FD921FB60000000
  %530 = fsub float %528, %527
  %531 = call float @llvm.fmuladd.f32(float %529, float %530, float %527)
  %532 = call float @llvm.fmuladd.f32(float %446, float %531, float %445)
  store volatile float %532, ptr %17, align 4, !tbaa !5
  %533 = load volatile float, ptr %9, align 4, !tbaa !5
  %534 = fadd float %533, 1.000000e+00
  %535 = fcmp ugt float %534, 0.000000e+00
  br i1 %535, label %536, label %547

536:                                              ; preds = %83
  %537 = fmul float %534, 5.000000e-01
  %538 = bitcast float %534 to i32
  %539 = ashr i32 %538, 1
  %540 = sub nsw i32 1597463007, %539
  %541 = bitcast i32 %540 to float
  %542 = fneg float %541
  %543 = fmul float %537, %542
  %544 = call float @llvm.fmuladd.f32(float %543, float %541, float 1.500000e+00)
  %545 = fmul float %544, %541
  %546 = fdiv float 1.000000e+00, %545
  br label %547

547:                                              ; preds = %83, %536
  %548 = phi float [ %546, %536 ], [ 0.000000e+00, %83 ]
  %549 = load volatile float, ptr %17, align 4, !tbaa !5
  %550 = fmul float %549, 5.000000e-01
  %551 = fcmp olt float %550, 0.000000e+00
  %552 = fadd float %550, 0x401921FB60000000
  %553 = select i1 %551, float %552, float %550
  %554 = fcmp ult float %553, 0x401921FB60000000
  %555 = fadd float %553, 0xC01921FB60000000
  %556 = select i1 %554, float %553, float %555
  %557 = fcmp oge float %556, 0x3FD921FB60000000
  %558 = fadd float %556, 0xBFD921FB60000000
  %559 = select i1 %557, float %558, float %550
  %560 = select i1 %557, float 0x3FD87DE2A0000000, float 0.000000e+00
  %561 = select i1 %557, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %562 = fcmp oge float %556, 0x3FE921FB60000000
  %563 = fadd float %556, 0xBFE921FB60000000
  %564 = select i1 %562, float %563, float %559
  %565 = select i1 %562, float 0x3FE6A09E60000000, float %560
  %566 = select i1 %562, float 0x3FED906BC0000000, float %561
  %567 = fcmp oge float %556, 0x3FF2D97C80000000
  %568 = fadd float %556, 0xBFF2D97C80000000
  %569 = select i1 %567, float %568, float %564
  %570 = select i1 %567, float 0x3FED906BC0000000, float %565
  %571 = select i1 %567, float 1.000000e+00, float %566
  %572 = fcmp oge float %556, 0x3FF921FB60000000
  %573 = fadd float %556, 0xBFF921FB60000000
  %574 = select i1 %572, float %573, float %569
  %575 = select i1 %572, float 1.000000e+00, float %570
  %576 = select i1 %572, float 0x3FED906BC0000000, float %571
  %577 = fcmp oge float %556, 0x3FFF6A7A40000000
  %578 = fadd float %556, 0xBFFF6A7A40000000
  %579 = select i1 %577, float %578, float %574
  %580 = select i1 %577, float 0x3FED906BC0000000, float %575
  %581 = select i1 %577, float 0x3FE6A09E60000000, float %576
  %582 = fcmp oge float %556, 0x4002D97C80000000
  %583 = fadd float %556, 0xC002D97C80000000
  %584 = select i1 %582, float %583, float %579
  %585 = select i1 %582, float 0x3FE6A09E60000000, float %580
  %586 = select i1 %582, float 0x3FD87DE2A0000000, float %581
  %587 = fcmp oge float %556, 0x4005FDBC00000000
  %588 = fadd float %556, 0xC005FDBC00000000
  %589 = select i1 %587, float %588, float %584
  %590 = select i1 %587, float 0x3FD87DE2A0000000, float %585
  %591 = select i1 %587, float 0.000000e+00, float %586
  %592 = fcmp oge float %556, 0x400921FB60000000
  %593 = fadd float %556, 0xC00921FB60000000
  %594 = select i1 %592, float %593, float %589
  %595 = select i1 %592, float 0.000000e+00, float %590
  %596 = select i1 %592, float 0xBFD87DE2A0000000, float %591
  %597 = fcmp oge float %556, 0x400C463AC0000000
  %598 = fadd float %556, 0xC00C463AC0000000
  %599 = select i1 %597, float %598, float %594
  %600 = select i1 %597, float 0xBFD87DE2A0000000, float %595
  %601 = select i1 %597, float 0xBFE6A09E60000000, float %596
  %602 = fcmp oge float %556, 0x400F6A7A40000000
  %603 = fadd float %556, 0xC00F6A7A40000000
  %604 = select i1 %602, float %603, float %599
  %605 = select i1 %602, float 0xBFE6A09E60000000, float %600
  %606 = select i1 %602, float 0xBFED906BC0000000, float %601
  %607 = fcmp oge float %556, 0x4011475CE0000000
  %608 = fadd float %556, 0xC011475CE0000000
  %609 = select i1 %607, float %608, float %604
  %610 = select i1 %607, float 0xBFED906BC0000000, float %605
  %611 = select i1 %607, float -1.000000e+00, float %606
  %612 = fcmp oge float %556, 0x4012D97C80000000
  %613 = fadd float %556, 0xC012D97C80000000
  %614 = select i1 %612, float %613, float %609
  %615 = select i1 %612, float -1.000000e+00, float %610
  %616 = select i1 %612, float 0xBFED906BC0000000, float %611
  %617 = fcmp oge float %556, 0x40146B9C40000000
  %618 = fadd float %556, 0xC0146B9C40000000
  %619 = select i1 %617, float %618, float %614
  %620 = select i1 %617, float 0xBFED906BC0000000, float %615
  %621 = select i1 %617, float 0xBFE6A09E60000000, float %616
  %622 = fcmp oge float %556, 0x4015FDBC00000000
  %623 = fadd float %556, 0xC015FDBC00000000
  %624 = select i1 %622, float %623, float %619
  %625 = select i1 %622, float 0xBFE6A09E60000000, float %620
  %626 = select i1 %622, float 0xBFD87DE2A0000000, float %621
  %627 = fcmp oge float %556, 0x40178FDBA0000000
  %628 = fadd float %556, 0xC0178FDBA0000000
  %629 = select i1 %627, float %628, float %624
  %630 = select i1 %627, float 0xBFD87DE2A0000000, float %625
  %631 = select i1 %627, float 0.000000e+00, float %626
  %632 = fdiv float %629, 0x3FD921FB60000000
  %633 = fsub float %631, %630
  %634 = call float @llvm.fmuladd.f32(float %632, float %633, float %630)
  %635 = fmul float %548, %634
  %636 = load volatile float, ptr %9, align 4, !tbaa !5
  %637 = fsub float 1.000000e+00, %636
  %638 = fcmp ugt float %637, 0.000000e+00
  br i1 %638, label %639, label %650

639:                                              ; preds = %547
  %640 = fmul float %637, 5.000000e-01
  %641 = bitcast float %637 to i32
  %642 = ashr i32 %641, 1
  %643 = sub nsw i32 1597463007, %642
  %644 = bitcast i32 %643 to float
  %645 = fneg float %644
  %646 = fmul float %640, %645
  %647 = call float @llvm.fmuladd.f32(float %646, float %644, float 1.500000e+00)
  %648 = fmul float %647, %644
  %649 = fdiv float 1.000000e+00, %648
  br label %650

650:                                              ; preds = %547, %639
  %651 = phi float [ %649, %639 ], [ 0.000000e+00, %547 ]
  %652 = load volatile float, ptr %17, align 4, !tbaa !5
  %653 = fmul float %652, 5.000000e-01
  %654 = fcmp olt float %653, 0.000000e+00
  %655 = fadd float %653, 0x401921FB60000000
  %656 = select i1 %654, float %655, float %653
  %657 = fcmp ult float %656, 0x401921FB60000000
  %658 = fadd float %656, 0xC01921FB60000000
  %659 = select i1 %657, float %656, float %658
  %660 = fcmp oge float %659, 0x3FD921FB60000000
  %661 = fadd float %659, 0xBFD921FB60000000
  %662 = select i1 %660, float %661, float %653
  %663 = select i1 %660, float 0x3FED906BC0000000, float 1.000000e+00
  %664 = select i1 %660, float 0x3FE6A09E60000000, float 0x3FED906BC0000000
  %665 = fcmp oge float %659, 0x3FE921FB60000000
  %666 = fadd float %659, 0xBFE921FB60000000
  %667 = select i1 %665, float %666, float %662
  %668 = select i1 %665, float 0x3FE6A09E60000000, float %663
  %669 = select i1 %665, float 0x3FD87DE2A0000000, float %664
  %670 = fcmp oge float %659, 0x3FF2D97C80000000
  %671 = fadd float %659, 0xBFF2D97C80000000
  %672 = select i1 %670, float %671, float %667
  %673 = select i1 %670, float 0x3FD87DE2A0000000, float %668
  %674 = select i1 %670, float 0.000000e+00, float %669
  %675 = fcmp oge float %659, 0x3FF921FB60000000
  %676 = fadd float %659, 0xBFF921FB60000000
  %677 = select i1 %675, float %676, float %672
  %678 = select i1 %675, float 0.000000e+00, float %673
  %679 = select i1 %675, float 0xBFD87DE2A0000000, float %674
  %680 = fcmp oge float %659, 0x3FFF6A7A40000000
  %681 = fadd float %659, 0xBFFF6A7A40000000
  %682 = select i1 %680, float %681, float %677
  %683 = select i1 %680, float 0xBFD87DE2A0000000, float %678
  %684 = select i1 %680, float 0xBFE6A09E60000000, float %679
  %685 = fcmp oge float %659, 0x4002D97C80000000
  %686 = fadd float %659, 0xC002D97C80000000
  %687 = select i1 %685, float %686, float %682
  %688 = select i1 %685, float 0xBFE6A09E60000000, float %683
  %689 = select i1 %685, float 0xBFED906BC0000000, float %684
  %690 = fcmp oge float %659, 0x4005FDBC00000000
  %691 = fadd float %659, 0xC005FDBC00000000
  %692 = select i1 %690, float %691, float %687
  %693 = select i1 %690, float 0xBFED906BC0000000, float %688
  %694 = select i1 %690, float -1.000000e+00, float %689
  %695 = fcmp oge float %659, 0x400921FB60000000
  %696 = fadd float %659, 0xC00921FB60000000
  %697 = select i1 %695, float %696, float %692
  %698 = select i1 %695, float -1.000000e+00, float %693
  %699 = select i1 %695, float 0xBFED906BC0000000, float %694
  %700 = fcmp oge float %659, 0x400C463AC0000000
  %701 = fadd float %659, 0xC00C463AC0000000
  %702 = select i1 %700, float %701, float %697
  %703 = select i1 %700, float 0xBFED906BC0000000, float %698
  %704 = select i1 %700, float 0xBFE6A09E60000000, float %699
  %705 = fcmp oge float %659, 0x400F6A7A40000000
  %706 = fadd float %659, 0xC00F6A7A40000000
  %707 = select i1 %705, float %706, float %702
  %708 = select i1 %705, float 0xBFE6A09E60000000, float %703
  %709 = select i1 %705, float 0xBFD87DE2A0000000, float %704
  %710 = fcmp oge float %659, 0x4011475CE0000000
  %711 = fadd float %659, 0xC011475CE0000000
  %712 = select i1 %710, float %711, float %707
  %713 = select i1 %710, float 0xBFD87DE2A0000000, float %708
  %714 = select i1 %710, float 0.000000e+00, float %709
  %715 = fcmp oge float %659, 0x4012D97C80000000
  %716 = fadd float %659, 0xC012D97C80000000
  %717 = select i1 %715, float %716, float %712
  %718 = select i1 %715, float 0.000000e+00, float %713
  %719 = select i1 %715, float 0x3FD87DE2A0000000, float %714
  %720 = fcmp oge float %659, 0x40146B9C40000000
  %721 = fadd float %659, 0xC0146B9C40000000
  %722 = select i1 %720, float %721, float %717
  %723 = select i1 %720, float 0x3FD87DE2A0000000, float %718
  %724 = select i1 %720, float 0x3FE6A09E60000000, float %719
  %725 = fcmp oge float %659, 0x4015FDBC00000000
  %726 = fadd float %659, 0xC015FDBC00000000
  %727 = select i1 %725, float %726, float %722
  %728 = select i1 %725, float 0x3FE6A09E60000000, float %723
  %729 = select i1 %725, float 0x3FED906BC0000000, float %724
  %730 = fcmp oge float %659, 0x40178FDBA0000000
  %731 = fadd float %659, 0xC0178FDBA0000000
  %732 = select i1 %730, float %731, float %727
  %733 = select i1 %730, float 0x3FED906BC0000000, float %728
  %734 = select i1 %730, float 1.000000e+00, float %729
  %735 = fdiv float %732, 0x3FD921FB60000000
  %736 = fsub float %734, %733
  %737 = call float @llvm.fmuladd.f32(float %735, float %736, float %733)
  %738 = fmul float %651, %737
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %1)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2)
  store float %635, ptr %1, align 8, !tbaa !5
  store float %738, ptr %2, align 8, !tbaa !5
  %739 = load i64, ptr %1, align 8
  %740 = and i64 %739, 4294967295
  %741 = load i64, ptr %2, align 8
  %742 = and i64 %741, 4294967295
  %743 = icmp eq i64 %742, 0
  %744 = icmp eq i64 %740, 0
  %745 = select i1 %743, i1 %744, i1 false
  %746 = trunc i64 %741 to i32
  %747 = bitcast i32 %746 to float
  %748 = trunc i64 %739 to i32
  %749 = bitcast i32 %748 to float
  br i1 %745, label %777, label %750

750:                                              ; preds = %650
  %751 = and i64 %739, 2147483647
  %752 = and i64 %741, 2147483647
  %753 = icmp samesign ugt i64 %752, %751
  br i1 %753, label %754, label %756

754:                                              ; preds = %750
  %755 = fdiv float %749, %747
  br label %758

756:                                              ; preds = %750
  %757 = fdiv float %747, %749
  br label %758

758:                                              ; preds = %756, %754
  %759 = phi float [ %755, %754 ], [ %757, %756 ]
  %760 = fneg float %759
  %761 = fmul float %759, %760
  %762 = fmul float %759, %761
  %763 = fdiv float %762, 3.000000e+00
  %764 = fmul float %761, %763
  %765 = fdiv float %764, 5.000000e+00
  %766 = fmul float %761, %765
  %767 = fdiv float %766, 7.000000e+00
  %768 = fmul float %761, %767
  %769 = fdiv float %768, 9.000000e+00
  %770 = fadd float %759, %763
  %771 = fadd float %770, %765
  %772 = fadd float %771, %767
  %773 = fadd float %772, %769
  %774 = fsub float 0x3FF921FB40000000, %773
  %775 = select i1 %753, float %773, float %774
  %776 = fmul float %775, 2.000000e+00
  br label %777

777:                                              ; preds = %650, %758
  %778 = phi float [ %776, %758 ], [ 0.000000e+00, %650 ]
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %1)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2)
  store volatile float %778, ptr %18, align 4, !tbaa !5
  %779 = load volatile float, ptr %8, align 4, !tbaa !5
  %780 = load volatile float, ptr %9, align 4, !tbaa !5
  %781 = load volatile float, ptr %17, align 4, !tbaa !5
  %782 = fcmp olt float %781, 0.000000e+00
  %783 = fadd float %781, 0x401921FB60000000
  %784 = select i1 %782, float %783, float %781
  %785 = fcmp ult float %784, 0x401921FB60000000
  %786 = fadd float %784, 0xC01921FB60000000
  %787 = select i1 %785, float %784, float %786
  %788 = fcmp oge float %787, 0x3FD921FB60000000
  %789 = fadd float %787, 0xBFD921FB60000000
  %790 = select i1 %788, float %789, float %781
  %791 = select i1 %788, float 0x3FED906BC0000000, float 1.000000e+00
  %792 = select i1 %788, float 0x3FE6A09E60000000, float 0x3FED906BC0000000
  %793 = fcmp oge float %787, 0x3FE921FB60000000
  %794 = fadd float %787, 0xBFE921FB60000000
  %795 = select i1 %793, float %794, float %790
  %796 = select i1 %793, float 0x3FE6A09E60000000, float %791
  %797 = select i1 %793, float 0x3FD87DE2A0000000, float %792
  %798 = fcmp oge float %787, 0x3FF2D97C80000000
  %799 = fadd float %787, 0xBFF2D97C80000000
  %800 = select i1 %798, float %799, float %795
  %801 = select i1 %798, float 0x3FD87DE2A0000000, float %796
  %802 = select i1 %798, float 0.000000e+00, float %797
  %803 = fcmp oge float %787, 0x3FF921FB60000000
  %804 = fadd float %787, 0xBFF921FB60000000
  %805 = select i1 %803, float %804, float %800
  %806 = select i1 %803, float 0.000000e+00, float %801
  %807 = select i1 %803, float 0xBFD87DE2A0000000, float %802
  %808 = fcmp oge float %787, 0x3FFF6A7A40000000
  %809 = fadd float %787, 0xBFFF6A7A40000000
  %810 = select i1 %808, float %809, float %805
  %811 = select i1 %808, float 0xBFD87DE2A0000000, float %806
  %812 = select i1 %808, float 0xBFE6A09E60000000, float %807
  %813 = fcmp oge float %787, 0x4002D97C80000000
  %814 = fadd float %787, 0xC002D97C80000000
  %815 = select i1 %813, float %814, float %810
  %816 = select i1 %813, float 0xBFE6A09E60000000, float %811
  %817 = select i1 %813, float 0xBFED906BC0000000, float %812
  %818 = fcmp oge float %787, 0x4005FDBC00000000
  %819 = fadd float %787, 0xC005FDBC00000000
  %820 = select i1 %818, float %819, float %815
  %821 = select i1 %818, float 0xBFED906BC0000000, float %816
  %822 = select i1 %818, float -1.000000e+00, float %817
  %823 = fcmp oge float %787, 0x400921FB60000000
  %824 = fadd float %787, 0xC00921FB60000000
  %825 = select i1 %823, float %824, float %820
  %826 = select i1 %823, float -1.000000e+00, float %821
  %827 = select i1 %823, float 0xBFED906BC0000000, float %822
  %828 = fcmp oge float %787, 0x400C463AC0000000
  %829 = fadd float %787, 0xC00C463AC0000000
  %830 = select i1 %828, float %829, float %825
  %831 = select i1 %828, float 0xBFED906BC0000000, float %826
  %832 = select i1 %828, float 0xBFE6A09E60000000, float %827
  %833 = fcmp oge float %787, 0x400F6A7A40000000
  %834 = fadd float %787, 0xC00F6A7A40000000
  %835 = select i1 %833, float %834, float %830
  %836 = select i1 %833, float 0xBFE6A09E60000000, float %831
  %837 = select i1 %833, float 0xBFD87DE2A0000000, float %832
  %838 = fcmp oge float %787, 0x4011475CE0000000
  %839 = fadd float %787, 0xC011475CE0000000
  %840 = select i1 %838, float %839, float %835
  %841 = select i1 %838, float 0xBFD87DE2A0000000, float %836
  %842 = select i1 %838, float 0.000000e+00, float %837
  %843 = fcmp oge float %787, 0x4012D97C80000000
  %844 = fadd float %787, 0xC012D97C80000000
  %845 = select i1 %843, float %844, float %840
  %846 = select i1 %843, float 0.000000e+00, float %841
  %847 = select i1 %843, float 0x3FD87DE2A0000000, float %842
  %848 = fcmp oge float %787, 0x40146B9C40000000
  %849 = fadd float %787, 0xC0146B9C40000000
  %850 = select i1 %848, float %849, float %845
  %851 = select i1 %848, float 0x3FD87DE2A0000000, float %846
  %852 = select i1 %848, float 0x3FE6A09E60000000, float %847
  %853 = fcmp oge float %787, 0x4015FDBC00000000
  %854 = fadd float %787, 0xC015FDBC00000000
  %855 = select i1 %853, float %854, float %850
  %856 = select i1 %853, float 0x3FE6A09E60000000, float %851
  %857 = select i1 %853, float 0x3FED906BC0000000, float %852
  %858 = fcmp oge float %787, 0x40178FDBA0000000
  %859 = fadd float %787, 0xC0178FDBA0000000
  %860 = select i1 %858, float %859, float %855
  %861 = select i1 %858, float 0x3FED906BC0000000, float %856
  %862 = select i1 %858, float 1.000000e+00, float %857
  %863 = fdiv float %860, 0x3FD921FB60000000
  %864 = fsub float %862, %861
  %865 = call float @llvm.fmuladd.f32(float %863, float %864, float %861)
  %866 = fneg float %780
  %867 = call float @llvm.fmuladd.f32(float %866, float %865, float 1.000000e+00)
  %868 = fmul float %779, %867
  store volatile float %868, ptr %19, align 4, !tbaa !5
  %869 = load volatile float, ptr %18, align 4, !tbaa !5
  %870 = fcmp olt float %869, 0.000000e+00
  %871 = fadd float %869, 0x401921FB60000000
  %872 = select i1 %870, float %871, float %869
  %873 = fcmp ult float %872, 0x401921FB60000000
  %874 = fadd float %872, 0xC01921FB60000000
  %875 = select i1 %873, float %872, float %874
  %876 = fcmp oge float %875, 0x3FD921FB60000000
  %877 = fadd float %875, 0xBFD921FB60000000
  %878 = select i1 %876, float %877, float %869
  %879 = select i1 %876, float 0x3FED906BC0000000, float 1.000000e+00
  %880 = select i1 %876, float 0x3FE6A09E60000000, float 0x3FED906BC0000000
  %881 = fcmp oge float %875, 0x3FE921FB60000000
  %882 = fadd float %875, 0xBFE921FB60000000
  %883 = select i1 %881, float %882, float %878
  %884 = select i1 %881, float 0x3FE6A09E60000000, float %879
  %885 = select i1 %881, float 0x3FD87DE2A0000000, float %880
  %886 = fcmp oge float %875, 0x3FF2D97C80000000
  %887 = fadd float %875, 0xBFF2D97C80000000
  %888 = select i1 %886, float %887, float %883
  %889 = select i1 %886, float 0x3FD87DE2A0000000, float %884
  %890 = select i1 %886, float 0.000000e+00, float %885
  %891 = fcmp oge float %875, 0x3FF921FB60000000
  %892 = fadd float %875, 0xBFF921FB60000000
  %893 = select i1 %891, float %892, float %888
  %894 = select i1 %891, float 0.000000e+00, float %889
  %895 = select i1 %891, float 0xBFD87DE2A0000000, float %890
  %896 = fcmp oge float %875, 0x3FFF6A7A40000000
  %897 = fadd float %875, 0xBFFF6A7A40000000
  %898 = select i1 %896, float %897, float %893
  %899 = select i1 %896, float 0xBFD87DE2A0000000, float %894
  %900 = select i1 %896, float 0xBFE6A09E60000000, float %895
  %901 = fcmp oge float %875, 0x4002D97C80000000
  %902 = fadd float %875, 0xC002D97C80000000
  %903 = select i1 %901, float %902, float %898
  %904 = select i1 %901, float 0xBFE6A09E60000000, float %899
  %905 = select i1 %901, float 0xBFED906BC0000000, float %900
  %906 = fcmp oge float %875, 0x4005FDBC00000000
  %907 = fadd float %875, 0xC005FDBC00000000
  %908 = select i1 %906, float %907, float %903
  %909 = select i1 %906, float 0xBFED906BC0000000, float %904
  %910 = select i1 %906, float -1.000000e+00, float %905
  %911 = fcmp oge float %875, 0x400921FB60000000
  %912 = fadd float %875, 0xC00921FB60000000
  %913 = select i1 %911, float %912, float %908
  %914 = select i1 %911, float -1.000000e+00, float %909
  %915 = select i1 %911, float 0xBFED906BC0000000, float %910
  %916 = fcmp oge float %875, 0x400C463AC0000000
  %917 = fadd float %875, 0xC00C463AC0000000
  %918 = select i1 %916, float %917, float %913
  %919 = select i1 %916, float 0xBFED906BC0000000, float %914
  %920 = select i1 %916, float 0xBFE6A09E60000000, float %915
  %921 = fcmp oge float %875, 0x400F6A7A40000000
  %922 = fadd float %875, 0xC00F6A7A40000000
  %923 = select i1 %921, float %922, float %918
  %924 = select i1 %921, float 0xBFE6A09E60000000, float %919
  %925 = select i1 %921, float 0xBFD87DE2A0000000, float %920
  %926 = fcmp oge float %875, 0x4011475CE0000000
  %927 = fadd float %875, 0xC011475CE0000000
  %928 = select i1 %926, float %927, float %923
  %929 = select i1 %926, float 0xBFD87DE2A0000000, float %924
  %930 = select i1 %926, float 0.000000e+00, float %925
  %931 = fcmp oge float %875, 0x4012D97C80000000
  %932 = fadd float %875, 0xC012D97C80000000
  %933 = select i1 %931, float %932, float %928
  %934 = select i1 %931, float 0.000000e+00, float %929
  %935 = select i1 %931, float 0x3FD87DE2A0000000, float %930
  %936 = fcmp oge float %875, 0x40146B9C40000000
  %937 = fadd float %875, 0xC0146B9C40000000
  %938 = select i1 %936, float %937, float %933
  %939 = select i1 %936, float 0x3FD87DE2A0000000, float %934
  %940 = select i1 %936, float 0x3FE6A09E60000000, float %935
  %941 = fcmp oge float %875, 0x4015FDBC00000000
  %942 = fadd float %875, 0xC015FDBC00000000
  %943 = select i1 %941, float %942, float %938
  %944 = select i1 %941, float 0x3FE6A09E60000000, float %939
  %945 = select i1 %941, float 0x3FED906BC0000000, float %940
  %946 = fcmp oge float %875, 0x40178FDBA0000000
  %947 = fadd float %875, 0xC0178FDBA0000000
  %948 = select i1 %946, float %947, float %943
  %949 = select i1 %946, float 0x3FED906BC0000000, float %944
  %950 = select i1 %946, float 1.000000e+00, float %945
  %951 = fdiv float %948, 0x3FD921FB60000000
  %952 = fsub float %950, %949
  %953 = call float @llvm.fmuladd.f32(float %951, float %952, float %949)
  %954 = load volatile float, ptr %18, align 4, !tbaa !5
  %955 = fcmp olt float %954, 0.000000e+00
  %956 = fadd float %954, 0x401921FB60000000
  %957 = select i1 %955, float %956, float %954
  %958 = fcmp ult float %957, 0x401921FB60000000
  %959 = fadd float %957, 0xC01921FB60000000
  %960 = select i1 %958, float %957, float %959
  %961 = fcmp oge float %960, 0x3FD921FB60000000
  %962 = fadd float %960, 0xBFD921FB60000000
  %963 = select i1 %961, float %962, float %954
  %964 = select i1 %961, float 0x3FD87DE2A0000000, float 0.000000e+00
  %965 = select i1 %961, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %966 = fcmp oge float %960, 0x3FE921FB60000000
  %967 = fadd float %960, 0xBFE921FB60000000
  %968 = select i1 %966, float %967, float %963
  %969 = select i1 %966, float 0x3FE6A09E60000000, float %964
  %970 = select i1 %966, float 0x3FED906BC0000000, float %965
  %971 = fcmp oge float %960, 0x3FF2D97C80000000
  %972 = fadd float %960, 0xBFF2D97C80000000
  %973 = select i1 %971, float %972, float %968
  %974 = select i1 %971, float 0x3FED906BC0000000, float %969
  %975 = select i1 %971, float 1.000000e+00, float %970
  %976 = fcmp oge float %960, 0x3FF921FB60000000
  %977 = fadd float %960, 0xBFF921FB60000000
  %978 = select i1 %976, float %977, float %973
  %979 = select i1 %976, float 1.000000e+00, float %974
  %980 = select i1 %976, float 0x3FED906BC0000000, float %975
  %981 = fcmp oge float %960, 0x3FFF6A7A40000000
  %982 = fadd float %960, 0xBFFF6A7A40000000
  %983 = select i1 %981, float %982, float %978
  %984 = select i1 %981, float 0x3FED906BC0000000, float %979
  %985 = select i1 %981, float 0x3FE6A09E60000000, float %980
  %986 = fcmp oge float %960, 0x4002D97C80000000
  %987 = fadd float %960, 0xC002D97C80000000
  %988 = select i1 %986, float %987, float %983
  %989 = select i1 %986, float 0x3FE6A09E60000000, float %984
  %990 = select i1 %986, float 0x3FD87DE2A0000000, float %985
  %991 = fcmp oge float %960, 0x4005FDBC00000000
  %992 = fadd float %960, 0xC005FDBC00000000
  %993 = select i1 %991, float %992, float %988
  %994 = select i1 %991, float 0x3FD87DE2A0000000, float %989
  %995 = select i1 %991, float 0.000000e+00, float %990
  %996 = fcmp oge float %960, 0x400921FB60000000
  %997 = fadd float %960, 0xC00921FB60000000
  %998 = select i1 %996, float %997, float %993
  %999 = select i1 %996, float 0.000000e+00, float %994
  %1000 = select i1 %996, float 0xBFD87DE2A0000000, float %995
  %1001 = fcmp oge float %960, 0x400C463AC0000000
  %1002 = fadd float %960, 0xC00C463AC0000000
  %1003 = select i1 %1001, float %1002, float %998
  %1004 = select i1 %1001, float 0xBFD87DE2A0000000, float %999
  %1005 = select i1 %1001, float 0xBFE6A09E60000000, float %1000
  %1006 = fcmp oge float %960, 0x400F6A7A40000000
  %1007 = fadd float %960, 0xC00F6A7A40000000
  %1008 = select i1 %1006, float %1007, float %1003
  %1009 = select i1 %1006, float 0xBFE6A09E60000000, float %1004
  %1010 = select i1 %1006, float 0xBFED906BC0000000, float %1005
  %1011 = fcmp oge float %960, 0x4011475CE0000000
  %1012 = fadd float %960, 0xC011475CE0000000
  %1013 = select i1 %1011, float %1012, float %1008
  %1014 = select i1 %1011, float 0xBFED906BC0000000, float %1009
  %1015 = select i1 %1011, float -1.000000e+00, float %1010
  %1016 = fcmp oge float %960, 0x4012D97C80000000
  %1017 = fadd float %960, 0xC012D97C80000000
  %1018 = select i1 %1016, float %1017, float %1013
  %1019 = select i1 %1016, float -1.000000e+00, float %1014
  %1020 = select i1 %1016, float 0xBFED906BC0000000, float %1015
  %1021 = fcmp oge float %960, 0x40146B9C40000000
  %1022 = fadd float %960, 0xC0146B9C40000000
  %1023 = select i1 %1021, float %1022, float %1018
  %1024 = select i1 %1021, float 0xBFED906BC0000000, float %1019
  %1025 = select i1 %1021, float 0xBFE6A09E60000000, float %1020
  %1026 = fcmp oge float %960, 0x4015FDBC00000000
  %1027 = fadd float %960, 0xC015FDBC00000000
  %1028 = select i1 %1026, float %1027, float %1023
  %1029 = select i1 %1026, float 0xBFE6A09E60000000, float %1024
  %1030 = select i1 %1026, float 0xBFD87DE2A0000000, float %1025
  %1031 = fcmp oge float %960, 0x40178FDBA0000000
  %1032 = fadd float %960, 0xC0178FDBA0000000
  %1033 = select i1 %1031, float %1032, float %1028
  %1034 = select i1 %1031, float 0xBFD87DE2A0000000, float %1029
  %1035 = select i1 %1031, float 0.000000e+00, float %1030
  %1036 = fdiv float %1033, 0x3FD921FB60000000
  %1037 = fsub float %1035, %1034
  %1038 = call float @llvm.fmuladd.f32(float %1036, float %1037, float %1034)
  %1039 = load volatile float, ptr %19, align 4, !tbaa !5
  %1040 = load volatile float, ptr %4, align 4, !tbaa !5
  %1041 = fneg float %1040
  %1042 = call float @llvm.fmuladd.f32(float %1039, float %953, float %1041)
  store volatile float %1042, ptr %3, align 4, !tbaa !5
  %1043 = load volatile float, ptr %19, align 4, !tbaa !5
  %1044 = getelementptr inbounds nuw i8, ptr %4, i64 4
  %1045 = load volatile float, ptr %1044, align 4, !tbaa !5
  %1046 = fneg float %1045
  %1047 = call float @llvm.fmuladd.f32(float %1043, float %1038, float %1046)
  %1048 = getelementptr inbounds nuw i8, ptr %3, i64 4
  store volatile float %1047, ptr %1048, align 4, !tbaa !5
  %1049 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %1050 = load volatile float, ptr %1049, align 4, !tbaa !5
  %1051 = fsub float 0.000000e+00, %1050
  %1052 = getelementptr inbounds nuw i8, ptr %3, i64 8
  store volatile float %1051, ptr %1052, align 4, !tbaa !5
  %1053 = fmul float %1047, %1047
  %1054 = call float @llvm.fmuladd.f32(float %1042, float %1042, float %1053)
  %1055 = call float @llvm.fmuladd.f32(float %1051, float %1051, float %1054)
  %1056 = fcmp ugt float %1055, 0.000000e+00
  br i1 %1056, label %1057, label %1068

1057:                                             ; preds = %777
  %1058 = fmul float %1055, 5.000000e-01
  %1059 = bitcast float %1055 to i32
  %1060 = ashr i32 %1059, 1
  %1061 = sub nsw i32 1597463007, %1060
  %1062 = bitcast i32 %1061 to float
  %1063 = fneg float %1062
  %1064 = fmul float %1058, %1063
  %1065 = call float @llvm.fmuladd.f32(float %1064, float %1062, float 1.500000e+00)
  %1066 = fmul float %1065, %1062
  %1067 = fdiv float 1.000000e+00, %1066
  br label %1068

1068:                                             ; preds = %777, %1057
  %1069 = phi float [ %1067, %1057 ], [ 0.000000e+00, %777 ]
  store volatile float %1069, ptr %12, align 4, !tbaa !5
  %1070 = load volatile float, ptr %12, align 4, !tbaa !5
  %1071 = load volatile float, ptr %3, align 4, !tbaa !5
  %1072 = fdiv float %1071, %1070
  store volatile float %1072, ptr %3, align 4, !tbaa !5
  %1073 = load volatile float, ptr %12, align 4, !tbaa !5
  %1074 = load volatile float, ptr %1048, align 4, !tbaa !5
  %1075 = fdiv float %1074, %1073
  store volatile float %1075, ptr %1048, align 4, !tbaa !5
  %1076 = load volatile float, ptr %12, align 4, !tbaa !5
  %1077 = load volatile float, ptr %1052, align 4, !tbaa !5
  %1078 = fdiv float %1077, %1076
  store volatile float %1078, ptr %1052, align 4, !tbaa !5
  %1079 = load volatile float, ptr %5, align 4, !tbaa !5
  %1080 = load volatile float, ptr %3, align 4, !tbaa !5
  %1081 = load volatile float, ptr %60, align 4, !tbaa !5
  %1082 = load volatile float, ptr %1048, align 4, !tbaa !5
  %1083 = fmul float %1081, %1082
  %1084 = call float @llvm.fmuladd.f32(float %1079, float %1080, float %1083)
  %1085 = load volatile float, ptr %65, align 4, !tbaa !5
  %1086 = load volatile float, ptr %1052, align 4, !tbaa !5
  %1087 = call float @llvm.fmuladd.f32(float %1085, float %1086, float %1084)
  store volatile float %1087, ptr %20, align 4, !tbaa !5
  %1088 = load volatile float, ptr %14, align 4, !tbaa !5
  %1089 = load volatile float, ptr %20, align 4, !tbaa !5
  %1090 = fadd float %1089, 1.000000e+00
  %1091 = fmul float %1088, %1090
  store volatile float %1091, ptr %21, align 4, !tbaa !5
  %1092 = load volatile float, ptr %14, align 4, !tbaa !5
  %1093 = load volatile float, ptr %14, align 4, !tbaa !5
  %1094 = fadd float %1093, 1.000000e+00
  %1095 = fdiv float %1092, %1094
  %1096 = load volatile float, ptr %20, align 4, !tbaa !5
  %1097 = fmul float %1096, %1095
  store volatile float %1097, ptr %22, align 4, !tbaa !5
  %1098 = load volatile float, ptr %3, align 4, !tbaa !5
  %1099 = load volatile float, ptr %22, align 4, !tbaa !5
  %1100 = load volatile float, ptr %5, align 4, !tbaa !5
  %1101 = call float @llvm.fmuladd.f32(float %1099, float %1100, float %1098)
  %1102 = load volatile float, ptr %5, align 4, !tbaa !5
  %1103 = fadd float %1101, %1102
  %1104 = load volatile float, ptr %21, align 4, !tbaa !5
  %1105 = fdiv float %1103, %1104
  store volatile float %1105, ptr %6, align 4, !tbaa !5
  %1106 = load volatile float, ptr %1048, align 4, !tbaa !5
  %1107 = load volatile float, ptr %22, align 4, !tbaa !5
  %1108 = load volatile float, ptr %60, align 4, !tbaa !5
  %1109 = call float @llvm.fmuladd.f32(float %1107, float %1108, float %1106)
  %1110 = load volatile float, ptr %60, align 4, !tbaa !5
  %1111 = fadd float %1109, %1110
  %1112 = load volatile float, ptr %21, align 4, !tbaa !5
  %1113 = fdiv float %1111, %1112
  %1114 = getelementptr inbounds nuw i8, ptr %6, i64 4
  store volatile float %1113, ptr %1114, align 4, !tbaa !5
  %1115 = load volatile float, ptr %1052, align 4, !tbaa !5
  %1116 = load volatile float, ptr %22, align 4, !tbaa !5
  %1117 = load volatile float, ptr %65, align 4, !tbaa !5
  %1118 = call float @llvm.fmuladd.f32(float %1116, float %1117, float %1115)
  %1119 = load volatile float, ptr %65, align 4, !tbaa !5
  %1120 = fadd float %1118, %1119
  %1121 = load volatile float, ptr %21, align 4, !tbaa !5
  %1122 = fdiv float %1120, %1121
  %1123 = getelementptr inbounds nuw i8, ptr %6, i64 8
  store volatile float %1122, ptr %1123, align 4, !tbaa !5
  %1124 = load volatile float, ptr %6, align 4, !tbaa !5
  %1125 = load volatile float, ptr %6, align 4, !tbaa !5
  %1126 = load volatile float, ptr %1114, align 4, !tbaa !5
  %1127 = load volatile float, ptr %1114, align 4, !tbaa !5
  %1128 = fmul float %1126, %1127
  %1129 = call float @llvm.fmuladd.f32(float %1124, float %1125, float %1128)
  %1130 = load volatile float, ptr %1123, align 4, !tbaa !5
  %1131 = load volatile float, ptr %1123, align 4, !tbaa !5
  %1132 = call float @llvm.fmuladd.f32(float %1130, float %1131, float %1129)
  %1133 = fcmp ugt float %1132, 0.000000e+00
  br i1 %1133, label %1134, label %1145

1134:                                             ; preds = %1068
  %1135 = fmul float %1132, 5.000000e-01
  %1136 = bitcast float %1132 to i32
  %1137 = ashr i32 %1136, 1
  %1138 = sub nsw i32 1597463007, %1137
  %1139 = bitcast i32 %1138 to float
  %1140 = fneg float %1139
  %1141 = fmul float %1135, %1140
  %1142 = call float @llvm.fmuladd.f32(float %1141, float %1139, float 1.500000e+00)
  %1143 = fmul float %1142, %1139
  %1144 = fdiv float 1.000000e+00, %1143
  br label %1145

1145:                                             ; preds = %1068, %1134
  %1146 = phi float [ %1144, %1134 ], [ 0.000000e+00, %1068 ]
  store volatile float %1146, ptr %23, align 4, !tbaa !5
  %1147 = load volatile float, ptr %23, align 4, !tbaa !5
  %1148 = load volatile float, ptr %6, align 4, !tbaa !5
  %1149 = fdiv float %1148, %1147
  store volatile float %1149, ptr %6, align 4, !tbaa !5
  %1150 = load volatile float, ptr %23, align 4, !tbaa !5
  %1151 = load volatile float, ptr %1114, align 4, !tbaa !5
  %1152 = fdiv float %1151, %1150
  store volatile float %1152, ptr %1114, align 4, !tbaa !5
  %1153 = load volatile float, ptr %23, align 4, !tbaa !5
  %1154 = load volatile float, ptr %1123, align 4, !tbaa !5
  %1155 = fdiv float %1154, %1153
  store volatile float %1155, ptr %1123, align 4, !tbaa !5
  %1156 = load volatile float, ptr %12, align 4, !tbaa !5
  %1157 = fdiv float %1156, 0x41B1DE7840000000
  store volatile float %1157, ptr %11, align 4, !tbaa !5
  %1158 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %24, i32 noundef 0, i32 noundef 3) #3
  %1159 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %24) #3
  %1160 = icmp eq ptr %1159, null
  br i1 %1160, label %1173, label %1161

1161:                                             ; preds = %1145, %1161
  %1162 = phi ptr [ %1171, %1161 ], [ %1159, %1145 ]
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %26) #3
  %1163 = load i64, ptr %1162, align 8, !tbaa !9
  %1164 = getelementptr inbounds [3 x float], ptr %4, i64 0, i64 %1163
  %1165 = load volatile float, ptr %1164, align 4, !tbaa !5
  %1166 = load volatile float, ptr %12, align 4, !tbaa !5
  %1167 = getelementptr inbounds [3 x float], ptr %6, i64 0, i64 %1163
  %1168 = load volatile float, ptr %1167, align 4, !tbaa !5
  %1169 = call float @llvm.fmuladd.f32(float %1166, float %1168, float %1165)
  store float %1169, ptr %26, align 4, !tbaa !5
  %1170 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %28, ptr noundef nonnull %1162, ptr noundef nonnull %26, i64 noundef 0) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %26) #3
  %1171 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %24) #3
  %1172 = icmp eq ptr %1171, null
  br i1 %1172, label %1173, label %1161, !llvm.loop !17

1173:                                             ; preds = %1161, %1145
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %24) #3
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %24) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %23)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %22)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %21)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %20)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %19)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %18)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %17)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %16)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %15)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %14)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %13)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %12)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %11)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %10)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %9)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %8)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %7)
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %6) #3
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %5) #3
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %4) #3
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %3) #3
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
!3 = !{i64 2147511341}
!4 = !{i64 2147511853}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"long long", !7, i64 0}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = !{!15, !15, i64 0}
!15 = !{!"long", !7, i64 0}
!16 = distinct !{!16, !12, !13}
!17 = distinct !{!17, !12, !13}
