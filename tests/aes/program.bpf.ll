; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

@__const.main.block = private unnamed_addr constant <{ i8, [15 x i8] }> <{ i8 12, [15 x i8] zeroinitializer }>, align 1

; Function Attrs: nofree nosync nounwind memory(none)
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca [16 x i8], align 1
  %2 = alloca [256 x i8], align 1
  %3 = alloca [16 x i8], align 1
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %1) #5
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(16) %1, ptr noundef nonnull align 1 dereferenceable(16) @__const.main.block, i64 16, i1 false)
  call void @llvm.lifetime.start.p0(i64 256, ptr nonnull %2) #5
  %4 = getelementptr inbounds nuw i8, ptr %2, i64 1
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(256) %4, i8 0, i64 255, i1 false)
  store i8 13, ptr %2, align 1
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %3) #5
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(16) %3, i8 0, i64 16, i1 false)
  %5 = getelementptr inbounds nuw i8, ptr %1, i64 1
  %6 = getelementptr inbounds nuw i8, ptr %1, i64 5
  %7 = getelementptr inbounds nuw i8, ptr %1, i64 9
  %8 = getelementptr inbounds nuw i8, ptr %1, i64 13
  %9 = getelementptr inbounds nuw i8, ptr %1, i64 2
  %10 = getelementptr inbounds nuw i8, ptr %1, i64 6
  %11 = getelementptr inbounds nuw i8, ptr %1, i64 10
  %12 = getelementptr inbounds nuw i8, ptr %1, i64 14
  %13 = getelementptr inbounds nuw i8, ptr %1, i64 15
  %14 = getelementptr inbounds nuw i8, ptr %1, i64 11
  %15 = getelementptr inbounds nuw i8, ptr %1, i64 7
  %16 = getelementptr inbounds nuw i8, ptr %1, i64 3
  br label %17

17:                                               ; preds = %0, %216
  %18 = phi i32 [ 0, %0 ], [ %217, %216 ]
  br label %20

19:                                               ; preds = %216
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %3) #5
  call void @llvm.lifetime.end.p0(i64 256, ptr nonnull %2) #5
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %1) #5
  ret i32 0

20:                                               ; preds = %17, %23
  %21 = phi i64 [ 0, %17 ], [ %24, %23 ]
  %22 = shl nuw nsw i64 %21, 2
  br label %26

23:                                               ; preds = %26
  %24 = add nuw nsw i64 %21, 1
  %25 = icmp eq i64 %24, 4
  br i1 %25, label %36, label %20, !llvm.loop !3

26:                                               ; preds = %20, %26
  %27 = phi i64 [ 0, %20 ], [ %34, %26 ]
  %28 = add nuw nsw i64 %27, %22
  %29 = getelementptr inbounds nuw [16 x i8], ptr %3, i64 0, i64 %28
  %30 = load i8, ptr %29, align 1, !tbaa !6
  %31 = getelementptr inbounds nuw [16 x i8], ptr %1, i64 0, i64 %28
  %32 = load i8, ptr %31, align 1, !tbaa !6
  %33 = xor i8 %32, %30
  store i8 %33, ptr %31, align 1, !tbaa !6
  %34 = add nuw nsw i64 %27, 1
  %35 = icmp eq i64 %34, 4
  br i1 %35, label %23, label %26, !llvm.loop !9

36:                                               ; preds = %23, %219
  %37 = phi i64 [ %220, %219 ], [ 0, %23 ]
  %38 = shl nuw nsw i64 %37, 2
  br label %222

