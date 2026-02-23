; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca [4 x float], align 4
  %2 = alloca [4 x float], align 4
  %3 = alloca [6 x float], align 8
  %4 = alloca float, align 4
  %5 = alloca i64, align 8
  %6 = alloca float, align 8
  %7 = alloca float, align 8
  %8 = alloca i64, align 8
  %9 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #2, !srcloc !3
  %10 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 1, i32 0, i32 0, i32 0) #2, !srcloc !4
  %11 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 2, i32 0, i32 0, i32 0) #2, !srcloc !5
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %1) #2
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %2) #2
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %3) #2
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #2
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %5) #2
  store i64 0, ptr %5, align 8, !tbaa !6
  br label %137

12:                                               ; preds = %137
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %5) #2
  %13 = load volatile float, ptr %1, align 4, !tbaa !10
  %14 = getelementptr inbounds nuw i8, ptr %1, i64 4
  %15 = load volatile float, ptr %14, align 4, !tbaa !10
  %16 = load volatile float, ptr %1, align 4, !tbaa !10
  %17 = load volatile float, ptr %14, align 4, !tbaa !10
  %18 = load volatile float, ptr %2, align 4, !tbaa !10
  %19 = getelementptr inbounds nuw i8, ptr %2, i64 4
  %20 = load volatile float, ptr %19, align 4, !tbaa !10
  %21 = load volatile float, ptr %2, align 4, !tbaa !10
  %22 = load volatile float, ptr %19, align 4, !tbaa !10
  store volatile float 0.000000e+00, ptr %3, align 8, !tbaa !10
  %23 = load volatile float, ptr %14, align 4, !tbaa !10
  %24 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %25 = load volatile float, ptr %24, align 4, !tbaa !10
  %26 = load volatile float, ptr %14, align 4, !tbaa !10
  %27 = load volatile float, ptr %24, align 4, !tbaa !10
  %28 = load volatile float, ptr %19, align 4, !tbaa !10
  %29 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %30 = load volatile float, ptr %29, align 4, !tbaa !10
  %31 = load volatile float, ptr %19, align 4, !tbaa !10
  %32 = load volatile float, ptr %29, align 4, !tbaa !10
  %33 = getelementptr inbounds nuw i8, ptr %3, i64 4
  store volatile float 0.000000e+00, ptr %33, align 4, !tbaa !10
  %34 = load volatile float, ptr %24, align 4, !tbaa !10
  %35 = getelementptr inbounds nuw i8, ptr %1, i64 12
  %36 = load volatile float, ptr %35, align 4, !tbaa !10
  %37 = load volatile float, ptr %24, align 4, !tbaa !10
  %38 = load volatile float, ptr %35, align 4, !tbaa !10
  %39 = load volatile float, ptr %29, align 4, !tbaa !10
  %40 = getelementptr inbounds nuw i8, ptr %2, i64 12
  %41 = load volatile float, ptr %40, align 4, !tbaa !10
  %42 = load volatile float, ptr %29, align 4, !tbaa !10
  %43 = load volatile float, ptr %40, align 4, !tbaa !10
  %44 = getelementptr inbounds nuw i8, ptr %3, i64 8
  store volatile float 0.000000e+00, ptr %44, align 8, !tbaa !10
  %45 = load volatile float, ptr %14, align 4, !tbaa !10
  %46 = load volatile float, ptr %35, align 4, !tbaa !10
  %47 = load volatile float, ptr %14, align 4, !tbaa !10
  %48 = load volatile float, ptr %35, align 4, !tbaa !10
  %49 = load volatile float, ptr %19, align 4, !tbaa !10
  %50 = load volatile float, ptr %40, align 4, !tbaa !10
  %51 = load volatile float, ptr %19, align 4, !tbaa !10
  %52 = load volatile float, ptr %40, align 4, !tbaa !10
  %53 = getelementptr inbounds nuw i8, ptr %3, i64 12
  store volatile float 0.000000e+00, ptr %53, align 4, !tbaa !10
  %54 = load volatile float, ptr %1, align 4, !tbaa !10
  %55 = load volatile float, ptr %24, align 4, !tbaa !10
  %56 = load volatile float, ptr %1, align 4, !tbaa !10
  %57 = load volatile float, ptr %24, align 4, !tbaa !10
  %58 = load volatile float, ptr %2, align 4, !tbaa !10
  %59 = load volatile float, ptr %29, align 4, !tbaa !10
  %60 = load volatile float, ptr %2, align 4, !tbaa !10
  %61 = load volatile float, ptr %29, align 4, !tbaa !10
  %62 = getelementptr inbounds nuw i8, ptr %3, i64 16
  store volatile float 0.000000e+00, ptr %62, align 8, !tbaa !10
  %63 = load volatile float, ptr %1, align 4, !tbaa !10
  %64 = load volatile float, ptr %35, align 4, !tbaa !10
  %65 = load volatile float, ptr %1, align 4, !tbaa !10
  %66 = load volatile float, ptr %35, align 4, !tbaa !10
  %67 = load volatile float, ptr %2, align 4, !tbaa !10
  %68 = load volatile float, ptr %40, align 4, !tbaa !10
  %69 = load volatile float, ptr %2, align 4, !tbaa !10
  %70 = load volatile float, ptr %40, align 4, !tbaa !10
  %71 = getelementptr inbounds nuw i8, ptr %3, i64 20
  store volatile float 0.000000e+00, ptr %71, align 4, !tbaa !10
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %6)
  %72 = load volatile float, ptr %3, align 8, !tbaa !10
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %7)
  %73 = load volatile float, ptr %3, align 8, !tbaa !10
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %7)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %6)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %6)
  %74 = load volatile float, ptr %33, align 4, !tbaa !10
  %75 = fmul float %74, 1.000000e+04
  store float %75, ptr %6, align 8, !tbaa !10
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %7)
  %76 = load volatile float, ptr %3, align 8, !tbaa !10
  %77 = fmul float %76, 1.000000e+04
  store float %77, ptr %7, align 8, !tbaa !10
  %78 = load i64, ptr %6, align 8, !tbaa !6
  %79 = load i64, ptr %7, align 8, !tbaa !6
  %80 = icmp sgt i64 %78, %79
  %81 = zext i1 %80 to i64
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %7)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %6)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %6)
  %82 = load volatile float, ptr %44, align 8, !tbaa !10
  %83 = fmul float %82, 1.000000e+04
  store float %83, ptr %6, align 8, !tbaa !10
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %7)
  %84 = select i1 %80, ptr %33, ptr %3
  %85 = load volatile float, ptr %84, align 4, !tbaa !10
  %86 = fmul float %85, 1.000000e+04
  store float %86, ptr %7, align 8, !tbaa !10
  %87 = load i64, ptr %6, align 8, !tbaa !6
  %88 = load i64, ptr %7, align 8, !tbaa !6
  %89 = icmp sgt i64 %87, %88
  %90 = select i1 %89, i64 2, i64 %81
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %7)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %6)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %6)
  %91 = load volatile float, ptr %53, align 4, !tbaa !10
  %92 = fmul float %91, 1.000000e+04
  store float %92, ptr %6, align 8, !tbaa !10
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %7)
  %93 = getelementptr inbounds nuw [6 x float], ptr %3, i64 0, i64 %90
  %94 = load volatile float, ptr %93, align 4, !tbaa !10
  %95 = fmul float %94, 1.000000e+04
  store float %95, ptr %7, align 8, !tbaa !10
  %96 = load i64, ptr %6, align 8, !tbaa !6
  %97 = load i64, ptr %7, align 8, !tbaa !6
  %98 = icmp sgt i64 %96, %97
  %99 = select i1 %98, i64 3, i64 %90
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %7)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %6)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %6)
  %100 = load volatile float, ptr %62, align 8, !tbaa !10
  %101 = fmul float %100, 1.000000e+04
  store float %101, ptr %6, align 8, !tbaa !10
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %7)
  %102 = getelementptr inbounds nuw [6 x float], ptr %3, i64 0, i64 %99
  %103 = load volatile float, ptr %102, align 4, !tbaa !10
  %104 = fmul float %103, 1.000000e+04
  store float %104, ptr %7, align 8, !tbaa !10
  %105 = load i64, ptr %6, align 8, !tbaa !6
  %106 = load i64, ptr %7, align 8, !tbaa !6
  %107 = icmp sgt i64 %105, %106
  %108 = select i1 %107, i64 4, i64 %99
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %7)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %6)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %6)
  %109 = load volatile float, ptr %71, align 4, !tbaa !10
  %110 = fmul float %109, 1.000000e+04
  store float %110, ptr %6, align 8, !tbaa !10
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %7)
  %111 = getelementptr inbounds nuw [6 x float], ptr %3, i64 0, i64 %108
  %112 = load volatile float, ptr %111, align 4, !tbaa !10
  %113 = fmul float %112, 1.000000e+04
  store float %113, ptr %7, align 8, !tbaa !10
  %114 = load i64, ptr %6, align 8, !tbaa !6
  %115 = load i64, ptr %7, align 8, !tbaa !6
  %116 = icmp sgt i64 %114, %115
  %117 = select i1 %116, i64 5, i64 %108
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %7)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %6)
  %118 = getelementptr inbounds nuw [6 x float], ptr %3, i64 0, i64 %117
  %119 = load volatile float, ptr %3, align 8, !tbaa !10
  %120 = load volatile float, ptr %118, align 4, !tbaa !10
  %121 = fdiv float %119, %120
  store volatile float %121, ptr %3, align 8, !tbaa !10
  %122 = load volatile float, ptr %33, align 4, !tbaa !10
  %123 = load volatile float, ptr %118, align 4, !tbaa !10
  %124 = fdiv float %122, %123
  store volatile float %124, ptr %33, align 4, !tbaa !10
  %125 = load volatile float, ptr %44, align 8, !tbaa !10
  %126 = load volatile float, ptr %118, align 4, !tbaa !10
  %127 = fdiv float %125, %126
  store volatile float %127, ptr %44, align 8, !tbaa !10
  %128 = load volatile float, ptr %53, align 4, !tbaa !10
  %129 = load volatile float, ptr %118, align 4, !tbaa !10
  %130 = fdiv float %128, %129
  store volatile float %130, ptr %53, align 4, !tbaa !10
  %131 = load volatile float, ptr %62, align 8, !tbaa !10
  %132 = load volatile float, ptr %118, align 4, !tbaa !10
  %133 = fdiv float %131, %132
  store volatile float %133, ptr %62, align 8, !tbaa !10
  %134 = load volatile float, ptr %71, align 4, !tbaa !10
  %135 = load volatile float, ptr %118, align 4, !tbaa !10
  %136 = fdiv float %134, %135
  store volatile float %136, ptr %71, align 4, !tbaa !10
  switch i64 %117, label %158 [
    i64 0, label %148
    i64 1, label %150
    i64 2, label %152
    i64 3, label %154
    i64 4, label %156
  ]

