; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

%struct.bpf_iter_num = type { i64, i64, i64, i64 }

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca [256 x i8], align 1
  %2 = alloca [512 x i8], align 1
  %3 = alloca [5 x i8], align 1
  %4 = alloca [20 x i8], align 1
  %5 = alloca %struct.bpf_iter_num, align 8
  %6 = alloca %struct.bpf_iter_num, align 8
  %7 = alloca %struct.bpf_iter_num, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 17, i32 0, i32 0, i32 0) #2, !srcloc !3
  %11 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 18, i32 0, i32 0, i32 0) #2, !srcloc !4
  call void @llvm.lifetime.start.p0(i64 256, ptr nonnull %1) #2
  call void @llvm.lifetime.start.p0(i64 512, ptr nonnull %2) #2
  call void @llvm.lifetime.start.p0(i64 5, ptr nonnull %3) #2
  call void @llvm.lifetime.start.p0(i64 20, ptr nonnull %4) #2
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %5) #2
  %12 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %5, i32 noundef 0, i32 noundef 255) #2
  %13 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %14 = icmp eq ptr %13, null
  br i1 %14, label %32, label %15

15:                                               ; preds = %0, %15
  %16 = phi ptr [ %30, %15 ], [ %13, %0 ]
  %17 = phi i32 [ %29, %15 ], [ 1, %0 ]
  %18 = trunc i32 %17 to i8
  %19 = load i64, ptr %16, align 8, !tbaa !5
  %20 = getelementptr inbounds [512 x i8], ptr %2, i64 0, i64 %19
  store volatile i8 %18, ptr %20, align 1, !tbaa !9
  %21 = load i64, ptr %16, align 8, !tbaa !5
  %22 = trunc i64 %21 to i8
  %23 = zext i32 %17 to i64
  %24 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %23
  store volatile i8 %22, ptr %24, align 1, !tbaa !9
  %25 = shl i32 %17, 1
  %26 = and i32 %17, 128
  %27 = icmp eq i32 %26, 0
  %28 = select i1 %27, i32 0, i32 285
  %29 = xor i32 %28, %25
  %30 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %31 = icmp eq ptr %30, null
  br i1 %31, label %32, label %15, !llvm.loop !10

32:                                               ; preds = %15, %0
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %5) #2
  %33 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %5, i32 noundef 255, i32 noundef 511) #2
  %34 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %35 = icmp eq ptr %34, null
  br i1 %35, label %45, label %36

36:                                               ; preds = %32, %36
  %37 = phi ptr [ %43, %36 ], [ %34, %32 ]
  %38 = load i64, ptr %37, align 8, !tbaa !5
  %39 = add nsw i64 %38, -255
  %40 = getelementptr inbounds [512 x i8], ptr %2, i64 0, i64 %39
  %41 = load volatile i8, ptr %40, align 1, !tbaa !9
  %42 = getelementptr inbounds [512 x i8], ptr %2, i64 0, i64 %38
  store volatile i8 %41, ptr %42, align 1, !tbaa !9
  %43 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %44 = icmp eq ptr %43, null
  br i1 %44, label %45, label %36, !llvm.loop !13

45:                                               ; preds = %36, %32
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %5) #2
  store volatile i8 1, ptr %3, align 1, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %6) #2
  %46 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %6, i32 noundef 1, i32 noundef 5) #2
  %47 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %6) #2
  %48 = icmp eq ptr %47, null
  br i1 %48, label %55, label %49

49:                                               ; preds = %45, %49
  %50 = phi ptr [ %53, %49 ], [ %47, %45 ]
  %51 = load i64, ptr %50, align 8, !tbaa !5
  %52 = getelementptr inbounds [5 x i8], ptr %3, i64 0, i64 %51
  store volatile i8 0, ptr %52, align 1, !tbaa !9
  %53 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %6) #2
  %54 = icmp eq ptr %53, null
  br i1 %54, label %55, label %49, !llvm.loop !14

