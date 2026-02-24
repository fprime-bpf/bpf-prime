; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca [2500 x i32], align 4
  %2 = alloca [25 x i32], align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #3, !srcloc !3
  %8 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 1, i32 0, i32 0, i32 0) #3, !srcloc !4
  call void @llvm.lifetime.start.p0(i64 10000, ptr nonnull %1) #3
  call void @llvm.lifetime.start.p0(i64 100, ptr nonnull %2) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %3) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #3
  store i32 0, ptr %4, align 4, !tbaa !5
  br label %10

9:                                                ; preds = %10
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %5) #3
  store i32 0, ptr %5, align 4, !tbaa !5
  br label %80

10:                                               ; preds = %0, %10
  %11 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %7, ptr noundef nonnull %4) #3
  %12 = load i32, ptr %11, align 4, !tbaa !5
  %13 = load i32, ptr %4, align 4, !tbaa !5
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [2500 x i32], ptr %1, i64 0, i64 %14
  store i32 %12, ptr %15, align 4, !tbaa !5
  %16 = add nsw i32 %13, 1
  store i32 %16, ptr %4, align 4, !tbaa !5
  %17 = icmp slt i32 %13, 2499
  br i1 %17, label %10, label %9, !llvm.loop !9

18:                                               ; preds = %80
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %5) #3
  %19 = load i32, ptr %2, align 4, !tbaa !5
  %20 = getelementptr inbounds nuw i8, ptr %2, i64 4
  %21 = load i32, ptr %20, align 4, !tbaa !5
  %22 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %23 = load <2 x i32>, ptr %22, align 4, !tbaa !5
  %24 = insertelement <4 x i32> poison, i32 %19, i64 0
  %25 = insertelement <4 x i32> %24, i32 %21, i64 1
  %26 = shufflevector <2 x i32> %23, <2 x i32> poison, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %27 = shufflevector <4 x i32> %25, <4 x i32> %26, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  %28 = and <4 x i32> %27, splat (i32 15)
  %29 = getelementptr inbounds nuw i8, ptr %2, i64 16
  %30 = load i32, ptr %29, align 4, !tbaa !5
  %31 = and i32 %30, 15
  %32 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %33 = load i32, ptr %32, align 4, !tbaa !5
  %34 = getelementptr inbounds nuw i8, ptr %2, i64 12
  %35 = load <2 x i32>, ptr %34, align 4, !tbaa !5
  %36 = insertelement <4 x i32> poison, i32 %21, i64 0
  %37 = insertelement <4 x i32> %36, i32 %33, i64 1
  %38 = shufflevector <2 x i32> %35, <2 x i32> poison, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %39 = shufflevector <4 x i32> %37, <4 x i32> %38, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  %40 = and <4 x i32> %39, splat (i32 15)
  %41 = getelementptr inbounds nuw i8, ptr %2, i64 20
  %42 = load i32, ptr %41, align 4, !tbaa !5
  %43 = and i32 %42, 15
  %44 = getelementptr inbounds nuw i8, ptr %2, i64 12
  %45 = load i32, ptr %44, align 4, !tbaa !5
  %46 = getelementptr inbounds nuw i8, ptr %2, i64 16
  %47 = load <2 x i32>, ptr %46, align 4, !tbaa !5
  %48 = insertelement <4 x i32> poison, i32 %33, i64 0
  %49 = insertelement <4 x i32> %48, i32 %45, i64 1
  %50 = shufflevector <2 x i32> %47, <2 x i32> poison, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %51 = shufflevector <4 x i32> %49, <4 x i32> %50, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  %52 = and <4 x i32> %51, splat (i32 15)
  %53 = getelementptr inbounds nuw i8, ptr %2, i64 24
  %54 = load i32, ptr %53, align 4, !tbaa !5
  %55 = and i32 %54, 15
  %56 = getelementptr inbounds nuw i8, ptr %2, i64 16
  %57 = load i32, ptr %56, align 4, !tbaa !5
  %58 = getelementptr inbounds nuw i8, ptr %2, i64 20
  %59 = load <2 x i32>, ptr %58, align 4, !tbaa !5
  %60 = insertelement <4 x i32> poison, i32 %45, i64 0
  %61 = insertelement <4 x i32> %60, i32 %57, i64 1
  %62 = shufflevector <2 x i32> %59, <2 x i32> poison, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %63 = shufflevector <4 x i32> %61, <4 x i32> %62, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  %64 = and <4 x i32> %63, splat (i32 15)
  %65 = getelementptr inbounds nuw i8, ptr %2, i64 28
  %66 = load i32, ptr %65, align 4, !tbaa !5
  %67 = and i32 %66, 15
  %68 = getelementptr inbounds nuw i8, ptr %2, i64 20
  %69 = load i32, ptr %68, align 4, !tbaa !5
  %70 = getelementptr inbounds nuw i8, ptr %2, i64 24
  %71 = load <2 x i32>, ptr %70, align 4, !tbaa !5
  %72 = insertelement <4 x i32> poison, i32 %57, i64 0
  %73 = insertelement <4 x i32> %72, i32 %69, i64 1
  %74 = shufflevector <2 x i32> %71, <2 x i32> poison, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %75 = shufflevector <4 x i32> %73, <4 x i32> %74, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  %76 = and <4 x i32> %75, splat (i32 15)
  %77 = getelementptr inbounds nuw i8, ptr %2, i64 32
  %78 = load i32, ptr %77, align 4, !tbaa !5
  %79 = and i32 %78, 15
  br label %88

