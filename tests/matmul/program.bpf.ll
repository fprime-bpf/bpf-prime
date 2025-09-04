; ModuleID = 'program.bpf.c'
source_filename = "program.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "aarch64-unknown-linux"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %mat_map_1 = alloca ptr, align 8
  %ret = alloca ptr, align 8
  %tmp = alloca ptr, align 8
  %mat_map_2 = alloca ptr, align 8
  %ret1 = alloca ptr, align 8
  %tmp2 = alloca ptr, align 8
  %mat_map_res = alloca ptr, align 8
  %ret3 = alloca ptr, align 8
  %tmp4 = alloca ptr, align 8
  %result = alloca ptr, align 8
  %mat_1 = alloca [100 x float], align 4
  %mat_2 = alloca [100 x float], align 4
  %mat_res = alloca [100 x float], align 4
  %i = alloca i32, align 4
  %i8 = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %i42 = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  %0 = call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "=r,i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #2, !srcloc !6
  store ptr %0, ptr %ret, align 8
  %1 = load ptr, ptr %ret, align 8
  store ptr %1, ptr %tmp, align 8
  %2 = load ptr, ptr %tmp, align 8
  store ptr %2, ptr %mat_map_1, align 8
  %3 = call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "=r,i,i,i,i"(i32 1, i32 0, i32 0, i32 0) #2, !srcloc !7
  store ptr %3, ptr %ret1, align 8
  %4 = load ptr, ptr %ret1, align 8
  store ptr %4, ptr %tmp2, align 8
  %5 = load ptr, ptr %tmp2, align 8
  store ptr %5, ptr %mat_map_2, align 8
  %6 = call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "=r,i,i,i,i"(i32 2, i32 0, i32 0, i32 0) #2, !srcloc !8
  store ptr %6, ptr %ret3, align 8
  %7 = load ptr, ptr %ret3, align 8
  store ptr %7, ptr %tmp4, align 8
  %8 = load ptr, ptr %tmp4, align 8
  store ptr %8, ptr %mat_map_res, align 8
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %9, 100
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %10 = load ptr, ptr %mat_map_1, align 8
  %call = call ptr inttoptr (i64 1 to ptr)(ptr noundef %10, ptr noundef %i)
  store ptr %call, ptr %result, align 8
  %11 = load ptr, ptr %result, align 8
  %12 = load float, ptr %11, align 4
  %13 = load i32, ptr %i, align 4
  %idxprom = sext i32 %13 to i64
  %arrayidx = getelementptr inbounds [100 x float], ptr %mat_1, i64 0, i64 %idxprom
  store float %12, ptr %arrayidx, align 4
  %14 = load ptr, ptr %mat_map_1, align 8
  %call5 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %14, ptr noundef %i)
  store ptr %call5, ptr %result, align 8
  %15 = load ptr, ptr %result, align 8
  %16 = load float, ptr %15, align 4
  %17 = load i32, ptr %i, align 4
  %idxprom6 = sext i32 %17 to i64
  %arrayidx7 = getelementptr inbounds [100 x float], ptr %mat_2, i64 0, i64 %idxprom6
  store float %16, ptr %arrayidx7, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %18 = load i32, ptr %i, align 4
  %inc = add nsw i32 %18, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !9

for.end:                                          ; preds = %for.cond
  store i32 0, ptr %i8, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc39, %for.end
  %19 = load i32, ptr %i8, align 4
  %cmp10 = icmp slt i32 %19, 10
  br i1 %cmp10, label %for.body11, label %for.end41

for.body11:                                       ; preds = %for.cond9
  store i32 0, ptr %j, align 4
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc36, %for.body11
  %20 = load i32, ptr %j, align 4
  %cmp13 = icmp slt i32 %20, 10
  br i1 %cmp13, label %for.body14, label %for.end38

for.body14:                                       ; preds = %for.cond12
  %21 = load i32, ptr %i8, align 4
  %mul = mul nsw i32 %21, 10
  %22 = load i32, ptr %j, align 4
  %add = add nsw i32 %mul, %22
  %idxprom15 = sext i32 %add to i64
  %arrayidx16 = getelementptr inbounds [100 x float], ptr %mat_res, i64 0, i64 %idxprom15
  store float 0.000000e+00, ptr %arrayidx16, align 4
  store i32 0, ptr %k, align 4
  br label %for.cond17