55:                                               ; preds = %49, %45
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %6) #2
  %56 = load volatile i8, ptr %2, align 1, !tbaa !9
  %57 = load volatile i8, ptr %3, align 1, !tbaa !9
  %58 = call i32 asm sideeffect "", "=r,0"(i32 0) #2, !srcloc !15
  %59 = load volatile i8, ptr %1, align 1, !tbaa !9
  %60 = zext i8 %59 to i64
  %61 = zext i8 %56 to i64
  %62 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %61
  %63 = load volatile i8, ptr %62, align 1, !tbaa !9
  %64 = zext i8 %63 to i64
  %65 = add nuw nsw i64 %64, %60
  %66 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %65
  %67 = load volatile i8, ptr %66, align 1, !tbaa !9
  %68 = icmp slt i32 %58, 0
  %69 = select i1 %68, i8 %67, i8 0
  %70 = xor i8 %69, %57
  %71 = getelementptr inbounds nuw i8, ptr %3, i64 1
  store volatile i8 %70, ptr %71, align 1, !tbaa !9
  %72 = load volatile i8, ptr %3, align 1, !tbaa !9
  %73 = zext i8 %72 to i32
  %74 = sub nsw i32 0, %73
  %75 = or i32 %73, %74
  %76 = call i32 asm sideeffect "", "=r,0"(i32 %75) #2, !srcloc !16
  %77 = zext i8 %72 to i64
  %78 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %77
  %79 = load volatile i8, ptr %78, align 1, !tbaa !9
  %80 = zext i8 %79 to i64
  %81 = load volatile i8, ptr %62, align 1, !tbaa !9
  %82 = zext i8 %81 to i64
  %83 = add nuw nsw i64 %82, %80
  %84 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %83
  %85 = load volatile i8, ptr %84, align 1, !tbaa !9
  %86 = icmp slt i32 %76, 0
  %87 = select i1 %86, i8 %85, i8 0
  store volatile i8 %87, ptr %3, align 1, !tbaa !9
  %88 = getelementptr inbounds nuw i8, ptr %2, i64 1
  %89 = load volatile i8, ptr %88, align 1, !tbaa !9
  %90 = load volatile i8, ptr %71, align 1, !tbaa !9
  %91 = call i32 asm sideeffect "", "=r,0"(i32 0) #2, !srcloc !17
  %92 = load volatile i8, ptr %1, align 1, !tbaa !9
  %93 = zext i8 %92 to i64
  %94 = zext i8 %89 to i64
  %95 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %94
  %96 = load volatile i8, ptr %95, align 1, !tbaa !9
  %97 = zext i8 %96 to i64
  %98 = add nuw nsw i64 %97, %93
  %99 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %98
  %100 = load volatile i8, ptr %99, align 1, !tbaa !9
  %101 = icmp slt i32 %91, 0
  %102 = select i1 %101, i8 %100, i8 0
  %103 = xor i8 %102, %90
  %104 = getelementptr inbounds nuw i8, ptr %3, i64 2
  store volatile i8 %103, ptr %104, align 1, !tbaa !9
  %105 = load volatile i8, ptr %3, align 1, !tbaa !9
  %106 = load volatile i8, ptr %71, align 1, !tbaa !9
  %107 = zext i8 %106 to i32
  %108 = sub nsw i32 0, %107
  %109 = or i32 %107, %108
  %110 = call i32 asm sideeffect "", "=r,0"(i32 %109) #2, !srcloc !18
  %111 = zext i8 %106 to i64
  %112 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %111
  %113 = load volatile i8, ptr %112, align 1, !tbaa !9
  %114 = zext i8 %113 to i64
  %115 = load volatile i8, ptr %95, align 1, !tbaa !9
  %116 = zext i8 %115 to i64
  %117 = add nuw nsw i64 %116, %114
  %118 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %117
  %119 = load volatile i8, ptr %118, align 1, !tbaa !9
  %120 = icmp slt i32 %110, 0
  %121 = select i1 %120, i8 %119, i8 0
  %122 = xor i8 %121, %105
  store volatile i8 %122, ptr %71, align 1, !tbaa !9
  %123 = load volatile i8, ptr %3, align 1, !tbaa !9
  %124 = zext i8 %123 to i32
  %125 = sub nsw i32 0, %124
  %126 = or i32 %124, %125
  %127 = call i32 asm sideeffect "", "=r,0"(i32 %126) #2, !srcloc !19
  %128 = zext i8 %123 to i64
  %129 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %128
  %130 = load volatile i8, ptr %129, align 1, !tbaa !9
  %131 = zext i8 %130 to i64
  %132 = load volatile i8, ptr %95, align 1, !tbaa !9
  %133 = zext i8 %132 to i64
  %134 = add nuw nsw i64 %133, %131
  %135 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %134
  %136 = load volatile i8, ptr %135, align 1, !tbaa !9
  %137 = icmp slt i32 %127, 0
  %138 = select i1 %137, i8 %136, i8 0
  store volatile i8 %138, ptr %3, align 1, !tbaa !9
  %139 = getelementptr inbounds nuw i8, ptr %2, i64 2
  %140 = load volatile i8, ptr %139, align 1, !tbaa !9
  %141 = load volatile i8, ptr %104, align 1, !tbaa !9
  %142 = call i32 asm sideeffect "", "=r,0"(i32 0) #2, !srcloc !20
  %143 = load volatile i8, ptr %1, align 1, !tbaa !9
  %144 = zext i8 %143 to i64
  %145 = zext i8 %140 to i64
  %146 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %145
  %147 = load volatile i8, ptr %146, align 1, !tbaa !9
  %148 = zext i8 %147 to i64
  %149 = add nuw nsw i64 %148, %144
  %150 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %149
  %151 = load volatile i8, ptr %150, align 1, !tbaa !9
  %152 = icmp slt i32 %142, 0
  %153 = select i1 %152, i8 %151, i8 0
  %154 = xor i8 %153, %141
  %155 = getelementptr inbounds nuw i8, ptr %3, i64 3
  store volatile i8 %154, ptr %155, align 1, !tbaa !9
  %156 = load volatile i8, ptr %71, align 1, !tbaa !9
  %157 = load volatile i8, ptr %104, align 1, !tbaa !9
  %158 = zext i8 %157 to i32
  %159 = sub nsw i32 0, %158
  %160 = or i32 %158, %159
  %161 = call i32 asm sideeffect "", "=r,0"(i32 %160) #2, !srcloc !21
  %162 = zext i8 %157 to i64
  %163 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %162
  %164 = load volatile i8, ptr %163, align 1, !tbaa !9
  %165 = zext i8 %164 to i64
  %166 = load volatile i8, ptr %146, align 1, !tbaa !9
  %167 = zext i8 %166 to i64
  %168 = add nuw nsw i64 %167, %165
  %169 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %168
  %170 = load volatile i8, ptr %169, align 1, !tbaa !9
  %171 = icmp slt i32 %161, 0
  %172 = select i1 %171, i8 %170, i8 0
  %173 = xor i8 %172, %156
  store volatile i8 %173, ptr %104, align 1, !tbaa !9
  %174 = load volatile i8, ptr %3, align 1, !tbaa !9
  %175 = load volatile i8, ptr %71, align 1, !tbaa !9
  %176 = zext i8 %175 to i32
  %177 = sub nsw i32 0, %176
  %178 = or i32 %176, %177
  %179 = call i32 asm sideeffect "", "=r,0"(i32 %178) #2, !srcloc !22
  %180 = zext i8 %175 to i64
  %181 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %180
  %182 = load volatile i8, ptr %181, align 1, !tbaa !9
  %183 = zext i8 %182 to i64
  %184 = load volatile i8, ptr %146, align 1, !tbaa !9
  %185 = zext i8 %184 to i64
  %186 = add nuw nsw i64 %185, %183
  %187 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %186
  %188 = load volatile i8, ptr %187, align 1, !tbaa !9
  %189 = icmp slt i32 %179, 0
  %190 = select i1 %189, i8 %188, i8 0
  %191 = xor i8 %190, %174
  store volatile i8 %191, ptr %71, align 1, !tbaa !9
  %192 = load volatile i8, ptr %3, align 1, !tbaa !9
  %193 = zext i8 %192 to i32
  %194 = sub nsw i32 0, %193
  %195 = or i32 %193, %194
  %196 = call i32 asm sideeffect "", "=r,0"(i32 %195) #2, !srcloc !23
  %197 = zext i8 %192 to i64
  %198 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %197
  %199 = load volatile i8, ptr %198, align 1, !tbaa !9
  %200 = zext i8 %199 to i64
  %201 = load volatile i8, ptr %146, align 1, !tbaa !9
  %202 = zext i8 %201 to i64
  %203 = add nuw nsw i64 %202, %200
  %204 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %203
  %205 = load volatile i8, ptr %204, align 1, !tbaa !9
  %206 = icmp slt i32 %196, 0
  %207 = select i1 %206, i8 %205, i8 0
  store volatile i8 %207, ptr %3, align 1, !tbaa !9
  %208 = getelementptr inbounds nuw i8, ptr %2, i64 3
  %209 = load volatile i8, ptr %208, align 1, !tbaa !9
  %210 = load volatile i8, ptr %155, align 1, !tbaa !9
  %211 = call i32 asm sideeffect "", "=r,0"(i32 0) #2, !srcloc !24
  %212 = load volatile i8, ptr %1, align 1, !tbaa !9
  %213 = zext i8 %212 to i64
  %214 = zext i8 %209 to i64
  %215 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %214
  %216 = load volatile i8, ptr %215, align 1, !tbaa !9
  %217 = zext i8 %216 to i64
  %218 = add nuw nsw i64 %217, %213
  %219 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %218
  %220 = load volatile i8, ptr %219, align 1, !tbaa !9
  %221 = icmp slt i32 %211, 0
  %222 = select i1 %221, i8 %220, i8 0
  %223 = xor i8 %222, %210
  %224 = getelementptr inbounds nuw i8, ptr %3, i64 4
  store volatile i8 %223, ptr %224, align 1, !tbaa !9
  %225 = load volatile i8, ptr %104, align 1, !tbaa !9
  %226 = load volatile i8, ptr %155, align 1, !tbaa !9
  %227 = zext i8 %226 to i32
  %228 = sub nsw i32 0, %227
  %229 = or i32 %227, %228
  %230 = call i32 asm sideeffect "", "=r,0"(i32 %229) #2, !srcloc !25
  %231 = zext i8 %226 to i64
  %232 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %231
  %233 = load volatile i8, ptr %232, align 1, !tbaa !9
  %234 = zext i8 %233 to i64
  %235 = load volatile i8, ptr %215, align 1, !tbaa !9
  %236 = zext i8 %235 to i64
  %237 = add nuw nsw i64 %236, %234
  %238 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %237
  %239 = load volatile i8, ptr %238, align 1, !tbaa !9
  %240 = icmp slt i32 %230, 0
  %241 = select i1 %240, i8 %239, i8 0
  %242 = xor i8 %241, %225
  store volatile i8 %242, ptr %155, align 1, !tbaa !9
  %243 = load volatile i8, ptr %71, align 1, !tbaa !9
  %244 = load volatile i8, ptr %104, align 1, !tbaa !9
  %245 = zext i8 %244 to i32
  %246 = sub nsw i32 0, %245
  %247 = or i32 %245, %246
  %248 = call i32 asm sideeffect "", "=r,0"(i32 %247) #2, !srcloc !26
  %249 = zext i8 %244 to i64
  %250 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %249
  %251 = load volatile i8, ptr %250, align 1, !tbaa !9
  %252 = zext i8 %251 to i64
  %253 = load volatile i8, ptr %215, align 1, !tbaa !9
  %254 = zext i8 %253 to i64
  %255 = add nuw nsw i64 %254, %252
  %256 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %255
  %257 = load volatile i8, ptr %256, align 1, !tbaa !9
  %258 = icmp slt i32 %248, 0
  %259 = select i1 %258, i8 %257, i8 0
  %260 = xor i8 %259, %243
  store volatile i8 %260, ptr %104, align 1, !tbaa !9
  %261 = load volatile i8, ptr %3, align 1, !tbaa !9
  %262 = load volatile i8, ptr %71, align 1, !tbaa !9
  %263 = zext i8 %262 to i32
  %264 = sub nsw i32 0, %263
  %265 = or i32 %263, %264
  %266 = call i32 asm sideeffect "", "=r,0"(i32 %265) #2, !srcloc !27
  %267 = zext i8 %262 to i64
  %268 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %267
  %269 = load volatile i8, ptr %268, align 1, !tbaa !9
  %270 = zext i8 %269 to i64
  %271 = load volatile i8, ptr %215, align 1, !tbaa !9
  %272 = zext i8 %271 to i64
  %273 = add nuw nsw i64 %272, %270
  %274 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %273
  %275 = load volatile i8, ptr %274, align 1, !tbaa !9
  %276 = icmp slt i32 %266, 0
  %277 = select i1 %276, i8 %275, i8 0
  %278 = xor i8 %277, %261
  store volatile i8 %278, ptr %71, align 1, !tbaa !9
  %279 = load volatile i8, ptr %3, align 1, !tbaa !9
  %280 = zext i8 %279 to i32
  %281 = sub nsw i32 0, %280
  %282 = or i32 %280, %281
  %283 = call i32 asm sideeffect "", "=r,0"(i32 %282) #2, !srcloc !28
  %284 = zext i8 %279 to i64
  %285 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %284
  %286 = load volatile i8, ptr %285, align 1, !tbaa !9
  %287 = zext i8 %286 to i64
  %288 = load volatile i8, ptr %215, align 1, !tbaa !9
  %289 = zext i8 %288 to i64
  %290 = add nuw nsw i64 %289, %287
  %291 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %290
  %292 = load volatile i8, ptr %291, align 1, !tbaa !9
  %293 = icmp slt i32 %283, 0
  %294 = select i1 %293, i8 %292, i8 0
  store volatile i8 %294, ptr %3, align 1, !tbaa !9
  %295 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %5, i32 noundef 0, i32 noundef 16) #2
  %296 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %297 = icmp eq ptr %296, null
  br i1 %297, label %307, label %298

