; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca [16 x i8], align 1
  %2 = alloca [256 x i8], align 1
  %3 = alloca [16 x i8], align 1
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #4, !srcloc !3
  %8 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 1, i32 0, i32 0, i32 0) #4, !srcloc !4
  %9 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 2, i32 0, i32 0, i32 0) #4, !srcloc !5
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %1) #4
  call void @llvm.lifetime.start.p0(i64 256, ptr nonnull %2) #4
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %3) #4
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(16) %3, i8 0, i64 16, i1 false)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #4
  store i32 0, ptr %4, align 4, !tbaa !6
  br label %11

10:                                               ; preds = %11
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #4
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %5) #4
  store i32 0, ptr %5, align 4, !tbaa !6
  br label %32

11:                                               ; preds = %0, %11
  %12 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %7, ptr noundef nonnull %4) #4
  %13 = load i8, ptr %12, align 1, !tbaa !10
  %14 = load i32, ptr %4, align 4, !tbaa !6
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [16 x i8], ptr %1, i64 0, i64 %15
  store i8 %13, ptr %16, align 1, !tbaa !10
  %17 = add nsw i32 %14, 1
  store i32 %17, ptr %4, align 4, !tbaa !6
  %18 = icmp slt i32 %14, 15
  br i1 %18, label %11, label %10, !llvm.loop !11

19:                                               ; preds = %32
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %5) #4
  %20 = getelementptr inbounds nuw i8, ptr %1, i64 1
  %21 = getelementptr inbounds nuw i8, ptr %1, i64 5
  %22 = getelementptr inbounds nuw i8, ptr %1, i64 9
  %23 = getelementptr inbounds nuw i8, ptr %1, i64 13
  %24 = getelementptr inbounds nuw i8, ptr %1, i64 2
  %25 = getelementptr inbounds nuw i8, ptr %1, i64 6
  %26 = getelementptr inbounds nuw i8, ptr %1, i64 10
  %27 = getelementptr inbounds nuw i8, ptr %1, i64 14
  %28 = getelementptr inbounds nuw i8, ptr %1, i64 15
  %29 = getelementptr inbounds nuw i8, ptr %1, i64 11
  %30 = getelementptr inbounds nuw i8, ptr %1, i64 7
  %31 = getelementptr inbounds nuw i8, ptr %1, i64 3
  br label %40

32:                                               ; preds = %10, %32
  %33 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %8, ptr noundef nonnull %5) #4
  %34 = load i8, ptr %33, align 1, !tbaa !10
  %35 = load i32, ptr %5, align 4, !tbaa !6
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %36
  store i8 %34, ptr %37, align 1, !tbaa !10
  %38 = add nsw i32 %35, 1
  store i32 %38, ptr %5, align 4, !tbaa !6
  %39 = icmp slt i32 %35, 255
  br i1 %39, label %32, label %19, !llvm.loop !14

40:                                               ; preds = %19, %239
  %41 = phi i32 [ 0, %19 ], [ %240, %239 ]
  br label %43

42:                                               ; preds = %239
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %6) #4
  store i32 0, ptr %6, align 4, !tbaa !6
  br label %262

43:                                               ; preds = %40, %46
  %44 = phi i64 [ 0, %40 ], [ %47, %46 ]
  %45 = shl nuw nsw i64 %44, 2
  br label %49

46:                                               ; preds = %49
  %47 = add nuw nsw i64 %44, 1
  %48 = icmp eq i64 %47, 4
  br i1 %48, label %59, label %43, !llvm.loop !15

49:                                               ; preds = %43, %49
  %50 = phi i64 [ 0, %43 ], [ %57, %49 ]
  %51 = add nuw nsw i64 %50, %45
  %52 = getelementptr inbounds nuw [16 x i8], ptr %3, i64 0, i64 %51
  %53 = load i8, ptr %52, align 1, !tbaa !10
  %54 = getelementptr inbounds nuw [16 x i8], ptr %1, i64 0, i64 %51
  %55 = load i8, ptr %54, align 1, !tbaa !10
  %56 = xor i8 %55, %53
  store i8 %56, ptr %54, align 1, !tbaa !10
  %57 = add nuw nsw i64 %50, 1
  %58 = icmp eq i64 %57, 4
  br i1 %58, label %46, label %49, !llvm.loop !16

59:                                               ; preds = %46, %242
  %60 = phi i64 [ %243, %242 ], [ 0, %46 ]
  %61 = shl nuw nsw i64 %60, 2
  br label %245

