#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

inputs:
  - id: filename
    type: string
  - id: script2
    type: File
  - id: script3
    type: File
  - id: script4
    type: File

outputs:    
  - id: output
    type: Directory #この型は、最後のステップの出力と揃える
    outputSource: run_matome/fin_out #run_matomeの出力がworkflowの出力になる

steps: 
    touch :
        run: run_1touch.cwl
        in: 
            filename: filename #左a1.cwlのパラメータ、右このcwl内の
        out: [outputtest] #複数の時はカンマ区切りで記載する

    run_2QC :
        run: run_2QC.cwl
        in:
            bam: touch/outputtest #touchステップのoutputtestを指定する
            script: script2
        out: [output] #QC.cwlのout 複数の時はカンマ区切りでかく
    run_3subproc :
        run: run_3subproc.cwl
        in:
            bam: touch/outputtest #touchステップのoutputtestを指定する
            script: script3
        out: [output_sub1] #subproc.cwlのout 複数の時はカンマ区切りでかく

    run_matome :
        run: run_matome.cwl
        in:
            script: script4
            BAM: touch/outputtest
            QC: run_2QC/output #touchステップのoutputtestを指定する
            subproc: run_3subproc/output_sub1
        out: [fin_out] #subproc.cwlのout 複数の時はカンマ区切りでかく