298:                                              ; preds = %55, %298
  %299 = phi ptr [ %305, %298 ], [ %296, %55 ]
  %300 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %10, ptr noundef nonnull %299) #2
  %301 = load i32, ptr %300, align 4, !tbaa !29
  %302 = trunc i32 %301 to i8
  %303 = load i64, ptr %299, align 8, !tbaa !5
  %304 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 %303
  store volatile i8 %302, ptr %304, align 1, !tbaa !9
  %305 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %306 = icmp eq ptr %305, null
  br i1 %306, label %307, label %298, !llvm.loop !31

307:                                              ; preds = %298, %55
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %5) #2
  %308 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %5, i32 noundef 16, i32 noundef 20) #2
  %309 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %310 = icmp eq ptr %309, null
  br i1 %310, label %317, label %311

311:                                              ; preds = %307, %311
  %312 = phi ptr [ %315, %311 ], [ %309, %307 ]
  %313 = load i64, ptr %312, align 8, !tbaa !5
  %314 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 %313
  store volatile i8 0, ptr %314, align 1, !tbaa !9
  %315 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %316 = icmp eq ptr %315, null
  br i1 %316, label %317, label %311, !llvm.loop !32

317:                                              ; preds = %311, %307
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %5) #2
  %318 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %5, i32 noundef 0, i32 noundef 16) #2
  %319 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %320 = icmp eq ptr %319, null
  br i1 %320, label %441, label %321

