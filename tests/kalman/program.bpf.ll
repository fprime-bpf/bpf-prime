; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "aarch64-unknown-linux"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %in_map = alloca ptr, align 8
  %ret = alloca ptr, align 8
  %tmp = alloca ptr, align 8
  %out_map = alloca ptr, align 8
  %ret1 = alloca ptr, align 8
  %tmp2 = alloca ptr, align 8
  %result = alloca ptr, align 8
  %ins = alloca [7 x float], align 4
  %preds = alloca [7 x float], align 4
  %i = alloca i32, align 4
  %i7 = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  %0 = call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "=r,i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #2, !srcloc !6
  store ptr %0, ptr %ret, align 8
  %1 = load ptr, ptr %ret, align 8
  store ptr %1, ptr %tmp, align 8
  %2 = load ptr, ptr %tmp, align 8
  store ptr %2, ptr %in_map, align 8
  %3 = call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "=r,i,i,i,i"(i32 1, i32 0, i32 0, i32 0) #2, !srcloc !7
  store ptr %3, ptr %ret1, align 8
  %4 = load ptr, ptr %ret1, align 8
  store ptr %4, ptr %tmp2, align 8
  %5 = load ptr, ptr %tmp2, align 8
  store ptr %5, ptr %out_map, align 8
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %6, 7
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load ptr, ptr %in_map, align 8
  %call = call ptr inttoptr (i64 1 to ptr)(ptr noundef %7, ptr noundef %i)
  store ptr %call, ptr %result, align 8
  %8 = load ptr, ptr %result, align 8
  %9 = load float, ptr %8, align 4
  %10 = load i32, ptr %i, align 4
  %idxprom = sext i32 %10 to i64
  %arrayidx = getelementptr inbounds [7 x float], ptr %ins, i64 0, i64 %idxprom
  store float %9, ptr %arrayidx, align 4
  %11 = load i32, ptr %i, align 4
  %idxprom3 = sext i32 %11 to i64
  %arrayidx4 = getelementptr inbounds [7 x float], ptr %ins, i64 0, i64 %idxprom3
  %12 = load float, ptr %arrayidx4, align 4
  %13 = load i32, ptr %i, align 4
  %idxprom5 = sext i32 %13 to i64
  %arrayidx6 = getelementptr inbounds [7 x float], ptr %preds, i64 0, i64 %idxprom5
  store float %12, ptr %arrayidx6, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load i32, ptr %i, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [7 x float], ptr %preds, i64 0, i64 0
  call void @predict(ptr noundef %arraydecay)
  store i32 0, ptr %i7, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc29, %for.end
  %15 = load i32, ptr %i7, align 4
  %cmp9 = icmp slt i32 %15, 7
  br i1 %cmp9, label %for.body10, label %for.end31

for.body10:                                       ; preds = %for.cond8
  %16 = load i32, ptr %i7, align 4
  %idxprom11 = sext i32 %16 to i64
  %arrayidx12 = getelementptr inbounds [7 x float], ptr %ins, i64 0, i64 %idxprom11
  %17 = load float, ptr %arrayidx12, align 4
  %18 = load i32, ptr %i7, align 4
  %idxprom13 = sext i32 %18 to i64
  %arrayidx14 = getelementptr inbounds [7 x float], ptr %preds, i64 0, i64 %idxprom13
  %19 = load float, ptr %arrayidx14, align 4
  %sub = fsub float %17, %19
  %20 = load i32, ptr %i7, align 4
  %idxprom15 = sext i32 %20 to i64
  %arrayidx16 = getelementptr inbounds [7 x float], ptr %ins, i64 0, i64 %idxprom15
  store float %sub, ptr %arrayidx16, align 4
  %21 = load i32, ptr %i7, align 4
  %idxprom17 = sext i32 %21 to i64
  %arrayidx18 = getelementptr inbounds [7 x float], ptr %ins, i64 0, i64 %idxprom17
  %22 = load float, ptr %arrayidx18, align 4
  %mul = fmul float %22, 0x3FA99999A0000000
  store float %mul, ptr %arrayidx18, align 4
  %23 = load i32, ptr %i7, align 4
  %idxprom19 = sext i32 %23 to i64
  %arrayidx20 = getelementptr inbounds [7 x float], ptr %preds, i64 0, i64 %idxprom19
  %24 = load float, ptr %arrayidx20, align 4
  %25 = load i32, ptr %i7, align 4
  %idxprom21 = sext i32 %25 to i64
  %arrayidx22 = getelementptr inbounds [7 x float], ptr %ins, i64 0, i64 %idxprom21
  %26 = load float, ptr %arrayidx22, align 4
  %sub23 = fsub float %24, %26
  %27 = load i32, ptr %i7, align 4
  %idxprom24 = sext i32 %27 to i64
  %arrayidx25 = getelementptr inbounds [7 x float], ptr %preds, i64 0, i64 %idxprom24
  store float %sub23, ptr %arrayidx25, align 4
  %28 = load ptr, ptr %out_map, align 8
  %29 = load i32, ptr %i7, align 4
  %idxprom26 = sext i32 %29 to i64
  %arrayidx27 = getelementptr inbounds [7 x float], ptr %preds, i64 0, i64 %idxprom26
  %call28 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %28, ptr noundef %i7, ptr noundef %arrayidx27, i64 noundef 0)
  br label %for.inc29

for.inc29:                                        ; preds = %for.body10
  %30 = load i32, ptr %i7, align 4
  %inc30 = add nsw i32 %30, 1
  store i32 %inc30, ptr %i7, align 4
  br label %for.cond8, !llvm.loop !10

for.end31:                                        ; preds = %for.cond8
  ret i32 0
}

declare void @predict(ptr noundef) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"clang version 20.1.0 (git@github.com:h313/llvm-duotronic.git 859c3b906df7604a0ad759c23448e36339b081df)"}
!6 = !{i64 2147503763}
!7 = !{i64 2147504201}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