for.cond17:                                       ; preds = %for.inc33, %for.body14
  %23 = load i32, ptr %k, align 4
  %cmp18 = icmp slt i32 %23, 10
  br i1 %cmp18, label %for.body19, label %for.end35

for.body19:                                       ; preds = %for.cond17
  %24 = load i32, ptr %i8, align 4
  %mul20 = mul nsw i32 %24, 10
  %25 = load i32, ptr %k, align 4
  %add21 = add nsw i32 %mul20, %25
  %idxprom22 = sext i32 %add21 to i64
  %arrayidx23 = getelementptr inbounds [100 x float], ptr %mat_1, i64 0, i64 %idxprom22
  %26 = load float, ptr %arrayidx23, align 4
  %27 = load i32, ptr %k, align 4
  %mul24 = mul nsw i32 %27, 10
  %28 = load i32, ptr %j, align 4
  %add25 = add nsw i32 %mul24, %28
  %idxprom26 = sext i32 %add25 to i64
  %arrayidx27 = getelementptr inbounds [100 x float], ptr %mat_2, i64 0, i64 %idxprom26
  %29 = load float, ptr %arrayidx27, align 4
  %30 = load i32, ptr %i8, align 4
  %mul29 = mul nsw i32 %30, 10
  %31 = load i32, ptr %j, align 4
  %add30 = add nsw i32 %mul29, %31
  %idxprom31 = sext i32 %add30 to i64
  %arrayidx32 = getelementptr inbounds [100 x float], ptr %mat_res, i64 0, i64 %idxprom31
  %32 = load float, ptr %arrayidx32, align 4
  %33 = call float @llvm.fmuladd.f32(float %26, float %29, float %32)
  store float %33, ptr %arrayidx32, align 4
  br label %for.inc33

for.inc33:                                        ; preds = %for.body19
  %34 = load i32, ptr %k, align 4
  %inc34 = add nsw i32 %34, 1
  store i32 %inc34, ptr %k, align 4
  br label %for.cond17, !llvm.loop !11

for.end35:                                        ; preds = %for.cond17
  br label %for.inc36

for.inc36:                                        ; preds = %for.end35
  %35 = load i32, ptr %j, align 4
  %inc37 = add nsw i32 %35, 1
  store i32 %inc37, ptr %j, align 4
  br label %for.cond12, !llvm.loop !12

for.end38:                                        ; preds = %for.cond12
  br label %for.inc39

for.inc39:                                        ; preds = %for.end38
  %36 = load i32, ptr %i8, align 4
  %inc40 = add nsw i32 %36, 1
  store i32 %inc40, ptr %i8, align 4
  br label %for.cond9, !llvm.loop !13

for.end41:                                        ; preds = %for.cond9
  store i32 0, ptr %i42, align 4
  br label %for.cond43

for.cond43:                                       ; preds = %for.inc49, %for.end41
  %37 = load i32, ptr %i42, align 4
  %cmp44 = icmp slt i32 %37, 100
  br i1 %cmp44, label %for.body45, label %for.end51

for.body45:                                       ; preds = %for.cond43
  %38 = load ptr, ptr %mat_map_res, align 8
  %39 = load i32, ptr %i42, align 4
  %idxprom46 = sext i32 %39 to i64
  %arrayidx47 = getelementptr inbounds [100 x float], ptr %mat_res, i64 0, i64 %idxprom46
  %call48 = call i64 inttoptr (i64 2 to ptr)(ptr noundef %38, ptr noundef %i42, ptr noundef %arrayidx47, i64 noundef 0)
  br label %for.inc49

for.inc49:                                        ; preds = %for.body45
  %40 = load i32, ptr %i42, align 4
  %inc50 = add nsw i32 %40, 1
  store i32 %inc50, ptr %i42, align 4
  br label %for.cond43, !llvm.loop !14

for.end51:                                        ; preds = %for.cond43
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"clang version 20.1.0 (git@github.com:h313/llvm-duotronic.git 859c3b906df7604a0ad759c23448e36339b081df)"}
!6 = !{i64 2147503767}
!7 = !{i64 2147504205}
!8 = !{i64 2147504643}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = distinct !{!14, !10}