321:                                              ; preds = %317, %321
  %322 = phi ptr [ %439, %321 ], [ %319, %317 ]
  %323 = load i64, ptr %322, align 8, !tbaa !5
  %324 = getelementptr inbounds nuw [20 x i8], ptr %4, i64 0, i64 %323
  %325 = load volatile i8, ptr %324, align 1, !tbaa !9
  %326 = load volatile i8, ptr %224, align 1, !tbaa !9
  %327 = zext i8 %325 to i32
  %328 = sub nsw i32 0, %327
  %329 = or i32 %327, %328
  %330 = call i32 asm sideeffect "", "=r,0"(i32 %329) #2, !srcloc !33
  %331 = zext i8 %326 to i32
  %332 = sub nsw i32 0, %331
  %333 = or i32 %331, %332
  %334 = call i32 asm sideeffect "", "=r,0"(i32 %333) #2, !srcloc !34
  %335 = and i32 %334, %330
  %336 = zext i8 %326 to i64
  %337 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %336
  %338 = load volatile i8, ptr %337, align 1, !tbaa !9
  %339 = zext i8 %338 to i64
  %340 = zext i8 %325 to i64
  %341 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %340
  %342 = load volatile i8, ptr %341, align 1, !tbaa !9
  %343 = zext i8 %342 to i64
  %344 = add nuw nsw i64 %343, %339
  %345 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %344
  %346 = load volatile i8, ptr %345, align 1, !tbaa !9
  %347 = icmp slt i32 %335, 0
  %348 = select i1 %347, i8 %346, i8 0
  %349 = load volatile i8, ptr %324, align 1, !tbaa !9
  %350 = xor i8 %348, %349
  store volatile i8 %350, ptr %324, align 1, !tbaa !9
  %351 = load volatile i8, ptr %155, align 1, !tbaa !9
  %352 = call i32 asm sideeffect "", "=r,0"(i32 %329) #2, !srcloc !35
  %353 = zext i8 %351 to i32
  %354 = sub nsw i32 0, %353
  %355 = or i32 %353, %354
  %356 = call i32 asm sideeffect "", "=r,0"(i32 %355) #2, !srcloc !36
  %357 = and i32 %356, %352
  %358 = add i64 %323, 1
  %359 = zext i8 %351 to i64
  %360 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %359
  %361 = load volatile i8, ptr %360, align 1, !tbaa !9
  %362 = zext i8 %361 to i64
  %363 = load volatile i8, ptr %341, align 1, !tbaa !9
  %364 = zext i8 %363 to i64
  %365 = add nuw nsw i64 %364, %362
  %366 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %365
  %367 = load volatile i8, ptr %366, align 1, !tbaa !9
  %368 = icmp slt i32 %357, 0
  %369 = select i1 %368, i8 %367, i8 0
  %370 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 %358
  %371 = load volatile i8, ptr %370, align 1, !tbaa !9
  %372 = xor i8 %369, %371
  store volatile i8 %372, ptr %370, align 1, !tbaa !9
  %373 = load volatile i8, ptr %104, align 1, !tbaa !9
  %374 = call i32 asm sideeffect "", "=r,0"(i32 %329) #2, !srcloc !37
  %375 = zext i8 %373 to i32
  %376 = sub nsw i32 0, %375
  %377 = or i32 %375, %376
  %378 = call i32 asm sideeffect "", "=r,0"(i32 %377) #2, !srcloc !38
  %379 = and i32 %378, %374
  %380 = add i64 %323, 2
  %381 = zext i8 %373 to i64
  %382 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %381
  %383 = load volatile i8, ptr %382, align 1, !tbaa !9
  %384 = zext i8 %383 to i64
  %385 = load volatile i8, ptr %341, align 1, !tbaa !9
  %386 = zext i8 %385 to i64
  %387 = add nuw nsw i64 %386, %384
  %388 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %387
  %389 = load volatile i8, ptr %388, align 1, !tbaa !9
  %390 = icmp slt i32 %379, 0
  %391 = select i1 %390, i8 %389, i8 0
  %392 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 %380
  %393 = load volatile i8, ptr %392, align 1, !tbaa !9
  %394 = xor i8 %391, %393
  store volatile i8 %394, ptr %392, align 1, !tbaa !9
  %395 = load volatile i8, ptr %71, align 1, !tbaa !9
  %396 = call i32 asm sideeffect "", "=r,0"(i32 %329) #2, !srcloc !39
  %397 = zext i8 %395 to i32
  %398 = sub nsw i32 0, %397
  %399 = or i32 %397, %398
  %400 = call i32 asm sideeffect "", "=r,0"(i32 %399) #2, !srcloc !40
  %401 = and i32 %400, %396
  %402 = add i64 %323, 3
  %403 = zext i8 %395 to i64
  %404 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %403
  %405 = load volatile i8, ptr %404, align 1, !tbaa !9
  %406 = zext i8 %405 to i64
  %407 = load volatile i8, ptr %341, align 1, !tbaa !9
  %408 = zext i8 %407 to i64
  %409 = add nuw nsw i64 %408, %406
  %410 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %409
  %411 = load volatile i8, ptr %410, align 1, !tbaa !9
  %412 = icmp slt i32 %401, 0
  %413 = select i1 %412, i8 %411, i8 0
  %414 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 %402
  %415 = load volatile i8, ptr %414, align 1, !tbaa !9
  %416 = xor i8 %413, %415
  store volatile i8 %416, ptr %414, align 1, !tbaa !9
  %417 = load volatile i8, ptr %3, align 1, !tbaa !9
  %418 = call i32 asm sideeffect "", "=r,0"(i32 %329) #2, !srcloc !41
  %419 = zext i8 %417 to i32
  %420 = sub nsw i32 0, %419
  %421 = or i32 %419, %420
  %422 = call i32 asm sideeffect "", "=r,0"(i32 %421) #2, !srcloc !42
  %423 = and i32 %422, %418
  %424 = add i64 %323, 4
  %425 = zext i8 %417 to i64
  %426 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %425
  %427 = load volatile i8, ptr %426, align 1, !tbaa !9
  %428 = zext i8 %427 to i64
  %429 = load volatile i8, ptr %341, align 1, !tbaa !9
  %430 = zext i8 %429 to i64
  %431 = add nuw nsw i64 %430, %428
  %432 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %431
  %433 = load volatile i8, ptr %432, align 1, !tbaa !9
  %434 = icmp slt i32 %423, 0
  %435 = select i1 %434, i8 %433, i8 0
  %436 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 %424
  %437 = load volatile i8, ptr %436, align 1, !tbaa !9
  %438 = xor i8 %435, %437
  store volatile i8 %438, ptr %436, align 1, !tbaa !9
  %439 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %440 = icmp eq ptr %439, null
  br i1 %440, label %441, label %321, !llvm.loop !43

