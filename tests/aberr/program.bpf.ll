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
  br label %85

69:                                               ; preds = %85
  store i64 0, ptr %30, align 8, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %31) #3
  %70 = load volatile float, ptr %4, align 4, !tbaa !5
  %71 = load volatile float, ptr %18, align 4, !tbaa !5
  %72 = load volatile float, ptr %10, align 4, !tbaa !5
  %73 = call float @llvm.fmuladd.f32(float %71, float %72, float %70)
  store float %73, ptr %31, align 4, !tbaa !5
  %74 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %35, ptr noundef nonnull %30, ptr noundef nonnull %31, i64 noundef 0) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %31) #3
  store i64 1, ptr %30, align 8, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %32) #3
  %75 = load volatile float, ptr %5, align 4, !tbaa !5
  %76 = load volatile float, ptr %18, align 4, !tbaa !5
  %77 = load volatile float, ptr %11, align 4, !tbaa !5
  %78 = call float @llvm.fmuladd.f32(float %76, float %77, float %75)
  store float %78, ptr %32, align 4, !tbaa !5
  %79 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %35, ptr noundef nonnull %30, ptr noundef nonnull %32, i64 noundef 0) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %32) #3
  store i64 2, ptr %30, align 8, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %33) #3
  %80 = load volatile float, ptr %6, align 4, !tbaa !5
  %81 = load volatile float, ptr %18, align 4, !tbaa !5
  %82 = load volatile float, ptr %12, align 4, !tbaa !5
  %83 = call float @llvm.fmuladd.f32(float %81, float %82, float %80)
  store float %83, ptr %33, align 4, !tbaa !5
  %84 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %35, ptr noundef nonnull %30, ptr noundef nonnull %33, i64 noundef 0) #3
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

