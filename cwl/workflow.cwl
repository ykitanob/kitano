#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

inputs:
  - id: filename
    type: string
  - id: script1
    type: File
  - id: script2
    type: File
  - id: script3
    type: File

outputs:    
  - id: output
    type: Directory #この型は、最後のステップの出力と揃える
    outputSource: run_matome/fin_out #run_matomeの出力がworkflowの出力になる

steps: 
    touch :
        run: run_0touch.cwl
        in: 
            filename: filename #左a1.cwlのパラメータ、右このcwl内の
        out: [outputtest] #複数の時はカンマ区切りで記載する

    run_1QC :
        run: run_1QC.cwl
        in:
            bam: touch/outputtest #touchステップのoutputtestを指定する
            script: script1
        out: [output] #QC.cwlのout 複数の時はカンマ区切りでかく
    run_2subproc :
        run: run_2subproc.cwl
        in:
            bam: touch/outputtest #touchステップのoutputtestを指定する
            script: script2
        out: [output_sub1] #subproc.cwlのout 複数の時はカンマ区切りでかく

    run_matome :
        run: run_matome.cwl
        in:
            script: script3
            BAM: touch/outputtest
            QC: run_1QC/output #touchステップのoutputtestを指定する
            subproc: run_2subproc/output_sub1
        out: [fin_out] #subproc.cwlのout 複数の時はカンマ区切りでかく