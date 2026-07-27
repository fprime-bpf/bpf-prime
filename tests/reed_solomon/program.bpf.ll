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
  %11 = alloca [16 x i8], align 1
  %12 = alloca %struct.bpf_iter_num, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #2, !srcloc !3
  %16 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 1, i32 0, i32 0, i32 0) #2, !srcloc !4
  call void @llvm.lifetime.start.p0(i64 256, ptr nonnull %1) #2
  call void @llvm.lifetime.start.p0(i64 512, ptr nonnull %2) #2
  call void @llvm.lifetime.start.p0(i64 5, ptr nonnull %3) #2
  call void @llvm.lifetime.start.p0(i64 20, ptr nonnull %4) #2
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %5) #2
  %17 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %5, i32 noundef 0, i32 noundef 255) #2
  %18 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %19 = icmp eq ptr %18, null
  br i1 %19, label %37, label %20

20:                                               ; preds = %0, %20
  %21 = phi ptr [ %35, %20 ], [ %18, %0 ]
  %22 = phi i32 [ %34, %20 ], [ 1, %0 ]
  %23 = trunc i32 %22 to i8
  %24 = load i64, ptr %21, align 8, !tbaa !5
  %25 = getelementptr inbounds [512 x i8], ptr %2, i64 0, i64 %24
  store volatile i8 %23, ptr %25, align 1, !tbaa !9
  %26 = load i64, ptr %21, align 8, !tbaa !5
  %27 = trunc i64 %26 to i8
  %28 = zext i32 %22 to i64
  %29 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %28
  store volatile i8 %27, ptr %29, align 1, !tbaa !9
  %30 = shl i32 %22, 1
  %31 = and i32 %22, 128
  %32 = icmp eq i32 %31, 0
  %33 = xor i32 %30, 285
  %34 = select i1 %32, i32 %30, i32 %33
  %35 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %36 = icmp eq ptr %35, null
  br i1 %36, label %37, label %20, !llvm.loop !10

37:                                               ; preds = %20, %0
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %5) #2
  %38 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %5, i32 noundef 255, i32 noundef 511) #2
  %39 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %40 = icmp eq ptr %39, null
  br i1 %40, label %50, label %41

41:                                               ; preds = %37, %41
  %42 = phi ptr [ %48, %41 ], [ %39, %37 ]
  %43 = load i64, ptr %42, align 8, !tbaa !5
  %44 = add nsw i64 %43, -255
  %45 = getelementptr inbounds [512 x i8], ptr %2, i64 0, i64 %44
  %46 = load volatile i8, ptr %45, align 1, !tbaa !9
  %47 = getelementptr inbounds [512 x i8], ptr %2, i64 0, i64 %43
  store volatile i8 %46, ptr %47, align 1, !tbaa !9
  %48 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %49 = icmp eq ptr %48, null
  br i1 %49, label %50, label %41, !llvm.loop !13

50:                                               ; preds = %41, %37
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %5) #2
  store volatile i8 1, ptr %3, align 1, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %6) #2
  %51 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %6, i32 noundef 1, i32 noundef 5) #2
  %52 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %6) #2
  %53 = icmp eq ptr %52, null
  br i1 %53, label %60, label %54

54:                                               ; preds = %50, %54
  %55 = phi ptr [ %58, %54 ], [ %52, %50 ]
  %56 = load i64, ptr %55, align 8, !tbaa !5
  %57 = getelementptr inbounds [5 x i8], ptr %3, i64 0, i64 %56
  store volatile i8 0, ptr %57, align 1, !tbaa !9
  %58 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %6) #2
  %59 = icmp eq ptr %58, null
  br i1 %59, label %60, label %54, !llvm.loop !14

60:                                               ; preds = %54, %50
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %6) #2
  %61 = load volatile i8, ptr %2, align 1, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %7) #2
  %62 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %7, i32 noundef 0, i32 noundef 2) #2
  %63 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %64 = icmp eq ptr %63, null
  br i1 %64, label %96, label %65

