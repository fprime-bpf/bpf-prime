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
  %8 = alloca %struct.bpf_iter_num, align 8
  %9 = alloca %struct.bpf_iter_num, align 8
  %10 = alloca %struct.bpf_iter_num, align 8
  %11 = alloca %struct.bpf_iter_num, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 17, i32 0, i32 0, i32 0) #2, !srcloc !3
  %15 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 18, i32 0, i32 0, i32 0) #2, !srcloc !4
  call void @llvm.lifetime.start.p0(i64 256, ptr nonnull %1) #2
  call void @llvm.lifetime.start.p0(i64 512, ptr nonnull %2) #2
  call void @llvm.lifetime.start.p0(i64 5, ptr nonnull %3) #2
  call void @llvm.lifetime.start.p0(i64 20, ptr nonnull %4) #2
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %5) #2
  %16 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %5, i32 noundef 0, i32 noundef 255) #2
  %17 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %18 = icmp eq ptr %17, null
  br i1 %18, label %36, label %19

19:                                               ; preds = %0, %19
  %20 = phi ptr [ %34, %19 ], [ %17, %0 ]
  %21 = phi i32 [ %33, %19 ], [ 1, %0 ]
  %22 = trunc i32 %21 to i8
  %23 = load i64, ptr %20, align 8, !tbaa !5
  %24 = getelementptr inbounds [512 x i8], ptr %2, i64 0, i64 %23
  store volatile i8 %22, ptr %24, align 1, !tbaa !9
  %25 = load i64, ptr %20, align 8, !tbaa !5
  %26 = trunc i64 %25 to i8
  %27 = zext i32 %21 to i64
  %28 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %27
  store volatile i8 %26, ptr %28, align 1, !tbaa !9
  %29 = shl i32 %21, 1
  %30 = and i32 %21, 128
  %31 = icmp eq i32 %30, 0
  %32 = select i1 %31, i32 0, i32 285
  %33 = xor i32 %32, %29
  %34 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %35 = icmp eq ptr %34, null
  br i1 %35, label %36, label %19, !llvm.loop !10

36:                                               ; preds = %19, %0
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %5) #2
  %37 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %5, i32 noundef 255, i32 noundef 511) #2
  %38 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %39 = icmp eq ptr %38, null
  br i1 %39, label %49, label %40

40:                                               ; preds = %36, %40
  %41 = phi ptr [ %47, %40 ], [ %38, %36 ]
  %42 = load i64, ptr %41, align 8, !tbaa !5
  %43 = add nsw i64 %42, -255
  %44 = getelementptr inbounds [512 x i8], ptr %2, i64 0, i64 %43
  %45 = load volatile i8, ptr %44, align 1, !tbaa !9
  %46 = getelementptr inbounds [512 x i8], ptr %2, i64 0, i64 %42
  store volatile i8 %45, ptr %46, align 1, !tbaa !9
  %47 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %48 = icmp eq ptr %47, null
  br i1 %48, label %49, label %40, !llvm.loop !13

49:                                               ; preds = %40, %36
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %5) #2
  store volatile i8 1, ptr %3, align 1, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %6) #2
  %50 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %6, i32 noundef 1, i32 noundef 5) #2
  %51 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %6) #2
  %52 = icmp eq ptr %51, null
  br i1 %52, label %59, label %53

53:                                               ; preds = %49, %53
  %54 = phi ptr [ %57, %53 ], [ %51, %49 ]
  %55 = load i64, ptr %54, align 8, !tbaa !5
  %56 = getelementptr inbounds [5 x i8], ptr %3, i64 0, i64 %55
  store volatile i8 0, ptr %56, align 1, !tbaa !9
  %57 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %6) #2
  %58 = icmp eq ptr %57, null
  br i1 %58, label %59, label %53, !llvm.loop !14