39:                                               ; preds = %219
  %40 = load i8, ptr %5, align 1, !tbaa !6
  %41 = load i8, ptr %6, align 1, !tbaa !6
  store i8 %41, ptr %5, align 1, !tbaa !6
  %42 = load i8, ptr %7, align 1, !tbaa !6
  store i8 %42, ptr %6, align 1, !tbaa !6
  %43 = load i8, ptr %8, align 1, !tbaa !6
  store i8 %43, ptr %7, align 1, !tbaa !6
  store i8 %40, ptr %8, align 1, !tbaa !6
  %44 = load i8, ptr %9, align 1, !tbaa !6
  %45 = load i8, ptr %10, align 1, !tbaa !6
  %46 = load i8, ptr %11, align 1, !tbaa !6
  store i8 %46, ptr %9, align 1, !tbaa !6
  %47 = load i8, ptr %12, align 1, !tbaa !6
  store i8 %47, ptr %10, align 1, !tbaa !6
  store i8 %44, ptr %11, align 1, !tbaa !6
  store i8 %45, ptr %12, align 1, !tbaa !6
  %48 = load i8, ptr %13, align 1, !tbaa !6
  %49 = load i8, ptr %14, align 1, !tbaa !6
  store i8 %49, ptr %13, align 1, !tbaa !6
  %50 = load i8, ptr %15, align 1, !tbaa !6
  store i8 %50, ptr %14, align 1, !tbaa !6
  %51 = load i8, ptr %16, align 1, !tbaa !6
  store i8 %51, ptr %15, align 1, !tbaa !6
  store i8 %48, ptr %16, align 1, !tbaa !6
  br label %52

52:                                               ; preds = %39, %209
  %53 = phi i64 [ 0, %39 ], [ %214, %209 ]
  %54 = shl nuw nsw i64 %53, 2
  %55 = getelementptr inbounds nuw i8, ptr %1, i64 %54
  %56 = load i8, ptr %55, align 1, !tbaa !6
  br label %57

57:                                               ; preds = %52, %57
  %58 = phi i8 [ 0, %52 ], [ %71, %57 ]
  %59 = phi i8 [ 0, %52 ], [ %65, %57 ]
  %60 = phi i8 [ %56, %52 ], [ %70, %57 ]
  %61 = phi i8 [ 2, %52 ], [ %69, %57 ]
  %62 = and i8 %60, 1
  %63 = icmp eq i8 %62, 0
  %64 = select i1 %63, i8 0, i8 %61
  %65 = xor i8 %64, %59
  %66 = shl i8 %61, 1
  %67 = xor i8 %66, 27
  %68 = icmp slt i8 %61, 0
  %69 = select i1 %68, i8 %67, i8 %66
  %70 = ashr i8 %60, 1
  %71 = add nuw nsw i8 %58, 1
  %72 = icmp samesign ult i8 %58, 7
  br i1 %72, label %57, label %73, !llvm.loop !10

73:                                               ; preds = %57
  %74 = or disjoint i64 %54, 1
  %75 = getelementptr inbounds nuw i8, ptr %1, i64 %74
  %76 = load i8, ptr %75, align 1, !tbaa !6
  br label %77

77:                                               ; preds = %73, %77
  %78 = phi i8 [ 0, %73 ], [ %91, %77 ]
  %79 = phi i8 [ 0, %73 ], [ %85, %77 ]
  %80 = phi i8 [ %76, %73 ], [ %90, %77 ]
  %81 = phi i8 [ 3, %73 ], [ %89, %77 ]
  %82 = and i8 %80, 1
  %83 = icmp eq i8 %82, 0
  %84 = select i1 %83, i8 0, i8 %81
  %85 = xor i8 %84, %79
  %86 = shl i8 %81, 1
  %87 = xor i8 %86, 27
  %88 = icmp slt i8 %81, 0
  %89 = select i1 %88, i8 %87, i8 %86
  %90 = ashr i8 %80, 1
  %91 = add nuw nsw i8 %78, 1
  %92 = icmp samesign ult i8 %78, 7
  br i1 %92, label %77, label %93, !llvm.loop !10

93:                                               ; preds = %77
  %94 = or disjoint i64 %54, 2
  %95 = getelementptr inbounds nuw i8, ptr %1, i64 %94
  %96 = load i8, ptr %95, align 1, !tbaa !6
  %97 = or disjoint i64 %54, 3
  %98 = getelementptr inbounds nuw i8, ptr %1, i64 %97
  %99 = load i8, ptr %98, align 1, !tbaa !6
  br label %100

