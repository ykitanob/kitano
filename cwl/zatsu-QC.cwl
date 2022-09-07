#!/usr/bin/env cwl-runner
# Generated from: run_QC.sh path/to/bam
class: CommandLineTool
cwlVersion: v1.0
baseCommand: ./run_QC.sh
arguments:
  - $(inputs.bam)
inputs:
  - id: bam
    type: File
outputs:
  - id: all-for-debugging
    type:
      type: array
      items: [File, Directory]
    outputBinding:
      glob: "*" #デバッグのためTMPから全部の出力ファイルをOUTPUTに持ってくるようにする

  - id: output
    type: Directory
    outputBinding:
      glob: "$(inputs.bam.basename)" #あとで確認