137:                                              ; preds = %0, %137
  %138 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %9, ptr noundef nonnull %5) #2
  %139 = load float, ptr %138, align 4, !tbaa !10
  %140 = load i64, ptr %5, align 8, !tbaa !6
  %141 = getelementptr inbounds [4 x float], ptr %1, i64 0, i64 %140
  store volatile float %139, ptr %141, align 4, !tbaa !10
  %142 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %10, ptr noundef nonnull %5) #2
  %143 = load float, ptr %142, align 4, !tbaa !10
  %144 = load i64, ptr %5, align 8, !tbaa !6
  %145 = getelementptr inbounds [4 x float], ptr %2, i64 0, i64 %144
  store volatile float %143, ptr %145, align 4, !tbaa !10
  %146 = add nsw i64 %144, 1
  store i64 %146, ptr %5, align 8, !tbaa !6
  %147 = icmp slt i64 %144, 3
  br i1 %147, label %137, label %12, !llvm.loop !12

148:                                              ; preds = %12
  %149 = load volatile float, ptr %33, align 4, !tbaa !10
  store volatile float %149, ptr %3, align 8, !tbaa !10
  br label %150

150:                                              ; preds = %12, %148
  %151 = load volatile float, ptr %44, align 8, !tbaa !10
  store volatile float %151, ptr %33, align 4, !tbaa !10
  br label %152

