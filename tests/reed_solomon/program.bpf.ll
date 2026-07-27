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
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #2, !srcloc !3
  %13 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 1, i32 0, i32 0, i32 0) #2, !srcloc !4
  call void @llvm.lifetime.start.p0(i64 256, ptr nonnull %1) #2
  call void @llvm.lifetime.start.p0(i64 512, ptr nonnull %2) #2
  call void @llvm.lifetime.start.p0(i64 5, ptr nonnull %3) #2
  call void @llvm.lifetime.start.p0(i64 20, ptr nonnull %4) #2
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %5) #2
  %14 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %5, i32 noundef 0, i32 noundef 255) #2
  %15 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %16 = icmp eq ptr %15, null
  br i1 %16, label %34, label %17

17:                                               ; preds = %0, %17
  %18 = phi ptr [ %32, %17 ], [ %15, %0 ]
  %19 = phi i32 [ %31, %17 ], [ 1, %0 ]
  %20 = trunc i32 %19 to i8
  %21 = load i64, ptr %18, align 8, !tbaa !5
  %22 = getelementptr inbounds [512 x i8], ptr %2, i64 0, i64 %21
  store volatile i8 %20, ptr %22, align 1, !tbaa !9
  %23 = load i64, ptr %18, align 8, !tbaa !5
  %24 = trunc i64 %23 to i8
  %25 = zext i32 %19 to i64
  %26 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %25
  store volatile i8 %24, ptr %26, align 1, !tbaa !9
  %27 = shl i32 %19, 1
  %28 = and i32 %19, 128
  %29 = icmp eq i32 %28, 0
  %30 = xor i32 %27, 285
  %31 = select i1 %29, i32 %27, i32 %30
  %32 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %33 = icmp eq ptr %32, null
  br i1 %33, label %34, label %17, !llvm.loop !10

34:                                               ; preds = %17, %0
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %5) #2
  %35 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %5, i32 noundef 255, i32 noundef 511) #2
  %36 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %37 = icmp eq ptr %36, null
  br i1 %37, label %47, label %38

38:                                               ; preds = %34, %38
  %39 = phi ptr [ %45, %38 ], [ %36, %34 ]
  %40 = load i64, ptr %39, align 8, !tbaa !5
  %41 = add nsw i64 %40, -255
  %42 = getelementptr inbounds [512 x i8], ptr %2, i64 0, i64 %41
  %43 = load volatile i8, ptr %42, align 1, !tbaa !9
  %44 = getelementptr inbounds [512 x i8], ptr %2, i64 0, i64 %40
  store volatile i8 %43, ptr %44, align 1, !tbaa !9
  %45 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %46 = icmp eq ptr %45, null
  br i1 %46, label %47, label %38, !llvm.loop !13

47:                                               ; preds = %38, %34
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %5) #2
  store volatile i8 1, ptr %3, align 1, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %6) #2
  %48 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %6, i32 noundef 1, i32 noundef 5) #2
  %49 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %6) #2
  %50 = icmp eq ptr %49, null
  br i1 %50, label %57, label %51

51:                                               ; preds = %47, %51
  %52 = phi ptr [ %55, %51 ], [ %49, %47 ]
  %53 = load i64, ptr %52, align 8, !tbaa !5
  %54 = getelementptr inbounds [5 x i8], ptr %3, i64 0, i64 %53
  store volatile i8 0, ptr %54, align 1, !tbaa !9
  %55 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %6) #2
  %56 = icmp eq ptr %55, null
  br i1 %56, label %57, label %51, !llvm.loop !14

57:                                               ; preds = %51, %47
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %6) #2
  %58 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %5, i32 noundef 0, i32 noundef 4) #2
  %59 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %60 = icmp eq ptr %59, null
  br i1 %60, label %111, label %61

61:                                               ; preds = %57, %108
  %62 = phi i64 [ %72, %108 ], [ 0, %57 ]
  %63 = phi ptr [ %109, %108 ], [ %59, %57 ]
  %64 = load i64, ptr %63, align 8, !tbaa !5
  %65 = getelementptr inbounds [512 x i8], ptr %2, i64 0, i64 %64
  %66 = load volatile i8, ptr %65, align 1, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %7) #2
  %67 = trunc i64 %62 to i32
  %68 = add i32 %67, 2
  %69 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %7, i32 noundef 0, i32 noundef %68) #2
  %70 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %71 = icmp eq ptr %70, null
  %72 = add nuw nsw i64 %62, 1
  br i1 %71, label %108, label %73

