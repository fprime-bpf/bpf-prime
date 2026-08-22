; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

%struct.bpf_iter_num = type { i64, i64, i64, i64 }

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
  %31 = alloca %struct.bpf_iter_num, align 8
  %32 = alloca float, align 4
  %33 = alloca float, align 4
  %34 = alloca float, align 4
  %35 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 8, i32 0, i32 0, i32 0) #3, !srcloc !3
  %36 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 9, i32 0, i32 0, i32 0) #3, !srcloc !4
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
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %31) #3
  store volatile float 0.000000e+00, ptr %17, align 4, !tbaa !5
  store i64 0, ptr %30, align 8, !tbaa !9
  %37 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %35, ptr noundef nonnull %30) #3
  %38 = load float, ptr %37, align 4, !tbaa !5
  store volatile float %38, ptr %1, align 4, !tbaa !5
  %39 = load volatile float, ptr %1, align 4, !tbaa !5
  store volatile float %39, ptr %4, align 4, !tbaa !5
  store i64 1, ptr %30, align 8, !tbaa !9
  %40 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %35, ptr noundef nonnull %30) #3
  %41 = load float, ptr %40, align 4, !tbaa !5
  store volatile float %41, ptr %2, align 4, !tbaa !5
  %42 = load volatile float, ptr %2, align 4, !tbaa !5
  store volatile float %42, ptr %5, align 4, !tbaa !5
  store i64 2, ptr %30, align 8, !tbaa !9
  %43 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %35, ptr noundef nonnull %30) #3
  %44 = load float, ptr %43, align 4, !tbaa !5
  store volatile float %44, ptr %3, align 4, !tbaa !5
  %45 = load volatile float, ptr %3, align 4, !tbaa !5
  store volatile float %45, ptr %6, align 4, !tbaa !5
  store i64 3, ptr %30, align 8, !tbaa !9
  %46 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %35, ptr noundef nonnull %30) #3
  %47 = load float, ptr %46, align 4, !tbaa !5
  %48 = fdiv float %47, 0x41B1DE7840000000
  store volatile float %48, ptr %7, align 4, !tbaa !5
  store i64 4, ptr %30, align 8, !tbaa !9
  %49 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %35, ptr noundef nonnull %30) #3
  %50 = load float, ptr %49, align 4, !tbaa !5
  %51 = fdiv float %50, 0x41B1DE7840000000
  store volatile float %51, ptr %8, align 4, !tbaa !5
  store i64 5, ptr %30, align 8, !tbaa !9
  %52 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %35, ptr noundef nonnull %30) #3
  %53 = load float, ptr %52, align 4, !tbaa !5
  %54 = fdiv float %53, 0x41B1DE7840000000
  store volatile float %54, ptr %9, align 4, !tbaa !5
  %55 = load volatile float, ptr %7, align 4, !tbaa !5
  %56 = load volatile float, ptr %7, align 4, !tbaa !5
  %57 = load volatile float, ptr %8, align 4, !tbaa !5
  %58 = load volatile float, ptr %8, align 4, !tbaa !5
  %59 = fmul float %57, %58
  %60 = call float @llvm.fmuladd.f32(float %55, float %56, float %59)
  %61 = load volatile float, ptr %9, align 4, !tbaa !5
  %62 = load volatile float, ptr %9, align 4, !tbaa !5
  %63 = call float @llvm.fmuladd.f32(float %61, float %62, float %60)
  store volatile float %63, ptr %19, align 4, !tbaa !5
  %64 = load volatile float, ptr %19, align 4, !tbaa !5
  %65 = fsub float 1.000000e+00, %64
  %66 = bitcast float %65 to i32
  %67 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %66) #3
  %68 = bitcast i32 %67 to float
  %69 = fdiv float 1.000000e+00, %68
  store volatile float %69, ptr %20, align 4, !tbaa !5
  store volatile float 0x40101EB860000000, ptr %13, align 4, !tbaa !5
  store volatile float 0x404F3C2900000000, ptr %14, align 4, !tbaa !5
  store volatile float 0x3FA47AE140000000, ptr %15, align 4, !tbaa !5
  store volatile float 1.000000e+02, ptr %16, align 4, !tbaa !5
  %70 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %31, i32 noundef 0, i32 noundef 5) #3
  %71 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %31) #3
  %72 = icmp eq ptr %71, null
  br i1 %72, label %253, label %73