80:                                               ; preds = %9, %80
  %81 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %8, ptr noundef nonnull %5) #3
  %82 = load i32, ptr %81, align 4, !tbaa !5
  %83 = load i32, ptr %5, align 4, !tbaa !5
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [25 x i32], ptr %2, i64 0, i64 %84
  store i32 %82, ptr %85, align 4, !tbaa !5
  %86 = add nsw i32 %83, 1
  store i32 %86, ptr %5, align 4, !tbaa !5
  %87 = icmp slt i32 %83, 24
  br i1 %87, label %80, label %18, !llvm.loop !11

88:                                               ; preds = %18, %192
  %89 = phi i64 [ 0, %18 ], [ %193, %192 ]
  %90 = phi i32 [ -1, %18 ], [ %189, %192 ]
  %91 = phi i32 [ undef, %18 ], [ %188, %192 ]
  %92 = trunc nuw nsw i64 %89 to i32
  %93 = mul nuw nsw i64 %89, 50
  %94 = add nuw i64 %93, 4
  %95 = mul nuw i64 %89, 50
  %96 = add nuw i64 %95, 50
  %97 = add nuw i64 %95, 54
  %98 = mul nuw i64 %89, 50
  %99 = add nuw i64 %98, 100
  %100 = add nuw i64 %98, 104
  %101 = mul nuw i64 %89, 50
  %102 = add nuw i64 %101, 150
  %103 = add nuw i64 %101, 154
  %104 = mul nuw i64 %89, 50
  %105 = add nuw i64 %104, 200
  %106 = add nuw i64 %104, 204
  br label %109

107:                                              ; preds = %192
  store i32 %188, ptr %3, align 4
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %6) #3
  store i32 0, ptr %6, align 4, !tbaa !5
  %108 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %8, ptr noundef nonnull %6, ptr noundef nonnull %3, i64 noundef 0) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %6) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %3) #3
  call void @llvm.lifetime.end.p0(i64 100, ptr nonnull %2) #3
  call void @llvm.lifetime.end.p0(i64 10000, ptr nonnull %1) #3
  ret i32 0