73:                                               ; preds = %61
  %74 = zext i8 %66 to i64
  %75 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %74
  br label %76

76:                                               ; preds = %73, %102
  %77 = phi ptr [ %70, %73 ], [ %106, %102 ]
  %78 = load i64, ptr %77, align 8, !tbaa !5
  %79 = sub nsw i64 %72, %78
  %80 = icmp sgt i64 %79, 0
  br i1 %80, label %81, label %85

81:                                               ; preds = %76
  %82 = add nsw i64 %79, -1
  %83 = getelementptr inbounds nuw [5 x i8], ptr %3, i64 0, i64 %82
  %84 = load volatile i8, ptr %83, align 1, !tbaa !9
  br label %85

85:                                               ; preds = %76, %81
  %86 = phi i8 [ %84, %81 ], [ 0, %76 ]
  %87 = icmp sgt i64 %79, %62
  br i1 %87, label %102, label %88

88:                                               ; preds = %85
  %89 = getelementptr inbounds [5 x i8], ptr %3, i64 0, i64 %79
  %90 = load volatile i8, ptr %89, align 1, !tbaa !9
  %91 = icmp eq i8 %90, 0
  br i1 %91, label %102, label %92

92:                                               ; preds = %88
  %93 = zext i8 %90 to i64
  %94 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %93
  %95 = load volatile i8, ptr %94, align 1, !tbaa !9
  %96 = zext i8 %95 to i64
  %97 = load volatile i8, ptr %75, align 1, !tbaa !9
  %98 = zext i8 %97 to i64
  %99 = add nuw nsw i64 %98, %96
  %100 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %99
  %101 = load volatile i8, ptr %100, align 1, !tbaa !9
  br label %102

102:                                              ; preds = %85, %88, %92
  %103 = phi i8 [ %101, %92 ], [ 0, %88 ], [ 0, %85 ]
  %104 = xor i8 %103, %86
  %105 = getelementptr inbounds [5 x i8], ptr %3, i64 0, i64 %79
  store volatile i8 %104, ptr %105, align 1, !tbaa !9
  %106 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %7) #2
  %107 = icmp eq ptr %106, null
  br i1 %107, label %108, label %76, !llvm.loop !15

108:                                              ; preds = %102, %61
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %7) #2
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %7) #2
  %109 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %110 = icmp eq ptr %109, null
  br i1 %110, label %111, label %61, !llvm.loop !16

111:                                              ; preds = %108, %57
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %5) #2
  %112 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %5, i32 noundef 0, i32 noundef 16) #2
  %113 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %114 = icmp eq ptr %113, null
  br i1 %114, label %124, label %115

115:                                              ; preds = %111, %115
  %116 = phi ptr [ %122, %115 ], [ %113, %111 ]
  %117 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %12, ptr noundef nonnull %116) #2
  %118 = load i32, ptr %117, align 4, !tbaa !17
  %119 = trunc i32 %118 to i8
  %120 = load i64, ptr %116, align 8, !tbaa !5
  %121 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 %120
  store volatile i8 %119, ptr %121, align 1, !tbaa !9
  %122 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %123 = icmp eq ptr %122, null
  br i1 %123, label %124, label %115, !llvm.loop !19

124:                                              ; preds = %115, %111
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %5) #2
  %125 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %5, i32 noundef 16, i32 noundef 20) #2
  %126 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %127 = icmp eq ptr %126, null
  br i1 %127, label %134, label %128

128:                                              ; preds = %124, %128
  %129 = phi ptr [ %132, %128 ], [ %126, %124 ]
  %130 = load i64, ptr %129, align 8, !tbaa !5
  %131 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 %130
  store volatile i8 0, ptr %131, align 1, !tbaa !9
  %132 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %133 = icmp eq ptr %132, null
  br i1 %133, label %134, label %128, !llvm.loop !20

134:                                              ; preds = %128, %124
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %5) #2
  %135 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %5, i32 noundef 0, i32 noundef 16) #2
  %136 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %137 = icmp eq ptr %136, null
  br i1 %137, label %180, label %138

