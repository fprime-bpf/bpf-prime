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
  store i64 %49, ptr %25, align 8, !tbaa !13
  %50 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %27, ptr noundef nonnull %25) #3
  %51 = load float, ptr %50, align 4, !tbaa !5
  %52 = fdiv float %51, 0x41B1DE7840000000
  %53 = load i64, ptr %47, align 8, !tbaa !9
  %54 = getelementptr inbounds [3 x float], ptr %5, i64 0, i64 %53
  store volatile float %52, ptr %54, align 4, !tbaa !5
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %25) #3
  %55 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %24) #3
  %56 = icmp eq ptr %55, null
  br i1 %56, label %57, label %46, !llvm.loop !15

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
  %86 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %24, i32 noundef 0, i32 noundef 5) #3
  %87 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %24) #3
  %88 = icmp eq ptr %87, null
  br i1 %88, label %1165, label %89

89:                                               ; preds = %83
  %90 = getelementptr inbounds nuw i8, ptr %4, i64 4
  %91 = getelementptr inbounds nuw i8, ptr %3, i64 4
  %92 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %93 = getelementptr inbounds nuw i8, ptr %3, i64 8
  %94 = getelementptr inbounds nuw i8, ptr %6, i64 4
  %95 = getelementptr inbounds nuw i8, ptr %6, i64 8
  br label %96

