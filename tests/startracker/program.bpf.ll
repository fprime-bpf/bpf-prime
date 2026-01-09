; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca [6 x float], align 8
  %2 = alloca float, align 4
  %3 = alloca i64, align 8
  %4 = alloca float, align 8
  %5 = alloca float, align 8
  %6 = alloca i64, align 8
  %7 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #3, !srcloc !3
  %8 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 1, i32 0, i32 0, i32 0) #3, !srcloc !4
  %9 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 2, i32 0, i32 0, i32 0) #3, !srcloc !5
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %1) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2) #3
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3) #3
  store i64 0, ptr %3, align 8, !tbaa !6
  br label %62

10:                                               ; preds = %62
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #3
  %11 = getelementptr inbounds nuw i8, ptr %1, i64 4
  %12 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %13 = getelementptr inbounds nuw i8, ptr %1, i64 12
  %14 = getelementptr inbounds nuw i8, ptr %1, i64 16
  %15 = getelementptr inbounds nuw i8, ptr %1, i64 20
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %1, i8 0, i64 24, i1 false)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4)
  store float 0.000000e+00, ptr %4, align 8, !tbaa !10
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %5)
  store float 0.000000e+00, ptr %5, align 8, !tbaa !10
  %16 = load i64, ptr %4, align 8, !tbaa !6
  %17 = load i64, ptr %5, align 8, !tbaa !6
  %18 = icmp sgt i64 %16, %17
  %19 = zext i1 %18 to i64
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %5)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4)
  store float 0.000000e+00, ptr %4, align 8, !tbaa !10
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %5)
  %20 = load float, ptr %11, align 4
  %21 = load float, ptr %1, align 8
  %22 = select i1 %18, float %20, float %21
  %23 = fmul float %22, 1.000000e+04
  store float %23, ptr %5, align 8, !tbaa !10
  %24 = load i64, ptr %4, align 8, !tbaa !6
  %25 = load i64, ptr %5, align 8, !tbaa !6
  %26 = icmp sgt i64 %24, %25
  %27 = select i1 %26, i64 2, i64 %19
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %5)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4)
  store float 0.000000e+00, ptr %4, align 8, !tbaa !10
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %5)
  %28 = getelementptr inbounds nuw [6 x float], ptr %1, i64 0, i64 %27
  %29 = load float, ptr %28, align 4, !tbaa !10
  %30 = fmul float %29, 1.000000e+04
  store float %30, ptr %5, align 8, !tbaa !10
  %31 = load i64, ptr %4, align 8, !tbaa !6
  %32 = load i64, ptr %5, align 8, !tbaa !6
  %33 = icmp sgt i64 %31, %32
  %34 = select i1 %33, i64 3, i64 %27
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %5)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4)
  store float 0.000000e+00, ptr %4, align 8, !tbaa !10
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %5)
  %35 = getelementptr inbounds nuw [6 x float], ptr %1, i64 0, i64 %34
  %36 = load float, ptr %35, align 4, !tbaa !10
  %37 = fmul float %36, 1.000000e+04
  store float %37, ptr %5, align 8, !tbaa !10
  %38 = load i64, ptr %4, align 8, !tbaa !6
  %39 = load i64, ptr %5, align 8, !tbaa !6
  %40 = icmp sgt i64 %38, %39
  %41 = select i1 %40, i64 4, i64 %34
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %5)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4)
  store float 0.000000e+00, ptr %4, align 8, !tbaa !10
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %5)
  %42 = getelementptr inbounds nuw [6 x float], ptr %1, i64 0, i64 %41
  %43 = load float, ptr %42, align 4, !tbaa !10
  %44 = fmul float %43, 1.000000e+04
  store float %44, ptr %5, align 8, !tbaa !10
  %45 = load i64, ptr %4, align 8, !tbaa !6
  %46 = load i64, ptr %5, align 8, !tbaa !6
  %47 = icmp sgt i64 %45, %46
  %48 = select i1 %47, i64 5, i64 %41
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %5)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4)
  %49 = getelementptr inbounds nuw [6 x float], ptr %1, i64 0, i64 %48
  %50 = load float, ptr %49, align 4, !tbaa !10
  %51 = fdiv float 0.000000e+00, %50
  store float %51, ptr %1, align 8, !tbaa !10
  %52 = load float, ptr %49, align 4, !tbaa !10
  %53 = fdiv float 0.000000e+00, %52
  store float %53, ptr %11, align 4, !tbaa !10
  %54 = load float, ptr %49, align 4, !tbaa !10
  %55 = fdiv float 0.000000e+00, %54
  store float %55, ptr %12, align 8, !tbaa !10
  %56 = load float, ptr %49, align 4, !tbaa !10
  %57 = fdiv float 0.000000e+00, %56
  store float %57, ptr %13, align 4, !tbaa !10
  %58 = load float, ptr %49, align 4, !tbaa !10
  %59 = fdiv float 0.000000e+00, %58
  store float %59, ptr %14, align 8, !tbaa !10
  %60 = load float, ptr %49, align 4, !tbaa !10
  %61 = fdiv float 0.000000e+00, %60
  store float %61, ptr %15, align 4, !tbaa !10
  switch i64 %48, label %73 [
    i64 0, label %68
    i64 1, label %69
    i64 2, label %70
    i64 3, label %71
    i64 4, label %72
  ]

