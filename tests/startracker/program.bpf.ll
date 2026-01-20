; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca [6 x float], align 4
  %2 = alloca float, align 4
  %3 = alloca [5 x i64], align 8
  %4 = alloca i64, align 8
  %5 = alloca float, align 8
  %6 = alloca float, align 8
  %7 = alloca i64, align 8
  %8 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #3, !srcloc !3
  %9 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 1, i32 0, i32 0, i32 0) #3, !srcloc !4
  %10 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 2, i32 0, i32 0, i32 0) #3, !srcloc !5
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %1) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2) #3
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %3) #3
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %4) #3
  store i64 0, ptr %4, align 8, !tbaa !6
  br label %12

11:                                               ; preds = %12
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4) #3
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(24) %1, i8 0, i64 24, i1 false)
  br label %20

12:                                               ; preds = %0, %12
  %13 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %8, ptr noundef nonnull %4) #3
  %14 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %9, ptr noundef nonnull %4) #3
  %15 = load i64, ptr %4, align 8, !tbaa !6
  %16 = add nsw i64 %15, 1
  store i64 %16, ptr %4, align 8, !tbaa !6
  %17 = icmp slt i64 %15, 3
  br i1 %17, label %12, label %11, !llvm.loop !10

18:                                               ; preds = %20
  %19 = getelementptr inbounds nuw [6 x float], ptr %1, i64 0, i64 %32
  br label %35

20:                                               ; preds = %11, %20
  %21 = phi i64 [ 0, %11 ], [ %33, %20 ]
  %22 = phi i64 [ 0, %11 ], [ %32, %20 ]
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %5)
  %23 = getelementptr inbounds nuw [6 x float], ptr %1, i64 0, i64 %21
  %24 = load float, ptr %23, align 4, !tbaa !13
  %25 = fmul float %24, 1.000000e+04
  store float %25, ptr %5, align 8, !tbaa !13
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %6)
  %26 = getelementptr inbounds nuw [6 x float], ptr %1, i64 0, i64 %22
  %27 = load float, ptr %26, align 4, !tbaa !13
  %28 = fmul float %27, 1.000000e+04
  store float %28, ptr %6, align 8, !tbaa !13
  %29 = load i64, ptr %5, align 8, !tbaa !6
  %30 = load i64, ptr %6, align 8, !tbaa !6
  %31 = icmp sgt i64 %29, %30
  %32 = select i1 %31, i64 %21, i64 %22
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %6)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %5)
  %33 = add nuw nsw i64 %21, 1
  %34 = icmp eq i64 %33, 6
  br i1 %34, label %18, label %20, !llvm.loop !15

35:                                               ; preds = %18, %35
  %36 = phi i64 [ 0, %18 ], [ %41, %35 ]
  %37 = getelementptr inbounds nuw [6 x float], ptr %1, i64 0, i64 %36
  %38 = load float, ptr %37, align 4, !tbaa !13
  %39 = load float, ptr %19, align 4, !tbaa !13
  %40 = fdiv float %38, %39
  store float %40, ptr %37, align 4, !tbaa !13
  %41 = add nuw nsw i64 %36, 1
  %42 = icmp eq i64 %41, 6
  br i1 %42, label %67, label %35, !llvm.loop !16

43:                                               ; preds = %67
  %44 = load i64, ptr %3, align 8, !tbaa !6
  %45 = getelementptr inbounds nuw i8, ptr %3, i64 8
  %46 = load i64, ptr %45, align 8, !tbaa !6
  %47 = and i64 %46, %44
  %48 = xor i64 %44, -1
  %49 = getelementptr inbounds nuw i8, ptr %3, i64 16
  %50 = load i64, ptr %49, align 8, !tbaa !6
  %51 = and i64 %50, %48
  %52 = or i64 %51, %47
  %53 = getelementptr inbounds nuw i8, ptr %3, i64 24
  %54 = load i64, ptr %53, align 8, !tbaa !6
  %55 = and i64 %54, %46
  %56 = xor i64 %54, -1
  %57 = and i64 %50, %56
  %58 = or i64 %55, %57
  %59 = getelementptr inbounds nuw i8, ptr %3, i64 32
  %60 = load i64, ptr %59, align 8, !tbaa !6
  %61 = xor i64 %60, -1
  %62 = and i64 %50, %61
  %63 = xor i64 %62, %54
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %7) #3
  %64 = xor i64 %58, %52
  %65 = xor i64 %64, %63
  store i64 %65, ptr %7, align 8, !tbaa !6
  %66 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %10, ptr noundef nonnull %7, ptr noundef nonnull %2, i64 noundef 0) #3
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %7) #3
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %3) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2) #3
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %1) #3
  ret i32 0

67:                                               ; preds = %35, %67
  %68 = phi i64 [ %72, %67 ], [ 0, %35 ]
  %69 = getelementptr inbounds nuw [6 x float], ptr %1, i64 0, i64 %68
  %70 = load i64, ptr %69, align 4, !tbaa !6
  %71 = getelementptr inbounds nuw [5 x i64], ptr %3, i64 0, i64 %68
  store i64 %70, ptr %71, align 8, !tbaa !6
  %72 = add nuw nsw i64 %68, 1
  %73 = icmp eq i64 %72, 5
  br i1 %73, label %43, label %67, !llvm.loop !17
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="duotronic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 755f040f24df9a74f4e5f7f7bdd64e3acd4e61b9)"}
!3 = !{i64 2147505379}
!4 = !{i64 2147505891}
!5 = !{i64 2147506403}
!6 = !{!7, !7, i64 0}
!7 = !{!"long", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = distinct !{!10, !11, !12}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = !{!14, !14, i64 0}
!14 = !{!"float", !8, i64 0}
!15 = distinct !{!15, !11, !12}
!16 = distinct !{!16, !11, !12}
!17 = distinct !{!17, !11, !12}