59:                                               ; preds = %53, %49
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %6) #2
  %60 = load volatile i8, ptr %2, align 1, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %7) #2
  %61 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %7, i32 noundef 0, i32 noundef 2) #2
  %62 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %63 = icmp eq ptr %62, null
  br i1 %63, label %95, label %64

64:                                               ; preds = %59
  %65 = zext i8 %60 to i64
  %66 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %65
  br label %67

67:                                               ; preds = %64, %90
  %68 = phi ptr [ %62, %64 ], [ %93, %90 ]
  %69 = load i64, ptr %68, align 8, !tbaa !5
  %70 = sub nsw i64 1, %69
  %71 = icmp slt i64 %69, 1
  br i1 %71, label %72, label %76

72:                                               ; preds = %67
  %73 = sub i64 0, %69
  %74 = getelementptr inbounds nuw [5 x i8], ptr %3, i64 0, i64 %73
  %75 = load volatile i8, ptr %74, align 1, !tbaa !9
  br label %90

76:                                               ; preds = %67
  %77 = getelementptr inbounds [5 x i8], ptr %3, i64 0, i64 %70
  %78 = load volatile i8, ptr %77, align 1, !tbaa !9
  %79 = icmp eq i8 %78, 0
  br i1 %79, label %90, label %80

80:                                               ; preds = %76
  %81 = zext i8 %78 to i64
  %82 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %81
  %83 = load volatile i8, ptr %82, align 1, !tbaa !9
  %84 = zext i8 %83 to i64
  %85 = load volatile i8, ptr %66, align 1, !tbaa !9
  %86 = zext i8 %85 to i64
  %87 = add nuw nsw i64 %86, %84
  %88 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %87
  %89 = load volatile i8, ptr %88, align 1, !tbaa !9
  br label %90

90:                                               ; preds = %72, %76, %80
  %91 = phi i8 [ %89, %80 ], [ 0, %76 ], [ %75, %72 ]
  %92 = getelementptr inbounds [5 x i8], ptr %3, i64 0, i64 %70
  store volatile i8 %91, ptr %92, align 1, !tbaa !9
  %93 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %94 = icmp eq ptr %93, null
  br i1 %94, label %95, label %67, !llvm.loop !15

95:                                               ; preds = %90, %59
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %7) #2
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %7) #2
  %96 = getelementptr inbounds nuw i8, ptr %2, i64 1
  %97 = load volatile i8, ptr %96, align 1, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %8) #2
  %98 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %8, i32 noundef 0, i32 noundef 3) #2
  %99 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %8) #2
  %100 = icmp eq ptr %99, null
  br i1 %100, label %136, label %101

101:                                              ; preds = %95
  %102 = zext i8 %97 to i64
  %103 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %102
  br label %104

104:                                              ; preds = %101, %129
  %105 = phi ptr [ %99, %101 ], [ %134, %129 ]
  %106 = load i64, ptr %105, align 8, !tbaa !5
  %107 = sub nsw i64 2, %106
  %108 = icmp slt i64 %106, 2
  br i1 %108, label %109, label %114

109:                                              ; preds = %104
  %110 = sub i64 1, %106
  %111 = getelementptr inbounds nuw [5 x i8], ptr %3, i64 0, i64 %110
  %112 = load volatile i8, ptr %111, align 1, !tbaa !9
  %113 = icmp eq i64 %106, 1
  br i1 %113, label %114, label %129

114:                                              ; preds = %104, %109
  %115 = phi i8 [ %112, %109 ], [ 0, %104 ]
  %116 = getelementptr inbounds [5 x i8], ptr %3, i64 0, i64 %107
  %117 = load volatile i8, ptr %116, align 1, !tbaa !9
  %118 = icmp eq i8 %117, 0
  br i1 %118, label %129, label %119

119:                                              ; preds = %114
  %120 = zext i8 %117 to i64
  %121 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %120
  %122 = load volatile i8, ptr %121, align 1, !tbaa !9
  %123 = zext i8 %122 to i64
  %124 = load volatile i8, ptr %103, align 1, !tbaa !9
  %125 = zext i8 %124 to i64
  %126 = add nuw nsw i64 %125, %123
  %127 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %126
  %128 = load volatile i8, ptr %127, align 1, !tbaa !9
  br label %129