62:                                               ; preds = %242
  %63 = load i8, ptr %20, align 1, !tbaa !10
  %64 = load i8, ptr %21, align 1, !tbaa !10
  store i8 %64, ptr %20, align 1, !tbaa !10
  %65 = load i8, ptr %22, align 1, !tbaa !10
  store i8 %65, ptr %21, align 1, !tbaa !10
  %66 = load i8, ptr %23, align 1, !tbaa !10
  store i8 %66, ptr %22, align 1, !tbaa !10
  store i8 %63, ptr %23, align 1, !tbaa !10
  %67 = load i8, ptr %24, align 1, !tbaa !10
  %68 = load i8, ptr %25, align 1, !tbaa !10
  %69 = load i8, ptr %26, align 1, !tbaa !10
  store i8 %69, ptr %24, align 1, !tbaa !10
  %70 = load i8, ptr %27, align 1, !tbaa !10
  store i8 %70, ptr %25, align 1, !tbaa !10
  store i8 %67, ptr %26, align 1, !tbaa !10
  store i8 %68, ptr %27, align 1, !tbaa !10
  %71 = load i8, ptr %28, align 1, !tbaa !10
  %72 = load i8, ptr %29, align 1, !tbaa !10
  store i8 %72, ptr %28, align 1, !tbaa !10
  %73 = load i8, ptr %30, align 1, !tbaa !10
  store i8 %73, ptr %29, align 1, !tbaa !10
  %74 = load i8, ptr %31, align 1, !tbaa !10
  store i8 %74, ptr %30, align 1, !tbaa !10
  store i8 %71, ptr %31, align 1, !tbaa !10
  br label %75

75:                                               ; preds = %62, %232
  %76 = phi i64 [ 0, %62 ], [ %237, %232 ]
  %77 = shl nuw nsw i64 %76, 2
  %78 = getelementptr inbounds nuw i8, ptr %1, i64 %77
  %79 = load i8, ptr %78, align 1, !tbaa !10
  br label %80

80:                                               ; preds = %75, %80
  %81 = phi i8 [ 0, %75 ], [ %94, %80 ]
  %82 = phi i8 [ 0, %75 ], [ %88, %80 ]
  %83 = phi i8 [ %79, %75 ], [ %93, %80 ]
  %84 = phi i8 [ 2, %75 ], [ %92, %80 ]
  %85 = and i8 %83, 1
  %86 = icmp eq i8 %85, 0
  %87 = select i1 %86, i8 0, i8 %84
  %88 = xor i8 %87, %82
  %89 = shl i8 %84, 1
  %90 = xor i8 %89, 27
  %91 = icmp slt i8 %84, 0
  %92 = select i1 %91, i8 %90, i8 %89
  %93 = ashr i8 %83, 1
  %94 = add nuw nsw i8 %81, 1
  %95 = icmp samesign ult i8 %81, 7
  br i1 %95, label %80, label %96, !llvm.loop !17

96:                                               ; preds = %80
  %97 = or disjoint i64 %77, 1
  %98 = getelementptr inbounds nuw i8, ptr %1, i64 %97
  %99 = load i8, ptr %98, align 1, !tbaa !10
  br label %100

100:                                              ; preds = %96, %100
  %101 = phi i8 [ 0, %96 ], [ %114, %100 ]
  %102 = phi i8 [ 0, %96 ], [ %108, %100 ]
  %103 = phi i8 [ %99, %96 ], [ %113, %100 ]
  %104 = phi i8 [ 3, %96 ], [ %112, %100 ]
  %105 = and i8 %103, 1
  %106 = icmp eq i8 %105, 0
  %107 = select i1 %106, i8 0, i8 %104
  %108 = xor i8 %107, %102
  %109 = shl i8 %104, 1
  %110 = xor i8 %109, 27
  %111 = icmp slt i8 %104, 0
  %112 = select i1 %111, i8 %110, i8 %109
  %113 = ashr i8 %103, 1
  %114 = add nuw nsw i8 %101, 1
  %115 = icmp samesign ult i8 %101, 7
  br i1 %115, label %100, label %116, !llvm.loop !17

116:                                              ; preds = %100
  %117 = or disjoint i64 %77, 2
  %118 = getelementptr inbounds nuw i8, ptr %1, i64 %117
  %119 = load i8, ptr %118, align 1, !tbaa !10
  %120 = or disjoint i64 %77, 3
  %121 = getelementptr inbounds nuw i8, ptr %1, i64 %120
  %122 = load i8, ptr %121, align 1, !tbaa !10
  br label %123

