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
  %8 = alloca ptr, align 8
  %9 = alloca [2500 x i32], align 4
  %10 = alloca [25 x i32], align 4
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  %18 = alloca i32, align 4
  %19 = alloca i64, align 8
  %20 = alloca i64, align 8
  store i32 0, ptr %1, align 4
  %21 = call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 0, i32 0, i32 0, i32 0) #1, !srcloc !3
  store ptr %21, ptr %3, align 8
  %22 = load ptr, ptr %3, align 8
  store ptr %22, ptr %4, align 8
  %23 = load ptr, ptr %4, align 8
  store ptr %23, ptr %2, align 8
  %24 = call ptr asm sideeffect ".byte 0x18, 0x11, 0x00, 0x00, ${1:c}, ${2:c}, ${3:c}, ${4:c}, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00", "={r1},i,i,i,i"(i32 1, i32 0, i32 0, i32 0) #1, !srcloc !4
  store ptr %24, ptr %6, align 8
  %25 = load ptr, ptr %6, align 8
  store ptr %25, ptr %7, align 8
  %26 = load ptr, ptr %7, align 8
  store ptr %26, ptr %5, align 8
  store i64 4294967295, ptr %12, align 8
  store i32 0, ptr %13, align 4
  br label %27

27:                                               ; preds = %38, %0
  %28 = load i32, ptr %13, align 4
  %29 = icmp slt i32 %28, 2500
  br i1 %29, label %30, label %41

30:                                               ; preds = %27
  %31 = load ptr, ptr %2, align 8
  %32 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %31, ptr noundef %13)
  store ptr %32, ptr %8, align 8
  %33 = load ptr, ptr %8, align 8
  %34 = load i32, ptr %33, align 4
  %35 = load i32, ptr %13, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [2500 x i32], ptr %9, i64 0, i64 %36
  store i32 %34, ptr %37, align 4
  br label %38

38:                                               ; preds = %30
  %39 = load i32, ptr %13, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %13, align 4
  br label %27, !llvm.loop !5

41:                                               ; preds = %27
  store i32 0, ptr %14, align 4
  br label %42

42:                                               ; preds = %53, %41
  %43 = load i32, ptr %14, align 4
  %44 = icmp slt i32 %43, 25
  br i1 %44, label %45, label %56

45:                                               ; preds = %42
  %46 = load ptr, ptr %5, align 8
  %47 = call ptr inttoptr (i64 1 to ptr)(ptr noundef %46, ptr noundef %14)
  store ptr %47, ptr %8, align 8
  %48 = load ptr, ptr %8, align 8
  %49 = load i32, ptr %48, align 4
  %50 = load i32, ptr %14, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [25 x i32], ptr %10, i64 0, i64 %51
  store i32 %49, ptr %52, align 4
  br label %53

53:                                               ; preds = %45
  %54 = load i32, ptr %14, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, ptr %14, align 4
  br label %42, !llvm.loop !7

56:                                               ; preds = %42
  store i64 0, ptr %15, align 8
  br label %57

57:                                               ; preds = %189, %56
  %58 = load i64, ptr %15, align 8
  %59 = icmp slt i64 %58, 45
  br i1 %59, label %60, label %192

60:                                               ; preds = %57
  store i64 0, ptr %16, align 8
  br label %61

61:                                               ; preds = %185, %60
  %62 = load i64, ptr %16, align 8
  %63 = icmp slt i64 %62, 45
  br i1 %63, label %64, label %188

64:                                               ; preds = %61
  store i64 0, ptr %17, align 8
  store i64 0, ptr %19, align 8
  br label %65

65:                                               ; preds = %174, %64
  %66 = load i64, ptr %19, align 8
  %67 = icmp slt i64 %66, 5
  br i1 %67, label %68, label %177

68:                                               ; preds = %65
  store i64 0, ptr %20, align 8
  br label %69

69:                                               ; preds = %170, %68
  %70 = load i64, ptr %20, align 8
  %71 = icmp slt i64 %70, 5
  br i1 %71, label %72, label %173

72:                                               ; preds = %69
  %73 = load i64, ptr %15, align 8
  %74 = load i64, ptr %19, align 8
  %75 = add nsw i64 %73, %74
  %76 = mul nsw i64 %75, 50
  %77 = load i64, ptr %16, align 8
  %78 = add nsw i64 %76, %77
  %79 = load i64, ptr %20, align 8
  %80 = add nsw i64 %78, %79
  %81 = getelementptr inbounds [2500 x i32], ptr %9, i64 0, i64 %80
  %82 = load i32, ptr %81, align 4
  %83 = and i32 %82, 15
  %84 = load i64, ptr %19, align 8
  %85 = load i64, ptr %20, align 8
  %86 = add nsw i64 %84, %85
  %87 = getelementptr inbounds [25 x i32], ptr %10, i64 0, i64 %86
  %88 = load i32, ptr %87, align 4
  %89 = and i32 %88, 15
  %90 = sub nsw i32 %83, %89
  store i32 %90, ptr %18, align 4
  %91 = load i32, ptr %18, align 4
  %92 = icmp sgt i32 %91, 0
  br i1 %92, label %93, label %98

93:                                               ; preds = %72
  %94 = load i32, ptr %18, align 4
  %95 = sext i32 %94 to i64
  %96 = load i64, ptr %17, align 8
  %97 = add nsw i64 %96, %95
  store i64 %97, ptr %17, align 8
  br label %103

98:                                               ; preds = %72
  %99 = load i32, ptr %18, align 4
  %100 = sext i32 %99 to i64
  %101 = load i64, ptr %17, align 8
  %102 = sub nsw i64 %101, %100
  store i64 %102, ptr %17, align 8
  br label %103

