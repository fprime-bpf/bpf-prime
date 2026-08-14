; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  %6 = alloca float, align 4
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
  %24 = alloca float, align 4
  %25 = alloca float, align 4
  %26 = alloca float, align 4
  %27 = alloca float, align 4
  %28 = alloca float, align 4
  %29 = alloca float, align 4
  %30 = alloca i64, align 8
  %31 = alloca float, align 4
  %32 = alloca float, align 4
  %33 = alloca float, align 4
  %34 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 8, i32 0, i32 0, i32 0) #3, !srcloc !3
  %35 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 9, i32 0, i32 0, i32 0) #3, !srcloc !4
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %1)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %3)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %5)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %6)
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
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %24)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %25)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %26)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %27)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %28)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %29)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %30) #3
  store volatile float 0.000000e+00, ptr %17, align 4, !tbaa !5
  store i64 0, ptr %30, align 8, !tbaa !9
  %36 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %34, ptr noundef nonnull %30) #3
  %37 = load float, ptr %36, align 4, !tbaa !5
  store volatile float %37, ptr %1, align 4, !tbaa !5
  %38 = load volatile float, ptr %1, align 4, !tbaa !5
  store volatile float %38, ptr %4, align 4, !tbaa !5
  store i64 1, ptr %30, align 8, !tbaa !9
  %39 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %34, ptr noundef nonnull %30) #3
  %40 = load float, ptr %39, align 4, !tbaa !5
  store volatile float %40, ptr %2, align 4, !tbaa !5
  %41 = load volatile float, ptr %2, align 4, !tbaa !5
  store volatile float %41, ptr %5, align 4, !tbaa !5
  store i64 2, ptr %30, align 8, !tbaa !9
  %42 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %34, ptr noundef nonnull %30) #3
  %43 = load float, ptr %42, align 4, !tbaa !5
  store volatile float %43, ptr %3, align 4, !tbaa !5
  %44 = load volatile float, ptr %3, align 4, !tbaa !5
  store volatile float %44, ptr %6, align 4, !tbaa !5
  store i64 3, ptr %30, align 8, !tbaa !9
  %45 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %34, ptr noundef nonnull %30) #3
  %46 = load float, ptr %45, align 4, !tbaa !5
  %47 = fdiv float %46, 0x41B1DE7840000000
  store volatile float %47, ptr %7, align 4, !tbaa !5
  store i64 4, ptr %30, align 8, !tbaa !9
  %48 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %34, ptr noundef nonnull %30) #3
  %49 = load float, ptr %48, align 4, !tbaa !5
  %50 = fdiv float %49, 0x41B1DE7840000000
  store volatile float %50, ptr %8, align 4, !tbaa !5
  store i64 5, ptr %30, align 8, !tbaa !9
  %51 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %34, ptr noundef nonnull %30) #3
  %52 = load float, ptr %51, align 4, !tbaa !5
  %53 = fdiv float %52, 0x41B1DE7840000000
  store volatile float %53, ptr %9, align 4, !tbaa !5
  %54 = load volatile float, ptr %7, align 4, !tbaa !5
  %55 = load volatile float, ptr %7, align 4, !tbaa !5
  %56 = load volatile float, ptr %8, align 4, !tbaa !5
  %57 = load volatile float, ptr %8, align 4, !tbaa !5
  %58 = fmul float %56, %57
  %59 = call float @llvm.fmuladd.f32(float %54, float %55, float %58)
  %60 = load volatile float, ptr %9, align 4, !tbaa !5
  %61 = load volatile float, ptr %9, align 4, !tbaa !5
  %62 = call float @llvm.fmuladd.f32(float %60, float %61, float %59)
  store volatile float %62, ptr %19, align 4, !tbaa !5
  %63 = load volatile float, ptr %19, align 4, !tbaa !5
  %64 = fsub float 1.000000e+00, %63
  %65 = bitcast float %64 to i32
  %66 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %65) #3
  %67 = bitcast i32 %66 to float
  %68 = fdiv float 1.000000e+00, %67
  store volatile float %68, ptr %20, align 4, !tbaa !5
  store volatile float 0x40101EB860000000, ptr %13, align 4, !tbaa !5
  store volatile float 0x404F3C2900000000, ptr %14, align 4, !tbaa !5
  store volatile float 0x3FA47AE140000000, ptr %15, align 4, !tbaa !5
  store volatile float 1.000000e+02, ptr %16, align 4, !tbaa !5
  %69 = load volatile float, ptr %13, align 4, !tbaa !5
  %70 = load volatile float, ptr %17, align 4, !tbaa !5
  %71 = fsub float %69, %70
  store volatile float %71, ptr %21, align 4, !tbaa !5
  %72 = load volatile float, ptr %16, align 4, !tbaa !5
  %73 = load volatile float, ptr %21, align 4, !tbaa !5
  %74 = fmul float %72, %73
  store volatile float %74, ptr %22, align 4, !tbaa !5
  %75 = load volatile float, ptr %22, align 4, !tbaa !5
  store volatile float %75, ptr %23, align 4, !tbaa !5
  %76 = load volatile float, ptr %22, align 4, !tbaa !5
  %77 = load volatile float, ptr %15, align 4, !tbaa !5
  %78 = load volatile float, ptr %23, align 4, !tbaa !5
  %79 = bitcast float %78 to i32
  %80 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %79) #3
  %81 = bitcast i32 %80 to float
  %82 = call float @llvm.fmuladd.f32(float %77, float %81, float %76)
  store volatile float %82, ptr %23, align 4, !tbaa !5
  %83 = load volatile float, ptr %22, align 4, !tbaa !5
  %84 = load volatile float, ptr %15, align 4, !tbaa !5
  %85 = load volatile float, ptr %23, align 4, !tbaa !5
  %86 = bitcast float %85 to i32
  %87 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %86) #3
  %88 = bitcast i32 %87 to float
  %89 = call float @llvm.fmuladd.f32(float %84, float %88, float %83)
  store volatile float %89, ptr %23, align 4, !tbaa !5
  %90 = load volatile float, ptr %22, align 4, !tbaa !5
  %91 = load volatile float, ptr %15, align 4, !tbaa !5
  %92 = load volatile float, ptr %23, align 4, !tbaa !5
  %93 = bitcast float %92 to i32
  %94 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %93) #3
  %95 = bitcast i32 %94 to float
  %96 = call float @llvm.fmuladd.f32(float %91, float %95, float %90)
  store volatile float %96, ptr %23, align 4, !tbaa !5
  %97 = load volatile float, ptr %22, align 4, !tbaa !5
  %98 = load volatile float, ptr %15, align 4, !tbaa !5
  %99 = load volatile float, ptr %23, align 4, !tbaa !5
  %100 = bitcast float %99 to i32
  %101 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %100) #3
  %102 = bitcast i32 %101 to float
  %103 = call float @llvm.fmuladd.f32(float %98, float %102, float %97)
  store volatile float %103, ptr %23, align 4, !tbaa !5
  %104 = load volatile float, ptr %22, align 4, !tbaa !5
  %105 = load volatile float, ptr %15, align 4, !tbaa !5
  %106 = load volatile float, ptr %23, align 4, !tbaa !5
  %107 = bitcast float %106 to i32
  %108 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %107) #3
  %109 = bitcast i32 %108 to float
  %110 = call float @llvm.fmuladd.f32(float %105, float %109, float %104)
  store volatile float %110, ptr %23, align 4, !tbaa !5
  %111 = load volatile float, ptr %15, align 4, !tbaa !5
  %112 = fadd float %111, 1.000000e+00
  %113 = bitcast float %112 to i32
  %114 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %113) #3
  %115 = bitcast i32 %114 to float
  %116 = load volatile float, ptr %23, align 4, !tbaa !5
  %117 = fmul float %116, 5.000000e-01
  %118 = bitcast float %117 to i32
  %119 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %118) #3
  %120 = bitcast i32 %119 to float
  %121 = fmul float %115, %120
  %122 = load volatile float, ptr %15, align 4, !tbaa !5
  %123 = fsub float 1.000000e+00, %122
  %124 = bitcast float %123 to i32
  %125 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %124) #3
  %126 = bitcast i32 %125 to float
  %127 = load volatile float, ptr %23, align 4, !tbaa !5
  %128 = fmul float %127, 5.000000e-01
  %129 = bitcast float %128 to i32
  %130 = call i32 inttoptr (i64 11 to ptr)(i32 noundef %129) #3
  %131 = bitcast i32 %130 to float
  %132 = fmul float %126, %131
  %133 = bitcast float %121 to i32
  %134 = bitcast float %132 to i32
  %135 = call i32 inttoptr (i64 12 to ptr)(i32 noundef %133, i32 noundef %134) #3
  %136 = bitcast i32 %135 to float
  %137 = fmul float %136, 2.000000e+00
  store volatile float %137, ptr %24, align 4, !tbaa !5
  %138 = load volatile float, ptr %14, align 4, !tbaa !5
  %139 = load volatile float, ptr %15, align 4, !tbaa !5
  %140 = load volatile float, ptr %23, align 4, !tbaa !5
  %141 = bitcast float %140 to i32
  %142 = call i32 inttoptr (i64 11 to ptr)(i32 noundef %141) #3
  %143 = bitcast i32 %142 to float
  %144 = fneg float %139
  %145 = call float @llvm.fmuladd.f32(float %144, float %143, float 1.000000e+00)
  %146 = fmul float %138, %145
  store volatile float %146, ptr %25, align 4, !tbaa !5
  %147 = load volatile float, ptr %24, align 4, !tbaa !5
  %148 = bitcast float %147 to i32
  %149 = call i32 inttoptr (i64 11 to ptr)(i32 noundef %148) #3
  %150 = bitcast i32 %149 to float
  %151 = load volatile float, ptr %24, align 4, !tbaa !5
  %152 = bitcast float %151 to i32
  %153 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %152) #3
  %154 = bitcast i32 %153 to float
  %155 = load volatile float, ptr %25, align 4, !tbaa !5
  %156 = load volatile float, ptr %4, align 4, !tbaa !5
  %157 = fneg float %156
  %158 = call float @llvm.fmuladd.f32(float %155, float %150, float %157)
  store volatile float %158, ptr %1, align 4, !tbaa !5
  %159 = load volatile float, ptr %25, align 4, !tbaa !5
  %160 = load volatile float, ptr %5, align 4, !tbaa !5
  %161 = fneg float %160
  %162 = call float @llvm.fmuladd.f32(float %159, float %154, float %161)
  store volatile float %162, ptr %2, align 4, !tbaa !5
  %163 = load volatile float, ptr %6, align 4, !tbaa !5
  %164 = fsub float 0.000000e+00, %163
  store volatile float %164, ptr %3, align 4, !tbaa !5
  %165 = fmul float %162, %162
  %166 = call float @llvm.fmuladd.f32(float %158, float %158, float %165)
  %167 = call float @llvm.fmuladd.f32(float %164, float %164, float %166)
  %168 = bitcast float %167 to i32
  %169 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %168) #3
  %170 = bitcast i32 %169 to float
  store volatile float %170, ptr %18, align 4, !tbaa !5
  %171 = load volatile float, ptr %18, align 4, !tbaa !5
  %172 = load volatile float, ptr %1, align 4, !tbaa !5
  %173 = fdiv float %172, %171
  store volatile float %173, ptr %1, align 4, !tbaa !5
  %174 = load volatile float, ptr %18, align 4, !tbaa !5
  %175 = load volatile float, ptr %2, align 4, !tbaa !5
  %176 = fdiv float %175, %174
  store volatile float %176, ptr %2, align 4, !tbaa !5
  %177 = load volatile float, ptr %18, align 4, !tbaa !5
  %178 = load volatile float, ptr %3, align 4, !tbaa !5
  %179 = fdiv float %178, %177
  store volatile float %179, ptr %3, align 4, !tbaa !5
  %180 = load volatile float, ptr %7, align 4, !tbaa !5
  %181 = load volatile float, ptr %1, align 4, !tbaa !5
  %182 = load volatile float, ptr %8, align 4, !tbaa !5
  %183 = load volatile float, ptr %2, align 4, !tbaa !5
  %184 = fmul float %182, %183
  %185 = call float @llvm.fmuladd.f32(float %180, float %181, float %184)
  %186 = load volatile float, ptr %9, align 4, !tbaa !5
  %187 = load volatile float, ptr %3, align 4, !tbaa !5
  %188 = call float @llvm.fmuladd.f32(float %186, float %187, float %185)
  store volatile float %188, ptr %26, align 4, !tbaa !5
  %189 = load volatile float, ptr %20, align 4, !tbaa !5
  %190 = load volatile float, ptr %26, align 4, !tbaa !5
  %191 = fadd float %190, 1.000000e+00
  %192 = fmul float %189, %191
  store volatile float %192, ptr %27, align 4, !tbaa !5
  %193 = load volatile float, ptr %20, align 4, !tbaa !5
  %194 = load volatile float, ptr %20, align 4, !tbaa !5
  %195 = fadd float %194, 1.000000e+00
  %196 = fdiv float %193, %195
  %197 = load volatile float, ptr %26, align 4, !tbaa !5
  %198 = fmul float %197, %196
  store volatile float %198, ptr %28, align 4, !tbaa !5
  %199 = load volatile float, ptr %1, align 4, !tbaa !5
  %200 = load volatile float, ptr %28, align 4, !tbaa !5
  %201 = load volatile float, ptr %7, align 4, !tbaa !5
  %202 = call float @llvm.fmuladd.f32(float %200, float %201, float %199)
  %203 = load volatile float, ptr %7, align 4, !tbaa !5
  %204 = fadd float %202, %203
  %205 = load volatile float, ptr %27, align 4, !tbaa !5
  %206 = fdiv float %204, %205
  store volatile float %206, ptr %10, align 4, !tbaa !5
  %207 = load volatile float, ptr %2, align 4, !tbaa !5
  %208 = load volatile float, ptr %28, align 4, !tbaa !5
  %209 = load volatile float, ptr %8, align 4, !tbaa !5
  %210 = call float @llvm.fmuladd.f32(float %208, float %209, float %207)
  %211 = load volatile float, ptr %8, align 4, !tbaa !5
  %212 = fadd float %210, %211
  %213 = load volatile float, ptr %27, align 4, !tbaa !5
  %214 = fdiv float %212, %213
  store volatile float %214, ptr %11, align 4, !tbaa !5
  %215 = load volatile float, ptr %3, align 4, !tbaa !5
  %216 = load volatile float, ptr %28, align 4, !tbaa !5
  %217 = load volatile float, ptr %9, align 4, !tbaa !5
  %218 = call float @llvm.fmuladd.f32(float %216, float %217, float %215)
  %219 = load volatile float, ptr %9, align 4, !tbaa !5
  %220 = fadd float %218, %219
  %221 = load volatile float, ptr %27, align 4, !tbaa !5
  %222 = fdiv float %220, %221
  store volatile float %222, ptr %12, align 4, !tbaa !5
  %223 = load volatile float, ptr %10, align 4, !tbaa !5
  %224 = load volatile float, ptr %10, align 4, !tbaa !5
  %225 = load volatile float, ptr %11, align 4, !tbaa !5
  %226 = load volatile float, ptr %11, align 4, !tbaa !5
  %227 = fmul float %225, %226
  %228 = call float @llvm.fmuladd.f32(float %223, float %224, float %227)
  %229 = load volatile float, ptr %12, align 4, !tbaa !5
  %230 = load volatile float, ptr %12, align 4, !tbaa !5
  %231 = call float @llvm.fmuladd.f32(float %229, float %230, float %228)
  %232 = bitcast float %231 to i32
  %233 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %232) #3
  %234 = bitcast i32 %233 to float
  store volatile float %234, ptr %29, align 4, !tbaa !5
  %235 = load volatile float, ptr %29, align 4, !tbaa !5
  %236 = load volatile float, ptr %10, align 4, !tbaa !5
  %237 = fdiv float %236, %235
  store volatile float %237, ptr %10, align 4, !tbaa !5
  %238 = load volatile float, ptr %29, align 4, !tbaa !5
  %239 = load volatile float, ptr %11, align 4, !tbaa !5
  %240 = fdiv float %239, %238
  store volatile float %240, ptr %11, align 4, !tbaa !5
  %241 = load volatile float, ptr %29, align 4, !tbaa !5
  %242 = load volatile float, ptr %12, align 4, !tbaa !5
  %243 = fdiv float %242, %241
  store volatile float %243, ptr %12, align 4, !tbaa !5
  %244 = load volatile float, ptr %18, align 4, !tbaa !5
  %245 = fdiv float %244, 0x41B1DE7840000000
  store volatile float %245, ptr %17, align 4, !tbaa !5
  %246 = load volatile float, ptr %13, align 4, !tbaa !5
  %247 = load volatile float, ptr %17, align 4, !tbaa !5
  %248 = fsub float %246, %247
  store volatile float %248, ptr %21, align 4, !tbaa !5
  %249 = load volatile float, ptr %16, align 4, !tbaa !5
  %250 = load volatile float, ptr %21, align 4, !tbaa !5
  %251 = fmul float %249, %250
  store volatile float %251, ptr %22, align 4, !tbaa !5
  %252 = load volatile float, ptr %22, align 4, !tbaa !5
  store volatile float %252, ptr %23, align 4, !tbaa !5
  %253 = load volatile float, ptr %22, align 4, !tbaa !5
  %254 = load volatile float, ptr %15, align 4, !tbaa !5
  %255 = load volatile float, ptr %23, align 4, !tbaa !5
  %256 = bitcast float %255 to i32
  %257 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %256) #3
  %258 = bitcast i32 %257 to float
  %259 = call float @llvm.fmuladd.f32(float %254, float %258, float %253)
  store volatile float %259, ptr %23, align 4, !tbaa !5
  %260 = load volatile float, ptr %22, align 4, !tbaa !5
  %261 = load volatile float, ptr %15, align 4, !tbaa !5
  %262 = load volatile float, ptr %23, align 4, !tbaa !5
  %263 = bitcast float %262 to i32
  %264 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %263) #3
  %265 = bitcast i32 %264 to float
  %266 = call float @llvm.fmuladd.f32(float %261, float %265, float %260)
  store volatile float %266, ptr %23, align 4, !tbaa !5
  %267 = load volatile float, ptr %22, align 4, !tbaa !5
  %268 = load volatile float, ptr %15, align 4, !tbaa !5
  %269 = load volatile float, ptr %23, align 4, !tbaa !5
  %270 = bitcast float %269 to i32
  %271 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %270) #3
  %272 = bitcast i32 %271 to float
  %273 = call float @llvm.fmuladd.f32(float %268, float %272, float %267)
  store volatile float %273, ptr %23, align 4, !tbaa !5
  %274 = load volatile float, ptr %22, align 4, !tbaa !5
  %275 = load volatile float, ptr %15, align 4, !tbaa !5
  %276 = load volatile float, ptr %23, align 4, !tbaa !5
  %277 = bitcast float %276 to i32
  %278 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %277) #3
  %279 = bitcast i32 %278 to float
  %280 = call float @llvm.fmuladd.f32(float %275, float %279, float %274)
  store volatile float %280, ptr %23, align 4, !tbaa !5
  %281 = load volatile float, ptr %22, align 4, !tbaa !5
  %282 = load volatile float, ptr %15, align 4, !tbaa !5
  %283 = load volatile float, ptr %23, align 4, !tbaa !5
  %284 = bitcast float %283 to i32
  %285 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %284) #3
  %286 = bitcast i32 %285 to float
  %287 = call float @llvm.fmuladd.f32(float %282, float %286, float %281)
  store volatile float %287, ptr %23, align 4, !tbaa !5
  %288 = load volatile float, ptr %15, align 4, !tbaa !5
  %289 = fadd float %288, 1.000000e+00
  %290 = bitcast float %289 to i32
  %291 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %290) #3
  %292 = bitcast i32 %291 to float
  %293 = load volatile float, ptr %23, align 4, !tbaa !5
  %294 = fmul float %293, 5.000000e-01
  %295 = bitcast float %294 to i32
  %296 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %295) #3
  %297 = bitcast i32 %296 to float
  %298 = fmul float %292, %297
  %299 = load volatile float, ptr %15, align 4, !tbaa !5
  %300 = fsub float 1.000000e+00, %299
  %301 = bitcast float %300 to i32
  %302 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %301) #3
  %303 = bitcast i32 %302 to float
  %304 = load volatile float, ptr %23, align 4, !tbaa !5
  %305 = fmul float %304, 5.000000e-01
  %306 = bitcast float %305 to i32
  %307 = call i32 inttoptr (i64 11 to ptr)(i32 noundef %306) #3
  %308 = bitcast i32 %307 to float
  %309 = fmul float %303, %308
  %310 = bitcast float %298 to i32
  %311 = bitcast float %309 to i32
  %312 = call i32 inttoptr (i64 12 to ptr)(i32 noundef %310, i32 noundef %311) #3
  %313 = bitcast i32 %312 to float
  %314 = fmul float %313, 2.000000e+00
  store volatile float %314, ptr %24, align 4, !tbaa !5
  %315 = load volatile float, ptr %14, align 4, !tbaa !5
  %316 = load volatile float, ptr %15, align 4, !tbaa !5
  %317 = load volatile float, ptr %23, align 4, !tbaa !5
  %318 = bitcast float %317 to i32
  %319 = call i32 inttoptr (i64 11 to ptr)(i32 noundef %318) #3
  %320 = bitcast i32 %319 to float
  %321 = fneg float %316
  %322 = call float @llvm.fmuladd.f32(float %321, float %320, float 1.000000e+00)
  %323 = fmul float %315, %322
  store volatile float %323, ptr %25, align 4, !tbaa !5
  %324 = load volatile float, ptr %24, align 4, !tbaa !5
  %325 = bitcast float %324 to i32
  %326 = call i32 inttoptr (i64 11 to ptr)(i32 noundef %325) #3
  %327 = bitcast i32 %326 to float
  %328 = load volatile float, ptr %24, align 4, !tbaa !5
  %329 = bitcast float %328 to i32
  %330 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %329) #3
  %331 = bitcast i32 %330 to float
  %332 = load volatile float, ptr %25, align 4, !tbaa !5
  %333 = load volatile float, ptr %4, align 4, !tbaa !5
  %334 = fneg float %333
  %335 = call float @llvm.fmuladd.f32(float %332, float %327, float %334)
  store volatile float %335, ptr %1, align 4, !tbaa !5
  %336 = load volatile float, ptr %25, align 4, !tbaa !5
  %337 = load volatile float, ptr %5, align 4, !tbaa !5
  %338 = fneg float %337
  %339 = call float @llvm.fmuladd.f32(float %336, float %331, float %338)
  store volatile float %339, ptr %2, align 4, !tbaa !5
  %340 = load volatile float, ptr %6, align 4, !tbaa !5
  %341 = fsub float 0.000000e+00, %340
  store volatile float %341, ptr %3, align 4, !tbaa !5
  %342 = fmul float %339, %339
  %343 = call float @llvm.fmuladd.f32(float %335, float %335, float %342)
  %344 = call float @llvm.fmuladd.f32(float %341, float %341, float %343)
  %345 = bitcast float %344 to i32
  %346 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %345) #3
  %347 = bitcast i32 %346 to float
  store volatile float %347, ptr %18, align 4, !tbaa !5
  %348 = load volatile float, ptr %18, align 4, !tbaa !5
  %349 = load volatile float, ptr %1, align 4, !tbaa !5
  %350 = fdiv float %349, %348
  store volatile float %350, ptr %1, align 4, !tbaa !5
  %351 = load volatile float, ptr %18, align 4, !tbaa !5
  %352 = load volatile float, ptr %2, align 4, !tbaa !5
  %353 = fdiv float %352, %351
  store volatile float %353, ptr %2, align 4, !tbaa !5
  %354 = load volatile float, ptr %18, align 4, !tbaa !5
  %355 = load volatile float, ptr %3, align 4, !tbaa !5
  %356 = fdiv float %355, %354
  store volatile float %356, ptr %3, align 4, !tbaa !5
  %357 = load volatile float, ptr %7, align 4, !tbaa !5
  %358 = load volatile float, ptr %1, align 4, !tbaa !5
  %359 = load volatile float, ptr %8, align 4, !tbaa !5
  %360 = load volatile float, ptr %2, align 4, !tbaa !5
  %361 = fmul float %359, %360
  %362 = call float @llvm.fmuladd.f32(float %357, float %358, float %361)
  %363 = load volatile float, ptr %9, align 4, !tbaa !5
  %364 = load volatile float, ptr %3, align 4, !tbaa !5
  %365 = call float @llvm.fmuladd.f32(float %363, float %364, float %362)
  store volatile float %365, ptr %26, align 4, !tbaa !5
  %366 = load volatile float, ptr %20, align 4, !tbaa !5
  %367 = load volatile float, ptr %26, align 4, !tbaa !5
  %368 = fadd float %367, 1.000000e+00
  %369 = fmul float %366, %368
  store volatile float %369, ptr %27, align 4, !tbaa !5
  %370 = load volatile float, ptr %20, align 4, !tbaa !5
  %371 = load volatile float, ptr %20, align 4, !tbaa !5
  %372 = fadd float %371, 1.000000e+00
  %373 = fdiv float %370, %372
  %374 = load volatile float, ptr %26, align 4, !tbaa !5
  %375 = fmul float %374, %373
  store volatile float %375, ptr %28, align 4, !tbaa !5
  %376 = load volatile float, ptr %1, align 4, !tbaa !5
  %377 = load volatile float, ptr %28, align 4, !tbaa !5
  %378 = load volatile float, ptr %7, align 4, !tbaa !5
  %379 = call float @llvm.fmuladd.f32(float %377, float %378, float %376)
  %380 = load volatile float, ptr %7, align 4, !tbaa !5
  %381 = fadd float %379, %380
  %382 = load volatile float, ptr %27, align 4, !tbaa !5
  %383 = fdiv float %381, %382
  store volatile float %383, ptr %10, align 4, !tbaa !5
  %384 = load volatile float, ptr %2, align 4, !tbaa !5
  %385 = load volatile float, ptr %28, align 4, !tbaa !5
  %386 = load volatile float, ptr %8, align 4, !tbaa !5
  %387 = call float @llvm.fmuladd.f32(float %385, float %386, float %384)
  %388 = load volatile float, ptr %8, align 4, !tbaa !5
  %389 = fadd float %387, %388
  %390 = load volatile float, ptr %27, align 4, !tbaa !5
  %391 = fdiv float %389, %390
  store volatile float %391, ptr %11, align 4, !tbaa !5
  %392 = load volatile float, ptr %3, align 4, !tbaa !5
  %393 = load volatile float, ptr %28, align 4, !tbaa !5
  %394 = load volatile float, ptr %9, align 4, !tbaa !5
  %395 = call float @llvm.fmuladd.f32(float %393, float %394, float %392)
  %396 = load volatile float, ptr %9, align 4, !tbaa !5
  %397 = fadd float %395, %396
  %398 = load volatile float, ptr %27, align 4, !tbaa !5
  %399 = fdiv float %397, %398
  store volatile float %399, ptr %12, align 4, !tbaa !5
  %400 = load volatile float, ptr %10, align 4, !tbaa !5
  %401 = load volatile float, ptr %10, align 4, !tbaa !5
  %402 = load volatile float, ptr %11, align 4, !tbaa !5
  %403 = load volatile float, ptr %11, align 4, !tbaa !5
  %404 = fmul float %402, %403
  %405 = call float @llvm.fmuladd.f32(float %400, float %401, float %404)
  %406 = load volatile float, ptr %12, align 4, !tbaa !5
  %407 = load volatile float, ptr %12, align 4, !tbaa !5
  %408 = call float @llvm.fmuladd.f32(float %406, float %407, float %405)
  %409 = bitcast float %408 to i32
  %410 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %409) #3
  %411 = bitcast i32 %410 to float
  store volatile float %411, ptr %29, align 4, !tbaa !5
  %412 = load volatile float, ptr %29, align 4, !tbaa !5
  %413 = load volatile float, ptr %10, align 4, !tbaa !5
  %414 = fdiv float %413, %412
  store volatile float %414, ptr %10, align 4, !tbaa !5
  %415 = load volatile float, ptr %29, align 4, !tbaa !5
  %416 = load volatile float, ptr %11, align 4, !tbaa !5
  %417 = fdiv float %416, %415
  store volatile float %417, ptr %11, align 4, !tbaa !5
  %418 = load volatile float, ptr %29, align 4, !tbaa !5
  %419 = load volatile float, ptr %12, align 4, !tbaa !5
  %420 = fdiv float %419, %418
  store volatile float %420, ptr %12, align 4, !tbaa !5
  %421 = load volatile float, ptr %18, align 4, !tbaa !5
  %422 = fdiv float %421, 0x41B1DE7840000000
  store volatile float %422, ptr %17, align 4, !tbaa !5
  %423 = load volatile float, ptr %13, align 4, !tbaa !5
  %424 = load volatile float, ptr %17, align 4, !tbaa !5
  %425 = fsub float %423, %424
  store volatile float %425, ptr %21, align 4, !tbaa !5
  %426 = load volatile float, ptr %16, align 4, !tbaa !5
  %427 = load volatile float, ptr %21, align 4, !tbaa !5
  %428 = fmul float %426, %427
  store volatile float %428, ptr %22, align 4, !tbaa !5
  %429 = load volatile float, ptr %22, align 4, !tbaa !5
  store volatile float %429, ptr %23, align 4, !tbaa !5
  %430 = load volatile float, ptr %22, align 4, !tbaa !5
  %431 = load volatile float, ptr %15, align 4, !tbaa !5
  %432 = load volatile float, ptr %23, align 4, !tbaa !5
  %433 = bitcast float %432 to i32
  %434 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %433) #3
  %435 = bitcast i32 %434 to float
  %436 = call float @llvm.fmuladd.f32(float %431, float %435, float %430)
  store volatile float %436, ptr %23, align 4, !tbaa !5
  %437 = load volatile float, ptr %22, align 4, !tbaa !5
  %438 = load volatile float, ptr %15, align 4, !tbaa !5
  %439 = load volatile float, ptr %23, align 4, !tbaa !5
  %440 = bitcast float %439 to i32
  %441 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %440) #3
  %442 = bitcast i32 %441 to float
  %443 = call float @llvm.fmuladd.f32(float %438, float %442, float %437)
  store volatile float %443, ptr %23, align 4, !tbaa !5
  %444 = load volatile float, ptr %22, align 4, !tbaa !5
  %445 = load volatile float, ptr %15, align 4, !tbaa !5
  %446 = load volatile float, ptr %23, align 4, !tbaa !5
  %447 = bitcast float %446 to i32
  %448 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %447) #3
  %449 = bitcast i32 %448 to float
  %450 = call float @llvm.fmuladd.f32(float %445, float %449, float %444)
  store volatile float %450, ptr %23, align 4, !tbaa !5
  %451 = load volatile float, ptr %22, align 4, !tbaa !5
  %452 = load volatile float, ptr %15, align 4, !tbaa !5
  %453 = load volatile float, ptr %23, align 4, !tbaa !5
  %454 = bitcast float %453 to i32
  %455 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %454) #3
  %456 = bitcast i32 %455 to float
  %457 = call float @llvm.fmuladd.f32(float %452, float %456, float %451)
  store volatile float %457, ptr %23, align 4, !tbaa !5
  %458 = load volatile float, ptr %22, align 4, !tbaa !5
  %459 = load volatile float, ptr %15, align 4, !tbaa !5
  %460 = load volatile float, ptr %23, align 4, !tbaa !5
  %461 = bitcast float %460 to i32
  %462 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %461) #3
  %463 = bitcast i32 %462 to float
  %464 = call float @llvm.fmuladd.f32(float %459, float %463, float %458)
  store volatile float %464, ptr %23, align 4, !tbaa !5
  %465 = load volatile float, ptr %15, align 4, !tbaa !5
  %466 = fadd float %465, 1.000000e+00
  %467 = bitcast float %466 to i32
  %468 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %467) #3
  %469 = bitcast i32 %468 to float
  %470 = load volatile float, ptr %23, align 4, !tbaa !5
  %471 = fmul float %470, 5.000000e-01
  %472 = bitcast float %471 to i32
  %473 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %472) #3
  %474 = bitcast i32 %473 to float
  %475 = fmul float %469, %474
  %476 = load volatile float, ptr %15, align 4, !tbaa !5
  %477 = fsub float 1.000000e+00, %476
  %478 = bitcast float %477 to i32
  %479 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %478) #3
  %480 = bitcast i32 %479 to float
  %481 = load volatile float, ptr %23, align 4, !tbaa !5
  %482 = fmul float %481, 5.000000e-01
  %483 = bitcast float %482 to i32
  %484 = call i32 inttoptr (i64 11 to ptr)(i32 noundef %483) #3
  %485 = bitcast i32 %484 to float
  %486 = fmul float %480, %485
  %487 = bitcast float %475 to i32
  %488 = bitcast float %486 to i32
  %489 = call i32 inttoptr (i64 12 to ptr)(i32 noundef %487, i32 noundef %488) #3
  %490 = bitcast i32 %489 to float
  %491 = fmul float %490, 2.000000e+00
  store volatile float %491, ptr %24, align 4, !tbaa !5
  %492 = load volatile float, ptr %14, align 4, !tbaa !5
  %493 = load volatile float, ptr %15, align 4, !tbaa !5
  %494 = load volatile float, ptr %23, align 4, !tbaa !5
  %495 = bitcast float %494 to i32
  %496 = call i32 inttoptr (i64 11 to ptr)(i32 noundef %495) #3
  %497 = bitcast i32 %496 to float
  %498 = fneg float %493
  %499 = call float @llvm.fmuladd.f32(float %498, float %497, float 1.000000e+00)
  %500 = fmul float %492, %499
  store volatile float %500, ptr %25, align 4, !tbaa !5
  %501 = load volatile float, ptr %24, align 4, !tbaa !5
  %502 = bitcast float %501 to i32
  %503 = call i32 inttoptr (i64 11 to ptr)(i32 noundef %502) #3
  %504 = bitcast i32 %503 to float
  %505 = load volatile float, ptr %24, align 4, !tbaa !5
  %506 = bitcast float %505 to i32
  %507 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %506) #3
  %508 = bitcast i32 %507 to float
  %509 = load volatile float, ptr %25, align 4, !tbaa !5
  %510 = load volatile float, ptr %4, align 4, !tbaa !5
  %511 = fneg float %510
  %512 = call float @llvm.fmuladd.f32(float %509, float %504, float %511)
  store volatile float %512, ptr %1, align 4, !tbaa !5
  %513 = load volatile float, ptr %25, align 4, !tbaa !5
  %514 = load volatile float, ptr %5, align 4, !tbaa !5
  %515 = fneg float %514
  %516 = call float @llvm.fmuladd.f32(float %513, float %508, float %515)
  store volatile float %516, ptr %2, align 4, !tbaa !5
  %517 = load volatile float, ptr %6, align 4, !tbaa !5
  %518 = fsub float 0.000000e+00, %517
  store volatile float %518, ptr %3, align 4, !tbaa !5
  %519 = fmul float %516, %516
  %520 = call float @llvm.fmuladd.f32(float %512, float %512, float %519)
  %521 = call float @llvm.fmuladd.f32(float %518, float %518, float %520)
  %522 = bitcast float %521 to i32
  %523 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %522) #3
  %524 = bitcast i32 %523 to float
  store volatile float %524, ptr %18, align 4, !tbaa !5
  %525 = load volatile float, ptr %18, align 4, !tbaa !5
  %526 = load volatile float, ptr %1, align 4, !tbaa !5
  %527 = fdiv float %526, %525
  store volatile float %527, ptr %1, align 4, !tbaa !5
  %528 = load volatile float, ptr %18, align 4, !tbaa !5
  %529 = load volatile float, ptr %2, align 4, !tbaa !5
  %530 = fdiv float %529, %528
  store volatile float %530, ptr %2, align 4, !tbaa !5
  %531 = load volatile float, ptr %18, align 4, !tbaa !5
  %532 = load volatile float, ptr %3, align 4, !tbaa !5
  %533 = fdiv float %532, %531
  store volatile float %533, ptr %3, align 4, !tbaa !5
  %534 = load volatile float, ptr %7, align 4, !tbaa !5
  %535 = load volatile float, ptr %1, align 4, !tbaa !5
  %536 = load volatile float, ptr %8, align 4, !tbaa !5
  %537 = load volatile float, ptr %2, align 4, !tbaa !5
  %538 = fmul float %536, %537
  %539 = call float @llvm.fmuladd.f32(float %534, float %535, float %538)
  %540 = load volatile float, ptr %9, align 4, !tbaa !5
  %541 = load volatile float, ptr %3, align 4, !tbaa !5
  %542 = call float @llvm.fmuladd.f32(float %540, float %541, float %539)
  store volatile float %542, ptr %26, align 4, !tbaa !5
  %543 = load volatile float, ptr %20, align 4, !tbaa !5
  %544 = load volatile float, ptr %26, align 4, !tbaa !5
  %545 = fadd float %544, 1.000000e+00
  %546 = fmul float %543, %545
  store volatile float %546, ptr %27, align 4, !tbaa !5
  %547 = load volatile float, ptr %20, align 4, !tbaa !5
  %548 = load volatile float, ptr %20, align 4, !tbaa !5
  %549 = fadd float %548, 1.000000e+00
  %550 = fdiv float %547, %549
  %551 = load volatile float, ptr %26, align 4, !tbaa !5
  %552 = fmul float %551, %550
  store volatile float %552, ptr %28, align 4, !tbaa !5
  %553 = load volatile float, ptr %1, align 4, !tbaa !5
  %554 = load volatile float, ptr %28, align 4, !tbaa !5
  %555 = load volatile float, ptr %7, align 4, !tbaa !5
  %556 = call float @llvm.fmuladd.f32(float %554, float %555, float %553)
  %557 = load volatile float, ptr %7, align 4, !tbaa !5
  %558 = fadd float %556, %557
  %559 = load volatile float, ptr %27, align 4, !tbaa !5
  %560 = fdiv float %558, %559
  store volatile float %560, ptr %10, align 4, !tbaa !5
  %561 = load volatile float, ptr %2, align 4, !tbaa !5
  %562 = load volatile float, ptr %28, align 4, !tbaa !5
  %563 = load volatile float, ptr %8, align 4, !tbaa !5
  %564 = call float @llvm.fmuladd.f32(float %562, float %563, float %561)
  %565 = load volatile float, ptr %8, align 4, !tbaa !5
  %566 = fadd float %564, %565
  %567 = load volatile float, ptr %27, align 4, !tbaa !5
  %568 = fdiv float %566, %567
  store volatile float %568, ptr %11, align 4, !tbaa !5
  %569 = load volatile float, ptr %3, align 4, !tbaa !5
  %570 = load volatile float, ptr %28, align 4, !tbaa !5
  %571 = load volatile float, ptr %9, align 4, !tbaa !5
  %572 = call float @llvm.fmuladd.f32(float %570, float %571, float %569)
  %573 = load volatile float, ptr %9, align 4, !tbaa !5
  %574 = fadd float %572, %573
  %575 = load volatile float, ptr %27, align 4, !tbaa !5
  %576 = fdiv float %574, %575
  store volatile float %576, ptr %12, align 4, !tbaa !5
  %577 = load volatile float, ptr %10, align 4, !tbaa !5
  %578 = load volatile float, ptr %10, align 4, !tbaa !5
  %579 = load volatile float, ptr %11, align 4, !tbaa !5
  %580 = load volatile float, ptr %11, align 4, !tbaa !5
  %581 = fmul float %579, %580
  %582 = call float @llvm.fmuladd.f32(float %577, float %578, float %581)
  %583 = load volatile float, ptr %12, align 4, !tbaa !5
  %584 = load volatile float, ptr %12, align 4, !tbaa !5
  %585 = call float @llvm.fmuladd.f32(float %583, float %584, float %582)
  %586 = bitcast float %585 to i32
  %587 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %586) #3
  %588 = bitcast i32 %587 to float
  store volatile float %588, ptr %29, align 4, !tbaa !5
  %589 = load volatile float, ptr %29, align 4, !tbaa !5
  %590 = load volatile float, ptr %10, align 4, !tbaa !5
  %591 = fdiv float %590, %589
  store volatile float %591, ptr %10, align 4, !tbaa !5
  %592 = load volatile float, ptr %29, align 4, !tbaa !5
  %593 = load volatile float, ptr %11, align 4, !tbaa !5
  %594 = fdiv float %593, %592
  store volatile float %594, ptr %11, align 4, !tbaa !5
  %595 = load volatile float, ptr %29, align 4, !tbaa !5
  %596 = load volatile float, ptr %12, align 4, !tbaa !5
  %597 = fdiv float %596, %595
  store volatile float %597, ptr %12, align 4, !tbaa !5
  %598 = load volatile float, ptr %18, align 4, !tbaa !5
  %599 = fdiv float %598, 0x41B1DE7840000000
  store volatile float %599, ptr %17, align 4, !tbaa !5
  %600 = load volatile float, ptr %13, align 4, !tbaa !5
  %601 = load volatile float, ptr %17, align 4, !tbaa !5
  %602 = fsub float %600, %601
  store volatile float %602, ptr %21, align 4, !tbaa !5
  %603 = load volatile float, ptr %16, align 4, !tbaa !5
  %604 = load volatile float, ptr %21, align 4, !tbaa !5
  %605 = fmul float %603, %604
  store volatile float %605, ptr %22, align 4, !tbaa !5
  %606 = load volatile float, ptr %22, align 4, !tbaa !5
  store volatile float %606, ptr %23, align 4, !tbaa !5
  %607 = load volatile float, ptr %22, align 4, !tbaa !5
  %608 = load volatile float, ptr %15, align 4, !tbaa !5
  %609 = load volatile float, ptr %23, align 4, !tbaa !5
  %610 = bitcast float %609 to i32
  %611 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %610) #3
  %612 = bitcast i32 %611 to float
  %613 = call float @llvm.fmuladd.f32(float %608, float %612, float %607)
  store volatile float %613, ptr %23, align 4, !tbaa !5
  %614 = load volatile float, ptr %22, align 4, !tbaa !5
  %615 = load volatile float, ptr %15, align 4, !tbaa !5
  %616 = load volatile float, ptr %23, align 4, !tbaa !5
  %617 = bitcast float %616 to i32
  %618 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %617) #3
  %619 = bitcast i32 %618 to float
  %620 = call float @llvm.fmuladd.f32(float %615, float %619, float %614)
  store volatile float %620, ptr %23, align 4, !tbaa !5
  %621 = load volatile float, ptr %22, align 4, !tbaa !5
  %622 = load volatile float, ptr %15, align 4, !tbaa !5
  %623 = load volatile float, ptr %23, align 4, !tbaa !5
  %624 = bitcast float %623 to i32
  %625 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %624) #3
  %626 = bitcast i32 %625 to float
  %627 = call float @llvm.fmuladd.f32(float %622, float %626, float %621)
  store volatile float %627, ptr %23, align 4, !tbaa !5
  %628 = load volatile float, ptr %22, align 4, !tbaa !5
  %629 = load volatile float, ptr %15, align 4, !tbaa !5
  %630 = load volatile float, ptr %23, align 4, !tbaa !5
  %631 = bitcast float %630 to i32
  %632 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %631) #3
  %633 = bitcast i32 %632 to float
  %634 = call float @llvm.fmuladd.f32(float %629, float %633, float %628)
  store volatile float %634, ptr %23, align 4, !tbaa !5
  %635 = load volatile float, ptr %22, align 4, !tbaa !5
  %636 = load volatile float, ptr %15, align 4, !tbaa !5
  %637 = load volatile float, ptr %23, align 4, !tbaa !5
  %638 = bitcast float %637 to i32
  %639 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %638) #3
  %640 = bitcast i32 %639 to float
  %641 = call float @llvm.fmuladd.f32(float %636, float %640, float %635)
  store volatile float %641, ptr %23, align 4, !tbaa !5
  %642 = load volatile float, ptr %15, align 4, !tbaa !5
  %643 = fadd float %642, 1.000000e+00
  %644 = bitcast float %643 to i32
  %645 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %644) #3
  %646 = bitcast i32 %645 to float
  %647 = load volatile float, ptr %23, align 4, !tbaa !5
  %648 = fmul float %647, 5.000000e-01
  %649 = bitcast float %648 to i32
  %650 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %649) #3
  %651 = bitcast i32 %650 to float
  %652 = fmul float %646, %651
  %653 = load volatile float, ptr %15, align 4, !tbaa !5
  %654 = fsub float 1.000000e+00, %653
  %655 = bitcast float %654 to i32
  %656 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %655) #3
  %657 = bitcast i32 %656 to float
  %658 = load volatile float, ptr %23, align 4, !tbaa !5
  %659 = fmul float %658, 5.000000e-01
  %660 = bitcast float %659 to i32
  %661 = call i32 inttoptr (i64 11 to ptr)(i32 noundef %660) #3
  %662 = bitcast i32 %661 to float
  %663 = fmul float %657, %662
  %664 = bitcast float %652 to i32
  %665 = bitcast float %663 to i32
  %666 = call i32 inttoptr (i64 12 to ptr)(i32 noundef %664, i32 noundef %665) #3
  %667 = bitcast i32 %666 to float
  %668 = fmul float %667, 2.000000e+00
  store volatile float %668, ptr %24, align 4, !tbaa !5
  %669 = load volatile float, ptr %14, align 4, !tbaa !5
  %670 = load volatile float, ptr %15, align 4, !tbaa !5
  %671 = load volatile float, ptr %23, align 4, !tbaa !5
  %672 = bitcast float %671 to i32
  %673 = call i32 inttoptr (i64 11 to ptr)(i32 noundef %672) #3
  %674 = bitcast i32 %673 to float
  %675 = fneg float %670
  %676 = call float @llvm.fmuladd.f32(float %675, float %674, float 1.000000e+00)
  %677 = fmul float %669, %676
  store volatile float %677, ptr %25, align 4, !tbaa !5
  %678 = load volatile float, ptr %24, align 4, !tbaa !5
  %679 = bitcast float %678 to i32
  %680 = call i32 inttoptr (i64 11 to ptr)(i32 noundef %679) #3
  %681 = bitcast i32 %680 to float
  %682 = load volatile float, ptr %24, align 4, !tbaa !5
  %683 = bitcast float %682 to i32
  %684 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %683) #3
  %685 = bitcast i32 %684 to float
  %686 = load volatile float, ptr %25, align 4, !tbaa !5
  %687 = load volatile float, ptr %4, align 4, !tbaa !5
  %688 = fneg float %687
  %689 = call float @llvm.fmuladd.f32(float %686, float %681, float %688)
  store volatile float %689, ptr %1, align 4, !tbaa !5
  %690 = load volatile float, ptr %25, align 4, !tbaa !5
  %691 = load volatile float, ptr %5, align 4, !tbaa !5
  %692 = fneg float %691
  %693 = call float @llvm.fmuladd.f32(float %690, float %685, float %692)
  store volatile float %693, ptr %2, align 4, !tbaa !5
  %694 = load volatile float, ptr %6, align 4, !tbaa !5
  %695 = fsub float 0.000000e+00, %694
  store volatile float %695, ptr %3, align 4, !tbaa !5
  %696 = fmul float %693, %693
  %697 = call float @llvm.fmuladd.f32(float %689, float %689, float %696)
  %698 = call float @llvm.fmuladd.f32(float %695, float %695, float %697)
  %699 = bitcast float %698 to i32
  %700 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %699) #3
  %701 = bitcast i32 %700 to float
  store volatile float %701, ptr %18, align 4, !tbaa !5
  %702 = load volatile float, ptr %18, align 4, !tbaa !5
  %703 = load volatile float, ptr %1, align 4, !tbaa !5
  %704 = fdiv float %703, %702
  store volatile float %704, ptr %1, align 4, !tbaa !5
  %705 = load volatile float, ptr %18, align 4, !tbaa !5
  %706 = load volatile float, ptr %2, align 4, !tbaa !5
  %707 = fdiv float %706, %705
  store volatile float %707, ptr %2, align 4, !tbaa !5
  %708 = load volatile float, ptr %18, align 4, !tbaa !5
  %709 = load volatile float, ptr %3, align 4, !tbaa !5
  %710 = fdiv float %709, %708
  store volatile float %710, ptr %3, align 4, !tbaa !5
  %711 = load volatile float, ptr %7, align 4, !tbaa !5
  %712 = load volatile float, ptr %1, align 4, !tbaa !5
  %713 = load volatile float, ptr %8, align 4, !tbaa !5
  %714 = load volatile float, ptr %2, align 4, !tbaa !5
  %715 = fmul float %713, %714
  %716 = call float @llvm.fmuladd.f32(float %711, float %712, float %715)
  %717 = load volatile float, ptr %9, align 4, !tbaa !5
  %718 = load volatile float, ptr %3, align 4, !tbaa !5
  %719 = call float @llvm.fmuladd.f32(float %717, float %718, float %716)
  store volatile float %719, ptr %26, align 4, !tbaa !5
  %720 = load volatile float, ptr %20, align 4, !tbaa !5
  %721 = load volatile float, ptr %26, align 4, !tbaa !5
  %722 = fadd float %721, 1.000000e+00
  %723 = fmul float %720, %722
  store volatile float %723, ptr %27, align 4, !tbaa !5
  %724 = load volatile float, ptr %20, align 4, !tbaa !5
  %725 = load volatile float, ptr %20, align 4, !tbaa !5
  %726 = fadd float %725, 1.000000e+00
  %727 = fdiv float %724, %726
  %728 = load volatile float, ptr %26, align 4, !tbaa !5
  %729 = fmul float %728, %727
  store volatile float %729, ptr %28, align 4, !tbaa !5
  %730 = load volatile float, ptr %1, align 4, !tbaa !5
  %731 = load volatile float, ptr %28, align 4, !tbaa !5
  %732 = load volatile float, ptr %7, align 4, !tbaa !5
  %733 = call float @llvm.fmuladd.f32(float %731, float %732, float %730)
  %734 = load volatile float, ptr %7, align 4, !tbaa !5
  %735 = fadd float %733, %734
  %736 = load volatile float, ptr %27, align 4, !tbaa !5
  %737 = fdiv float %735, %736
  store volatile float %737, ptr %10, align 4, !tbaa !5
  %738 = load volatile float, ptr %2, align 4, !tbaa !5
  %739 = load volatile float, ptr %28, align 4, !tbaa !5
  %740 = load volatile float, ptr %8, align 4, !tbaa !5
  %741 = call float @llvm.fmuladd.f32(float %739, float %740, float %738)
  %742 = load volatile float, ptr %8, align 4, !tbaa !5
  %743 = fadd float %741, %742
  %744 = load volatile float, ptr %27, align 4, !tbaa !5
  %745 = fdiv float %743, %744
  store volatile float %745, ptr %11, align 4, !tbaa !5
  %746 = load volatile float, ptr %3, align 4, !tbaa !5
  %747 = load volatile float, ptr %28, align 4, !tbaa !5
  %748 = load volatile float, ptr %9, align 4, !tbaa !5
  %749 = call float @llvm.fmuladd.f32(float %747, float %748, float %746)
  %750 = load volatile float, ptr %9, align 4, !tbaa !5
  %751 = fadd float %749, %750
  %752 = load volatile float, ptr %27, align 4, !tbaa !5
  %753 = fdiv float %751, %752
  store volatile float %753, ptr %12, align 4, !tbaa !5
  %754 = load volatile float, ptr %10, align 4, !tbaa !5
  %755 = load volatile float, ptr %10, align 4, !tbaa !5
  %756 = load volatile float, ptr %11, align 4, !tbaa !5
  %757 = load volatile float, ptr %11, align 4, !tbaa !5
  %758 = fmul float %756, %757
  %759 = call float @llvm.fmuladd.f32(float %754, float %755, float %758)
  %760 = load volatile float, ptr %12, align 4, !tbaa !5
  %761 = load volatile float, ptr %12, align 4, !tbaa !5
  %762 = call float @llvm.fmuladd.f32(float %760, float %761, float %759)
  %763 = bitcast float %762 to i32
  %764 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %763) #3
  %765 = bitcast i32 %764 to float
  store volatile float %765, ptr %29, align 4, !tbaa !5
  %766 = load volatile float, ptr %29, align 4, !tbaa !5
  %767 = load volatile float, ptr %10, align 4, !tbaa !5
  %768 = fdiv float %767, %766
  store volatile float %768, ptr %10, align 4, !tbaa !5
  %769 = load volatile float, ptr %29, align 4, !tbaa !5
  %770 = load volatile float, ptr %11, align 4, !tbaa !5
  %771 = fdiv float %770, %769
  store volatile float %771, ptr %11, align 4, !tbaa !5
  %772 = load volatile float, ptr %29, align 4, !tbaa !5
  %773 = load volatile float, ptr %12, align 4, !tbaa !5
  %774 = fdiv float %773, %772
  store volatile float %774, ptr %12, align 4, !tbaa !5
  %775 = load volatile float, ptr %18, align 4, !tbaa !5
  %776 = fdiv float %775, 0x41B1DE7840000000
  store volatile float %776, ptr %17, align 4, !tbaa !5
  %777 = load volatile float, ptr %13, align 4, !tbaa !5
  %778 = load volatile float, ptr %17, align 4, !tbaa !5
  %779 = fsub float %777, %778
  store volatile float %779, ptr %21, align 4, !tbaa !5
  %780 = load volatile float, ptr %16, align 4, !tbaa !5
  %781 = load volatile float, ptr %21, align 4, !tbaa !5
  %782 = fmul float %780, %781
  store volatile float %782, ptr %22, align 4, !tbaa !5
  %783 = load volatile float, ptr %22, align 4, !tbaa !5
  store volatile float %783, ptr %23, align 4, !tbaa !5
  %784 = load volatile float, ptr %22, align 4, !tbaa !5
  %785 = load volatile float, ptr %15, align 4, !tbaa !5
  %786 = load volatile float, ptr %23, align 4, !tbaa !5
  %787 = bitcast float %786 to i32
  %788 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %787) #3
  %789 = bitcast i32 %788 to float
  %790 = call float @llvm.fmuladd.f32(float %785, float %789, float %784)
  store volatile float %790, ptr %23, align 4, !tbaa !5
  %791 = load volatile float, ptr %22, align 4, !tbaa !5
  %792 = load volatile float, ptr %15, align 4, !tbaa !5
  %793 = load volatile float, ptr %23, align 4, !tbaa !5
  %794 = bitcast float %793 to i32
  %795 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %794) #3
  %796 = bitcast i32 %795 to float
  %797 = call float @llvm.fmuladd.f32(float %792, float %796, float %791)
  store volatile float %797, ptr %23, align 4, !tbaa !5
  %798 = load volatile float, ptr %22, align 4, !tbaa !5
  %799 = load volatile float, ptr %15, align 4, !tbaa !5
  %800 = load volatile float, ptr %23, align 4, !tbaa !5
  %801 = bitcast float %800 to i32
  %802 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %801) #3
  %803 = bitcast i32 %802 to float
  %804 = call float @llvm.fmuladd.f32(float %799, float %803, float %798)
  store volatile float %804, ptr %23, align 4, !tbaa !5
  %805 = load volatile float, ptr %22, align 4, !tbaa !5
  %806 = load volatile float, ptr %15, align 4, !tbaa !5
  %807 = load volatile float, ptr %23, align 4, !tbaa !5
  %808 = bitcast float %807 to i32
  %809 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %808) #3
  %810 = bitcast i32 %809 to float
  %811 = call float @llvm.fmuladd.f32(float %806, float %810, float %805)
  store volatile float %811, ptr %23, align 4, !tbaa !5
  %812 = load volatile float, ptr %22, align 4, !tbaa !5
  %813 = load volatile float, ptr %15, align 4, !tbaa !5
  %814 = load volatile float, ptr %23, align 4, !tbaa !5
  %815 = bitcast float %814 to i32
  %816 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %815) #3
  %817 = bitcast i32 %816 to float
  %818 = call float @llvm.fmuladd.f32(float %813, float %817, float %812)
  store volatile float %818, ptr %23, align 4, !tbaa !5
  %819 = load volatile float, ptr %15, align 4, !tbaa !5
  %820 = fadd float %819, 1.000000e+00
  %821 = bitcast float %820 to i32
  %822 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %821) #3
  %823 = bitcast i32 %822 to float
  %824 = load volatile float, ptr %23, align 4, !tbaa !5
  %825 = fmul float %824, 5.000000e-01
  %826 = bitcast float %825 to i32
  %827 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %826) #3
  %828 = bitcast i32 %827 to float
  %829 = fmul float %823, %828
  %830 = load volatile float, ptr %15, align 4, !tbaa !5
  %831 = fsub float 1.000000e+00, %830
  %832 = bitcast float %831 to i32
  %833 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %832) #3
  %834 = bitcast i32 %833 to float
  %835 = load volatile float, ptr %23, align 4, !tbaa !5
  %836 = fmul float %835, 5.000000e-01
  %837 = bitcast float %836 to i32
  %838 = call i32 inttoptr (i64 11 to ptr)(i32 noundef %837) #3
  %839 = bitcast i32 %838 to float
  %840 = fmul float %834, %839
  %841 = bitcast float %829 to i32
  %842 = bitcast float %840 to i32
  %843 = call i32 inttoptr (i64 12 to ptr)(i32 noundef %841, i32 noundef %842) #3
  %844 = bitcast i32 %843 to float
  %845 = fmul float %844, 2.000000e+00
  store volatile float %845, ptr %24, align 4, !tbaa !5
  %846 = load volatile float, ptr %14, align 4, !tbaa !5
  %847 = load volatile float, ptr %15, align 4, !tbaa !5
  %848 = load volatile float, ptr %23, align 4, !tbaa !5
  %849 = bitcast float %848 to i32
  %850 = call i32 inttoptr (i64 11 to ptr)(i32 noundef %849) #3
  %851 = bitcast i32 %850 to float
  %852 = fneg float %847
  %853 = call float @llvm.fmuladd.f32(float %852, float %851, float 1.000000e+00)
  %854 = fmul float %846, %853
  store volatile float %854, ptr %25, align 4, !tbaa !5
  %855 = load volatile float, ptr %24, align 4, !tbaa !5
  %856 = bitcast float %855 to i32
  %857 = call i32 inttoptr (i64 11 to ptr)(i32 noundef %856) #3
  %858 = bitcast i32 %857 to float
  %859 = load volatile float, ptr %24, align 4, !tbaa !5
  %860 = bitcast float %859 to i32
  %861 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %860) #3
  %862 = bitcast i32 %861 to float
  %863 = load volatile float, ptr %25, align 4, !tbaa !5
  %864 = load volatile float, ptr %4, align 4, !tbaa !5
  %865 = fneg float %864
  %866 = call float @llvm.fmuladd.f32(float %863, float %858, float %865)
  store volatile float %866, ptr %1, align 4, !tbaa !5
  %867 = load volatile float, ptr %25, align 4, !tbaa !5
  %868 = load volatile float, ptr %5, align 4, !tbaa !5
  %869 = fneg float %868
  %870 = call float @llvm.fmuladd.f32(float %867, float %862, float %869)
  store volatile float %870, ptr %2, align 4, !tbaa !5
  %871 = load volatile float, ptr %6, align 4, !tbaa !5
  %872 = fsub float 0.000000e+00, %871
  store volatile float %872, ptr %3, align 4, !tbaa !5
  %873 = fmul float %870, %870
  %874 = call float @llvm.fmuladd.f32(float %866, float %866, float %873)
  %875 = call float @llvm.fmuladd.f32(float %872, float %872, float %874)
  %876 = bitcast float %875 to i32
  %877 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %876) #3
  %878 = bitcast i32 %877 to float
  store volatile float %878, ptr %18, align 4, !tbaa !5
  %879 = load volatile float, ptr %18, align 4, !tbaa !5
  %880 = load volatile float, ptr %1, align 4, !tbaa !5
  %881 = fdiv float %880, %879
  store volatile float %881, ptr %1, align 4, !tbaa !5
  %882 = load volatile float, ptr %18, align 4, !tbaa !5
  %883 = load volatile float, ptr %2, align 4, !tbaa !5
  %884 = fdiv float %883, %882
  store volatile float %884, ptr %2, align 4, !tbaa !5
  %885 = load volatile float, ptr %18, align 4, !tbaa !5
  %886 = load volatile float, ptr %3, align 4, !tbaa !5
  %887 = fdiv float %886, %885
  store volatile float %887, ptr %3, align 4, !tbaa !5
  %888 = load volatile float, ptr %7, align 4, !tbaa !5
  %889 = load volatile float, ptr %1, align 4, !tbaa !5
  %890 = load volatile float, ptr %8, align 4, !tbaa !5
  %891 = load volatile float, ptr %2, align 4, !tbaa !5
  %892 = fmul float %890, %891
  %893 = call float @llvm.fmuladd.f32(float %888, float %889, float %892)
  %894 = load volatile float, ptr %9, align 4, !tbaa !5
  %895 = load volatile float, ptr %3, align 4, !tbaa !5
  %896 = call float @llvm.fmuladd.f32(float %894, float %895, float %893)
  store volatile float %896, ptr %26, align 4, !tbaa !5
  %897 = load volatile float, ptr %20, align 4, !tbaa !5
  %898 = load volatile float, ptr %26, align 4, !tbaa !5
  %899 = fadd float %898, 1.000000e+00
  %900 = fmul float %897, %899
  store volatile float %900, ptr %27, align 4, !tbaa !5
  %901 = load volatile float, ptr %20, align 4, !tbaa !5
  %902 = load volatile float, ptr %20, align 4, !tbaa !5
  %903 = fadd float %902, 1.000000e+00
  %904 = fdiv float %901, %903
  %905 = load volatile float, ptr %26, align 4, !tbaa !5
  %906 = fmul float %905, %904
  store volatile float %906, ptr %28, align 4, !tbaa !5
  %907 = load volatile float, ptr %1, align 4, !tbaa !5
  %908 = load volatile float, ptr %28, align 4, !tbaa !5
  %909 = load volatile float, ptr %7, align 4, !tbaa !5
  %910 = call float @llvm.fmuladd.f32(float %908, float %909, float %907)
  %911 = load volatile float, ptr %7, align 4, !tbaa !5
  %912 = fadd float %910, %911
  %913 = load volatile float, ptr %27, align 4, !tbaa !5
  %914 = fdiv float %912, %913
  store volatile float %914, ptr %10, align 4, !tbaa !5
  %915 = load volatile float, ptr %2, align 4, !tbaa !5
  %916 = load volatile float, ptr %28, align 4, !tbaa !5
  %917 = load volatile float, ptr %8, align 4, !tbaa !5
  %918 = call float @llvm.fmuladd.f32(float %916, float %917, float %915)
  %919 = load volatile float, ptr %8, align 4, !tbaa !5
  %920 = fadd float %918, %919
  %921 = load volatile float, ptr %27, align 4, !tbaa !5
  %922 = fdiv float %920, %921
  store volatile float %922, ptr %11, align 4, !tbaa !5
  %923 = load volatile float, ptr %3, align 4, !tbaa !5
  %924 = load volatile float, ptr %28, align 4, !tbaa !5
  %925 = load volatile float, ptr %9, align 4, !tbaa !5
  %926 = call float @llvm.fmuladd.f32(float %924, float %925, float %923)
  %927 = load volatile float, ptr %9, align 4, !tbaa !5
  %928 = fadd float %926, %927
  %929 = load volatile float, ptr %27, align 4, !tbaa !5
  %930 = fdiv float %928, %929
  store volatile float %930, ptr %12, align 4, !tbaa !5
  %931 = load volatile float, ptr %10, align 4, !tbaa !5
  %932 = load volatile float, ptr %10, align 4, !tbaa !5
  %933 = load volatile float, ptr %11, align 4, !tbaa !5
  %934 = load volatile float, ptr %11, align 4, !tbaa !5
  %935 = fmul float %933, %934
  %936 = call float @llvm.fmuladd.f32(float %931, float %932, float %935)
  %937 = load volatile float, ptr %12, align 4, !tbaa !5
  %938 = load volatile float, ptr %12, align 4, !tbaa !5
  %939 = call float @llvm.fmuladd.f32(float %937, float %938, float %936)
  %940 = bitcast float %939 to i32
  %941 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %940) #3
  %942 = bitcast i32 %941 to float
  store volatile float %942, ptr %29, align 4, !tbaa !5
  %943 = load volatile float, ptr %29, align 4, !tbaa !5
  %944 = load volatile float, ptr %10, align 4, !tbaa !5
  %945 = fdiv float %944, %943
  store volatile float %945, ptr %10, align 4, !tbaa !5
  %946 = load volatile float, ptr %29, align 4, !tbaa !5
  %947 = load volatile float, ptr %11, align 4, !tbaa !5
  %948 = fdiv float %947, %946
  store volatile float %948, ptr %11, align 4, !tbaa !5
  %949 = load volatile float, ptr %29, align 4, !tbaa !5
  %950 = load volatile float, ptr %12, align 4, !tbaa !5
  %951 = fdiv float %950, %949
  store volatile float %951, ptr %12, align 4, !tbaa !5
  %952 = load volatile float, ptr %18, align 4, !tbaa !5
  %953 = fdiv float %952, 0x41B1DE7840000000
  store volatile float %953, ptr %17, align 4, !tbaa !5
  store i64 0, ptr %30, align 8, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %31) #3
  %954 = load volatile float, ptr %4, align 4, !tbaa !5
  %955 = load volatile float, ptr %18, align 4, !tbaa !5
  %956 = load volatile float, ptr %10, align 4, !tbaa !5
  %957 = call float @llvm.fmuladd.f32(float %955, float %956, float %954)
  store float %957, ptr %31, align 4, !tbaa !5
  %958 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %35, ptr noundef nonnull %30, ptr noundef nonnull %31, i64 noundef 0) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %31) #3
  store i64 1, ptr %30, align 8, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %32) #3
  %959 = load volatile float, ptr %5, align 4, !tbaa !5
  %960 = load volatile float, ptr %18, align 4, !tbaa !5
  %961 = load volatile float, ptr %11, align 4, !tbaa !5
  %962 = call float @llvm.fmuladd.f32(float %960, float %961, float %959)
  store float %962, ptr %32, align 4, !tbaa !5
  %963 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %35, ptr noundef nonnull %30, ptr noundef nonnull %32, i64 noundef 0) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %32) #3
  store i64 2, ptr %30, align 8, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %33) #3
  %964 = load volatile float, ptr %6, align 4, !tbaa !5
  %965 = load volatile float, ptr %18, align 4, !tbaa !5
  %966 = load volatile float, ptr %12, align 4, !tbaa !5
  %967 = call float @llvm.fmuladd.f32(float %965, float %966, float %964)
  store float %967, ptr %33, align 4, !tbaa !5
  %968 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %35, ptr noundef nonnull %30, ptr noundef nonnull %33, i64 noundef 0) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %33) #3
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %30) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %29)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %28)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %27)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %26)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %25)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %24)
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
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %10)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %11)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %12)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %7)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %8)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %9)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %5)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %6)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %1)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %3)
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
!3 = !{i64 2147507515}
!4 = !{i64 2147508027}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"long", !7, i64 0}