62:                                               ; preds = %0, %62
  %63 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %7, ptr noundef nonnull %3) #3
  %64 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %8, ptr noundef nonnull %3) #3
  %65 = load i64, ptr %3, align 8, !tbaa !6
  %66 = add nsw i64 %65, 1
  store i64 %66, ptr %3, align 8, !tbaa !6
  %67 = icmp slt i64 %65, 3
  br i1 %67, label %62, label %10, !llvm.loop !12

68:                                               ; preds = %10
  store float %53, ptr %1, align 8, !tbaa !10
  br label %69

69:                                               ; preds = %10, %68
  store float %55, ptr %11, align 4, !tbaa !10
  br label %70

70:                                               ; preds = %10, %69
  store float %57, ptr %12, align 8, !tbaa !10
  br label %71

71:                                               ; preds = %10, %70
  store float %59, ptr %13, align 4, !tbaa !10
  br label %72

72:                                               ; preds = %10, %71
  store float %61, ptr %14, align 8, !tbaa !10
  br label %73

73:                                               ; preds = %10, %72
  %74 = load i64, ptr %1, align 8, !tbaa !6
  %75 = load i64, ptr %11, align 4, !tbaa !6
  %76 = load i64, ptr %12, align 8, !tbaa !6
  %77 = load i64, ptr %13, align 4, !tbaa !6
  %78 = load i64, ptr %14, align 8, !tbaa !6
  %79 = and i64 %75, %74
  %80 = xor i64 %74, -1
  %81 = and i64 %76, %80
  %82 = or i64 %81, %79
  %83 = and i64 %77, %75
  %84 = xor i64 %77, -1
  %85 = and i64 %76, %84
  %86 = or i64 %83, %85
  %87 = xor i64 %78, -1
  %88 = and i64 %76, %87
  %89 = xor i64 %88, %77
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %6) #3
  %90 = xor i64 %86, %82
  %91 = xor i64 %90, %89
  store i64 %91, ptr %6, align 8, !tbaa !6
  %92 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %9, ptr noundef nonnull %6, ptr noundef nonnull %2, i64 noundef 0) #3
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %6) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2) #3
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %1) #3
  ret i32 0
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
!3 = !{i64 2147504683}
!4 = !{i64 2147505195}
!5 = !{i64 2147505707}
!6 = !{!7, !7, i64 0}
!7 = !{!"long", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !8, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
