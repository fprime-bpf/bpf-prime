; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "aarch64-unknown-linux"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %map = alloca ptr, align 8
  %ret = alloca ptr, align 8
  %tmp = alloca ptr, align 8
  %key = alloca i32, align 4
  %value = alloca i32, align 4
  %ret1 = alloca ptr, align 8
  %tmp2 = alloca ptr, align 8
  store i32 0, ptr %retval, align 4
  %0 = call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "=r,i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #1, !srcloc !6
  store ptr %0, ptr %ret, align 8
  %1 = load ptr, ptr %ret, align 8
  store ptr %1, ptr %tmp, align 8
  %2 = load ptr, ptr %tmp, align 8
  store ptr %2, ptr %map, align 8
  store i32 0, ptr %key, align 4
  store i32 -559038737, ptr %value, align 4
  %3 = load ptr, ptr %map, align 8
  %call = call i64 inttoptr (i64 2 to ptr)(ptr noundef %3, ptr noundef %key, ptr noundef %value, i64 noundef 0)
  %4 = call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "=r,i,i,i,i"(i32 1, i32 0, i32 0, i32 0) #1, !srcloc !7
  store ptr %4, ptr %ret1, align 8
  %5 = load ptr, ptr %ret1, align 8
  store ptr %5, ptr %tmp2, align 8
  %6 = load ptr, ptr %tmp2, align 8
  store ptr %6, ptr %map, align 8
  store i32 2, ptr %key, align 4
  store i32 -1414673666, ptr %value, align 4
  %7 = load ptr, ptr %map, align 8
  %call3 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %7, ptr noundef %key, ptr noundef %value, i64 noundef 0)
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
attributes #1 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"clang version 20.1.0 (git@github.com:h313/llvm-duotronic.git 859c3b906df7604a0ad759c23448e36339b081df)"}
!6 = !{i64 2147503180}
!7 = !{i64 2147503618}