96:                                               ; preds = %89, %1150
  %97 = load volatile float, ptr %7, align 4, !tbaa !5
  %98 = load volatile float, ptr %11, align 4, !tbaa !5
  %99 = fsub float %97, %98
  store volatile float %99, ptr %15, align 4, !tbaa !5
  %100 = load volatile float, ptr %10, align 4, !tbaa !5
  %101 = load volatile float, ptr %15, align 4, !tbaa !5
  %102 = fmul float %100, %101
  store volatile float %102, ptr %16, align 4, !tbaa !5
  %103 = load volatile float, ptr %16, align 4, !tbaa !5
  store volatile float %103, ptr %17, align 4, !tbaa !5
  %104 = load volatile float, ptr %16, align 4, !tbaa !5
  %105 = load volatile float, ptr %9, align 4, !tbaa !5
  %106 = load volatile float, ptr %17, align 4, !tbaa !5
  %107 = fcmp olt float %106, 0.000000e+00
  %108 = fadd float %106, 0x401921FB60000000
  %109 = select i1 %107, float %108, float %106
  %110 = fcmp ult float %109, 0x401921FB60000000
  %111 = fadd float %109, 0xC01921FB60000000
  %112 = select i1 %110, float %109, float %111
  %113 = fcmp oge float %112, 0x3FD921FB60000000
  %114 = fadd float %112, 0xBFD921FB60000000
  %115 = select i1 %113, float %114, float %106
  %116 = select i1 %113, float 0x3FD87DE2A0000000, float 0.000000e+00
  %117 = select i1 %113, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %118 = fcmp oge float %112, 0x3FE921FB60000000
  %119 = fadd float %112, 0xBFE921FB60000000
  %120 = select i1 %118, float %119, float %115
  %121 = select i1 %118, float 0x3FE6A09E60000000, float %116
  %122 = select i1 %118, float 0x3FED906BC0000000, float %117
  %123 = fcmp oge float %112, 0x3FF2D97C80000000
  %124 = fadd float %112, 0xBFF2D97C80000000
  %125 = select i1 %123, float %124, float %120
  %126 = select i1 %123, float 0x3FED906BC0000000, float %121
  %127 = select i1 %123, float 1.000000e+00, float %122
  %128 = fcmp oge float %112, 0x3FF921FB60000000
  %129 = fadd float %112, 0xBFF921FB60000000
  %130 = select i1 %128, float %129, float %125
  %131 = select i1 %128, float 1.000000e+00, float %126
  %132 = select i1 %128, float 0x3FED906BC0000000, float %127
  %133 = fcmp oge float %112, 0x3FFF6A7A40000000
  %134 = fadd float %112, 0xBFFF6A7A40000000
  %135 = select i1 %133, float %134, float %130
  %136 = select i1 %133, float 0x3FED906BC0000000, float %131
  %137 = select i1 %133, float 0x3FE6A09E60000000, float %132
  %138 = fcmp oge float %112, 0x4002D97C80000000
  %139 = fadd float %112, 0xC002D97C80000000
  %140 = select i1 %138, float %139, float %135
  %141 = select i1 %138, float 0x3FE6A09E60000000, float %136
  %142 = select i1 %138, float 0x3FD87DE2A0000000, float %137
  %143 = fcmp oge float %112, 0x4005FDBC00000000
  %144 = fadd float %112, 0xC005FDBC00000000
  %145 = select i1 %143, float %144, float %140
  %146 = select i1 %143, float 0x3FD87DE2A0000000, float %141
  %147 = select i1 %143, float 0.000000e+00, float %142
  %148 = fcmp oge float %112, 0x400921FB60000000
  %149 = fadd float %112, 0xC00921FB60000000
  %150 = select i1 %148, float %149, float %145
  %151 = select i1 %148, float 0.000000e+00, float %146
  %152 = select i1 %148, float 0xBFD87DE2A0000000, float %147
  %153 = fcmp oge float %112, 0x400C463AC0000000
  %154 = fadd float %112, 0xC00C463AC0000000
  %155 = select i1 %153, float %154, float %150
  %156 = select i1 %153, float 0xBFD87DE2A0000000, float %151
  %157 = select i1 %153, float 0xBFE6A09E60000000, float %152
  %158 = fcmp oge float %112, 0x400F6A7A40000000
  %159 = fadd float %112, 0xC00F6A7A40000000
  %160 = select i1 %158, float %159, float %155
  %161 = select i1 %158, float 0xBFE6A09E60000000, float %156
  %162 = select i1 %158, float 0xBFED906BC0000000, float %157
  %163 = fcmp oge float %112, 0x4011475CE0000000
  %164 = fadd float %112, 0xC011475CE0000000
  %165 = select i1 %163, float %164, float %160
  %166 = select i1 %163, float 0xBFED906BC0000000, float %161
  %167 = select i1 %163, float -1.000000e+00, float %162
  %168 = fcmp oge float %112, 0x4012D97C80000000
  %169 = fadd float %112, 0xC012D97C80000000
  %170 = select i1 %168, float %169, float %165
  %171 = select i1 %168, float -1.000000e+00, float %166
  %172 = select i1 %168, float 0xBFED906BC0000000, float %167
  %173 = fcmp oge float %112, 0x40146B9C40000000
  %174 = fadd float %112, 0xC0146B9C40000000
  %175 = select i1 %173, float %174, float %170
  %176 = select i1 %173, float 0xBFED906BC0000000, float %171
  %177 = select i1 %173, float 0xBFE6A09E60000000, float %172
  %178 = fcmp oge float %112, 0x4015FDBC00000000
  %179 = fadd float %112, 0xC015FDBC00000000
  %180 = select i1 %178, float %179, float %175
  %181 = select i1 %178, float 0xBFE6A09E60000000, float %176
  %182 = select i1 %178, float 0xBFD87DE2A0000000, float %177
  %183 = fcmp oge float %112, 0x40178FDBA0000000
  %184 = fadd float %112, 0xC0178FDBA0000000
  %185 = select i1 %183, float %184, float %180
  %186 = select i1 %183, float 0xBFD87DE2A0000000, float %181
  %187 = select i1 %183, float 0.000000e+00, float %182
  %188 = fdiv float %185, 0x3FD921FB60000000
  %189 = fsub float %187, %186
  %190 = call float @llvm.fmuladd.f32(float %188, float %189, float %186)
  %191 = call float @llvm.fmuladd.f32(float %105, float %190, float %104)
  store volatile float %191, ptr %17, align 4, !tbaa !5
  %192 = load volatile float, ptr %16, align 4, !tbaa !5
  %193 = load volatile float, ptr %9, align 4, !tbaa !5
  %194 = load volatile float, ptr %17, align 4, !tbaa !5
  %195 = fcmp olt float %194, 0.000000e+00
  %196 = fadd float %194, 0x401921FB60000000
  %197 = select i1 %195, float %196, float %194
  %198 = fcmp ult float %197, 0x401921FB60000000
  %199 = fadd float %197, 0xC01921FB60000000
  %200 = select i1 %198, float %197, float %199
  %201 = fcmp oge float %200, 0x3FD921FB60000000
  %202 = fadd float %200, 0xBFD921FB60000000
  %203 = select i1 %201, float %202, float %194
  %204 = select i1 %201, float 0x3FD87DE2A0000000, float 0.000000e+00
  %205 = select i1 %201, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %206 = fcmp oge float %200, 0x3FE921FB60000000
  %207 = fadd float %200, 0xBFE921FB60000000
  %208 = select i1 %206, float %207, float %203
  %209 = select i1 %206, float 0x3FE6A09E60000000, float %204
  %210 = select i1 %206, float 0x3FED906BC0000000, float %205
  %211 = fcmp oge float %200, 0x3FF2D97C80000000
  %212 = fadd float %200, 0xBFF2D97C80000000
  %213 = select i1 %211, float %212, float %208
  %214 = select i1 %211, float 0x3FED906BC0000000, float %209
  %215 = select i1 %211, float 1.000000e+00, float %210
  %216 = fcmp oge float %200, 0x3FF921FB60000000
  %217 = fadd float %200, 0xBFF921FB60000000
  %218 = select i1 %216, float %217, float %213
  %219 = select i1 %216, float 1.000000e+00, float %214
  %220 = select i1 %216, float 0x3FED906BC0000000, float %215
  %221 = fcmp oge float %200, 0x3FFF6A7A40000000
  %222 = fadd float %200, 0xBFFF6A7A40000000
  %223 = select i1 %221, float %222, float %218
  %224 = select i1 %221, float 0x3FED906BC0000000, float %219
  %225 = select i1 %221, float 0x3FE6A09E60000000, float %220
  %226 = fcmp oge float %200, 0x4002D97C80000000
  %227 = fadd float %200, 0xC002D97C80000000
  %228 = select i1 %226, float %227, float %223
  %229 = select i1 %226, float 0x3FE6A09E60000000, float %224
  %230 = select i1 %226, float 0x3FD87DE2A0000000, float %225
  %231 = fcmp oge float %200, 0x4005FDBC00000000
  %232 = fadd float %200, 0xC005FDBC00000000
  %233 = select i1 %231, float %232, float %228
  %234 = select i1 %231, float 0x3FD87DE2A0000000, float %229
  %235 = select i1 %231, float 0.000000e+00, float %230
  %236 = fcmp oge float %200, 0x400921FB60000000
  %237 = fadd float %200, 0xC00921FB60000000
  %238 = select i1 %236, float %237, float %233
  %239 = select i1 %236, float 0.000000e+00, float %234
  %240 = select i1 %236, float 0xBFD87DE2A0000000, float %235
  %241 = fcmp oge float %200, 0x400C463AC0000000
  %242 = fadd float %200, 0xC00C463AC0000000
  %243 = select i1 %241, float %242, float %238
  %244 = select i1 %241, float 0xBFD87DE2A0000000, float %239
  %245 = select i1 %241, float 0xBFE6A09E60000000, float %240
  %246 = fcmp oge float %200, 0x400F6A7A40000000
  %247 = fadd float %200, 0xC00F6A7A40000000
  %248 = select i1 %246, float %247, float %243
  %249 = select i1 %246, float 0xBFE6A09E60000000, float %244
  %250 = select i1 %246, float 0xBFED906BC0000000, float %245
  %251 = fcmp oge float %200, 0x4011475CE0000000
  %252 = fadd float %200, 0xC011475CE0000000
  %253 = select i1 %251, float %252, float %248
  %254 = select i1 %251, float 0xBFED906BC0000000, float %249
  %255 = select i1 %251, float -1.000000e+00, float %250
  %256 = fcmp oge float %200, 0x4012D97C80000000
  %257 = fadd float %200, 0xC012D97C80000000
  %258 = select i1 %256, float %257, float %253
  %259 = select i1 %256, float -1.000000e+00, float %254
  %260 = select i1 %256, float 0xBFED906BC0000000, float %255
  %261 = fcmp oge float %200, 0x40146B9C40000000
  %262 = fadd float %200, 0xC0146B9C40000000
  %263 = select i1 %261, float %262, float %258
  %264 = select i1 %261, float 0xBFED906BC0000000, float %259
  %265 = select i1 %261, float 0xBFE6A09E60000000, float %260
  %266 = fcmp oge float %200, 0x4015FDBC00000000
  %267 = fadd float %200, 0xC015FDBC00000000
  %268 = select i1 %266, float %267, float %263
  %269 = select i1 %266, float 0xBFE6A09E60000000, float %264
  %270 = select i1 %266, float 0xBFD87DE2A0000000, float %265
  %271 = fcmp oge float %200, 0x40178FDBA0000000
  %272 = fadd float %200, 0xC0178FDBA0000000
  %273 = select i1 %271, float %272, float %268
  %274 = select i1 %271, float 0xBFD87DE2A0000000, float %269
  %275 = select i1 %271, float 0.000000e+00, float %270
  %276 = fdiv float %273, 0x3FD921FB60000000
  %277 = fsub float %275, %274
  %278 = call float @llvm.fmuladd.f32(float %276, float %277, float %274)
  %279 = call float @llvm.fmuladd.f32(float %193, float %278, float %192)
  store volatile float %279, ptr %17, align 4, !tbaa !5
  %280 = load volatile float, ptr %16, align 4, !tbaa !5
  %281 = load volatile float, ptr %9, align 4, !tbaa !5
  %282 = load volatile float, ptr %17, align 4, !tbaa !5
  %283 = fcmp olt float %282, 0.000000e+00
  %284 = fadd float %282, 0x401921FB60000000
  %285 = select i1 %283, float %284, float %282
  %286 = fcmp ult float %285, 0x401921FB60000000
  %287 = fadd float %285, 0xC01921FB60000000
  %288 = select i1 %286, float %285, float %287
  %289 = fcmp oge float %288, 0x3FD921FB60000000
  %290 = fadd float %288, 0xBFD921FB60000000
  %291 = select i1 %289, float %290, float %282
  %292 = select i1 %289, float 0x3FD87DE2A0000000, float 0.000000e+00
  %293 = select i1 %289, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %294 = fcmp oge float %288, 0x3FE921FB60000000
  %295 = fadd float %288, 0xBFE921FB60000000
  %296 = select i1 %294, float %295, float %291
  %297 = select i1 %294, float 0x3FE6A09E60000000, float %292
  %298 = select i1 %294, float 0x3FED906BC0000000, float %293
  %299 = fcmp oge float %288, 0x3FF2D97C80000000
  %300 = fadd float %288, 0xBFF2D97C80000000
  %301 = select i1 %299, float %300, float %296
  %302 = select i1 %299, float 0x3FED906BC0000000, float %297
  %303 = select i1 %299, float 1.000000e+00, float %298
  %304 = fcmp oge float %288, 0x3FF921FB60000000
  %305 = fadd float %288, 0xBFF921FB60000000
  %306 = select i1 %304, float %305, float %301
  %307 = select i1 %304, float 1.000000e+00, float %302
  %308 = select i1 %304, float 0x3FED906BC0000000, float %303
  %309 = fcmp oge float %288, 0x3FFF6A7A40000000
  %310 = fadd float %288, 0xBFFF6A7A40000000
  %311 = select i1 %309, float %310, float %306
  %312 = select i1 %309, float 0x3FED906BC0000000, float %307
  %313 = select i1 %309, float 0x3FE6A09E60000000, float %308
  %314 = fcmp oge float %288, 0x4002D97C80000000
  %315 = fadd float %288, 0xC002D97C80000000
  %316 = select i1 %314, float %315, float %311
  %317 = select i1 %314, float 0x3FE6A09E60000000, float %312
  %318 = select i1 %314, float 0x3FD87DE2A0000000, float %313
  %319 = fcmp oge float %288, 0x4005FDBC00000000
  %320 = fadd float %288, 0xC005FDBC00000000
  %321 = select i1 %319, float %320, float %316
  %322 = select i1 %319, float 0x3FD87DE2A0000000, float %317
  %323 = select i1 %319, float 0.000000e+00, float %318
  %324 = fcmp oge float %288, 0x400921FB60000000
  %325 = fadd float %288, 0xC00921FB60000000
  %326 = select i1 %324, float %325, float %321
  %327 = select i1 %324, float 0.000000e+00, float %322
  %328 = select i1 %324, float 0xBFD87DE2A0000000, float %323
  %329 = fcmp oge float %288, 0x400C463AC0000000
  %330 = fadd float %288, 0xC00C463AC0000000
  %331 = select i1 %329, float %330, float %326
  %332 = select i1 %329, float 0xBFD87DE2A0000000, float %327
  %333 = select i1 %329, float 0xBFE6A09E60000000, float %328
  %334 = fcmp oge float %288, 0x400F6A7A40000000
  %335 = fadd float %288, 0xC00F6A7A40000000
  %336 = select i1 %334, float %335, float %331
  %337 = select i1 %334, float 0xBFE6A09E60000000, float %332
  %338 = select i1 %334, float 0xBFED906BC0000000, float %333
  %339 = fcmp oge float %288, 0x4011475CE0000000
  %340 = fadd float %288, 0xC011475CE0000000
  %341 = select i1 %339, float %340, float %336
  %342 = select i1 %339, float 0xBFED906BC0000000, float %337
  %343 = select i1 %339, float -1.000000e+00, float %338
  %344 = fcmp oge float %288, 0x4012D97C80000000
  %345 = fadd float %288, 0xC012D97C80000000
  %346 = select i1 %344, float %345, float %341
  %347 = select i1 %344, float -1.000000e+00, float %342
  %348 = select i1 %344, float 0xBFED906BC0000000, float %343
  %349 = fcmp oge float %288, 0x40146B9C40000000
  %350 = fadd float %288, 0xC0146B9C40000000
  %351 = select i1 %349, float %350, float %346
  %352 = select i1 %349, float 0xBFED906BC0000000, float %347
  %353 = select i1 %349, float 0xBFE6A09E60000000, float %348
  %354 = fcmp oge float %288, 0x4015FDBC00000000
  %355 = fadd float %288, 0xC015FDBC00000000
  %356 = select i1 %354, float %355, float %351
  %357 = select i1 %354, float 0xBFE6A09E60000000, float %352
  %358 = select i1 %354, float 0xBFD87DE2A0000000, float %353
  %359 = fcmp oge float %288, 0x40178FDBA0000000
  %360 = fadd float %288, 0xC0178FDBA0000000
  %361 = select i1 %359, float %360, float %356
  %362 = select i1 %359, float 0xBFD87DE2A0000000, float %357
  %363 = select i1 %359, float 0.000000e+00, float %358
  %364 = fdiv float %361, 0x3FD921FB60000000
  %365 = fsub float %363, %362
  %366 = call float @llvm.fmuladd.f32(float %364, float %365, float %362)
  %367 = call float @llvm.fmuladd.f32(float %281, float %366, float %280)
  store volatile float %367, ptr %17, align 4, !tbaa !5
  %368 = load volatile float, ptr %16, align 4, !tbaa !5
  %369 = load volatile float, ptr %9, align 4, !tbaa !5
  %370 = load volatile float, ptr %17, align 4, !tbaa !5
  %371 = fcmp olt float %370, 0.000000e+00
  %372 = fadd float %370, 0x401921FB60000000
  %373 = select i1 %371, float %372, float %370
  %374 = fcmp ult float %373, 0x401921FB60000000
  %375 = fadd float %373, 0xC01921FB60000000
  %376 = select i1 %374, float %373, float %375
  %377 = fcmp oge float %376, 0x3FD921FB60000000
  %378 = fadd float %376, 0xBFD921FB60000000
  %379 = select i1 %377, float %378, float %370
  %380 = select i1 %377, float 0x3FD87DE2A0000000, float 0.000000e+00
  %381 = select i1 %377, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %382 = fcmp oge float %376, 0x3FE921FB60000000
  %383 = fadd float %376, 0xBFE921FB60000000
  %384 = select i1 %382, float %383, float %379
  %385 = select i1 %382, float 0x3FE6A09E60000000, float %380
  %386 = select i1 %382, float 0x3FED906BC0000000, float %381
  %387 = fcmp oge float %376, 0x3FF2D97C80000000
  %388 = fadd float %376, 0xBFF2D97C80000000
  %389 = select i1 %387, float %388, float %384
  %390 = select i1 %387, float 0x3FED906BC0000000, float %385
  %391 = select i1 %387, float 1.000000e+00, float %386
  %392 = fcmp oge float %376, 0x3FF921FB60000000
  %393 = fadd float %376, 0xBFF921FB60000000
  %394 = select i1 %392, float %393, float %389
  %395 = select i1 %392, float 1.000000e+00, float %390
  %396 = select i1 %392, float 0x3FED906BC0000000, float %391
  %397 = fcmp oge float %376, 0x3FFF6A7A40000000
  %398 = fadd float %376, 0xBFFF6A7A40000000
  %399 = select i1 %397, float %398, float %394
  %400 = select i1 %397, float 0x3FED906BC0000000, float %395
  %401 = select i1 %397, float 0x3FE6A09E60000000, float %396
  %402 = fcmp oge float %376, 0x4002D97C80000000
  %403 = fadd float %376, 0xC002D97C80000000
  %404 = select i1 %402, float %403, float %399
  %405 = select i1 %402, float 0x3FE6A09E60000000, float %400
  %406 = select i1 %402, float 0x3FD87DE2A0000000, float %401
  %407 = fcmp oge float %376, 0x4005FDBC00000000
  %408 = fadd float %376, 0xC005FDBC00000000
  %409 = select i1 %407, float %408, float %404
  %410 = select i1 %407, float 0x3FD87DE2A0000000, float %405
  %411 = select i1 %407, float 0.000000e+00, float %406
  %412 = fcmp oge float %376, 0x400921FB60000000
  %413 = fadd float %376, 0xC00921FB60000000
  %414 = select i1 %412, float %413, float %409
  %415 = select i1 %412, float 0.000000e+00, float %410
  %416 = select i1 %412, float 0xBFD87DE2A0000000, float %411
  %417 = fcmp oge float %376, 0x400C463AC0000000
  %418 = fadd float %376, 0xC00C463AC0000000
  %419 = select i1 %417, float %418, float %414
  %420 = select i1 %417, float 0xBFD87DE2A0000000, float %415
  %421 = select i1 %417, float 0xBFE6A09E60000000, float %416
  %422 = fcmp oge float %376, 0x400F6A7A40000000
  %423 = fadd float %376, 0xC00F6A7A40000000
  %424 = select i1 %422, float %423, float %419
  %425 = select i1 %422, float 0xBFE6A09E60000000, float %420
  %426 = select i1 %422, float 0xBFED906BC0000000, float %421
  %427 = fcmp oge float %376, 0x4011475CE0000000
  %428 = fadd float %376, 0xC011475CE0000000
  %429 = select i1 %427, float %428, float %424
  %430 = select i1 %427, float 0xBFED906BC0000000, float %425
  %431 = select i1 %427, float -1.000000e+00, float %426
  %432 = fcmp oge float %376, 0x4012D97C80000000
  %433 = fadd float %376, 0xC012D97C80000000
  %434 = select i1 %432, float %433, float %429
  %435 = select i1 %432, float -1.000000e+00, float %430
  %436 = select i1 %432, float 0xBFED906BC0000000, float %431
  %437 = fcmp oge float %376, 0x40146B9C40000000
  %438 = fadd float %376, 0xC0146B9C40000000
  %439 = select i1 %437, float %438, float %434
  %440 = select i1 %437, float 0xBFED906BC0000000, float %435
  %441 = select i1 %437, float 0xBFE6A09E60000000, float %436
  %442 = fcmp oge float %376, 0x4015FDBC00000000
  %443 = fadd float %376, 0xC015FDBC00000000
  %444 = select i1 %442, float %443, float %439
  %445 = select i1 %442, float 0xBFE6A09E60000000, float %440
  %446 = select i1 %442, float 0xBFD87DE2A0000000, float %441
  %447 = fcmp oge float %376, 0x40178FDBA0000000
  %448 = fadd float %376, 0xC0178FDBA0000000
  %449 = select i1 %447, float %448, float %444
  %450 = select i1 %447, float 0xBFD87DE2A0000000, float %445
  %451 = select i1 %447, float 0.000000e+00, float %446
  %452 = fdiv float %449, 0x3FD921FB60000000
  %453 = fsub float %451, %450
  %454 = call float @llvm.fmuladd.f32(float %452, float %453, float %450)
  %455 = call float @llvm.fmuladd.f32(float %369, float %454, float %368)
  store volatile float %455, ptr %17, align 4, !tbaa !5
  %456 = load volatile float, ptr %16, align 4, !tbaa !5
  %457 = load volatile float, ptr %9, align 4, !tbaa !5
  %458 = load volatile float, ptr %17, align 4, !tbaa !5
  %459 = fcmp olt float %458, 0.000000e+00
  %460 = fadd float %458, 0x401921FB60000000
  %461 = select i1 %459, float %460, float %458
  %462 = fcmp ult float %461, 0x401921FB60000000
  %463 = fadd float %461, 0xC01921FB60000000
  %464 = select i1 %462, float %461, float %463
  %465 = fcmp oge float %464, 0x3FD921FB60000000
  %466 = fadd float %464, 0xBFD921FB60000000
  %467 = select i1 %465, float %466, float %458
  %468 = select i1 %465, float 0x3FD87DE2A0000000, float 0.000000e+00
  %469 = select i1 %465, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %470 = fcmp oge float %464, 0x3FE921FB60000000
  %471 = fadd float %464, 0xBFE921FB60000000
  %472 = select i1 %470, float %471, float %467
  %473 = select i1 %470, float 0x3FE6A09E60000000, float %468
  %474 = select i1 %470, float 0x3FED906BC0000000, float %469
  %475 = fcmp oge float %464, 0x3FF2D97C80000000
  %476 = fadd float %464, 0xBFF2D97C80000000
  %477 = select i1 %475, float %476, float %472
  %478 = select i1 %475, float 0x3FED906BC0000000, float %473
  %479 = select i1 %475, float 1.000000e+00, float %474
  %480 = fcmp oge float %464, 0x3FF921FB60000000
  %481 = fadd float %464, 0xBFF921FB60000000
  %482 = select i1 %480, float %481, float %477
  %483 = select i1 %480, float 1.000000e+00, float %478
  %484 = select i1 %480, float 0x3FED906BC0000000, float %479
  %485 = fcmp oge float %464, 0x3FFF6A7A40000000
  %486 = fadd float %464, 0xBFFF6A7A40000000
  %487 = select i1 %485, float %486, float %482
  %488 = select i1 %485, float 0x3FED906BC0000000, float %483
  %489 = select i1 %485, float 0x3FE6A09E60000000, float %484
  %490 = fcmp oge float %464, 0x4002D97C80000000
  %491 = fadd float %464, 0xC002D97C80000000
  %492 = select i1 %490, float %491, float %487
  %493 = select i1 %490, float 0x3FE6A09E60000000, float %488
  %494 = select i1 %490, float 0x3FD87DE2A0000000, float %489
  %495 = fcmp oge float %464, 0x4005FDBC00000000
  %496 = fadd float %464, 0xC005FDBC00000000
  %497 = select i1 %495, float %496, float %492
  %498 = select i1 %495, float 0x3FD87DE2A0000000, float %493
  %499 = select i1 %495, float 0.000000e+00, float %494
  %500 = fcmp oge float %464, 0x400921FB60000000
  %501 = fadd float %464, 0xC00921FB60000000
  %502 = select i1 %500, float %501, float %497
  %503 = select i1 %500, float 0.000000e+00, float %498
  %504 = select i1 %500, float 0xBFD87DE2A0000000, float %499
  %505 = fcmp oge float %464, 0x400C463AC0000000
  %506 = fadd float %464, 0xC00C463AC0000000
  %507 = select i1 %505, float %506, float %502
  %508 = select i1 %505, float 0xBFD87DE2A0000000, float %503
  %509 = select i1 %505, float 0xBFE6A09E60000000, float %504
  %510 = fcmp oge float %464, 0x400F6A7A40000000
  %511 = fadd float %464, 0xC00F6A7A40000000
  %512 = select i1 %510, float %511, float %507
  %513 = select i1 %510, float 0xBFE6A09E60000000, float %508
  %514 = select i1 %510, float 0xBFED906BC0000000, float %509
  %515 = fcmp oge float %464, 0x4011475CE0000000
  %516 = fadd float %464, 0xC011475CE0000000
  %517 = select i1 %515, float %516, float %512
  %518 = select i1 %515, float 0xBFED906BC0000000, float %513
  %519 = select i1 %515, float -1.000000e+00, float %514
  %520 = fcmp oge float %464, 0x4012D97C80000000
  %521 = fadd float %464, 0xC012D97C80000000
  %522 = select i1 %520, float %521, float %517
  %523 = select i1 %520, float -1.000000e+00, float %518
  %524 = select i1 %520, float 0xBFED906BC0000000, float %519
  %525 = fcmp oge float %464, 0x40146B9C40000000
  %526 = fadd float %464, 0xC0146B9C40000000
  %527 = select i1 %525, float %526, float %522
  %528 = select i1 %525, float 0xBFED906BC0000000, float %523
  %529 = select i1 %525, float 0xBFE6A09E60000000, float %524
  %530 = fcmp oge float %464, 0x4015FDBC00000000
  %531 = fadd float %464, 0xC015FDBC00000000
  %532 = select i1 %530, float %531, float %527
  %533 = select i1 %530, float 0xBFE6A09E60000000, float %528
  %534 = select i1 %530, float 0xBFD87DE2A0000000, float %529
  %535 = fcmp oge float %464, 0x40178FDBA0000000
  %536 = fadd float %464, 0xC0178FDBA0000000
  %537 = select i1 %535, float %536, float %532
  %538 = select i1 %535, float 0xBFD87DE2A0000000, float %533
  %539 = select i1 %535, float 0.000000e+00, float %534
  %540 = fdiv float %537, 0x3FD921FB60000000
  %541 = fsub float %539, %538
  %542 = call float @llvm.fmuladd.f32(float %540, float %541, float %538)
  %543 = call float @llvm.fmuladd.f32(float %457, float %542, float %456)
  store volatile float %543, ptr %17, align 4, !tbaa !5
  %544 = load volatile float, ptr %9, align 4, !tbaa !5
  %545 = fadd float %544, 1.000000e+00
  %546 = fcmp ugt float %545, 0.000000e+00
  br i1 %546, label %547, label %558