441:                                              ; preds = %321, %317
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %5) #2
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %7) #2
  %442 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %7, i32 noundef 0, i32 noundef 4) #2
  %443 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %444 = icmp eq ptr %443, null
  br i1 %444, label %456, label %445

445:                                              ; preds = %441, %445
  %446 = phi ptr [ %454, %445 ], [ %443, %441 ]
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %8) #2
  %447 = load i64, ptr %446, align 8, !tbaa !5
  %448 = trunc i64 %447 to i32
  store i32 %448, ptr %8, align 4, !tbaa !29
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %9) #2
  %449 = add nsw i64 %447, 16
  %450 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 %449
  %451 = load volatile i8, ptr %450, align 1, !tbaa !9
  %452 = zext i8 %451 to i32
  store i32 %452, ptr %9, align 4, !tbaa !29
  %453 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %11, ptr noundef nonnull %8, ptr noundef nonnull %9, i64 noundef 0) #2
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %9) #2
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %8) #2
  %454 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %455 = icmp eq ptr %454, null
  br i1 %455, label %456, label %445, !llvm.loop !44

456:                                              ; preds = %445, %441
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %7) #2
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %7) #2
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %6) #2
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %5) #2
  call void @llvm.lifetime.end.p0(i64 20, ptr nonnull %4) #2
  call void @llvm.lifetime.end.p0(i64 5, ptr nonnull %3) #2
  call void @llvm.lifetime.end.p0(i64 512, ptr nonnull %2) #2
  call void @llvm.lifetime.end.p0(i64 256, ptr nonnull %1) #2
  ret i32 0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="duotronic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 03a843fe2f5c0023ee1e6ee21d74290f4387a642)"}