65:                                               ; preds = %60
  %66 = zext i8 %61 to i64
  %67 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %66
  br label %68

68:                                               ; preds = %65, %91
  %69 = phi ptr [ %63, %65 ], [ %94, %91 ]
  %70 = load i64, ptr %69, align 8, !tbaa !5
  %71 = sub nsw i64 1, %70
  %72 = icmp slt i64 %70, 1
  br i1 %72, label %73, label %77

73:                                               ; preds = %68
  %74 = sub i64 0, %70
  %75 = getelementptr inbounds nuw [5 x i8], ptr %3, i64 0, i64 %74
  %76 = load volatile i8, ptr %75, align 1, !tbaa !9
  br label %91

77:                                               ; preds = %68
  %78 = getelementptr inbounds [5 x i8], ptr %3, i64 0, i64 %71
  %79 = load volatile i8, ptr %78, align 1, !tbaa !9
  %80 = icmp eq i8 %79, 0
  br i1 %80, label %91, label %81

81:                                               ; preds = %77
  %82 = zext i8 %79 to i64
  %83 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %82
  %84 = load volatile i8, ptr %83, align 1, !tbaa !9
  %85 = zext i8 %84 to i64
  %86 = load volatile i8, ptr %67, align 1, !tbaa !9
  %87 = zext i8 %86 to i64
  %88 = add nuw nsw i64 %87, %85
  %89 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %88
  %90 = load volatile i8, ptr %89, align 1, !tbaa !9
  br label %91

91:                                               ; preds = %73, %77, %81
  %92 = phi i8 [ %90, %81 ], [ 0, %77 ], [ %76, %73 ]
  %93 = getelementptr inbounds [5 x i8], ptr %3, i64 0, i64 %71
  store volatile i8 %92, ptr %93, align 1, !tbaa !9
  %94 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %95 = icmp eq ptr %94, null
  br i1 %95, label %96, label %68, !llvm.loop !15

96:                                               ; preds = %91, %60
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %7) #2
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %7) #2
  %97 = getelementptr inbounds nuw i8, ptr %2, i64 1
  %98 = load volatile i8, ptr %97, align 1, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %8) #2
  %99 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %8, i32 noundef 0, i32 noundef 3) #2
  %100 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %8) #2
  %101 = icmp eq ptr %100, null
  br i1 %101, label %137, label %102

102:                                              ; preds = %96
  %103 = zext i8 %98 to i64
  %104 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %103
  br label %105

105:                                              ; preds = %102, %130
  %106 = phi ptr [ %100, %102 ], [ %135, %130 ]
  %107 = load i64, ptr %106, align 8, !tbaa !5
  %108 = sub nsw i64 2, %107
  %109 = icmp slt i64 %107, 2
  br i1 %109, label %110, label %115

110:                                              ; preds = %105
  %111 = sub i64 1, %107
  %112 = getelementptr inbounds nuw [5 x i8], ptr %3, i64 0, i64 %111
  %113 = load volatile i8, ptr %112, align 1, !tbaa !9
  %114 = icmp eq i64 %107, 1
  br i1 %114, label %115, label %130

115:                                              ; preds = %105, %110
  %116 = phi i8 [ %113, %110 ], [ 0, %105 ]
  %117 = getelementptr inbounds [5 x i8], ptr %3, i64 0, i64 %108
  %118 = load volatile i8, ptr %117, align 1, !tbaa !9
  %119 = icmp eq i8 %118, 0
  br i1 %119, label %130, label %120

120:                                              ; preds = %115
  %121 = zext i8 %118 to i64
  %122 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %121
  %123 = load volatile i8, ptr %122, align 1, !tbaa !9
  %124 = zext i8 %123 to i64
  %125 = load volatile i8, ptr %104, align 1, !tbaa !9
  %126 = zext i8 %125 to i64
  %127 = add nuw nsw i64 %126, %124
  %128 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %127
  %129 = load volatile i8, ptr %128, align 1, !tbaa !9
  br label %130