85:                                               ; preds = %0, %85
  %86 = phi i64 [ 0, %0 ], [ %264, %85 ]
  %87 = load volatile float, ptr %13, align 4, !tbaa !5
  %88 = load volatile float, ptr %17, align 4, !tbaa !5
  %89 = fsub float %87, %88
  store volatile float %89, ptr %21, align 4, !tbaa !5
  %90 = load volatile float, ptr %16, align 4, !tbaa !5
  %91 = load volatile float, ptr %21, align 4, !tbaa !5
  %92 = fmul float %90, %91
  store volatile float %92, ptr %22, align 4, !tbaa !5
  %93 = load volatile float, ptr %22, align 4, !tbaa !5
  store volatile float %93, ptr %23, align 4, !tbaa !5
  %94 = load volatile float, ptr %22, align 4, !tbaa !5
  %95 = load volatile float, ptr %15, align 4, !tbaa !5
  %96 = load volatile float, ptr %23, align 4, !tbaa !5
  %97 = bitcast float %96 to i32
  %98 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %97) #3
  %99 = bitcast i32 %98 to float
  %100 = call float @llvm.fmuladd.f32(float %95, float %99, float %94)
  store volatile float %100, ptr %23, align 4, !tbaa !5
  %101 = load volatile float, ptr %22, align 4, !tbaa !5
  %102 = load volatile float, ptr %15, align 4, !tbaa !5
  %103 = load volatile float, ptr %23, align 4, !tbaa !5
  %104 = bitcast float %103 to i32
  %105 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %104) #3
  %106 = bitcast i32 %105 to float
  %107 = call float @llvm.fmuladd.f32(float %102, float %106, float %101)
  store volatile float %107, ptr %23, align 4, !tbaa !5
  %108 = load volatile float, ptr %22, align 4, !tbaa !5
  %109 = load volatile float, ptr %15, align 4, !tbaa !5
  %110 = load volatile float, ptr %23, align 4, !tbaa !5
  %111 = bitcast float %110 to i32
  %112 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %111) #3
  %113 = bitcast i32 %112 to float
  %114 = call float @llvm.fmuladd.f32(float %109, float %113, float %108)
  store volatile float %114, ptr %23, align 4, !tbaa !5
  %115 = load volatile float, ptr %22, align 4, !tbaa !5
  %116 = load volatile float, ptr %15, align 4, !tbaa !5
  %117 = load volatile float, ptr %23, align 4, !tbaa !5
  %118 = bitcast float %117 to i32
  %119 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %118) #3
  %120 = bitcast i32 %119 to float
  %121 = call float @llvm.fmuladd.f32(float %116, float %120, float %115)
  store volatile float %121, ptr %23, align 4, !tbaa !5
  %122 = load volatile float, ptr %22, align 4, !tbaa !5
  %123 = load volatile float, ptr %15, align 4, !tbaa !5
  %124 = load volatile float, ptr %23, align 4, !tbaa !5
  %125 = bitcast float %124 to i32
  %126 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %125) #3
  %127 = bitcast i32 %126 to float
  %128 = call float @llvm.fmuladd.f32(float %123, float %127, float %122)
  store volatile float %128, ptr %23, align 4, !tbaa !5
  %129 = load volatile float, ptr %15, align 4, !tbaa !5
  %130 = fadd float %129, 1.000000e+00
  %131 = bitcast float %130 to i32
  %132 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %131) #3
  %133 = bitcast i32 %132 to float
  %134 = load volatile float, ptr %23, align 4, !tbaa !5
  %135 = fmul float %134, 5.000000e-01
  %136 = bitcast float %135 to i32
  %137 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %136) #3
  %138 = bitcast i32 %137 to float
  %139 = fmul float %133, %138
  %140 = load volatile float, ptr %15, align 4, !tbaa !5
  %141 = fsub float 1.000000e+00, %140
  %142 = bitcast float %141 to i32
  %143 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %142) #3
  %144 = bitcast i32 %143 to float
  %145 = load volatile float, ptr %23, align 4, !tbaa !5
  %146 = fmul float %145, 5.000000e-01
  %147 = bitcast float %146 to i32
  %148 = call i32 inttoptr (i64 11 to ptr)(i32 noundef %147) #3
  %149 = bitcast i32 %148 to float
  %150 = fmul float %144, %149
  %151 = bitcast float %139 to i32
  %152 = bitcast float %150 to i32
  %153 = call i32 inttoptr (i64 13 to ptr)(i32 noundef %151, i32 noundef %152) #3
  %154 = bitcast i32 %153 to float
  %155 = fmul float %154, 2.000000e+00
  store volatile float %155, ptr %24, align 4, !tbaa !5
  %156 = load volatile float, ptr %14, align 4, !tbaa !5
  %157 = load volatile float, ptr %15, align 4, !tbaa !5
  %158 = load volatile float, ptr %23, align 4, !tbaa !5
  %159 = bitcast float %158 to i32
  %160 = call i32 inttoptr (i64 11 to ptr)(i32 noundef %159) #3
  %161 = bitcast i32 %160 to float
  %162 = fneg float %157
  %163 = call float @llvm.fmuladd.f32(float %162, float %161, float 1.000000e+00)
  %164 = fmul float %156, %163
  store volatile float %164, ptr %25, align 4, !tbaa !5
  %165 = load volatile float, ptr %24, align 4, !tbaa !5
  %166 = bitcast float %165 to i32
  %167 = call i32 inttoptr (i64 11 to ptr)(i32 noundef %166) #3
  %168 = bitcast i32 %167 to float
  %169 = load volatile float, ptr %24, align 4, !tbaa !5
  %170 = bitcast float %169 to i32
  %171 = call i32 inttoptr (i64 10 to ptr)(i32 noundef %170) #3
  %172 = bitcast i32 %171 to float
  %173 = load volatile float, ptr %25, align 4, !tbaa !5
  %174 = load volatile float, ptr %4, align 4, !tbaa !5
  %175 = fneg float %174
  %176 = call float @llvm.fmuladd.f32(float %173, float %168, float %175)
  store volatile float %176, ptr %1, align 4, !tbaa !5
  %177 = load volatile float, ptr %25, align 4, !tbaa !5
  %178 = load volatile float, ptr %5, align 4, !tbaa !5
  %179 = fneg float %178
  %180 = call float @llvm.fmuladd.f32(float %177, float %172, float %179)
  store volatile float %180, ptr %2, align 4, !tbaa !5
  %181 = load volatile float, ptr %6, align 4, !tbaa !5
  %182 = fsub float 0.000000e+00, %181
  store volatile float %182, ptr %3, align 4, !tbaa !5
  %183 = fmul float %180, %180
  %184 = call float @llvm.fmuladd.f32(float %176, float %176, float %183)
  %185 = call float @llvm.fmuladd.f32(float %182, float %182, float %184)
  %186 = bitcast float %185 to i32
  %187 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %186) #3
  %188 = bitcast i32 %187 to float
  store volatile float %188, ptr %18, align 4, !tbaa !5
  %189 = load volatile float, ptr %18, align 4, !tbaa !5
  %190 = load volatile float, ptr %1, align 4, !tbaa !5
  %191 = fdiv float %190, %189
  store volatile float %191, ptr %1, align 4, !tbaa !5
  %192 = load volatile float, ptr %18, align 4, !tbaa !5
  %193 = load volatile float, ptr %2, align 4, !tbaa !5
  %194 = fdiv float %193, %192
  store volatile float %194, ptr %2, align 4, !tbaa !5
  %195 = load volatile float, ptr %18, align 4, !tbaa !5
  %196 = load volatile float, ptr %3, align 4, !tbaa !5
  %197 = fdiv float %196, %195
  store volatile float %197, ptr %3, align 4, !tbaa !5
  %198 = load volatile float, ptr %7, align 4, !tbaa !5
  %199 = load volatile float, ptr %1, align 4, !tbaa !5
  %200 = load volatile float, ptr %8, align 4, !tbaa !5
  %201 = load volatile float, ptr %2, align 4, !tbaa !5
  %202 = fmul float %200, %201
  %203 = call float @llvm.fmuladd.f32(float %198, float %199, float %202)
  %204 = load volatile float, ptr %9, align 4, !tbaa !5
  %205 = load volatile float, ptr %3, align 4, !tbaa !5
  %206 = call float @llvm.fmuladd.f32(float %204, float %205, float %203)
  store volatile float %206, ptr %26, align 4, !tbaa !5
  %207 = load volatile float, ptr %20, align 4, !tbaa !5
  %208 = load volatile float, ptr %26, align 4, !tbaa !5
  %209 = fadd float %208, 1.000000e+00
  %210 = fmul float %207, %209
  store volatile float %210, ptr %27, align 4, !tbaa !5
  %211 = load volatile float, ptr %20, align 4, !tbaa !5
  %212 = load volatile float, ptr %20, align 4, !tbaa !5
  %213 = fadd float %212, 1.000000e+00
  %214 = fdiv float %211, %213
  %215 = load volatile float, ptr %26, align 4, !tbaa !5
  %216 = fmul float %215, %214
  store volatile float %216, ptr %28, align 4, !tbaa !5
  %217 = load volatile float, ptr %1, align 4, !tbaa !5
  %218 = load volatile float, ptr %28, align 4, !tbaa !5
  %219 = load volatile float, ptr %7, align 4, !tbaa !5
  %220 = call float @llvm.fmuladd.f32(float %218, float %219, float %217)
  %221 = load volatile float, ptr %7, align 4, !tbaa !5
  %222 = fadd float %220, %221
  %223 = load volatile float, ptr %27, align 4, !tbaa !5
  %224 = fdiv float %222, %223
  store volatile float %224, ptr %10, align 4, !tbaa !5
  %225 = load volatile float, ptr %2, align 4, !tbaa !5
  %226 = load volatile float, ptr %28, align 4, !tbaa !5
  %227 = load volatile float, ptr %8, align 4, !tbaa !5
  %228 = call float @llvm.fmuladd.f32(float %226, float %227, float %225)
  %229 = load volatile float, ptr %8, align 4, !tbaa !5
  %230 = fadd float %228, %229
  %231 = load volatile float, ptr %27, align 4, !tbaa !5
  %232 = fdiv float %230, %231
  store volatile float %232, ptr %11, align 4, !tbaa !5
  %233 = load volatile float, ptr %3, align 4, !tbaa !5
  %234 = load volatile float, ptr %28, align 4, !tbaa !5
  %235 = load volatile float, ptr %9, align 4, !tbaa !5
  %236 = call float @llvm.fmuladd.f32(float %234, float %235, float %233)
  %237 = load volatile float, ptr %9, align 4, !tbaa !5
  %238 = fadd float %236, %237
  %239 = load volatile float, ptr %27, align 4, !tbaa !5
  %240 = fdiv float %238, %239
  store volatile float %240, ptr %12, align 4, !tbaa !5
  %241 = load volatile float, ptr %10, align 4, !tbaa !5
  %242 = load volatile float, ptr %10, align 4, !tbaa !5
  %243 = load volatile float, ptr %11, align 4, !tbaa !5
  %244 = load volatile float, ptr %11, align 4, !tbaa !5
  %245 = fmul float %243, %244
  %246 = call float @llvm.fmuladd.f32(float %241, float %242, float %245)
  %247 = load volatile float, ptr %12, align 4, !tbaa !5
  %248 = load volatile float, ptr %12, align 4, !tbaa !5
  %249 = call float @llvm.fmuladd.f32(float %247, float %248, float %246)
  %250 = bitcast float %249 to i32
  %251 = call i32 inttoptr (i64 9 to ptr)(i32 noundef %250) #3
  %252 = bitcast i32 %251 to float
  store volatile float %252, ptr %29, align 4, !tbaa !5
  %253 = load volatile float, ptr %29, align 4, !tbaa !5
  %254 = load volatile float, ptr %10, align 4, !tbaa !5
  %255 = fdiv float %254, %253
  store volatile float %255, ptr %10, align 4, !tbaa !5
  %256 = load volatile float, ptr %29, align 4, !tbaa !5
  %257 = load volatile float, ptr %11, align 4, !tbaa !5
  %258 = fdiv float %257, %256
  store volatile float %258, ptr %11, align 4, !tbaa !5
  %259 = load volatile float, ptr %29, align 4, !tbaa !5
  %260 = load volatile float, ptr %12, align 4, !tbaa !5
  %261 = fdiv float %260, %259
  store volatile float %261, ptr %12, align 4, !tbaa !5
  %262 = load volatile float, ptr %18, align 4, !tbaa !5
  %263 = fdiv float %262, 0x41B1DE7840000000
  store volatile float %263, ptr %17, align 4, !tbaa !5
  %264 = add nuw nsw i64 %86, 1
  %265 = icmp eq i64 %264, 5
  br i1 %265, label %69, label %85, !llvm.loop !11
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
!3 = !{i64 2147507679}
!4 = !{i64 2147508191}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!"llvm.loop.unroll.disable"}