73:                                               ; preds = %0, %73
  %74 = load volatile float, ptr %13, align 4, !tbaa !5
  %75 = load volatile float, ptr %17, align 4, !tbaa !5
  %76 = fsub float %74, %75
  store volatile float %76, ptr %21, align 4, !tbaa !5
  %77 = load volatile float, ptr %16, align 4, !tbaa !5
  %78 = load volatile float, ptr %21, align 4, !tbaa !5
  %79 = fmul float %77, %78
  store volatile float %79, ptr %22, align 4, !tbaa !5
  %80 = load volatile float, ptr %22, align 4, !tbaa !5
  store volatile float %80, ptr %23, align 4, !tbaa !5
  %81 = load volatile float, ptr %22, align 4, !tbaa !5
  %82 = load volatile float, ptr %15, align 4, !tbaa !5
  %83 = load volatile float, ptr %23, align 4, !tbaa !5
  %84 = bitcast float %83 to i32
  %85 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %84) #3
  %86 = bitcast i32 %85 to float
  %87 = call float @llvm.fmuladd.f32(float %82, float %86, float %81)
  store volatile float %87, ptr %23, align 4, !tbaa !5
  %88 = load volatile float, ptr %22, align 4, !tbaa !5
  %89 = load volatile float, ptr %15, align 4, !tbaa !5
  %90 = load volatile float, ptr %23, align 4, !tbaa !5
  %91 = bitcast float %90 to i32
  %92 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %91) #3
  %93 = bitcast i32 %92 to float
  %94 = call float @llvm.fmuladd.f32(float %89, float %93, float %88)
  store volatile float %94, ptr %23, align 4, !tbaa !5
  %95 = load volatile float, ptr %22, align 4, !tbaa !5
  %96 = load volatile float, ptr %15, align 4, !tbaa !5
  %97 = load volatile float, ptr %23, align 4, !tbaa !5
  %98 = bitcast float %97 to i32
  %99 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %98) #3
  %100 = bitcast i32 %99 to float
  %101 = call float @llvm.fmuladd.f32(float %96, float %100, float %95)
  store volatile float %101, ptr %23, align 4, !tbaa !5
  %102 = load volatile float, ptr %22, align 4, !tbaa !5
  %103 = load volatile float, ptr %15, align 4, !tbaa !5
  %104 = load volatile float, ptr %23, align 4, !tbaa !5
  %105 = bitcast float %104 to i32
  %106 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %105) #3
  %107 = bitcast i32 %106 to float
  %108 = call float @llvm.fmuladd.f32(float %103, float %107, float %102)
  store volatile float %108, ptr %23, align 4, !tbaa !5
  %109 = load volatile float, ptr %22, align 4, !tbaa !5
  %110 = load volatile float, ptr %15, align 4, !tbaa !5
  %111 = load volatile float, ptr %23, align 4, !tbaa !5
  %112 = bitcast float %111 to i32
  %113 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %112) #3
  %114 = bitcast i32 %113 to float
  %115 = call float @llvm.fmuladd.f32(float %110, float %114, float %109)
  store volatile float %115, ptr %23, align 4, !tbaa !5
  %116 = load volatile float, ptr %15, align 4, !tbaa !5
  %117 = fadd float %116, 1.000000e+00
  %118 = bitcast float %117 to i32
  %119 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %118) #3
  %120 = bitcast i32 %119 to float
  %121 = load volatile float, ptr %23, align 4, !tbaa !5
  %122 = fmul float %121, 5.000000e-01
  %123 = bitcast float %122 to i32
  %124 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %123) #3
  %125 = bitcast i32 %124 to float
  %126 = fmul float %120, %125
  %127 = load volatile float, ptr %15, align 4, !tbaa !5
  %128 = fsub float 1.000000e+00, %127
  %129 = bitcast float %128 to i32
  %130 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %129) #3
  %131 = bitcast i32 %130 to float
  %132 = load volatile float, ptr %23, align 4, !tbaa !5
  %133 = fmul float %132, 5.000000e-01
  %134 = bitcast float %133 to i32
  %135 = call i32 inttoptr (i64 11 to ptr)(i32 noundef %134) #3
  %136 = bitcast i32 %135 to float
  %137 = fmul float %131, %136
  %138 = bitcast float %126 to i32
  %139 = bitcast float %137 to i32
  %140 = call i32 inttoptr (i64 13 to ptr)(i32 noundef %138, i32 noundef %139) #3
  %141 = bitcast i32 %140 to float
  %142 = fmul float %141, 2.000000e+00
  store volatile float %142, ptr %24, align 4, !tbaa !5
  %143 = load volatile float, ptr %14, align 4, !tbaa !5
  %144 = load volatile float, ptr %15, align 4, !tbaa !5
  %145 = load volatile float, ptr %23, align 4, !tbaa !5
  %146 = bitcast float %145 to i32
  %147 = call i32 inttoptr (i64 11 to ptr)(i32 noundef %146) #3
  %148 = bitcast i32 %147 to float
  %149 = fneg float %144
  %150 = call float @llvm.fmuladd.f32(float %149, float %148, float 1.000000e+00)
  %151 = fmul float %143, %150
  store volatile float %151, ptr %25, align 4, !tbaa !5
  %152 = load volatile float, ptr %24, align 4, !tbaa !5
  %153 = bitcast float %152 to i32
  %154 = call i32 inttoptr (i64 11 to ptr)(i32 noundef %153) #3
  %155 = bitcast i32 %154 to float
  %156 = load volatile float, ptr %24, align 4, !tbaa !5
  %157 = bitcast float %156 to i32
  %158 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %157) #3
  %159 = bitcast i32 %158 to float
  %160 = load volatile float, ptr %25, align 4, !tbaa !5
  %161 = load volatile float, ptr %4, align 4, !tbaa !5
  %162 = fneg float %161
  %163 = call float @llvm.fmuladd.f32(float %160, float %155, float %162)
  store volatile float %163, ptr %1, align 4, !tbaa !5
  %164 = load volatile float, ptr %25, align 4, !tbaa !5
  %165 = load volatile float, ptr %5, align 4, !tbaa !5
  %166 = fneg float %165
  %167 = call float @llvm.fmuladd.f32(float %164, float %159, float %166)
  store volatile float %167, ptr %2, align 4, !tbaa !5
  %168 = load volatile float, ptr %6, align 4, !tbaa !5
  %169 = fsub float 0.000000e+00, %168
  store volatile float %169, ptr %3, align 4, !tbaa !5
  %170 = fmul float %167, %167
  %171 = call float @llvm.fmuladd.f32(float %163, float %163, float %170)
  %172 = call float @llvm.fmuladd.f32(float %169, float %169, float %171)
  %173 = bitcast float %172 to i32
  %174 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %173) #3
  %175 = bitcast i32 %174 to float
  store volatile float %175, ptr %18, align 4, !tbaa !5
  %176 = load volatile float, ptr %18, align 4, !tbaa !5
  %177 = load volatile float, ptr %1, align 4, !tbaa !5
  %178 = fdiv float %177, %176
  store volatile float %178, ptr %1, align 4, !tbaa !5
  %179 = load volatile float, ptr %18, align 4, !tbaa !5
  %180 = load volatile float, ptr %2, align 4, !tbaa !5
  %181 = fdiv float %180, %179
  store volatile float %181, ptr %2, align 4, !tbaa !5
  %182 = load volatile float, ptr %18, align 4, !tbaa !5
  %183 = load volatile float, ptr %3, align 4, !tbaa !5
  %184 = fdiv float %183, %182
  store volatile float %184, ptr %3, align 4, !tbaa !5
  %185 = load volatile float, ptr %7, align 4, !tbaa !5
  %186 = load volatile float, ptr %1, align 4, !tbaa !5
  %187 = load volatile float, ptr %8, align 4, !tbaa !5
  %188 = load volatile float, ptr %2, align 4, !tbaa !5
  %189 = fmul float %187, %188
  %190 = call float @llvm.fmuladd.f32(float %185, float %186, float %189)
  %191 = load volatile float, ptr %9, align 4, !tbaa !5
  %192 = load volatile float, ptr %3, align 4, !tbaa !5
  %193 = call float @llvm.fmuladd.f32(float %191, float %192, float %190)
  store volatile float %193, ptr %26, align 4, !tbaa !5
  %194 = load volatile float, ptr %20, align 4, !tbaa !5
  %195 = load volatile float, ptr %26, align 4, !tbaa !5
  %196 = fadd float %195, 1.000000e+00
  %197 = fmul float %194, %196
  store volatile float %197, ptr %27, align 4, !tbaa !5
  %198 = load volatile float, ptr %20, align 4, !tbaa !5
  %199 = load volatile float, ptr %20, align 4, !tbaa !5
  %200 = fadd float %199, 1.000000e+00
  %201 = fdiv float %198, %200
  %202 = load volatile float, ptr %26, align 4, !tbaa !5
  %203 = fmul float %202, %201
  store volatile float %203, ptr %28, align 4, !tbaa !5
  %204 = load volatile float, ptr %1, align 4, !tbaa !5
  %205 = load volatile float, ptr %28, align 4, !tbaa !5
  %206 = load volatile float, ptr %7, align 4, !tbaa !5
  %207 = call float @llvm.fmuladd.f32(float %205, float %206, float %204)
  %208 = load volatile float, ptr %7, align 4, !tbaa !5
  %209 = fadd float %207, %208
  %210 = load volatile float, ptr %27, align 4, !tbaa !5
  %211 = fdiv float %209, %210
  store volatile float %211, ptr %10, align 4, !tbaa !5
  %212 = load volatile float, ptr %2, align 4, !tbaa !5
  %213 = load volatile float, ptr %28, align 4, !tbaa !5
  %214 = load volatile float, ptr %8, align 4, !tbaa !5
  %215 = call float @llvm.fmuladd.f32(float %213, float %214, float %212)
  %216 = load volatile float, ptr %8, align 4, !tbaa !5
  %217 = fadd float %215, %216
  %218 = load volatile float, ptr %27, align 4, !tbaa !5
  %219 = fdiv float %217, %218
  store volatile float %219, ptr %11, align 4, !tbaa !5
  %220 = load volatile float, ptr %3, align 4, !tbaa !5
  %221 = load volatile float, ptr %28, align 4, !tbaa !5
  %222 = load volatile float, ptr %9, align 4, !tbaa !5
  %223 = call float @llvm.fmuladd.f32(float %221, float %222, float %220)
  %224 = load volatile float, ptr %9, align 4, !tbaa !5
  %225 = fadd float %223, %224
  %226 = load volatile float, ptr %27, align 4, !tbaa !5
  %227 = fdiv float %225, %226
  store volatile float %227, ptr %12, align 4, !tbaa !5
  %228 = load volatile float, ptr %10, align 4, !tbaa !5
  %229 = load volatile float, ptr %10, align 4, !tbaa !5
  %230 = load volatile float, ptr %11, align 4, !tbaa !5
  %231 = load volatile float, ptr %11, align 4, !tbaa !5
  %232 = fmul float %230, %231
  %233 = call float @llvm.fmuladd.f32(float %228, float %229, float %232)
  %234 = load volatile float, ptr %12, align 4, !tbaa !5
  %235 = load volatile float, ptr %12, align 4, !tbaa !5
  %236 = call float @llvm.fmuladd.f32(float %234, float %235, float %233)
  %237 = bitcast float %236 to i32
  %238 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %237) #3
  %239 = bitcast i32 %238 to float
  store volatile float %239, ptr %29, align 4, !tbaa !5
  %240 = load volatile float, ptr %29, align 4, !tbaa !5
  %241 = load volatile float, ptr %10, align 4, !tbaa !5
  %242 = fdiv float %241, %240
  store volatile float %242, ptr %10, align 4, !tbaa !5
  %243 = load volatile float, ptr %29, align 4, !tbaa !5
  %244 = load volatile float, ptr %11, align 4, !tbaa !5
  %245 = fdiv float %244, %243
  store volatile float %245, ptr %11, align 4, !tbaa !5
  %246 = load volatile float, ptr %29, align 4, !tbaa !5
  %247 = load volatile float, ptr %12, align 4, !tbaa !5
  %248 = fdiv float %247, %246
  store volatile float %248, ptr %12, align 4, !tbaa !5
  %249 = load volatile float, ptr %18, align 4, !tbaa !5
  %250 = fdiv float %249, 0x41B1DE7840000000
  store volatile float %250, ptr %17, align 4, !tbaa !5
  %251 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %31) #3
  %252 = icmp eq ptr %251, null
  br i1 %252, label %253, label %73, !llvm.loop !11