138:                                              ; preds = %134, %177
  %139 = phi ptr [ %178, %177 ], [ %136, %134 ]
  %140 = load i64, ptr %139, align 8, !tbaa !5
  %141 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 %140
  %142 = load volatile i8, ptr %141, align 1, !tbaa !9
  %143 = icmp eq i8 %142, 0
  br i1 %143, label %177, label %144

144:                                              ; preds = %138
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %8) #2
  %145 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %8, i32 noundef 0, i32 noundef 5) #2
  %146 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %8) #2
  %147 = icmp eq ptr %146, null
  br i1 %147, label %176, label %148

148:                                              ; preds = %144
  %149 = zext i8 %142 to i64
  %150 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %149
  br label %151

151:                                              ; preds = %148, %173
  %152 = phi ptr [ %146, %148 ], [ %174, %173 ]
  %153 = load i64, ptr %152, align 8, !tbaa !5
  %154 = sub nsw i64 4, %153
  %155 = getelementptr inbounds [5 x i8], ptr %3, i64 0, i64 %154
  %156 = load volatile i8, ptr %155, align 1, !tbaa !9
  %157 = icmp eq i8 %156, 0
  br i1 %157, label %173, label %158

158:                                              ; preds = %151
  %159 = load i64, ptr %139, align 8, !tbaa !5
  %160 = add nsw i64 %159, %153
  %161 = zext i8 %156 to i64
  %162 = getelementptr inbounds nuw [256 x i8], ptr %1, i64 0, i64 %161
  %163 = load volatile i8, ptr %162, align 1, !tbaa !9
  %164 = zext i8 %163 to i64
  %165 = load volatile i8, ptr %150, align 1, !tbaa !9
  %166 = zext i8 %165 to i64
  %167 = add nuw nsw i64 %166, %164
  %168 = getelementptr inbounds nuw [512 x i8], ptr %2, i64 0, i64 %167
  %169 = load volatile i8, ptr %168, align 1, !tbaa !9
  %170 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 %160
  %171 = load volatile i8, ptr %170, align 1, !tbaa !9
  %172 = xor i8 %171, %169
  store volatile i8 %172, ptr %170, align 1, !tbaa !9
  br label %173

173:                                              ; preds = %158, %151
  %174 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %8) #2
  %175 = icmp eq ptr %174, null
  br i1 %175, label %176, label %151, !llvm.loop !21

176:                                              ; preds = %173, %144
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %8) #2
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %8) #2
  br label %177

177:                                              ; preds = %176, %138
  %178 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %5) #2
  %179 = icmp eq ptr %178, null
  br i1 %179, label %180, label %138, !llvm.loop !22

180:                                              ; preds = %177, %134
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %5) #2
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %9) #2
  %181 = call i32 inttoptr (i64 5 to ptr)(ptr noundef nonnull %9, i32 noundef 0, i32 noundef 4) #2
  %182 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %9) #2
  %183 = icmp eq ptr %182, null
  br i1 %183, label %195, label %184

184:                                              ; preds = %180, %184
  %185 = phi ptr [ %193, %184 ], [ %182, %180 ]
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %10) #2
  %186 = load i64, ptr %185, align 8, !tbaa !5
  %187 = trunc i64 %186 to i32
  store i32 %187, ptr %10, align 4, !tbaa !17
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %11) #2
  %188 = add nsw i64 %186, 16
  %189 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 %188
  %190 = load volatile i8, ptr %189, align 1, !tbaa !9
  %191 = zext i8 %190 to i32
  store i32 %191, ptr %11, align 4, !tbaa !17
  %192 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %13, ptr noundef nonnull %10, ptr noundef nonnull %11, i64 noundef 0) #2
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %11) #2
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %10) #2
  %193 = call ptr inttoptr (i64 6 to ptr)(ptr noundef nonnull %9) #2
  %194 = icmp eq ptr %193, null
  br i1 %194, label %195, label %184, !llvm.loop !23

195:                                              ; preds = %184, %180
  call void inttoptr (i64 7 to ptr)(ptr noundef nonnull %9) #2
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %9) #2
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
!3 = !{i64 2147506405}
!4 = !{i64 2147506917}
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
!17 = !{!18, !18, i64 0}
!18 = !{!"int", !7, i64 0}
!19 = distinct !{!19, !11, !12}
!20 = distinct !{!20, !11, !12}
!21 = distinct !{!21, !11, !12}
!22 = distinct !{!22, !11, !12}
!23 = distinct !{!23, !11, !12}