!3 = !{i64 2147509072}
!4 = !{i64 2147509588}
!5 = !{!6, !6, i64 0}
!6 = !{!"long long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!7, !7, i64 0}
!10 = distinct !{!10, !11, !12}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !11, !12}
!14 = distinct !{!14, !11, !12}
!15 = !{i64 2147510592}
!16 = !{i64 2147511170}
!17 = !{i64 2147511748}
!18 = !{i64 2147512326}
!19 = !{i64 2147512904}
!20 = !{i64 2147513482}
!21 = !{i64 2147514060}
!22 = !{i64 2147514638}
!23 = !{i64 2147515216}
!24 = !{i64 2147515794}
!25 = !{i64 2147516372}
!26 = !{i64 2147516950}
!27 = !{i64 2147517528}
!28 = !{i64 2147518106}
!29 = !{!30, !30, i64 0}
!30 = !{!"int", !7, i64 0}
!31 = distinct !{!31, !11, !12}
!32 = distinct !{!32, !11, !12}
!33 = !{i64 2147518870}
!34 = !{i64 2147518905}
!35 = !{i64 2147519654}
!36 = !{i64 2147519689}
!37 = !{i64 2147520438}
!38 = !{i64 2147520473}
!39 = !{i64 2147521222}
!40 = !{i64 2147521257}
!41 = !{i64 2147522006}
!42 = !{i64 2147522041}
!43 = distinct !{!43, !11, !12}
!44 = distinct !{!44, !11, !12}