152:                                              ; preds = %12, %150
  %153 = load volatile float, ptr %53, align 4, !tbaa !10
  store volatile float %153, ptr %44, align 8, !tbaa !10
  br label %154

154:                                              ; preds = %12, %152
  %155 = load volatile float, ptr %62, align 8, !tbaa !10
  store volatile float %155, ptr %53, align 4, !tbaa !10
  br label %156

156:                                              ; preds = %12, %154
  %157 = load volatile float, ptr %71, align 4, !tbaa !10
  store volatile float %157, ptr %62, align 8, !tbaa !10
  br label %158

158:                                              ; preds = %12, %156
  %159 = load i64, ptr %3, align 8, !tbaa !6
  %160 = load i64, ptr %33, align 4, !tbaa !6
  %161 = load i64, ptr %44, align 8, !tbaa !6
  %162 = load i64, ptr %53, align 4, !tbaa !6
  %163 = load i64, ptr %62, align 8, !tbaa !6
  %164 = and i64 %160, %159
  %165 = xor i64 %159, -1
  %166 = and i64 %161, %165
  %167 = or i64 %166, %164
  %168 = and i64 %162, %160
  %169 = xor i64 %162, -1
  %170 = and i64 %161, %169
  %171 = or i64 %168, %170
  %172 = xor i64 %163, -1
  %173 = and i64 %161, %172
  %174 = xor i64 %173, %162
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %8) #2
  %175 = xor i64 %171, %167
  %176 = xor i64 %175, %174
  store i64 %176, ptr %8, align 8, !tbaa !6
  %177 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %11, ptr noundef nonnull %8, ptr noundef nonnull %4, i64 noundef 0) #2
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %8) #2
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #2
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3) #2
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %2) #2
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %1) #2
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
!2 = !{!"clang version 20.1.0 (https://github.com/fprime-bpf/llvm-project.git 3047ef595b8b4944540de771dcf86dc85a97ef76)"}
!3 = !{i64 2147510183}
!4 = !{i64 2147510695}
!5 = !{i64 2147511207}
!6 = !{!7, !7, i64 0}
!7 = !{!"long", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !8, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
