; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

; Function Attrs: nounwind
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca i32, align 4
  %2 = alloca float, align 4
  %3 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "=r,i,i,i,i"(i32 2, i32 0, i32 0, i32 0) #2, !srcloc !3
  %4 = tail call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "=r,i,i,i,i"(i32 4, i32 0, i32 0, i32 0) #2, !srcloc !4
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %1) #2
  store i32 0, ptr %1, align 4, !tbaa !5
  %5 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %3, ptr noundef nonnull %1) #2
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2) #2
  %6 = load float, ptr %5, align 4, !tbaa !9
  store float %6, ptr %2, align 4, !tbaa !9
  store i32 1, ptr %1, align 4, !tbaa !5
  %7 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %3, ptr noundef nonnull %1) #2
  %8 = load float, ptr %7, align 4, !tbaa !9
  %9 = fcmp ogt float %6, %8
  br i1 %9, label %10, label %12

10:                                               ; preds = %0
  %11 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %4, ptr noundef nonnull %1, ptr noundef nonnull %2, i64 noundef 0) #2
  br label %12

12:                                               ; preds = %10, %0
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2) #2
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %1) #2
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
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 755f040f24df9a74f4e5f7f7bdd64e3acd4e61b9)"}
!3 = !{i64 2147501384}
!4 = !{i64 2147501822}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !7, i64 0}