547:                                              ; preds = %96
  %548 = fmul float %545, 5.000000e-01
  %549 = bitcast float %545 to i32
  %550 = ashr i32 %549, 1
  %551 = sub nsw i32 1597463007, %550
  %552 = bitcast i32 %551 to float
  %553 = fneg float %552
  %554 = fmul float %548, %553
  %555 = call float @llvm.fmuladd.f32(float %554, float %552, float 1.500000e+00)
  %556 = fmul float %555, %552
  %557 = fdiv float 1.000000e+00, %556
  br label %558

558:                                              ; preds = %96, %547
  %559 = phi float [ %557, %547 ], [ 0.000000e+00, %96 ]
  %560 = load volatile float, ptr %17, align 4, !tbaa !5
  %561 = fmul float %560, 5.000000e-01
  %562 = fcmp olt float %561, 0.000000e+00
  %563 = fadd float %561, 0x401921FB60000000
  %564 = select i1 %562, float %563, float %561
  %565 = fcmp ult float %564, 0x401921FB60000000
  %566 = fadd float %564, 0xC01921FB60000000
  %567 = select i1 %565, float %564, float %566
  %568 = fcmp oge float %567, 0x3FD921FB60000000
  %569 = fadd float %567, 0xBFD921FB60000000
  %570 = select i1 %568, float %569, float %561
  %571 = select i1 %568, float 0x3FD87DE2A0000000, float 0.000000e+00
  %572 = select i1 %568, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %573 = fcmp oge float %567, 0x3FE921FB60000000
  %574 = fadd float %567, 0xBFE921FB60000000
  %575 = select i1 %573, float %574, float %570
  %576 = select i1 %573, float 0x3FE6A09E60000000, float %571
  %577 = select i1 %573, float 0x3FED906BC0000000, float %572
  %578 = fcmp oge float %567, 0x3FF2D97C80000000
  %579 = fadd float %567, 0xBFF2D97C80000000
  %580 = select i1 %578, float %579, float %575
  %581 = select i1 %578, float 0x3FED906BC0000000, float %576
  %582 = select i1 %578, float 1.000000e+00, float %577
  %583 = fcmp oge float %567, 0x3FF921FB60000000
  %584 = fadd float %567, 0xBFF921FB60000000
  %585 = select i1 %583, float %584, float %580
  %586 = select i1 %583, float 1.000000e+00, float %581
  %587 = select i1 %583, float 0x3FED906BC0000000, float %582
  %588 = fcmp oge float %567, 0x3FFF6A7A40000000
  %589 = fadd float %567, 0xBFFF6A7A40000000
  %590 = select i1 %588, float %589, float %585
  %591 = select i1 %588, float 0x3FED906BC0000000, float %586
  %592 = select i1 %588, float 0x3FE6A09E60000000, float %587
  %593 = fcmp oge float %567, 0x4002D97C80000000
  %594 = fadd float %567, 0xC002D97C80000000
  %595 = select i1 %593, float %594, float %590
  %596 = select i1 %593, float 0x3FE6A09E60000000, float %591
  %597 = select i1 %593, float 0x3FD87DE2A0000000, float %592
  %598 = fcmp oge float %567, 0x4005FDBC00000000
  %599 = fadd float %567, 0xC005FDBC00000000
  %600 = select i1 %598, float %599, float %595
  %601 = select i1 %598, float 0x3FD87DE2A0000000, float %596
  %602 = select i1 %598, float 0.000000e+00, float %597
  %603 = fcmp oge float %567, 0x400921FB60000000
  %604 = fadd float %567, 0xC00921FB60000000
  %605 = select i1 %603, float %604, float %600
  %606 = select i1 %603, float 0.000000e+00, float %601
  %607 = select i1 %603, float 0xBFD87DE2A0000000, float %602
  %608 = fcmp oge float %567, 0x400C463AC0000000
  %609 = fadd float %567, 0xC00C463AC0000000
  %610 = select i1 %608, float %609, float %605
  %611 = select i1 %608, float 0xBFD87DE2A0000000, float %606
  %612 = select i1 %608, float 0xBFE6A09E60000000, float %607
  %613 = fcmp oge float %567, 0x400F6A7A40000000
  %614 = fadd float %567, 0xC00F6A7A40000000
  %615 = select i1 %613, float %614, float %610
  %616 = select i1 %613, float 0xBFE6A09E60000000, float %611
  %617 = select i1 %613, float 0xBFED906BC0000000, float %612
  %618 = fcmp oge float %567, 0x4011475CE0000000
  %619 = fadd float %567, 0xC011475CE0000000
  %620 = select i1 %618, float %619, float %615
  %621 = select i1 %618, float 0xBFED906BC0000000, float %616
  %622 = select i1 %618, float -1.000000e+00, float %617
  %623 = fcmp oge float %567, 0x4012D97C80000000
  %624 = fadd float %567, 0xC012D97C80000000
  %625 = select i1 %623, float %624, float %620
  %626 = select i1 %623, float -1.000000e+00, float %621
  %627 = select i1 %623, float 0xBFED906BC0000000, float %622
  %628 = fcmp oge float %567, 0x40146B9C40000000
  %629 = fadd float %567, 0xC0146B9C40000000
  %630 = select i1 %628, float %629, float %625
  %631 = select i1 %628, float 0xBFED906BC0000000, float %626
  %632 = select i1 %628, float 0xBFE6A09E60000000, float %627
  %633 = fcmp oge float %567, 0x4015FDBC00000000
  %634 = fadd float %567, 0xC015FDBC00000000
  %635 = select i1 %633, float %634, float %630
  %636 = select i1 %633, float 0xBFE6A09E60000000, float %631
  %637 = select i1 %633, float 0xBFD87DE2A0000000, float %632
  %638 = fcmp oge float %567, 0x40178FDBA0000000
  %639 = fadd float %567, 0xC0178FDBA0000000
  %640 = select i1 %638, float %639, float %635
  %641 = select i1 %638, float 0xBFD87DE2A0000000, float %636
  %642 = select i1 %638, float 0.000000e+00, float %637
  %643 = fdiv float %640, 0x3FD921FB60000000
  %644 = fsub float %642, %641
  %645 = call float @llvm.fmuladd.f32(float %643, float %644, float %641)
  %646 = fmul float %559, %645
  %647 = load volatile float, ptr %9, align 4, !tbaa !5
  %648 = fsub float 1.000000e+00, %647
  %649 = fcmp ugt float %648, 0.000000e+00
  br i1 %649, label %650, label %661

