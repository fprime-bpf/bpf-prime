; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128-f32:32:32"
target triple = "bpf"

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca float, align 4
  %11 = alloca ptr, align 8
  %12 = alloca float, align 4
  store i32 0, ptr %1, align 4
  %13 = call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 2, i32 0, i32 0, i32 0) #1, !srcloc !3
  store ptr %13, ptr %3, align 8
  %14 = load ptr, ptr %3, align 8
  store ptr %14, ptr %4, align 8
  %15 = load ptr, ptr %4, align 8
  store ptr %15, ptr %2, align 8
  %16 = call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 4, i32 0, i32 0, i32 0) #1, !srcloc !4
  store ptr %16, ptr %6, align 8
  %17 = load ptr, ptr %6, align 8
  store ptr %17, ptr %7, align 8
  %18 = load ptr, ptr %7, align 8
  store ptr %18, ptr %5, align 8
  store i32 0, ptr %8, align 4
  %19 = load ptr, ptr %2, align 8
  %20 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %19, ptr noundef %8)
  store ptr %20, ptr %9, align 8
  %21 = load ptr, ptr %9, align 8
  %22 = load float, ptr %21, align 4
  store float %22, ptr %10, align 4
  store i32 1, ptr %8, align 4
  %23 = load ptr, ptr %2, align 8
  %24 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %23, ptr noundef %8)
  store ptr %24, ptr %11, align 8
  %25 = load ptr, ptr %11, align 8
  %26 = load float, ptr %25, align 4
  store float %26, ptr %12, align 4
  %27 = load float, ptr %10, align 4
  %28 = load float, ptr %12, align 4
  %29 = fcmp ogt float %27, %28
  br i1 %29, label %30, label %33

30:                                               ; preds = %0
  %31 = load ptr, ptr %5, align 8
  %32 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %31, ptr noundef %8, ptr noundef %10, i64 noundef 0)
  br label %33

33:                                               ; preds = %30, %0
  ret i32 0
}

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="duotronic" }
attributes #1 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 755f040f24df9a74f4e5f7f7bdd64e3acd4e61b9)"}
!3 = !{i64 2147501516}
!4 = !{i64 2147502028}
