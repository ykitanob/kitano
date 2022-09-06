#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

inputs:
  - id: aaa_txt
    type: string
  - id: script
    type: File

outputs:    
  - id: output
    type: Directory
    outputSource: run_QC/output
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

        out: [output] #QC.cwlのout