109:                                              ; preds = %88, %109
  %110 = phi i64 [ 0, %88 ], [ %190, %109 ]
  %111 = phi i32 [ %90, %88 ], [ %189, %109 ]
  %112 = phi i32 [ %91, %88 ], [ %188, %109 ]
  %113 = add nuw nsw i64 %93, %110
  %114 = getelementptr inbounds nuw [2500 x i32], ptr %1, i64 0, i64 %113
  %115 = load <4 x i32>, ptr %114, align 4, !tbaa !5
  %116 = and <4 x i32> %115, splat (i32 15)
  %117 = sub nsw <4 x i32> %116, %28
  %118 = call <4 x i32> @llvm.abs.v4i32(<4 x i32> %117, i1 true)
  %119 = add nuw i64 %110, %94
  %120 = getelementptr inbounds nuw [2500 x i32], ptr %1, i64 0, i64 %119
  %121 = load i32, ptr %120, align 4, !tbaa !5
  %122 = and i32 %121, 15
  %123 = sub nsw i32 %122, %31
  %124 = call i32 @llvm.abs.i32(i32 %123, i1 true)
  %125 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %118)
  %126 = add i32 %125, %124
  %127 = add nuw nsw i64 %96, %110
  %128 = getelementptr inbounds nuw [2500 x i32], ptr %1, i64 0, i64 %127
  %129 = load <4 x i32>, ptr %128, align 4, !tbaa !5
  %130 = and <4 x i32> %129, splat (i32 15)
  %131 = sub nsw <4 x i32> %130, %40
  %132 = call <4 x i32> @llvm.abs.v4i32(<4 x i32> %131, i1 true)
  %133 = add nuw i64 %110, %97
  %134 = getelementptr inbounds nuw [2500 x i32], ptr %1, i64 0, i64 %133
  %135 = load i32, ptr %134, align 4, !tbaa !5
  %136 = and i32 %135, 15
  %137 = sub nsw i32 %136, %43
  %138 = call i32 @llvm.abs.i32(i32 %137, i1 true)
  %139 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %132)
  %140 = add i32 %139, %138
  %141 = add i32 %140, %126
  %142 = add nuw nsw i64 %99, %110
  %143 = getelementptr inbounds nuw [2500 x i32], ptr %1, i64 0, i64 %142
  %144 = load <4 x i32>, ptr %143, align 4, !tbaa !5
  %145 = and <4 x i32> %144, splat (i32 15)
  %146 = sub nsw <4 x i32> %145, %52
  %147 = call <4 x i32> @llvm.abs.v4i32(<4 x i32> %146, i1 true)
  %148 = add nuw i64 %110, %100
  %149 = getelementptr inbounds nuw [2500 x i32], ptr %1, i64 0, i64 %148
  %150 = load i32, ptr %149, align 4, !tbaa !5
  %151 = and i32 %150, 15
  %152 = sub nsw i32 %151, %55
  %153 = call i32 @llvm.abs.i32(i32 %152, i1 true)
  %154 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %147)
  %155 = add i32 %154, %153
  %156 = add i32 %155, %141
  %157 = add nuw nsw i64 %102, %110
  %158 = getelementptr inbounds nuw [2500 x i32], ptr %1, i64 0, i64 %157
  %159 = load <4 x i32>, ptr %158, align 4, !tbaa !5
  %160 = and <4 x i32> %159, splat (i32 15)
  %161 = sub nsw <4 x i32> %160, %64
  %162 = call <4 x i32> @llvm.abs.v4i32(<4 x i32> %161, i1 true)
  %163 = add nuw i64 %110, %103
  %164 = getelementptr inbounds nuw [2500 x i32], ptr %1, i64 0, i64 %163
  %165 = load i32, ptr %164, align 4, !tbaa !5
  %166 = and i32 %165, 15
  %167 = sub nsw i32 %166, %67
  %168 = call i32 @llvm.abs.i32(i32 %167, i1 true)
  %169 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %162)
  %170 = add i32 %169, %168
  %171 = add i32 %170, %156
  %172 = add nuw nsw i64 %105, %110
  %173 = getelementptr inbounds nuw [2500 x i32], ptr %1, i64 0, i64 %172
  %174 = load <4 x i32>, ptr %173, align 4, !tbaa !5
  %175 = and <4 x i32> %174, splat (i32 15)
  %176 = sub nsw <4 x i32> %175, %76
  %177 = call <4 x i32> @llvm.abs.v4i32(<4 x i32> %176, i1 true)
  %178 = add nuw i64 %110, %106
  %179 = getelementptr inbounds nuw [2500 x i32], ptr %1, i64 0, i64 %178
  %180 = load i32, ptr %179, align 4, !tbaa !5
  %181 = and i32 %180, 15
  %182 = sub nsw i32 %181, %79
  %183 = call i32 @llvm.abs.i32(i32 %182, i1 true)
  %184 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %177)
  %185 = add i32 %184, %183
  %186 = add i32 %185, %171
  %187 = icmp slt i32 %186, %111
  %188 = select i1 %187, i32 %92, i32 %112
  %189 = call i32 @llvm.smin.i32(i32 %186, i32 %111)
  %190 = add nuw nsw i64 %110, 1
  %191 = icmp eq i64 %190, 45
  br i1 %191, label %192, label %109, !llvm.loop !12

192:                                              ; preds = %109
  %193 = add nuw nsw i64 %89, 1
  %194 = icmp eq i64 %193, 45
  br i1 %194, label %107, label %88, !llvm.loop !13
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.abs.v4i32(<4 x i32>, i1 immarg) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #2

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="duotronic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 3047ef595b8b4944540de771dcf86dc85a97ef76)"}
!3 = !{i64 2147503434}
!4 = !{i64 2147503946}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