253:                                              ; preds = %73, %0
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %31) #3
  store i64 0, ptr %30, align 8, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %32) #3
  %254 = load volatile float, ptr %4, align 4, !tbaa !5
  %255 = load volatile float, ptr %18, align 4, !tbaa !5
  %256 = load volatile float, ptr %10, align 4, !tbaa !5
  %257 = call float @llvm.fmuladd.f32(float %255, float %256, float %254)
  store float %257, ptr %32, align 4, !tbaa !5
  %258 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %36, ptr noundef nonnull %30, ptr noundef nonnull %32, i64 noundef 0) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %32) #3
  store i64 1, ptr %30, align 8, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %33) #3
  %259 = load volatile float, ptr %5, align 4, !tbaa !5
  %260 = load volatile float, ptr %18, align 4, !tbaa !5
  %261 = load volatile float, ptr %11, align 4, !tbaa !5
  %262 = call float @llvm.fmuladd.f32(float %260, float %261, float %259)
  store float %262, ptr %33, align 4, !tbaa !5
  %263 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %36, ptr noundef nonnull %30, ptr noundef nonnull %33, i64 noundef 0) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %33) #3
  store i64 2, ptr %30, align 8, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %34) #3
  %264 = load volatile float, ptr %6, align 4, !tbaa !5
  %265 = load volatile float, ptr %18, align 4, !tbaa !5
  %266 = load volatile float, ptr %12, align 4, !tbaa !5
  %267 = call float @llvm.fmuladd.f32(float %265, float %266, float %264)
  store float %267, ptr %34, align 4, !tbaa !5
  %268 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %36, ptr noundef nonnull %30, ptr noundef nonnull %34, i64 noundef 0) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %34) #3
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %31) #3
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
!3 = !{i64 2147507906}
!4 = !{i64 2147508418}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!"llvm.loop.unroll.disable"}