650:                                              ; preds = %558
  %651 = fmul float %648, 5.000000e-01
  %652 = bitcast float %648 to i32
  %653 = ashr i32 %652, 1
  %654 = sub nsw i32 1597463007, %653
  %655 = bitcast i32 %654 to float
  %656 = fneg float %655
  %657 = fmul float %651, %656
  %658 = call float @llvm.fmuladd.f32(float %657, float %655, float 1.500000e+00)
  %659 = fmul float %658, %655
  %660 = fdiv float 1.000000e+00, %659
  br label %661

661:                                              ; preds = %558, %650
  %662 = phi float [ %660, %650 ], [ 0.000000e+00, %558 ]
  %663 = load volatile float, ptr %17, align 4, !tbaa !5
  %664 = fmul float %663, 5.000000e-01
  %665 = fcmp olt float %664, 0.000000e+00
  %666 = fadd float %664, 0x401921FB60000000
  %667 = select i1 %665, float %666, float %664
  %668 = fcmp ult float %667, 0x401921FB60000000
  %669 = fadd float %667, 0xC01921FB60000000
  %670 = select i1 %668, float %667, float %669
  %671 = fcmp oge float %670, 0x3FD921FB60000000
  %672 = fadd float %670, 0xBFD921FB60000000
  %673 = select i1 %671, float %672, float %664
  %674 = select i1 %671, float 0x3FED906BC0000000, float 1.000000e+00
  %675 = select i1 %671, float 0x3FE6A09E60000000, float 0x3FED906BC0000000
  %676 = fcmp oge float %670, 0x3FE921FB60000000
  %677 = fadd float %670, 0xBFE921FB60000000
  %678 = select i1 %676, float %677, float %673
  %679 = select i1 %676, float 0x3FE6A09E60000000, float %674
  %680 = select i1 %676, float 0x3FD87DE2A0000000, float %675
  %681 = fcmp oge float %670, 0x3FF2D97C80000000
  %682 = fadd float %670, 0xBFF2D97C80000000
  %683 = select i1 %681, float %682, float %678
  %684 = select i1 %681, float 0x3FD87DE2A0000000, float %679
  %685 = select i1 %681, float 0.000000e+00, float %680
  %686 = fcmp oge float %670, 0x3FF921FB60000000
  %687 = fadd float %670, 0xBFF921FB60000000
  %688 = select i1 %686, float %687, float %683
  %689 = select i1 %686, float 0.000000e+00, float %684
  %690 = select i1 %686, float 0xBFD87DE2A0000000, float %685
  %691 = fcmp oge float %670, 0x3FFF6A7A40000000
  %692 = fadd float %670, 0xBFFF6A7A40000000
  %693 = select i1 %691, float %692, float %688
  %694 = select i1 %691, float 0xBFD87DE2A0000000, float %689
  %695 = select i1 %691, float 0xBFE6A09E60000000, float %690
  %696 = fcmp oge float %670, 0x4002D97C80000000
  %697 = fadd float %670, 0xC002D97C80000000
  %698 = select i1 %696, float %697, float %693
  %699 = select i1 %696, float 0xBFE6A09E60000000, float %694
  %700 = select i1 %696, float 0xBFED906BC0000000, float %695
  %701 = fcmp oge float %670, 0x4005FDBC00000000
  %702 = fadd float %670, 0xC005FDBC00000000
  %703 = select i1 %701, float %702, float %698
  %704 = select i1 %701, float 0xBFED906BC0000000, float %699
  %705 = select i1 %701, float -1.000000e+00, float %700
  %706 = fcmp oge float %670, 0x400921FB60000000
  %707 = fadd float %670, 0xC00921FB60000000
  %708 = select i1 %706, float %707, float %703
  %709 = select i1 %706, float -1.000000e+00, float %704
  %710 = select i1 %706, float 0xBFED906BC0000000, float %705
  %711 = fcmp oge float %670, 0x400C463AC0000000
  %712 = fadd float %670, 0xC00C463AC0000000
  %713 = select i1 %711, float %712, float %708
  %714 = select i1 %711, float 0xBFED906BC0000000, float %709
  %715 = select i1 %711, float 0xBFE6A09E60000000, float %710
  %716 = fcmp oge float %670, 0x400F6A7A40000000
  %717 = fadd float %670, 0xC00F6A7A40000000
  %718 = select i1 %716, float %717, float %713
  %719 = select i1 %716, float 0xBFE6A09E60000000, float %714
  %720 = select i1 %716, float 0xBFD87DE2A0000000, float %715
  %721 = fcmp oge float %670, 0x4011475CE0000000
  %722 = fadd float %670, 0xC011475CE0000000
  %723 = select i1 %721, float %722, float %718
  %724 = select i1 %721, float 0xBFD87DE2A0000000, float %719
  %725 = select i1 %721, float 0.000000e+00, float %720
  %726 = fcmp oge float %670, 0x4012D97C80000000
  %727 = fadd float %670, 0xC012D97C80000000
  %728 = select i1 %726, float %727, float %723
  %729 = select i1 %726, float 0.000000e+00, float %724
  %730 = select i1 %726, float 0x3FD87DE2A0000000, float %725
  %731 = fcmp oge float %670, 0x40146B9C40000000
  %732 = fadd float %670, 0xC0146B9C40000000
  %733 = select i1 %731, float %732, float %728
  %734 = select i1 %731, float 0x3FD87DE2A0000000, float %729
  %735 = select i1 %731, float 0x3FE6A09E60000000, float %730
  %736 = fcmp oge float %670, 0x4015FDBC00000000
  %737 = fadd float %670, 0xC015FDBC00000000
  %738 = select i1 %736, float %737, float %733
  %739 = select i1 %736, float 0x3FE6A09E60000000, float %734
  %740 = select i1 %736, float 0x3FED906BC0000000, float %735
  %741 = fcmp oge float %670, 0x40178FDBA0000000
  %742 = fadd float %670, 0xC0178FDBA0000000
  %743 = select i1 %741, float %742, float %738
  %744 = select i1 %741, float 0x3FED906BC0000000, float %739
  %745 = select i1 %741, float 1.000000e+00, float %740
  %746 = fdiv float %743, 0x3FD921FB60000000
  %747 = fsub float %745, %744
  %748 = call float @llvm.fmuladd.f32(float %746, float %747, float %744)
  %749 = fmul float %662, %748
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %1)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2)
  store float %646, ptr %1, align 8, !tbaa !5
  store float %749, ptr %2, align 8, !tbaa !5
  %750 = load i64, ptr %1, align 8
  %751 = and i64 %750, 4294967295
  %752 = load i64, ptr %2, align 8
  %753 = and i64 %752, 4294967295
  %754 = icmp eq i64 %753, 0
  %755 = icmp eq i64 %751, 0
  %756 = select i1 %754, i1 %755, i1 false
  %757 = trunc i64 %752 to i32
  %758 = bitcast i32 %757 to float
  %759 = trunc i64 %750 to i32
  %760 = bitcast i32 %759 to float
  br i1 %756, label %788, label %761

