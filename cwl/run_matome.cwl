#!/usr/bin/env cwl-runner
# Generated from: sh run_QC.sh path/to/bam
class: CommandLineTool
cwlVersion: v1.0
baseCommand: sh
arguments:
  - $(inputs.script)
  - $(inputs.BAM)
  - $(inputs.QC)
  - $(inputs.subproc)

inputs:
  - id: script
    type: File
  - id: BAM
    type: File
  - id: QC
    type: Directory
  - id: subproc
    type:
      type: array
      items: [File, Directory]

outputs:
  - id: fin_out
    type: Directory
    outputBinding:
      glob: "*"    #"$(inputs.bam.nameroot)/*" #あとで確認