100:                                              ; preds = %93, %100
  %101 = phi i8 [ 0, %93 ], [ %114, %100 ]
  %102 = phi i8 [ 0, %93 ], [ %108, %100 ]
  %103 = phi i8 [ %76, %93 ], [ %113, %100 ]
  %104 = phi i8 [ 2, %93 ], [ %112, %100 ]
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
  br i1 %115, label %100, label %116, !llvm.loop !10

116:                                              ; preds = %100
  %117 = xor i8 %85, %65
  %118 = xor i8 %117, %96
  br label %119

119:                                              ; preds = %116, %119
  %120 = phi i8 [ 0, %116 ], [ %133, %119 ]
  %121 = phi i8 [ 0, %116 ], [ %127, %119 ]
  %122 = phi i8 [ %96, %116 ], [ %132, %119 ]
  %123 = phi i8 [ 3, %116 ], [ %131, %119 ]
  %124 = and i8 %122, 1
  %125 = icmp eq i8 %124, 0
  %126 = select i1 %125, i8 0, i8 %123
  %127 = xor i8 %126, %121
  %128 = shl i8 %123, 1
  %129 = xor i8 %128, 27
  %130 = icmp slt i8 %123, 0
  %131 = select i1 %130, i8 %129, i8 %128
  %132 = ashr i8 %122, 1
  %133 = add nuw nsw i8 %120, 1
  %134 = icmp samesign ult i8 %120, 7
  br i1 %134, label %119, label %135, !llvm.loop !10

135:                                              ; preds = %119
  %136 = xor i8 %99, %56
  %137 = xor i8 %136, %108
  %138 = xor i8 %137, %127
  br label %139

139:                                              ; preds = %135, %139
  %140 = phi i8 [ 0, %135 ], [ %153, %139 ]
  %141 = phi i8 [ 0, %135 ], [ %147, %139 ]
  %142 = phi i8 [ %96, %135 ], [ %152, %139 ]
  %143 = phi i8 [ 2, %135 ], [ %151, %139 ]
  %144 = and i8 %142, 1
  %145 = icmp eq i8 %144, 0
  %146 = select i1 %145, i8 0, i8 %143
  %147 = xor i8 %146, %141
  %148 = shl i8 %143, 1
  %149 = xor i8 %148, 27
  %150 = icmp slt i8 %143, 0
  %151 = select i1 %150, i8 %149, i8 %148
  %152 = ashr i8 %142, 1
  %153 = add nuw nsw i8 %140, 1
  %154 = icmp samesign ult i8 %140, 7
  br i1 %154, label %139, label %155, !llvm.loop !10

155:                                              ; preds = %139
  %156 = xor i8 %76, %56
  br label %157

157:                                              ; preds = %155, %157
  %158 = phi i8 [ 0, %155 ], [ %171, %157 ]
  %159 = phi i8 [ 0, %155 ], [ %165, %157 ]
  %160 = phi i8 [ %99, %155 ], [ %170, %157 ]
  %161 = phi i8 [ 3, %155 ], [ %169, %157 ]
  %162 = and i8 %160, 1
  %163 = icmp eq i8 %162, 0
  %164 = select i1 %163, i8 0, i8 %161
  %165 = xor i8 %164, %159
  %166 = shl i8 %161, 1
  %167 = xor i8 %166, 27
  %168 = icmp slt i8 %161, 0
  %169 = select i1 %168, i8 %167, i8 %166
  %170 = ashr i8 %160, 1
  %171 = add nuw nsw i8 %158, 1
  %172 = icmp samesign ult i8 %158, 7
  br i1 %172, label %157, label %173, !llvm.loop !10

173:                                              ; preds = %157
  %174 = xor i8 %156, %147
  br label %175

175:                                              ; preds = %173, %175
  %176 = phi i8 [ 0, %173 ], [ %189, %175 ]
  %177 = phi i8 [ 0, %173 ], [ %183, %175 ]
  %178 = phi i8 [ %56, %173 ], [ %188, %175 ]
  %179 = phi i8 [ 3, %173 ], [ %187, %175 ]
  %180 = and i8 %178, 1
  %181 = icmp eq i8 %180, 0
  %182 = select i1 %181, i8 0, i8 %179
  %183 = xor i8 %182, %177
  %184 = shl i8 %179, 1
  %185 = xor i8 %184, 27
  %186 = icmp slt i8 %179, 0
  %187 = select i1 %186, i8 %185, i8 %184
  %188 = ashr i8 %178, 1
  %189 = add nuw nsw i8 %176, 1
  %190 = icmp samesign ult i8 %176, 7
  br i1 %190, label %175, label %191, !llvm.loop !10