761:                                              ; preds = %661
  %762 = and i64 %750, 2147483647
  %763 = and i64 %752, 2147483647
  %764 = icmp samesign ugt i64 %763, %762
  br i1 %764, label %765, label %767

765:                                              ; preds = %761
  %766 = fdiv float %760, %758
  br label %769

767:                                              ; preds = %761
  %768 = fdiv float %758, %760
  br label %769

769:                                              ; preds = %767, %765
  %770 = phi float [ %766, %765 ], [ %768, %767 ]
  %771 = fneg float %770
  %772 = fmul float %770, %771
  %773 = fmul float %770, %772
  %774 = fdiv float %773, 3.000000e+00
  %775 = fmul float %772, %774
  %776 = fdiv float %775, 5.000000e+00
  %777 = fmul float %772, %776
  %778 = fdiv float %777, 7.000000e+00
  %779 = fmul float %772, %778
  %780 = fdiv float %779, 9.000000e+00
  %781 = fadd float %770, %774
  %782 = fadd float %781, %776
  %783 = fadd float %782, %778
  %784 = fadd float %783, %780
  %785 = fsub float 0x3FF921FB40000000, %784
  %786 = select i1 %764, float %784, float %785
  %787 = fmul float %786, 2.000000e+00
  br label %788

788:                                              ; preds = %661, %769
  %789 = phi float [ %787, %769 ], [ 0.000000e+00, %661 ]
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %1)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2)
  store volatile float %789, ptr %18, align 4, !tbaa !5
  %790 = load volatile float, ptr %8, align 4, !tbaa !5
  %791 = load volatile float, ptr %9, align 4, !tbaa !5
  %792 = load volatile float, ptr %17, align 4, !tbaa !5
  %793 = fcmp olt float %792, 0.000000e+00
  %794 = fadd float %792, 0x401921FB60000000
  %795 = select i1 %793, float %794, float %792
  %796 = fcmp ult float %795, 0x401921FB60000000
  %797 = fadd float %795, 0xC01921FB60000000
  %798 = select i1 %796, float %795, float %797
  %799 = fcmp oge float %798, 0x3FD921FB60000000
  %800 = fadd float %798, 0xBFD921FB60000000
  %801 = select i1 %799, float %800, float %792
  %802 = select i1 %799, float 0x3FED906BC0000000, float 1.000000e+00
  %803 = select i1 %799, float 0x3FE6A09E60000000, float 0x3FED906BC0000000
  %804 = fcmp oge float %798, 0x3FE921FB60000000
  %805 = fadd float %798, 0xBFE921FB60000000
  %806 = select i1 %804, float %805, float %801
  %807 = select i1 %804, float 0x3FE6A09E60000000, float %802
  %808 = select i1 %804, float 0x3FD87DE2A0000000, float %803
  %809 = fcmp oge float %798, 0x3FF2D97C80000000
  %810 = fadd float %798, 0xBFF2D97C80000000
  %811 = select i1 %809, float %810, float %806
  %812 = select i1 %809, float 0x3FD87DE2A0000000, float %807
  %813 = select i1 %809, float 0.000000e+00, float %808
  %814 = fcmp oge float %798, 0x3FF921FB60000000
  %815 = fadd float %798, 0xBFF921FB60000000
  %816 = select i1 %814, float %815, float %811
  %817 = select i1 %814, float 0.000000e+00, float %812
  %818 = select i1 %814, float 0xBFD87DE2A0000000, float %813
  %819 = fcmp oge float %798, 0x3FFF6A7A40000000
  %820 = fadd float %798, 0xBFFF6A7A40000000
  %821 = select i1 %819, float %820, float %816
  %822 = select i1 %819, float 0xBFD87DE2A0000000, float %817
  %823 = select i1 %819, float 0xBFE6A09E60000000, float %818
  %824 = fcmp oge float %798, 0x4002D97C80000000
  %825 = fadd float %798, 0xC002D97C80000000
  %826 = select i1 %824, float %825, float %821
  %827 = select i1 %824, float 0xBFE6A09E60000000, float %822
  %828 = select i1 %824, float 0xBFED906BC0000000, float %823
  %829 = fcmp oge float %798, 0x4005FDBC00000000
  %830 = fadd float %798, 0xC005FDBC00000000
  %831 = select i1 %829, float %830, float %826
  %832 = select i1 %829, float 0xBFED906BC0000000, float %827
  %833 = select i1 %829, float -1.000000e+00, float %828
  %834 = fcmp oge float %798, 0x400921FB60000000
  %835 = fadd float %798, 0xC00921FB60000000
  %836 = select i1 %834, float %835, float %831
  %837 = select i1 %834, float -1.000000e+00, float %832
  %838 = select i1 %834, float 0xBFED906BC0000000, float %833
  %839 = fcmp oge float %798, 0x400C463AC0000000
  %840 = fadd float %798, 0xC00C463AC0000000
  %841 = select i1 %839, float %840, float %836
  %842 = select i1 %839, float 0xBFED906BC0000000, float %837
  %843 = select i1 %839, float 0xBFE6A09E60000000, float %838
  %844 = fcmp oge float %798, 0x400F6A7A40000000
  %845 = fadd float %798, 0xC00F6A7A40000000
  %846 = select i1 %844, float %845, float %841
  %847 = select i1 %844, float 0xBFE6A09E60000000, float %842
  %848 = select i1 %844, float 0xBFD87DE2A0000000, float %843
  %849 = fcmp oge float %798, 0x4011475CE0000000
  %850 = fadd float %798, 0xC011475CE0000000
  %851 = select i1 %849, float %850, float %846
  %852 = select i1 %849, float 0xBFD87DE2A0000000, float %847
  %853 = select i1 %849, float 0.000000e+00, float %848
  %854 = fcmp oge float %798, 0x4012D97C80000000
  %855 = fadd float %798, 0xC012D97C80000000
  %856 = select i1 %854, float %855, float %851
  %857 = select i1 %854, float 0.000000e+00, float %852
  %858 = select i1 %854, float 0x3FD87DE2A0000000, float %853
  %859 = fcmp oge float %798, 0x40146B9C40000000
  %860 = fadd float %798, 0xC0146B9C40000000
  %861 = select i1 %859, float %860, float %856
  %862 = select i1 %859, float 0x3FD87DE2A0000000, float %857
  %863 = select i1 %859, float 0x3FE6A09E60000000, float %858
  %864 = fcmp oge float %798, 0x4015FDBC00000000
  %865 = fadd float %798, 0xC015FDBC00000000
  %866 = select i1 %864, float %865, float %861
  %867 = select i1 %864, float 0x3FE6A09E60000000, float %862
  %868 = select i1 %864, float 0x3FED906BC0000000, float %863
  %869 = fcmp oge float %798, 0x40178FDBA0000000
  %870 = fadd float %798, 0xC0178FDBA0000000
  %871 = select i1 %869, float %870, float %866
  %872 = select i1 %869, float 0x3FED906BC0000000, float %867
  %873 = select i1 %869, float 1.000000e+00, float %868
  %874 = fdiv float %871, 0x3FD921FB60000000
  %875 = fsub float %873, %872
  %876 = call float @llvm.fmuladd.f32(float %874, float %875, float %872)
  %877 = fneg float %791
  %878 = call float @llvm.fmuladd.f32(float %877, float %876, float 1.000000e+00)
  %879 = fmul float %790, %878
  store volatile float %879, ptr %19, align 4, !tbaa !5
  %880 = load volatile float, ptr %18, align 4, !tbaa !5
  %881 = fcmp olt float %880, 0.000000e+00
  %882 = fadd float %880, 0x401921FB60000000
  %883 = select i1 %881, float %882, float %880
  %884 = fcmp ult float %883, 0x401921FB60000000
  %885 = fadd float %883, 0xC01921FB60000000
  %886 = select i1 %884, float %883, float %885
  %887 = fcmp oge float %886, 0x3FD921FB60000000
  %888 = fadd float %886, 0xBFD921FB60000000
  %889 = select i1 %887, float %888, float %880
  %890 = select i1 %887, float 0x3FED906BC0000000, float 1.000000e+00
  %891 = select i1 %887, float 0x3FE6A09E60000000, float 0x3FED906BC0000000
  %892 = fcmp oge float %886, 0x3FE921FB60000000
  %893 = fadd float %886, 0xBFE921FB60000000
  %894 = select i1 %892, float %893, float %889
  %895 = select i1 %892, float 0x3FE6A09E60000000, float %890
  %896 = select i1 %892, float 0x3FD87DE2A0000000, float %891
  %897 = fcmp oge float %886, 0x3FF2D97C80000000
  %898 = fadd float %886, 0xBFF2D97C80000000
  %899 = select i1 %897, float %898, float %894
  %900 = select i1 %897, float 0x3FD87DE2A0000000, float %895
  %901 = select i1 %897, float 0.000000e+00, float %896
  %902 = fcmp oge float %886, 0x3FF921FB60000000
  %903 = fadd float %886, 0xBFF921FB60000000
  %904 = select i1 %902, float %903, float %899
  %905 = select i1 %902, float 0.000000e+00, float %900
  %906 = select i1 %902, float 0xBFD87DE2A0000000, float %901
  %907 = fcmp oge float %886, 0x3FFF6A7A40000000
  %908 = fadd float %886, 0xBFFF6A7A40000000
  %909 = select i1 %907, float %908, float %904
  %910 = select i1 %907, float 0xBFD87DE2A0000000, float %905
  %911 = select i1 %907, float 0xBFE6A09E60000000, float %906
  %912 = fcmp oge float %886, 0x4002D97C80000000
  %913 = fadd float %886, 0xC002D97C80000000
  %914 = select i1 %912, float %913, float %909
  %915 = select i1 %912, float 0xBFE6A09E60000000, float %910
  %916 = select i1 %912, float 0xBFED906BC0000000, float %911
  %917 = fcmp oge float %886, 0x4005FDBC00000000
  %918 = fadd float %886, 0xC005FDBC00000000
  %919 = select i1 %917, float %918, float %914
  %920 = select i1 %917, float 0xBFED906BC0000000, float %915
  %921 = select i1 %917, float -1.000000e+00, float %916
  %922 = fcmp oge float %886, 0x400921FB60000000
  %923 = fadd float %886, 0xC00921FB60000000
  %924 = select i1 %922, float %923, float %919
  %925 = select i1 %922, float -1.000000e+00, float %920
  %926 = select i1 %922, float 0xBFED906BC0000000, float %921
  %927 = fcmp oge float %886, 0x400C463AC0000000
  %928 = fadd float %886, 0xC00C463AC0000000
  %929 = select i1 %927, float %928, float %924
  %930 = select i1 %927, float 0xBFED906BC0000000, float %925
  %931 = select i1 %927, float 0xBFE6A09E60000000, float %926
  %932 = fcmp oge float %886, 0x400F6A7A40000000
  %933 = fadd float %886, 0xC00F6A7A40000000
  %934 = select i1 %932, float %933, float %929
  %935 = select i1 %932, float 0xBFE6A09E60000000, float %930
  %936 = select i1 %932, float 0xBFD87DE2A0000000, float %931
  %937 = fcmp oge float %886, 0x4011475CE0000000
  %938 = fadd float %886, 0xC011475CE0000000
  %939 = select i1 %937, float %938, float %934
  %940 = select i1 %937, float 0xBFD87DE2A0000000, float %935
  %941 = select i1 %937, float 0.000000e+00, float %936
  %942 = fcmp oge float %886, 0x4012D97C80000000
  %943 = fadd float %886, 0xC012D97C80000000
  %944 = select i1 %942, float %943, float %939
  %945 = select i1 %942, float 0.000000e+00, float %940
  %946 = select i1 %942, float 0x3FD87DE2A0000000, float %941
  %947 = fcmp oge float %886, 0x40146B9C40000000
  %948 = fadd float %886, 0xC0146B9C40000000
  %949 = select i1 %947, float %948, float %944
  %950 = select i1 %947, float 0x3FD87DE2A0000000, float %945
  %951 = select i1 %947, float 0x3FE6A09E60000000, float %946
  %952 = fcmp oge float %886, 0x4015FDBC00000000
  %953 = fadd float %886, 0xC015FDBC00000000
  %954 = select i1 %952, float %953, float %949
  %955 = select i1 %952, float 0x3FE6A09E60000000, float %950
  %956 = select i1 %952, float 0x3FED906BC0000000, float %951
  %957 = fcmp oge float %886, 0x40178FDBA0000000
  %958 = fadd float %886, 0xC0178FDBA0000000
  %959 = select i1 %957, float %958, float %954
  %960 = select i1 %957, float 0x3FED906BC0000000, float %955
  %961 = select i1 %957, float 1.000000e+00, float %956
  %962 = fdiv float %959, 0x3FD921FB60000000
  %963 = fsub float %961, %960
  %964 = call float @llvm.fmuladd.f32(float %962, float %963, float %960)
  %965 = load volatile float, ptr %18, align 4, !tbaa !5
  %966 = fcmp olt float %965, 0.000000e+00
  %967 = fadd float %965, 0x401921FB60000000
  %968 = select i1 %966, float %967, float %965
  %969 = fcmp ult float %968, 0x401921FB60000000
  %970 = fadd float %968, 0xC01921FB60000000
  %971 = select i1 %969, float %968, float %970
  %972 = fcmp oge float %971, 0x3FD921FB60000000
  %973 = fadd float %971, 0xBFD921FB60000000
  %974 = select i1 %972, float %973, float %965
  %975 = select i1 %972, float 0x3FD87DE2A0000000, float 0.000000e+00
  %976 = select i1 %972, float 0x3FE6A09E60000000, float 0x3FD87DE2A0000000
  %977 = fcmp oge float %971, 0x3FE921FB60000000
  %978 = fadd float %971, 0xBFE921FB60000000
  %979 = select i1 %977, float %978, float %974
  %980 = select i1 %977, float 0x3FE6A09E60000000, float %975
  %981 = select i1 %977, float 0x3FED906BC0000000, float %976
  %982 = fcmp oge float %971, 0x3FF2D97C80000000
  %983 = fadd float %971, 0xBFF2D97C80000000
  %984 = select i1 %982, float %983, float %979
  %985 = select i1 %982, float 0x3FED906BC0000000, float %980
  %986 = select i1 %982, float 1.000000e+00, float %981
  %987 = fcmp oge float %971, 0x3FF921FB60000000
  %988 = fadd float %971, 0xBFF921FB60000000
  %989 = select i1 %987, float %988, float %984
  %990 = select i1 %987, float 1.000000e+00, float %985
  %991 = select i1 %987, float 0x3FED906BC0000000, float %986
  %992 = fcmp oge float %971, 0x3FFF6A7A40000000
  %993 = fadd float %971, 0xBFFF6A7A40000000
  %994 = select i1 %992, float %993, float %989
  %995 = select i1 %992, float 0x3FED906BC0000000, float %990
  %996 = select i1 %992, float 0x3FE6A09E60000000, float %991
  %997 = fcmp oge float %971, 0x4002D97C80000000
  %998 = fadd float %971, 0xC002D97C80000000
  %999 = select i1 %997, float %998, float %994
  %1000 = select i1 %997, float 0x3FE6A09E60000000, float %995
  %1001 = select i1 %997, float 0x3FD87DE2A0000000, float %996
  %1002 = fcmp oge float %971, 0x4005FDBC00000000
  %1003 = fadd float %971, 0xC005FDBC00000000
  %1004 = select i1 %1002, float %1003, float %999
  %1005 = select i1 %1002, float 0x3FD87DE2A0000000, float %1000
  %1006 = select i1 %1002, float 0.000000e+00, float %1001
  %1007 = fcmp oge float %971, 0x400921FB60000000
  %1008 = fadd float %971, 0xC00921FB60000000
  %1009 = select i1 %1007, float %1008, float %1004
  %1010 = select i1 %1007, float 0.000000e+00, float %1005
  %1011 = select i1 %1007, float 0xBFD87DE2A0000000, float %1006
  %1012 = fcmp oge float %971, 0x400C463AC0000000
  %1013 = fadd float %971, 0xC00C463AC0000000
  %1014 = select i1 %1012, float %1013, float %1009
  %1015 = select i1 %1012, float 0xBFD87DE2A0000000, float %1010
  %1016 = select i1 %1012, float 0xBFE6A09E60000000, float %1011
  %1017 = fcmp oge float %971, 0x400F6A7A40000000
  %1018 = fadd float %971, 0xC00F6A7A40000000
  %1019 = select i1 %1017, float %1018, float %1014
  %1020 = select i1 %1017, float 0xBFE6A09E60000000, float %1015
  %1021 = select i1 %1017, float 0xBFED906BC0000000, float %1016
  %1022 = fcmp oge float %971, 0x4011475CE0000000
  %1023 = fadd float %971, 0xC011475CE0000000
  %1024 = select i1 %1022, float %1023, float %1019
  %1025 = select i1 %1022, float 0xBFED906BC0000000, float %1020
  %1026 = select i1 %1022, float -1.000000e+00, float %1021
  %1027 = fcmp oge float %971, 0x4012D97C80000000
  %1028 = fadd float %971, 0xC012D97C80000000
  %1029 = select i1 %1027, float %1028, float %1024
  %1030 = select i1 %1027, float -1.000000e+00, float %1025
  %1031 = select i1 %1027, float 0xBFED906BC0000000, float %1026
  %1032 = fcmp oge float %971, 0x40146B9C40000000
  %1033 = fadd float %971, 0xC0146B9C40000000
  %1034 = select i1 %1032, float %1033, float %1029
  %1035 = select i1 %1032, float 0xBFED906BC0000000, float %1030
  %1036 = select i1 %1032, float 0xBFE6A09E60000000, float %1031
  %1037 = fcmp oge float %971, 0x4015FDBC00000000
  %1038 = fadd float %971, 0xC015FDBC00000000
  %1039 = select i1 %1037, float %1038, float %1034
  %1040 = select i1 %1037, float 0xBFE6A09E60000000, float %1035
  %1041 = select i1 %1037, float 0xBFD87DE2A0000000, float %1036
  %1042 = fcmp oge float %971, 0x40178FDBA0000000
  %1043 = fadd float %971, 0xC0178FDBA0000000
  %1044 = select i1 %1042, float %1043, float %1039
  %1045 = select i1 %1042, float 0xBFD87DE2A0000000, float %1040
  %1046 = select i1 %1042, float 0.000000e+00, float %1041
  %1047 = fdiv float %1044, 0x3FD921FB60000000
  %1048 = fsub float %1046, %1045
  %1049 = call float @llvm.fmuladd.f32(float %1047, float %1048, float %1045)
  %1050 = load volatile float, ptr %19, align 4, !tbaa !5
  %1051 = load volatile float, ptr %4, align 4, !tbaa !5
  %1052 = fneg float %1051
  %1053 = call float @llvm.fmuladd.f32(float %1050, float %964, float %1052)
  store volatile float %1053, ptr %3, align 4, !tbaa !5
  %1054 = load volatile float, ptr %19, align 4, !tbaa !5
  %1055 = load volatile float, ptr %90, align 4, !tbaa !5
  %1056 = fneg float %1055
  %1057 = call float @llvm.fmuladd.f32(float %1054, float %1049, float %1056)
  store volatile float %1057, ptr %91, align 4, !tbaa !5
  %1058 = load volatile float, ptr %92, align 4, !tbaa !5
  %1059 = fsub float 0.000000e+00, %1058
  store volatile float %1059, ptr %93, align 4, !tbaa !5
  %1060 = fmul float %1057, %1057
  %1061 = call float @llvm.fmuladd.f32(float %1053, float %1053, float %1060)
  %1062 = call float @llvm.fmuladd.f32(float %1059, float %1059, float %1061)
  %1063 = fcmp ugt float %1062, 0.000000e+00
  br i1 %1063, label %1064, label %1075