130:                                              ; preds = %110, %115, %120
  %131 = phi i8 [ %116, %120 ], [ %116, %115 ], [ %113, %110 ]
  %132 = phi i8 [ %129, %120 ], [ 0, %115 ], [ 0, %110 ]
  %133 = xor i8 %132, %131
  %134 = getelementptr inbounds [5 x i8], ptr %3, i64 0, i64 %108
  store volatile i8 %133, ptr %134, align 1, !tbaa !9
  %135 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %8) #2
  %136 = icmp eq ptr %135, null
  br i1 %136, label %137, label %105, !llvm.loop !16

137:                                              ; preds = %130, %96
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %8) #2
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %8) #2
  %138 = getelementptr inbounds nuw i8, ptr %2, i64 2
  %139 = load volatile i8, ptr %138, align 1, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %9) #2
  %140 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %9, i32 noundef 0, i32 noundef 4) #2
  %141 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %9) #2
  %142 = icmp eq ptr %141, null
  br i1 %142, label %178, label %143

143:                                              ; preds = %137
  %144 = zext i8 %139 to i64
  %145 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %144
  br label %146

146:                                              ; preds = %143, %171
  %147 = phi ptr [ %141, %143 ], [ %176, %171 ]
  %148 = load i64, ptr %147, align 8, !tbaa !5
  %149 = sub nsw i64 3, %148
  %150 = icmp slt i64 %148, 3
  br i1 %150, label %151, label %156

151:                                              ; preds = %146
  %152 = sub i64 2, %148
  %153 = getelementptr inbounds nuw [5 x i8], ptr %3, i64 0, i64 %152
  %154 = load volatile i8, ptr %153, align 1, !tbaa !9
  %155 = icmp sgt i64 %148, 0
  br i1 %155, label %156, label %171

156:                                              ; preds = %146, %151
  %157 = phi i8 [ %154, %151 ], [ 0, %146 ]
  %158 = getelementptr inbounds [5 x i8], ptr %3, i64 0, i64 %149
  %159 = load volatile i8, ptr %158, align 1, !tbaa !9
  %160 = icmp eq i8 %159, 0
  br i1 %160, label %171, label %161

161:                                              ; preds = %156
  %162 = zext i8 %159 to i64
  %163 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %162
  %164 = load volatile i8, ptr %163, align 1, !tbaa !9
  %165 = zext i8 %164 to i64
  %166 = load volatile i8, ptr %145, align 1, !tbaa !9
  %167 = zext i8 %166 to i64
  %168 = add nuw nsw i64 %167, %165
  %169 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %168
  %170 = load volatile i8, ptr %169, align 1, !tbaa !9
  br label %171

171:                                              ; preds = %151, %156, %161
  %172 = phi i8 [ %157, %161 ], [ %157, %156 ], [ %154, %151 ]
  %173 = phi i8 [ %170, %161 ], [ 0, %156 ], [ 0, %151 ]
  %174 = xor i8 %173, %172
  %175 = getelementptr inbounds [5 x i8], ptr %3, i64 0, i64 %149
  store volatile i8 %174, ptr %175, align 1, !tbaa !9
  %176 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %9) #2
  %177 = icmp eq ptr %176, null
  br i1 %177, label %178, label %146, !llvm.loop !17

178:                                              ; preds = %171, %137
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %9) #2
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %9) #2
  %179 = getelementptr inbounds nuw i8, ptr %2, i64 3
  %180 = load volatile i8, ptr %179, align 1, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %10) #2
  %181 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %10, i32 noundef 0, i32 noundef 5) #2
  %182 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %10) #2
  %183 = icmp eq ptr %182, null
  br i1 %183, label %219, label %184

184:                                              ; preds = %178
  %185 = zext i8 %180 to i64
  %186 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %185
  br label %187