191:                                              ; preds = %175
  %192 = xor i8 %118, %99
  br label %193

193:                                              ; preds = %191, %193
  %194 = phi i8 [ 0, %191 ], [ %207, %193 ]
  %195 = phi i8 [ 0, %191 ], [ %201, %193 ]
  %196 = phi i8 [ %99, %191 ], [ %206, %193 ]
  %197 = phi i8 [ 2, %191 ], [ %205, %193 ]
  %198 = and i8 %196, 1
  %199 = icmp eq i8 %198, 0
  %200 = select i1 %199, i8 0, i8 %197
  %201 = xor i8 %200, %195
  %202 = shl i8 %197, 1
  %203 = xor i8 %202, 27
  %204 = icmp slt i8 %197, 0
  %205 = select i1 %204, i8 %203, i8 %202
  %206 = ashr i8 %196, 1
  %207 = add nuw nsw i8 %194, 1
  %208 = icmp samesign ult i8 %194, 7
  br i1 %208, label %193, label %209, !llvm.loop !10

209:                                              ; preds = %193
  %210 = xor i8 %174, %165
  %211 = xor i8 %96, %76
  %212 = xor i8 %211, %183
  %213 = xor i8 %212, %201
  store i8 %192, ptr %55, align 1, !tbaa !6
  store i8 %138, ptr %75, align 1, !tbaa !6
  store i8 %210, ptr %95, align 1, !tbaa !6
  store i8 %213, ptr %98, align 1, !tbaa !6
  %214 = add nuw nsw i64 %53, 1
  %215 = icmp eq i64 %214, 4
  br i1 %215, label %216, label %52, !llvm.loop !11

216:                                              ; preds = %209
  %217 = add nuw nsw i32 %18, 1
  %218 = icmp eq i32 %217, 1000
  br i1 %218, label %19, label %17, !llvm.loop !12

219:                                              ; preds = %235
  %220 = add nuw nsw i64 %37, 1
  %221 = icmp eq i64 %220, 4
  br i1 %221, label %39, label %36, !llvm.loop !13

222:                                              ; preds = %36, %235
  %223 = phi i64 [ 0, %36 ], [ %236, %235 ]
  %224 = add nuw nsw i64 %223, %38
  %225 = getelementptr inbounds nuw [16 x i8], ptr %1, i64 0, i64 %224
  %226 = load i8, ptr %225, align 1, !tbaa !6
  %227 = icmp sgt i8 %226, -1
  %228 = tail call i1 @llvm.bpf.passthrough.i1.i1(i32 0, i1 %227)
  %229 = icmp slt i8 %226, 16
  %230 = select i1 %228, i1 %229, i1 false
  br i1 %230, label %231, label %235

231:                                              ; preds = %222
  %232 = sext i8 %226 to i64
  %233 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 %232
  %234 = load i8, ptr %233, align 1, !tbaa !6
  store i8 %234, ptr %225, align 1, !tbaa !6
  br label %235

235:                                              ; preds = %231, %222
  %236 = add nuw nsw i64 %223, 1
  %237 = icmp eq i64 %236, 4
  br i1 %237, label %219, label %222, !llvm.loop !14
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind memory(none)
declare i1 @llvm.bpf.passthrough.i1.i1(i32, i1) #4

attributes #0 = { nofree nosync nounwind memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="duotronic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #4 = { nounwind memory(none) }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 755f040f24df9a74f4e5f7f7bdd64e3acd4e61b9)"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.mustprogress"}
!5 = !{!"llvm.loop.unroll.disable"}
!6 = !{!7, !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !4, !5}
!10 = distinct !{!10, !4, !5}
!11 = distinct !{!11, !4, !5}
!12 = distinct !{!12, !4, !5}
!13 = distinct !{!13, !4, !5}
!14 = distinct !{!14, !4, !5}