1064:                                             ; preds = %788
  %1065 = fmul float %1062, 5.000000e-01
  %1066 = bitcast float %1062 to i32
  %1067 = ashr i32 %1066, 1
  %1068 = sub nsw i32 1597463007, %1067
  %1069 = bitcast i32 %1068 to float
  %1070 = fneg float %1069
  %1071 = fmul float %1065, %1070
  %1072 = call float @llvm.fmuladd.f32(float %1071, float %1069, float 1.500000e+00)
  %1073 = fmul float %1072, %1069
  %1074 = fdiv float 1.000000e+00, %1073
  br label %1075

1075:                                             ; preds = %788, %1064
  %1076 = phi float [ %1074, %1064 ], [ 0.000000e+00, %788 ]
  store volatile float %1076, ptr %12, align 4, !tbaa !5
  %1077 = load volatile float, ptr %12, align 4, !tbaa !5
  %1078 = load volatile float, ptr %3, align 4, !tbaa !5
  %1079 = fdiv float %1078, %1077
  store volatile float %1079, ptr %3, align 4, !tbaa !5
  %1080 = load volatile float, ptr %12, align 4, !tbaa !5
  %1081 = load volatile float, ptr %91, align 4, !tbaa !5
  %1082 = fdiv float %1081, %1080
  store volatile float %1082, ptr %91, align 4, !tbaa !5
  %1083 = load volatile float, ptr %12, align 4, !tbaa !5
  %1084 = load volatile float, ptr %93, align 4, !tbaa !5
  %1085 = fdiv float %1084, %1083
  store volatile float %1085, ptr %93, align 4, !tbaa !5
  %1086 = load volatile float, ptr %5, align 4, !tbaa !5
  %1087 = load volatile float, ptr %3, align 4, !tbaa !5
  %1088 = load volatile float, ptr %60, align 4, !tbaa !5
  %1089 = load volatile float, ptr %91, align 4, !tbaa !5
  %1090 = fmul float %1088, %1089
  %1091 = call float @llvm.fmuladd.f32(float %1086, float %1087, float %1090)
  %1092 = load volatile float, ptr %65, align 4, !tbaa !5
  %1093 = load volatile float, ptr %93, align 4, !tbaa !5
  %1094 = call float @llvm.fmuladd.f32(float %1092, float %1093, float %1091)
  store volatile float %1094, ptr %20, align 4, !tbaa !5
  %1095 = load volatile float, ptr %14, align 4, !tbaa !5
  %1096 = load volatile float, ptr %20, align 4, !tbaa !5
  %1097 = fadd float %1096, 1.000000e+00
  %1098 = fmul float %1095, %1097
  store volatile float %1098, ptr %21, align 4, !tbaa !5
  %1099 = load volatile float, ptr %14, align 4, !tbaa !5
  %1100 = load volatile float, ptr %14, align 4, !tbaa !5
  %1101 = fadd float %1100, 1.000000e+00
  %1102 = fdiv float %1099, %1101
  %1103 = load volatile float, ptr %20, align 4, !tbaa !5
  %1104 = fmul float %1103, %1102
  store volatile float %1104, ptr %22, align 4, !tbaa !5
  %1105 = load volatile float, ptr %3, align 4, !tbaa !5
  %1106 = load volatile float, ptr %22, align 4, !tbaa !5
  %1107 = load volatile float, ptr %5, align 4, !tbaa !5
  %1108 = call float @llvm.fmuladd.f32(float %1106, float %1107, float %1105)
  %1109 = load volatile float, ptr %5, align 4, !tbaa !5
  %1110 = fadd float %1108, %1109
  %1111 = load volatile float, ptr %21, align 4, !tbaa !5
  %1112 = fdiv float %1110, %1111
  store volatile float %1112, ptr %6, align 4, !tbaa !5
  %1113 = load volatile float, ptr %91, align 4, !tbaa !5
  %1114 = load volatile float, ptr %22, align 4, !tbaa !5
  %1115 = load volatile float, ptr %60, align 4, !tbaa !5
  %1116 = call float @llvm.fmuladd.f32(float %1114, float %1115, float %1113)
  %1117 = load volatile float, ptr %60, align 4, !tbaa !5
  %1118 = fadd float %1116, %1117
  %1119 = load volatile float, ptr %21, align 4, !tbaa !5
  %1120 = fdiv float %1118, %1119
  store volatile float %1120, ptr %94, align 4, !tbaa !5
  %1121 = load volatile float, ptr %93, align 4, !tbaa !5
  %1122 = load volatile float, ptr %22, align 4, !tbaa !5
  %1123 = load volatile float, ptr %65, align 4, !tbaa !5
  %1124 = call float @llvm.fmuladd.f32(float %1122, float %1123, float %1121)
  %1125 = load volatile float, ptr %65, align 4, !tbaa !5
  %1126 = fadd float %1124, %1125
  %1127 = load volatile float, ptr %21, align 4, !tbaa !5
  %1128 = fdiv float %1126, %1127
  store volatile float %1128, ptr %95, align 4, !tbaa !5
  %1129 = load volatile float, ptr %6, align 4, !tbaa !5
  %1130 = load volatile float, ptr %6, align 4, !tbaa !5
  %1131 = load volatile float, ptr %94, align 4, !tbaa !5
  %1132 = load volatile float, ptr %94, align 4, !tbaa !5
  %1133 = fmul float %1131, %1132
  %1134 = call float @llvm.fmuladd.f32(float %1129, float %1130, float %1133)
  %1135 = load volatile float, ptr %95, align 4, !tbaa !5
  %1136 = load volatile float, ptr %95, align 4, !tbaa !5
  %1137 = call float @llvm.fmuladd.f32(float %1135, float %1136, float %1134)
  %1138 = fcmp ugt float %1137, 0.000000e+00
  br i1 %1138, label %1139, label %1150