187:                                              ; preds = %184, %212
  %188 = phi ptr [ %182, %184 ], [ %217, %212 ]
  %189 = load i64, ptr %188, align 8, !tbaa !5
  %190 = sub nsw i64 4, %189
  %191 = icmp slt i64 %189, 4
  br i1 %191, label %192, label %197

192:                                              ; preds = %187
  %193 = sub i64 3, %189
  %194 = getelementptr inbounds nuw [5 x i8], ptr %3, i64 0, i64 %193
  %195 = load volatile i8, ptr %194, align 1, !tbaa !9
  %196 = icmp sgt i64 %189, 0
  br i1 %196, label %197, label %212

197:                                              ; preds = %187, %192
  %198 = phi i8 [ %195, %192 ], [ 0, %187 ]
  %199 = getelementptr inbounds [5 x i8], ptr %3, i64 0, i64 %190
  %200 = load volatile i8, ptr %199, align 1, !tbaa !9
  %201 = icmp eq i8 %200, 0
  br i1 %201, label %212, label %202

202:                                              ; preds = %197
  %203 = zext i8 %200 to i64
  %204 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %203
  %205 = load volatile i8, ptr %204, align 1, !tbaa !9
  %206 = zext i8 %205 to i64
  %207 = load volatile i8, ptr %186, align 1, !tbaa !9
  %208 = zext i8 %207 to i64
  %209 = add nuw nsw i64 %208, %206
  %210 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %209
  %211 = load volatile i8, ptr %210, align 1, !tbaa !9
  br label %212

212:                                              ; preds = %192, %197, %202
  %213 = phi i8 [ %198, %202 ], [ %198, %197 ], [ %195, %192 ]
  %214 = phi i8 [ %211, %202 ], [ 0, %197 ], [ 0, %192 ]
  %215 = xor i8 %214, %213
  %216 = getelementptr inbounds [5 x i8], ptr %3, i64 0, i64 %190
  store volatile i8 %215, ptr %216, align 1, !tbaa !9
  %217 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %10) #2
  %218 = icmp eq ptr %217, null
  br i1 %218, label %219, label %187, !llvm.loop !18

219:                                              ; preds = %212, %178
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %10) #2
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %10) #2
  %220 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %5, i32 noundef 0, i32 noundef 16) #2
  %221 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %222 = icmp eq ptr %221, null
  br i1 %222, label %232, label %223

223:                                              ; preds = %219, %223
  %224 = phi ptr [ %230, %223 ], [ %221, %219 ]
  %225 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %15, ptr noundef nonnull %224) #2
  %226 = load i32, ptr %225, align 4, !tbaa !19
  %227 = trunc i32 %226 to i8
  %228 = load i64, ptr %224, align 8, !tbaa !5
  %229 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 %228
  store volatile i8 %227, ptr %229, align 1, !tbaa !9
  %230 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %231 = icmp eq ptr %230, null
  br i1 %231, label %232, label %223, !llvm.loop !21

232:                                              ; preds = %223, %219
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %5) #2
  %233 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %5, i32 noundef 16, i32 noundef 20) #2
  %234 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %235 = icmp eq ptr %234, null
  br i1 %235, label %242, label %236

236:                                              ; preds = %232, %236
  %237 = phi ptr [ %240, %236 ], [ %234, %232 ]
  %238 = load i64, ptr %237, align 8, !tbaa !5
  %239 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 %238
  store volatile i8 0, ptr %239, align 1, !tbaa !9
  %240 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %241 = icmp eq ptr %240, null
  br i1 %241, label %242, label %236, !llvm.loop !22

242:                                              ; preds = %236, %232
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %5) #2
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %11) #2
  %243 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %5, i32 noundef 0, i32 noundef 16) #2
  %244 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %245 = icmp eq ptr %244, null
  br i1 %245, label %254, label %246

