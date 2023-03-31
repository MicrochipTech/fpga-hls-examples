; ModuleID = 'hls_output/.hls/part1.12.stdcompileopts.bc'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

; Function Attrs: noinline nounwind
define void @_Z12sobel_filterPA512_hS0_([512 x i8]* noalias nocapture readonly "legup_array_depth"="262144" "legup_decl"="unsigned char in[512][512]" %in, [512 x i8]* noalias nocapture "legup_array_depth"="262144" "legup_decl"="unsigned char out[512][512]" %out) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{[512 x i8]* %in}, i64 0, metadata !14), !dbg !66
  tail call void @llvm.dbg.value(metadata !{[512 x i8]* %out}, i64 0, metadata !15), !dbg !67
  br label %for.cond1.preheader, !dbg !68

for.cond1.preheader:                              ; preds = %for.inc57, %entry
  %i.038 = phi i32 [ 0, %entry ], [ %add20.2, %for.inc57 ]
  %i.0.off = add i32 %i.038, -1, !dbg !71
  %0 = icmp ugt i32 %i.0.off, 509, !dbg !71
  %or = zext i1 %0 to i32, !dbg !71
  %add20.2 = add nsw i32 %i.038, 1, !dbg !73
  br label %for.body3, !dbg !74

for.body3:                                        ; preds = %for.inc54, %for.cond1.preheader
  %j.036 = phi i32 [ 0, %for.cond1.preheader ], [ %inc55.pre-phi, %for.inc54 ]
  %cmp7 = icmp slt i32 %j.036, 1, !dbg !71
  %conv8 = zext i1 %cmp7 to i32, !dbg !71
  %or9 = or i32 %conv8, %or, !dbg !71
  %cmp10 = icmp sgt i32 %j.036, 510, !dbg !71
  %conv11 = zext i1 %cmp10 to i32, !dbg !71
  %or12 = or i32 %or9, %conv11, !dbg !71
  %tobool = icmp eq i32 %or12, 0, !dbg !71
  br i1 %tobool, label %for.cond14.preheader, label %if.then, !dbg !71