1139:                                             ; preds = %1075
  %1140 = fmul float %1137, 5.000000e-01
  %1141 = bitcast float %1137 to i32
  %1142 = ashr i32 %1141, 1
  %1143 = sub nsw i32 1597463007, %1142
  %1144 = bitcast i32 %1143 to float
  %1145 = fneg float %1144
  %1146 = fmul float %1140, %1145
  %1147 = call float @llvm.fmuladd.f32(float %1146, float %1144, float 1.500000e+00)
  %1148 = fmul float %1147, %1144
  %1149 = fdiv float 1.000000e+00, %1148
  br label %1150

1150:                                             ; preds = %1075, %1139
  %1151 = phi float [ %1149, %1139 ], [ 0.000000e+00, %1075 ]
  store volatile float %1151, ptr %23, align 4, !tbaa !5
  %1152 = load volatile float, ptr %23, align 4, !tbaa !5
  %1153 = load volatile float, ptr %6, align 4, !tbaa !5
  %1154 = fdiv float %1153, %1152
  store volatile float %1154, ptr %6, align 4, !tbaa !5
  %1155 = load volatile float, ptr %23, align 4, !tbaa !5
  %1156 = load volatile float, ptr %94, align 4, !tbaa !5
  %1157 = fdiv float %1156, %1155
  store volatile float %1157, ptr %94, align 4, !tbaa !5
  %1158 = load volatile float, ptr %23, align 4, !tbaa !5
  %1159 = load volatile float, ptr %95, align 4, !tbaa !5
  %1160 = fdiv float %1159, %1158
  store volatile float %1160, ptr %95, align 4, !tbaa !5
  %1161 = load volatile float, ptr %12, align 4, !tbaa !5
  %1162 = fdiv float %1161, 0x41B1DE7840000000
  store volatile float %1162, ptr %11, align 4, !tbaa !5
  %1163 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %24) #3
  %1164 = icmp eq ptr %1163, null
  br i1 %1164, label %1165, label %96, !llvm.loop !16