129:                                              ; preds = %109, %114, %119
  %130 = phi i8 [ %115, %119 ], [ %115, %114 ], [ %112, %109 ]
  %131 = phi i8 [ %128, %119 ], [ 0, %114 ], [ 0, %109 ]
  %132 = xor i8 %131, %130
  %133 = getelementptr inbounds [5 x i8], ptr %3, i64 0, i64 %107
  store volatile i8 %132, ptr %133, align 1, !tbaa !9
  %134 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %8) #2
  %135 = icmp eq ptr %134, null
  br i1 %135, label %136, label %104, !llvm.loop !16

136:                                              ; preds = %129, %95
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %8) #2
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %8) #2
  %137 = getelementptr inbounds nuw i8, ptr %2, i64 2
  %138 = load volatile i8, ptr %137, align 1, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %9) #2
  %139 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %9, i32 noundef 0, i32 noundef 4) #2
  %140 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %9) #2
  %141 = icmp eq ptr %140, null
  br i1 %141, label %177, label %142

142:                                              ; preds = %136
  %143 = zext i8 %138 to i64
  %144 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %143
  br label %145

145:                                              ; preds = %142, %170
  %146 = phi ptr [ %140, %142 ], [ %175, %170 ]
  %147 = load i64, ptr %146, align 8, !tbaa !5
  %148 = sub nsw i64 3, %147
  %149 = icmp slt i64 %147, 3
  br i1 %149, label %150, label %155

150:                                              ; preds = %145
  %151 = sub i64 2, %147
  %152 = getelementptr inbounds nuw [5 x i8], ptr %3, i64 0, i64 %151
  %153 = load volatile i8, ptr %152, align 1, !tbaa !9
  %154 = icmp sgt i64 %147, 0
  br i1 %154, label %155, label %170

155:                                              ; preds = %145, %150
  %156 = phi i8 [ %153, %150 ], [ 0, %145 ]
  %157 = getelementptr inbounds [5 x i8], ptr %3, i64 0, i64 %148
  %158 = load volatile i8, ptr %157, align 1, !tbaa !9
  %159 = icmp eq i8 %158, 0
  br i1 %159, label %170, label %160

160:                                              ; preds = %155
  %161 = zext i8 %158 to i64
  %162 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %161
  %163 = load volatile i8, ptr %162, align 1, !tbaa !9
  %164 = zext i8 %163 to i64
  %165 = load volatile i8, ptr %144, align 1, !tbaa !9
  %166 = zext i8 %165 to i64
  %167 = add nuw nsw i64 %166, %164
  %168 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %167
  %169 = load volatile i8, ptr %168, align 1, !tbaa !9
  br label %170

170:                                              ; preds = %150, %155, %160
  %171 = phi i8 [ %156, %160 ], [ %156, %155 ], [ %153, %150 ]
  %172 = phi i8 [ %169, %160 ], [ 0, %155 ], [ 0, %150 ]
  %173 = xor i8 %172, %171
  %174 = getelementptr inbounds [5 x i8], ptr %3, i64 0, i64 %148
  store volatile i8 %173, ptr %174, align 1, !tbaa !9
  %175 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %9) #2
  %176 = icmp eq ptr %175, null
  br i1 %176, label %177, label %145, !llvm.loop !17

177:                                              ; preds = %170, %136
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %9) #2
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %9) #2
  %178 = getelementptr inbounds nuw i8, ptr %2, i64 3
  %179 = load volatile i8, ptr %178, align 1, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %10) #2
  %180 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %10, i32 noundef 0, i32 noundef 5) #2
  %181 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %10) #2
  %182 = icmp eq ptr %181, null
  br i1 %182, label %218, label %183

183:                                              ; preds = %177
  %184 = zext i8 %179 to i64
  %185 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %184
  br label %186