246:                                              ; preds = %242, %246
  %247 = phi ptr [ %252, %246 ], [ %244, %242 ]
  %248 = load i64, ptr %247, align 8, !tbaa !5
  %249 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 %248
  %250 = load volatile i8, ptr %249, align 1, !tbaa !9
  %251 = getelementptr inbounds [16 x i8], ptr %11, i64 0, i64 %248
  store volatile i8 %250, ptr %251, align 1, !tbaa !9
  %252 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %253 = icmp eq ptr %252, null
  br i1 %253, label %254, label %246, !llvm.loop !23

254:                                              ; preds = %246, %242
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %5) #2
  %255 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %5, i32 noundef 0, i32 noundef 80) #2
  %256 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %257 = icmp eq ptr %256, null
  br i1 %257, label %292, label %258

258:                                              ; preds = %254, %289
  %259 = phi ptr [ %290, %289 ], [ %256, %254 ]
  %260 = load i64, ptr %259, align 8, !tbaa !5
  %261 = freeze i64 %260
  %262 = udiv i64 %261, 5
  %263 = mul i64 %262, 5
  %264 = sub i64 %261, %263
  %265 = getelementptr inbounds nuw [16 x i8], ptr %11, i64 0, i64 %262
  %266 = load volatile i8, ptr %265, align 1, !tbaa !9
  %267 = icmp eq i8 %266, 0
  br i1 %267, label %289, label %268

268:                                              ; preds = %258
  %269 = sub nuw nsw i64 4, %264
  %270 = getelementptr inbounds nuw [5 x i8], ptr %3, i64 0, i64 %269
  %271 = load volatile i8, ptr %270, align 1, !tbaa !9
  %272 = icmp eq i8 %271, 0
  br i1 %272, label %289, label %273

273:                                              ; preds = %268
  %274 = add nuw nsw i64 %262, %264
  %275 = zext i8 %271 to i64
  %276 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %275
  %277 = load volatile i8, ptr %276, align 1, !tbaa !9
  %278 = zext i8 %277 to i64
  %279 = zext i8 %266 to i64
  %280 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %279
  %281 = load volatile i8, ptr %280, align 1, !tbaa !9
  %282 = zext i8 %281 to i64
  %283 = add nuw nsw i64 %282, %278
  %284 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %283
  %285 = load volatile i8, ptr %284, align 1, !tbaa !9
  %286 = getelementptr inbounds nuw [20 x i8], ptr %4, i64 0, i64 %274
  %287 = load volatile i8, ptr %286, align 1, !tbaa !9
  %288 = xor i8 %287, %285
  store volatile i8 %288, ptr %286, align 1, !tbaa !9
  br label %289

289:                                              ; preds = %268, %273, %258
  %290 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %291 = icmp eq ptr %290, null
  br i1 %291, label %292, label %258, !llvm.loop !24

292:                                              ; preds = %289, %254
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %5) #2
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %12) #2
  %293 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %12, i32 noundef 0, i32 noundef 4) #2
  %294 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %12) #2
  %295 = icmp eq ptr %294, null
  br i1 %295, label %307, label %296

296:                                              ; preds = %292, %296
  %297 = phi ptr [ %305, %296 ], [ %294, %292 ]
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %13) #2
  %298 = load i64, ptr %297, align 8, !tbaa !5
  %299 = trunc i64 %298 to i32
  store i32 %299, ptr %13, align 4, !tbaa !19
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %14) #2
  %300 = add nsw i64 %298, 16
  %301 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 %300
  %302 = load volatile i8, ptr %301, align 1, !tbaa !9
  %303 = zext i8 %302 to i32
  store i32 %303, ptr %14, align 4, !tbaa !19
  %304 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %16, ptr noundef nonnull %13, ptr noundef nonnull %14, i64 noundef 0) #2
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %14) #2
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %13) #2
  %305 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %12) #2
  %306 = icmp eq ptr %305, null
  br i1 %306, label %307, label %296, !llvm.loop !25

307:                                              ; preds = %296, %292
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %12) #2
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %12) #2
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %11) #2
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
!3 = !{i64 2147508936}
!4 = !{i64 2147509448}
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
!25 = distinct !{!25, !11, !12}