103:                                              ; preds = %98, %93
  %104 = load i64, ptr %15, align 8
  %105 = load i64, ptr %19, align 8
  %106 = add nsw i64 %104, %105
  %107 = mul nsw i64 %106, 50
  %108 = load i64, ptr %16, align 8
  %109 = add nsw i64 %107, %108
  %110 = load i64, ptr %20, align 8
  %111 = add nsw i64 %109, %110
  %112 = getelementptr inbounds [2500 x i32], ptr %9, i64 0, i64 %111
  %113 = load i32, ptr %112, align 4
  %114 = and i32 %113, 240
  %115 = ashr i32 %114, 8
  %116 = load i64, ptr %19, align 8
  %117 = load i64, ptr %20, align 8
  %118 = add nsw i64 %116, %117
  %119 = getelementptr inbounds [25 x i32], ptr %10, i64 0, i64 %118
  %120 = load i32, ptr %119, align 4
  %121 = and i32 %120, 240
  %122 = ashr i32 %121, 8
  %123 = sub nsw i32 %115, %122
  store i32 %123, ptr %18, align 4
  %124 = load i32, ptr %18, align 4
  %125 = icmp sgt i32 %124, 0
  br i1 %125, label %126, label %131

126:                                              ; preds = %103
  %127 = load i32, ptr %18, align 4
  %128 = sext i32 %127 to i64
  %129 = load i64, ptr %17, align 8
  %130 = add nsw i64 %129, %128
  store i64 %130, ptr %17, align 8
  br label %136

131:                                              ; preds = %103
  %132 = load i32, ptr %18, align 4
  %133 = sext i32 %132 to i64
  %134 = load i64, ptr %17, align 8
  %135 = sub nsw i64 %134, %133
  store i64 %135, ptr %17, align 8
  br label %136

136:                                              ; preds = %131, %126
  %137 = load i64, ptr %15, align 8
  %138 = load i64, ptr %19, align 8
  %139 = add nsw i64 %137, %138
  %140 = mul nsw i64 %139, 50
  %141 = load i64, ptr %16, align 8
  %142 = add nsw i64 %140, %141
  %143 = load i64, ptr %20, align 8
  %144 = add nsw i64 %142, %143
  %145 = getelementptr inbounds [2500 x i32], ptr %9, i64 0, i64 %144
  %146 = load i32, ptr %145, align 4
  %147 = and i32 %146, 3840
  %148 = ashr i32 %147, 16
  %149 = load i64, ptr %19, align 8
  %150 = load i64, ptr %20, align 8
  %151 = add nsw i64 %149, %150
  %152 = getelementptr inbounds [25 x i32], ptr %10, i64 0, i64 %151
  %153 = load i32, ptr %152, align 4
  %154 = and i32 %153, 3840
  %155 = ashr i32 %154, 16
  %156 = sub nsw i32 %148, %155
  store i32 %156, ptr %18, align 4
  %157 = load i32, ptr %18, align 4
  %158 = icmp sgt i32 %157, 0
  br i1 %158, label %159, label %164

159:                                              ; preds = %136
  %160 = load i32, ptr %18, align 4
  %161 = sext i32 %160 to i64
  %162 = load i64, ptr %17, align 8
  %163 = add nsw i64 %162, %161
  store i64 %163, ptr %17, align 8
  br label %169

164:                                              ; preds = %136
  %165 = load i32, ptr %18, align 4
  %166 = sext i32 %165 to i64
  %167 = load i64, ptr %17, align 8
  %168 = sub nsw i64 %167, %166
  store i64 %168, ptr %17, align 8
  br label %169

169:                                              ; preds = %164, %159
  br label %170

170:                                              ; preds = %169
  %171 = load i64, ptr %20, align 8
  %172 = add nsw i64 %171, 1
  store i64 %172, ptr %20, align 8
  br label %69, !llvm.loop !8

173:                                              ; preds = %69
  br label %174

174:                                              ; preds = %173
  %175 = load i64, ptr %19, align 8
  %176 = add nsw i64 %175, 1
  store i64 %176, ptr %19, align 8
  br label %65, !llvm.loop !9

177:                                              ; preds = %65
  %178 = load i64, ptr %17, align 8
  %179 = load i64, ptr %12, align 8
  %180 = icmp slt i64 %178, %179
  br i1 %180, label %181, label %184

181:                                              ; preds = %177
  %182 = load i64, ptr %15, align 8
  store i64 %182, ptr %11, align 8
  %183 = load i64, ptr %17, align 8
  store i64 %183, ptr %12, align 8
  br label %184

184:                                              ; preds = %181, %177
  br label %185

185:                                              ; preds = %184
  %186 = load i64, ptr %15, align 8
  %187 = add nsw i64 %186, 1
  store i64 %187, ptr %15, align 8
  br label %61, !llvm.loop !10

188:                                              ; preds = %61
  br label %189

189:                                              ; preds = %188
  %190 = load i64, ptr %15, align 8
  %191 = add nsw i64 %190, 1
  store i64 %191, ptr %15, align 8
  br label %57, !llvm.loop !11

192:                                              ; preds = %57
  ret i32 0
}

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="duotronic" }
attributes #1 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 20.1.0 (git@github.com:fprime-bpf/llvm-project.git 755f040f24df9a74f4e5f7f7bdd64e3acd4e61b9)"}
!3 = !{i64 2147503012}
!4 = !{i64 2147503524}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = distinct !{!7, !6}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !6}
!10 = distinct !{!10, !6}
!11 = distinct !{!11, !6}