for.cond14.preheader:                             ; preds = %for.body3
  %add = add nsw i32 %j.036, -1, !dbg !73
  %arrayidx22 = getelementptr inbounds [512 x i8]* %in, i32 %i.0.off, i32 %add, !dbg !73
  %1 = load i8* %arrayidx22, align 1, !dbg !73, !tbaa !77
  %conv23 = zext i8 %1 to i32, !dbg !73
  %arrayidx22.1 = getelementptr inbounds [512 x i8]* %in, i32 %i.0.off, i32 %j.036, !dbg !73
  %2 = load i8* %arrayidx22.1, align 1, !dbg !73, !tbaa !77
  %conv23.1 = zext i8 %2 to i32, !dbg !73
  %add.2 = add nsw i32 %j.036, 1, !dbg !73
  %arrayidx22.2 = getelementptr inbounds [512 x i8]* %in, i32 %i.0.off, i32 %add.2, !dbg !73
  %3 = load i8* %arrayidx22.2, align 1, !dbg !73, !tbaa !77
  %conv23.2 = zext i8 %3 to i32, !dbg !73
  %arrayidx22.139 = getelementptr inbounds [512 x i8]* %in, i32 %i.038, i32 %add, !dbg !73
  %4 = load i8* %arrayidx22.139, align 1, !dbg !73, !tbaa !77
  %conv23.140 = zext i8 %4 to i32, !dbg !73
  %arrayidx22.2.1 = getelementptr inbounds [512 x i8]* %in, i32 %i.038, i32 %add.2, !dbg !73
  %5 = load i8* %arrayidx22.2.1, align 1, !dbg !73, !tbaa !77
  %conv23.2.1 = zext i8 %5 to i32, !dbg !73
  %arrayidx22.247 = getelementptr inbounds [512 x i8]* %in, i32 %add20.2, i32 %add, !dbg !73
  %6 = load i8* %arrayidx22.247, align 1, !dbg !73, !tbaa !77
  %conv23.248 = zext i8 %6 to i32, !dbg !73
  %arrayidx22.1.2 = getelementptr inbounds [512 x i8]* %in, i32 %add20.2, i32 %j.036, !dbg !73
  %7 = load i8* %arrayidx22.1.2, align 1, !dbg !73, !tbaa !77
  %conv23.1.2 = zext i8 %7 to i32, !dbg !73
  %arrayidx22.2.2 = getelementptr inbounds [512 x i8]* %in, i32 %add20.2, i32 %add.2, !dbg !73
  %8 = load i8* %arrayidx22.2.2, align 1, !dbg !73, !tbaa !77
  %conv23.2.2 = zext i8 %8 to i32, !dbg !73
  %tmp = sub i32 %conv23.2.1, %conv23.140
  %tmp1 = shl nsw i32 %tmp, 1
  %add28.143 = sub i32 %conv23.2, %conv23, !dbg !80
  %add28.2.1 = sub i32 %add28.143, %conv23.248, !dbg !80
  %add28.251 = add nsw i32 %add28.2.1, %conv23.2.2, !dbg !80
  %add28.2.2 = add nsw i32 %add28.251, %tmp1, !dbg !80
  %tmp3 = sub i32 %conv23.1, %conv23.1.2
  %tmp4 = shl nsw i32 %tmp3, 1
  %add34.2 = add nuw nsw i32 %conv23.2, %conv23, !dbg !81
  %add34.254 = sub i32 %add34.2, %conv23.248, !dbg !81
  %add34.1.2 = sub i32 %add34.254, %conv23.2.2, !dbg !81
  %add34.2.2 = add nsw i32 %add34.1.2, %tmp4, !dbg !81
  %cmp38 = icmp slt i32 %add28.2.2, 0, !dbg !82
  %sub = sub nsw i32 0, %add28.2.2, !dbg !83
  %cond = select i1 %cmp38, i32 %sub, i32 %add28.2.2, !dbg !82
  %cmp39 = icmp slt i32 %add34.2.2, 0, !dbg !85
  %sub41 = sub nsw i32 0, %add34.2.2, !dbg !86
  %cond44 = select i1 %cmp39, i32 %sub41, i32 %add34.2.2, !dbg !85
  %add45 = add nsw i32 %cond44, %cond, !dbg !88
  %cmp46 = icmp sgt i32 %add45, 255, !dbg !89
  %9 = trunc i32 %add45 to i8, !dbg !90
  %conv51 = select i1 %cmp46, i8 -1, i8 %9, !dbg !90
  br label %for.inc54, !dbg !91

if.then:                                          ; preds = %for.body3
  %inc55.pre = add nsw i32 %j.036, 1, !dbg !92
  br label %for.inc54, !dbg !93

for.inc54:                                        ; preds = %if.then, %for.cond14.preheader
  %conv51.sink = phi i8 [ 0, %if.then ], [ %conv51, %for.cond14.preheader ]
  %inc55.pre-phi = phi i32 [ %inc55.pre, %if.then ], [ %add.2, %for.cond14.preheader ], !dbg !92
  %10 = getelementptr inbounds [512 x i8]* %out, i32 %i.038, i32 %j.036, !dbg !95
  store i8 %conv51.sink, i8* %10, align 1, !dbg !95
  %exitcond = icmp eq i32 %inc55.pre-phi, 512, !dbg !74
  br i1 %exitcond, label %for.inc57, label %for.body3, !dbg !74

for.inc57:                                        ; preds = %for.inc54
  %exitcond55 = icmp eq i32 %add20.2, 512, !dbg !68
  br i1 %exitcond55, label %for.end59, label %for.cond1.preheader, !dbg !68

