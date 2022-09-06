#!/usr/bin/env cwl-runner
# Generated from: sh run_QC.sh path/to/bam
class: CommandLineTool
cwlVersion: v1.0
baseCommand: sh
arguments:
  - $(inputs.run_QC_sh)
  - $(inputs.bam)
inputs:
  - id: run_QC_sh
    type: File
  - id: bam
    type: File
outputs:
  - id: all-for-debugging
    type:
      type: array
      items: [File, Directory]
    outputBinding:
      glob: "*"
  - id: output
    type: Directory
    outputBinding:
      glob: "$(inputs.bam.nameroot)" #あとで確認