186:                                              ; preds = %183, %211
  %187 = phi ptr [ %181, %183 ], [ %216, %211 ]
  %188 = load i64, ptr %187, align 8, !tbaa !5
  %189 = sub nsw i64 4, %188
  %190 = icmp slt i64 %188, 4
  br i1 %190, label %191, label %196

191:                                              ; preds = %186
  %192 = sub i64 3, %188
  %193 = getelementptr inbounds nuw [5 x i8], ptr %3, i64 0, i64 %192
  %194 = load volatile i8, ptr %193, align 1, !tbaa !9
  %195 = icmp sgt i64 %188, 0
  br i1 %195, label %196, label %211

196:                                              ; preds = %186, %191
  %197 = phi i8 [ %194, %191 ], [ 0, %186 ]
  %198 = getelementptr inbounds [5 x i8], ptr %3, i64 0, i64 %189
  %199 = load volatile i8, ptr %198, align 1, !tbaa !9
  %200 = icmp eq i8 %199, 0
  br i1 %200, label %211, label %201

201:                                              ; preds = %196
  %202 = zext i8 %199 to i64
  %203 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %202
  %204 = load volatile i8, ptr %203, align 1, !tbaa !9
  %205 = zext i8 %204 to i64
  %206 = load volatile i8, ptr %185, align 1, !tbaa !9
  %207 = zext i8 %206 to i64
  %208 = add nuw nsw i64 %207, %205
  %209 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %208
  %210 = load volatile i8, ptr %209, align 1, !tbaa !9
  br label %211

211:                                              ; preds = %191, %196, %201
  %212 = phi i8 [ %197, %201 ], [ %197, %196 ], [ %194, %191 ]
  %213 = phi i8 [ %210, %201 ], [ 0, %196 ], [ 0, %191 ]
  %214 = xor i8 %213, %212
  %215 = getelementptr inbounds [5 x i8], ptr %3, i64 0, i64 %189
  store volatile i8 %214, ptr %215, align 1, !tbaa !9
  %216 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %10) #2
  %217 = icmp eq ptr %216, null
  br i1 %217, label %218, label %186, !llvm.loop !18

218:                                              ; preds = %211, %177
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %10) #2
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %10) #2
  %219 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %5, i32 noundef 0, i32 noundef 16) #2
  %220 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %221 = icmp eq ptr %220, null
  br i1 %221, label %231, label %222

222:                                              ; preds = %218, %222
  %223 = phi ptr [ %229, %222 ], [ %220, %218 ]
  %224 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %14, ptr noundef nonnull %223) #2
  %225 = load i32, ptr %224, align 4, !tbaa !19
  %226 = trunc i32 %225 to i8
  %227 = load i64, ptr %223, align 8, !tbaa !5
  %228 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 %227
  store volatile i8 %226, ptr %228, align 1, !tbaa !9
  %229 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %230 = icmp eq ptr %229, null
  br i1 %230, label %231, label %222, !llvm.loop !21

231:                                              ; preds = %222, %218
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %5) #2
  %232 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %5, i32 noundef 16, i32 noundef 20) #2
  %233 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %234 = icmp eq ptr %233, null
  br i1 %234, label %241, label %235

235:                                              ; preds = %231, %235
  %236 = phi ptr [ %239, %235 ], [ %233, %231 ]
  %237 = load i64, ptr %236, align 8, !tbaa !5
  %238 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 %237
  store volatile i8 0, ptr %238, align 1, !tbaa !9
  %239 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %240 = icmp eq ptr %239, null
  br i1 %240, label %241, label %235, !llvm.loop !22

241:                                              ; preds = %235, %231
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %5) #2
  %242 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %5, i32 noundef 0, i32 noundef 80) #2
  %243 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %244 = icmp eq ptr %243, null
  br i1 %244, label %283, label %245