for.end59:                                        ; preds = %for.inc57
  ret void, !dbg !96
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { noinline nounwind "legup_ret"="void" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "top_level_function"="1" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!legup.userdefined = !{!58, !59, !60, !61}
!_Z12sobel_filterPA512_hS0_ = !{!62}
!llvm.module.flags = !{!63, !64}
!llvm.ident = !{!65}

!0 = metadata !{i32 786449, metadata !1, i32 4, metadata !"clang version 3.5.0 (tags/RELEASE_352/final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !45, metadata !2, metadata !"", i32 1} ; [ DW_TAG_compile_unit ] [/home/parisa/fpga-hls-examples/sobel_tutorial/part1/sobel.cpp] [DW_LANG_C_plus_plus]
!1 = metadata !{metadata !"sobel.cpp", metadata !"/home/parisa/fpga-hls-examples/sobel_tutorial/part1"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !33}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"sobel_filter", metadata !"sobel_filter", metadata !"_Z12sobel_filterPA512_hS0_", i32 9, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void ([512 x i8]*, [512 x i8]*)* @_Z12sobel_filterPA512_hS0_, null, null, metadata !13, i32 10} ; [ DW_TAG_subprogram ] [line 9] [def] [scope 10] [sobel_filter]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/parisa/fpga-hls-examples/sobel_tutorial/part1/sobel.cpp]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null, metadata !8, metadata !8}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 32, align 32, offset 0] [from ]
!9 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 4096, i64 8, i32 0, i32 0, metadata !10, metadata !11, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 4096, align 8, offset 0] [from unsigned char]
!10 = metadata !{i32 786468, null, null, metadata !"unsigned char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 786465, i64 0, i64 512}      ; [ DW_TAG_subrange_type ] [0, 511]
!13 = metadata !{metadata !14, metadata !15, metadata !16, metadata !19, metadata !22, metadata !24, metadata !25, metadata !27, metadata !30, metadata !32}
!14 = metadata !{i32 786689, metadata !4, metadata !"in", metadata !5, i32 16777225, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [in] [line 9]
!15 = metadata !{i32 786689, metadata !4, metadata !"out", metadata !5, i32 33554442, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [out] [line 10]
!16 = metadata !{i32 786688, metadata !17, metadata !"i", metadata !5, i32 17, metadata !18, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 17]
!17 = metadata !{i32 786443, metadata !1, metadata !4, i32 17, i32 5, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/parisa/fpga-hls-examples/sobel_tutorial/part1/sobel.cpp]
!18 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!19 = metadata !{i32 786688, metadata !20, metadata !"j", metadata !5, i32 18, metadata !18, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 18]
!20 = metadata !{i32 786443, metadata !1, metadata !21, i32 18, i32 9, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/parisa/fpga-hls-examples/sobel_tutorial/part1/sobel.cpp]
!21 = metadata !{i32 786443, metadata !1, metadata !17, i32 17, i32 38, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/parisa/fpga-hls-examples/sobel_tutorial/part1/sobel.cpp]
!22 = metadata !{i32 786688, metadata !23, metadata !"gx_sum", metadata !5, i32 26, metadata !18, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [gx_sum] [line 26]
!23 = metadata !{i32 786443, metadata !1, metadata !20, i32 18, i32 41, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/parisa/fpga-hls-examples/sobel_tutorial/part1/sobel.cpp]
!24 = metadata !{i32 786688, metadata !23, metadata !"gy_sum", metadata !5, i32 26, metadata !18, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [gy_sum] [line 26]
!25 = metadata !{i32 786688, metadata !26, metadata !"m", metadata !5, i32 27, metadata !18, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 27]
!26 = metadata !{i32 786443, metadata !1, metadata !23, i32 27, i32 13, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/parisa/fpga-hls-examples/sobel_tutorial/part1/sobel.cpp]
!27 = metadata !{i32 786688, metadata !28, metadata !"n", metadata !5, i32 28, metadata !18, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 28]
!28 = metadata !{i32 786443, metadata !1, metadata !29, i32 28, i32 17, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/parisa/fpga-hls-examples/sobel_tutorial/part1/sobel.cpp]
!29 = metadata !{i32 786443, metadata !1, metadata !26, i32 27, i32 43, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/parisa/fpga-hls-examples/sobel_tutorial/part1/sobel.cpp]
!30 = metadata !{i32 786688, metadata !31, metadata !"pixel", metadata !5, i32 29, metadata !18, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pixel] [line 29]
!31 = metadata !{i32 786443, metadata !1, metadata !28, i32 28, i32 47, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/parisa/fpga-hls-examples/sobel_tutorial/part1/sobel.cpp]
!32 = metadata !{i32 786688, metadata !23, metadata !"sum", metadata !5, i32 38, metadata !18, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sum] [line 38]
!33 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 46, metadata !34, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !36, i32 46} ; [ DW_TAG_subprogram ] [line 46] [def] [main]
!34 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !35, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!35 = metadata !{metadata !18}
!36 = metadata !{metadata !37, metadata !40, metadata !41, metadata !43}
!37 = metadata !{i32 786688, metadata !33, metadata !"sobel_output", metadata !5, i32 47, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sobel_output] [line 47]
!38 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 2097152, i64 8, i32 0, i32 0, metadata !10, metadata !39, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2097152, align 8, offset 0] [from unsigned char]
!39 = metadata !{metadata !12, metadata !12}
!40 = metadata !{i32 786688, metadata !33, metadata !"mismatch_count", metadata !5, i32 52, metadata !18, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mismatch_count] [line 52]
!41 = metadata !{i32 786688, metadata !42, metadata !"i", metadata !5, i32 53, metadata !18, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 53]
!42 = metadata !{i32 786443, metadata !1, metadata !33, i32 53, i32 5, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/parisa/fpga-hls-examples/sobel_tutorial/part1/sobel.cpp]
!43 = metadata !{i32 786688, metadata !44, metadata !"j", metadata !5, i32 54, metadata !18, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 54]
!44 = metadata !{i32 786443, metadata !1, metadata !42, i32 54, i32 9, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/parisa/fpga-hls-examples/sobel_tutorial/part1/sobel.cpp]
!45 = metadata !{metadata !46, metadata !49, metadata !52, metadata !57}
!46 = metadata !{i32 786484, i32 0, null, metadata !"elaine_512_input", metadata !"elaine_512_input", metadata !"", metadata !47, i32 2, metadata !38, i32 0, i32 1, null, null} ; [ DW_TAG_variable ] [elaine_512_input] [line 2] [def]
!47 = metadata !{i32 786473, metadata !48}        ; [ DW_TAG_file_type ] [/home/parisa/fpga-hls-examples/sobel_tutorial/part1/./input.h]
!48 = metadata !{metadata !"./input.h", metadata !"/home/parisa/fpga-hls-examples/sobel_tutorial/part1"}
!49 = metadata !{i32 786484, i32 0, null, metadata !"elaine_512_golden_output", metadata !"elaine_512_golden_output", metadata !"", metadata !50, i32 1, metadata !38, i32 0, i32 1, null, null} ; [ DW_TAG_variable ] [elaine_512_golden_output] [line 1] [def]
!50 = metadata !{i32 786473, metadata !51}        ; [ DW_TAG_file_type ] [/home/parisa/fpga-hls-examples/sobel_tutorial/part1/./output.h]
!51 = metadata !{metadata !"./output.h", metadata !"/home/parisa/fpga-hls-examples/sobel_tutorial/part1"}
!52 = metadata !{i32 786484, i32 0, metadata !4, metadata !"gx", metadata !"gx", metadata !"", metadata !5, i32 14, metadata !53, i32 1, i32 1, null, null} ; [ DW_TAG_variable ] [gx] [line 14] [local] [def]
!53 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 288, i64 32, i32 0, i32 0, metadata !54, metadata !55, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 288, align 32, offset 0] [from ]
!54 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !18} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!55 = metadata !{metadata !56, metadata !56}
!56 = metadata !{i32 786465, i64 0, i64 3}        ; [ DW_TAG_subrange_type ] [0, 2]
!57 = metadata !{i32 786484, i32 0, metadata !4, metadata !"gy", metadata !"gy", metadata !"", metadata !5, i32 15, metadata !53, i32 1, i32 1, null, null} ; [ DW_TAG_variable ] [gy] [line 15] [local] [def]
!58 = metadata !{metadata !"elaine_512_input"}
!59 = metadata !{metadata !"elaine_512_golden_output"}
!60 = metadata !{metadata !"_Z12sobel_filterPA512_hS0_"}
!61 = metadata !{metadata !"main"}
!62 = metadata !{metadata !"legup.function.top"}
!63 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!64 = metadata !{i32 2, metadata !"Debug Info Version", i32 1}
!65 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_352/final)"}
!66 = metadata !{i32 9, i32 33, metadata !4, null}
!67 = metadata !{i32 10, i32 33, metadata !4, null}
!68 = metadata !{i32 17, i32 10, metadata !69, null}
!69 = metadata !{i32 786443, metadata !1, metadata !70, i32 17, i32 10, i32 2, i32 33} ; [ DW_TAG_lexical_block ] [/home/parisa/fpga-hls-examples/sobel_tutorial/part1/sobel.cpp]
!70 = metadata !{i32 786443, metadata !1, metadata !17, i32 17, i32 10, i32 1, i32 14} ; [ DW_TAG_lexical_block ] [/home/parisa/fpga-hls-examples/sobel_tutorial/part1/sobel.cpp]
!71 = metadata !{i32 20, i32 17, metadata !72, null}
!72 = metadata !{i32 786443, metadata !1, metadata !23, i32 20, i32 17, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/parisa/fpga-hls-examples/sobel_tutorial/part1/sobel.cpp]
!73 = metadata !{i32 29, i32 21, metadata !31, null}
!74 = metadata !{i32 18, i32 14, metadata !75, null}
!75 = metadata !{i32 786443, metadata !1, metadata !76, i32 18, i32 14, i32 2, i32 32} ; [ DW_TAG_lexical_block ] [/home/parisa/fpga-hls-examples/sobel_tutorial/part1/sobel.cpp]
!76 = metadata !{i32 786443, metadata !1, metadata !20, i32 18, i32 14, i32 1, i32 15} ; [ DW_TAG_lexical_block ] [/home/parisa/fpga-hls-examples/sobel_tutorial/part1/sobel.cpp]
!77 = metadata !{metadata !78, metadata !78, i64 0}
!78 = metadata !{metadata !"omnipotent char", metadata !79, i64 0}
!79 = metadata !{metadata !"Simple C/C++ TBAA"}
!80 = metadata !{i32 30, i32 21, metadata !31, null}
!81 = metadata !{i32 31, i32 21, metadata !31, null}
!82 = metadata !{i32 35, i32 13, metadata !23, null}
!83 = metadata !{i32 35, i32 13, metadata !84, null}
!84 = metadata !{i32 786443, metadata !1, metadata !23, i32 35, i32 13, i32 1, i32 20} ; [ DW_TAG_lexical_block ] [/home/parisa/fpga-hls-examples/sobel_tutorial/part1/sobel.cpp]
!85 = metadata !{i32 36, i32 13, metadata !23, null}
!86 = metadata !{i32 36, i32 13, metadata !87, null}
!87 = metadata !{i32 786443, metadata !1, metadata !23, i32 36, i32 13, i32 1, i32 24} ; [ DW_TAG_lexical_block ] [/home/parisa/fpga-hls-examples/sobel_tutorial/part1/sobel.cpp]
!88 = metadata !{i32 38, i32 13, metadata !23, null}
!89 = metadata !{i32 39, i32 13, metadata !23, null}
!90 = metadata !{i32 41, i32 13, metadata !23, null}
!91 = metadata !{i32 42, i32 9, metadata !23, null}
!92 = metadata !{i32 18, i32 36, metadata !20, null}
!93 = metadata !{i32 22, i32 17, metadata !94, null}
!94 = metadata !{i32 786443, metadata !1, metadata !72, i32 20, i32 73, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/parisa/fpga-hls-examples/sobel_tutorial/part1/sobel.cpp]
!95 = metadata !{i32 21, i32 17, metadata !94, null}
!96 = metadata !{i32 44, i32 1, metadata !4, null}