1165:                                             ; preds = %1150, %83
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %24) #3
  %1166 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %24, i32 noundef 0, i32 noundef 3) #3
  %1167 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %24) #3
  %1168 = icmp eq ptr %1167, null
  br i1 %1168, label %1181, label %1169

1169:                                             ; preds = %1165, %1169
  %1170 = phi ptr [ %1179, %1169 ], [ %1167, %1165 ]
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %26) #3
  %1171 = load i64, ptr %1170, align 8, !tbaa !9
  %1172 = getelementptr inbounds [3 x float], ptr %4, i64 0, i64 %1171
  %1173 = load volatile float, ptr %1172, align 4, !tbaa !5
  %1174 = load volatile float, ptr %12, align 4, !tbaa !5
  %1175 = getelementptr inbounds [3 x float], ptr %6, i64 0, i64 %1171
  %1176 = load volatile float, ptr %1175, align 4, !tbaa !5
  %1177 = call float @llvm.fmuladd.f32(float %1174, float %1176, float %1173)
  store float %1177, ptr %26, align 4, !tbaa !5
  %1178 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %28, ptr noundef nonnull %1170, ptr noundef nonnull %26, i64 noundef 0) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %26) #3
  %1179 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %24) #3
  %1180 = icmp eq ptr %1179, null
  br i1 %1180, label %1181, label %1169, !llvm.loop !17

1181:                                             ; preds = %1169, %1165
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
!2 = !{!"clang version 20.1.0 (https://github.com/fprime-bpf/llvm-project.git 03a843fe2f5c0023ee1e6ee21d74290f4387a642)"}
!3 = !{i64 2147511606}
!4 = !{i64 2147512118}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"long long", !7, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!14, !14, i64 0}
!14 = !{!"long", !7, i64 0}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}
!17 = distinct !{!17, !12}
