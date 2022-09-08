#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

inputs:
  - id: aaa_txt
    type: string
  - id: script
    type: File
  - id: script2
    type: File
  - id: script3
    type: File

outputs:    
  - id: output
    type: Directory #この型は、最後のステップの出力と揃える
    outputSource: run_matome/fin_out

steps: 
    touch :
        run: a1.cwl
        in: 
            aaa_txt: aaa_txt #左a1.cwlのパラメータ、右このcwl内の
        out: [outputtest] #複数の時はカンマ区切り

    run_QC :
        run: zatsu-QCsh.cwl
        in:
            bam: touch/outputtest #touchステップのoutputtestを指定する
            run_QC_sh: script
        out: [output] #QC.cwlのout 複数の時はカンマ区切りでかく
    run_subproc3 :
        run: run_subproc.cwl
        in:
            bam: touch/outputtest #touchステップのoutputtestを指定する
            script: script2
        out: [output_sub1] #subproc.cwlのout 複数の時はカンマ区切りでかく


    run_matome :
        run: run_matome.cwl
        in:
            script: script3
            BAM: touch/outputtest
            QC: run_QC/output #touchステップのoutputtestを指定する
            subproc: run_subproc3/output_sub1
        out: [fin_out] #subproc.cwlのout 複数の時はカンマ区切りでかく