123:                                              ; preds = %116, %123
  %124 = phi i8 [ 0, %116 ], [ %137, %123 ]
  %125 = phi i8 [ 0, %116 ], [ %131, %123 ]
  %126 = phi i8 [ %99, %116 ], [ %136, %123 ]
  %127 = phi i8 [ 2, %116 ], [ %135, %123 ]
  %128 = and i8 %126, 1
  %129 = icmp eq i8 %128, 0
  %130 = select i1 %129, i8 0, i8 %127
  %131 = xor i8 %130, %125
  %132 = shl i8 %127, 1
  %133 = xor i8 %132, 27
  %134 = icmp slt i8 %127, 0
  %135 = select i1 %134, i8 %133, i8 %132
  %136 = ashr i8 %126, 1
  %137 = add nuw nsw i8 %124, 1
  %138 = icmp samesign ult i8 %124, 7
  br i1 %138, label %123, label %139, !llvm.loop !17

139:                                              ; preds = %123
  %140 = xor i8 %108, %88
  %141 = xor i8 %140, %119
  br label %142

142:                                              ; preds = %139, %142
  %143 = phi i8 [ 0, %139 ], [ %156, %142 ]
  %144 = phi i8 [ 0, %139 ], [ %150, %142 ]
  %145 = phi i8 [ %119, %139 ], [ %155, %142 ]
  %146 = phi i8 [ 3, %139 ], [ %154, %142 ]
  %147 = and i8 %145, 1
  %148 = icmp eq i8 %147, 0
  %149 = select i1 %148, i8 0, i8 %146
  %150 = xor i8 %149, %144
  %151 = shl i8 %146, 1
  %152 = xor i8 %151, 27
  %153 = icmp slt i8 %146, 0
  %154 = select i1 %153, i8 %152, i8 %151
  %155 = ashr i8 %145, 1
  %156 = add nuw nsw i8 %143, 1
  %157 = icmp samesign ult i8 %143, 7
  br i1 %157, label %142, label %158, !llvm.loop !17

158:                                              ; preds = %142
  %159 = xor i8 %122, %79
  %160 = xor i8 %159, %131
  %161 = xor i8 %160, %150
  br label %162

162:                                              ; preds = %158, %162
  %163 = phi i8 [ 0, %158 ], [ %176, %162 ]
  %164 = phi i8 [ 0, %158 ], [ %170, %162 ]
  %165 = phi i8 [ %119, %158 ], [ %175, %162 ]
  %166 = phi i8 [ 2, %158 ], [ %174, %162 ]
  %167 = and i8 %165, 1
  %168 = icmp eq i8 %167, 0
  %169 = select i1 %168, i8 0, i8 %166
  %170 = xor i8 %169, %164
  %171 = shl i8 %166, 1
  %172 = xor i8 %171, 27
  %173 = icmp slt i8 %166, 0
  %174 = select i1 %173, i8 %172, i8 %171
  %175 = ashr i8 %165, 1
  %176 = add nuw nsw i8 %163, 1
  %177 = icmp samesign ult i8 %163, 7
  br i1 %177, label %162, label %178, !llvm.loop !17

178:                                              ; preds = %162
  %179 = xor i8 %99, %79
  br label %180

180:                                              ; preds = %178, %180
  %181 = phi i8 [ 0, %178 ], [ %194, %180 ]
  %182 = phi i8 [ 0, %178 ], [ %188, %180 ]
  %183 = phi i8 [ %122, %178 ], [ %193, %180 ]
  %184 = phi i8 [ 3, %178 ], [ %192, %180 ]
  %185 = and i8 %183, 1
  %186 = icmp eq i8 %185, 0
  %187 = select i1 %186, i8 0, i8 %184
  %188 = xor i8 %187, %182
  %189 = shl i8 %184, 1
  %190 = xor i8 %189, 27
  %191 = icmp slt i8 %184, 0
  %192 = select i1 %191, i8 %190, i8 %189
  %193 = ashr i8 %183, 1
  %194 = add nuw nsw i8 %181, 1
  %195 = icmp samesign ult i8 %181, 7
  br i1 %195, label %180, label %196, !llvm.loop !17

196:                                              ; preds = %180
  %197 = xor i8 %179, %170
  br label %198

198:                                              ; preds = %196, %198
  %199 = phi i8 [ 0, %196 ], [ %212, %198 ]
  %200 = phi i8 [ 0, %196 ], [ %206, %198 ]
  %201 = phi i8 [ %79, %196 ], [ %211, %198 ]
  %202 = phi i8 [ 3, %196 ], [ %210, %198 ]
  %203 = and i8 %201, 1
  %204 = icmp eq i8 %203, 0
  %205 = select i1 %204, i8 0, i8 %202
  %206 = xor i8 %205, %200
  %207 = shl i8 %202, 1
  %208 = xor i8 %207, 27
  %209 = icmp slt i8 %202, 0
  %210 = select i1 %209, i8 %208, i8 %207
  %211 = ashr i8 %201, 1
  %212 = add nuw nsw i8 %199, 1
  %213 = icmp samesign ult i8 %199, 7
  br i1 %213, label %198, label %214, !llvm.loop !17