245:                                              ; preds = %241, %257
  %246 = phi ptr [ %281, %257 ], [ %243, %241 ]
  %247 = phi i8 [ %258, %257 ], [ 0, %241 ]
  %248 = load i64, ptr %246, align 8, !tbaa !5
  %249 = freeze i64 %248
  %250 = udiv i64 %249, 5
  %251 = mul i64 %250, 5
  %252 = sub i64 %249, %251
  %253 = icmp eq i64 %252, 0
  br i1 %253, label %254, label %257

254:                                              ; preds = %245
  %255 = getelementptr inbounds nuw [20 x i8], ptr %4, i64 0, i64 %250
  %256 = load volatile i8, ptr %255, align 1, !tbaa !9
  br label %257

257:                                              ; preds = %254, %245
  %258 = phi i8 [ %256, %254 ], [ %247, %245 ]
  %259 = sub nuw nsw i64 4, %252
  %260 = getelementptr inbounds nuw [5 x i8], ptr %3, i64 0, i64 %259
  %261 = load volatile i8, ptr %260, align 1, !tbaa !9
  %262 = icmp ne i8 %258, 0
  %263 = icmp ne i8 %261, 0
  %264 = and i1 %262, %263
  %265 = add nuw nsw i64 %250, %252
  %266 = zext i8 %261 to i64
  %267 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %266
  %268 = load volatile i8, ptr %267, align 1, !tbaa !9
  %269 = zext i8 %268 to i64
  %270 = zext i8 %258 to i64
  %271 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %270
  %272 = load volatile i8, ptr %271, align 1, !tbaa !9
  %273 = zext i8 %272 to i64
  %274 = add nuw nsw i64 %273, %269
  %275 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %274
  %276 = load volatile i8, ptr %275, align 1, !tbaa !9
  %277 = select i1 %264, i8 %276, i8 0
  %278 = getelementptr inbounds nuw [20 x i8], ptr %4, i64 0, i64 %265
  %279 = load volatile i8, ptr %278, align 1, !tbaa !9
  %280 = xor i8 %277, %279
  store volatile i8 %280, ptr %278, align 1, !tbaa !9
  %281 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %282 = icmp eq ptr %281, null
  br i1 %282, label %283, label %245, !llvm.loop !23

283:                                              ; preds = %257, %241
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %5) #2
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %11) #2
  %284 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %11, i32 noundef 0, i32 noundef 4) #2
  %285 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %11) #2
  %286 = icmp eq ptr %285, null
  br i1 %286, label %298, label %287

287:                                              ; preds = %283, %287
  %288 = phi ptr [ %296, %287 ], [ %285, %283 ]
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %12) #2
  %289 = load i64, ptr %288, align 8, !tbaa !5
  %290 = trunc i64 %289 to i32
  store i32 %290, ptr %12, align 4, !tbaa !19
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %13) #2
  %291 = add nsw i64 %289, 16
  %292 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 %291
  %293 = load volatile i8, ptr %292, align 1, !tbaa !9
  %294 = zext i8 %293 to i32
  store i32 %294, ptr %13, align 4, !tbaa !19
  %295 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %15, ptr noundef nonnull %12, ptr noundef nonnull %13, i64 noundef 0) #2
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %13) #2
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %12) #2
  %296 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %11) #2
  %297 = icmp eq ptr %296, null
  br i1 %297, label %298, label %287, !llvm.loop !24

298:                                              ; preds = %287, %283
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %11) #2
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %11) #2
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
!3 = !{i64 2147510743}
!4 = !{i64 2147511259}
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
!15 = distinct !{!15, !11, !12}
!16 = distinct !{!16, !11, !12}
!17 = distinct !{!17, !11, !12}
!18 = distinct !{!18, !11, !12}
!19 = !{!20, !20, i64 0}
!20 = !{!"int", !7, i64 0}
!21 = distinct !{!21, !11, !12}
!22 = distinct !{!22, !11, !12}
!23 = distinct !{!23, !11, !12}
!24 = distinct !{!24, !11, !12}