214:                                              ; preds = %198
  %215 = xor i8 %141, %122
  br label %216

216:                                              ; preds = %214, %216
  %217 = phi i8 [ 0, %214 ], [ %230, %216 ]
  %218 = phi i8 [ 0, %214 ], [ %224, %216 ]
  %219 = phi i8 [ %122, %214 ], [ %229, %216 ]
  %220 = phi i8 [ 2, %214 ], [ %228, %216 ]
  %221 = and i8 %219, 1
  %222 = icmp eq i8 %221, 0
  %223 = select i1 %222, i8 0, i8 %220
  %224 = xor i8 %223, %218
  %225 = shl i8 %220, 1
  %226 = xor i8 %225, 27
  %227 = icmp slt i8 %220, 0
  %228 = select i1 %227, i8 %226, i8 %225
  %229 = ashr i8 %219, 1
  %230 = add nuw nsw i8 %217, 1
  %231 = icmp samesign ult i8 %217, 7
  br i1 %231, label %216, label %232, !llvm.loop !17

232:                                              ; preds = %216
  %233 = xor i8 %197, %188
  %234 = xor i8 %119, %99
  %235 = xor i8 %234, %206
  %236 = xor i8 %235, %224
  store i8 %215, ptr %78, align 1, !tbaa !10
  store i8 %161, ptr %98, align 1, !tbaa !10
  store i8 %233, ptr %118, align 1, !tbaa !10
  store i8 %236, ptr %121, align 1, !tbaa !10
  %237 = add nuw nsw i64 %76, 1
  %238 = icmp eq i64 %237, 4
  br i1 %238, label %239, label %75, !llvm.loop !18

239:                                              ; preds = %232
  %240 = add nuw nsw i32 %41, 1
  %241 = icmp eq i32 %240, 1000
  br i1 %241, label %42, label %40, !llvm.loop !19

242:                                              ; preds = %258
  %243 = add nuw nsw i64 %60, 1
  %244 = icmp eq i64 %243, 4
  br i1 %244, label %62, label %59, !llvm.loop !20

245:                                              ; preds = %59, %258
  %246 = phi i64 [ 0, %59 ], [ %259, %258 ]
  %247 = add nuw nsw i64 %246, %61
  %248 = getelementptr inbounds nuw [16 x i8], ptr %1, i64 0, i64 %247
  %249 = load i8, ptr %248, align 1, !tbaa !10
  %250 = icmp sgt i8 %249, -1
  %251 = call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %250)
  %252 = icmp slt i8 %249, 16
  %253 = select i1 %251, i1 %252, i1 false
  br i1 %253, label %254, label %258

254:                                              ; preds = %245
  %255 = sext i8 %249 to i64
  %256 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %255
  %257 = load i8, ptr %256, align 1, !tbaa !10
  store i8 %257, ptr %248, align 1, !tbaa !10
  br label %258

258:                                              ; preds = %254, %245
  %259 = add nuw nsw i64 %246, 1
  %260 = icmp eq i64 %259, 4
  br i1 %260, label %242, label %245, !llvm.loop !21

261:                                              ; preds = %262
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %6) #4
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %3) #4
  call void @llvm.lifetime.end.p0(i64 256, ptr nonnull %2) #4
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %1) #4
  ret i32 0

262:                                              ; preds = %42, %262
  %263 = phi i32 [ 0, %42 ], [ %269, %262 ]
  %264 = call i32 @llvm.bpf.passthrough.i32.i32(i32 1, i32 %263)
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds [16 x i8], ptr %1, i64 0, i64 %265
  %267 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %9, ptr noundef nonnull %6, ptr noundef nonnull %266, i64 noundef 0) #4
  %268 = load i32, ptr %6, align 4, !tbaa !6
  %269 = add nsw i32 %268, 1
  store i32 %269, ptr %6, align 4, !tbaa !6
  %270 = icmp slt i32 %268, 15
  br i1 %270, label %262, label %261, !llvm.loop !22
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind memory(none)
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #3

; Function Attrs: nounwind memory(none)
declare i32 @llvm.bpf.passthrough.i32.i32(i32, i32) #3

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="duotronic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { nounwind memory(none) }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 3047ef595b8b4944540de771dcf86dc85a97ef76)"}
!3 = !{i64 2147504946}
!4 = !{i64 2147505458}
!5 = !{i64 2147505970}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!8, !8, i64 0}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !12, !13}
!15 = distinct !{!15, !12, !13}
!16 = distinct !{!16, !12, !13}
!17 = distinct !{!17, !12, !13}
!18 = distinct !{!18, !12, !13}
!19 = distinct !{!19, !12, !13}
!20 = distinct !{!20, !12, !13}
!21 = distinct !{!21, !12, !13}
!22 = distinct !{!22, !12, !13}
