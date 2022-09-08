#!/usr/bin/env cwl-runner
# Generated from: sh run_QC.sh path/to/bam
class: CommandLineTool
cwlVersion: v1.0
baseCommand: sh
arguments:
  - $(inputs.script)
  - $(inputs.bam)
inputs:
  - id: script
    type: File
  - id: bam
    type: File

outputs:
  - id: output_sub1
    type: 
      type: array
      items: [File, Directory]
    outputBinding:
      glob: "$(inputs.script.nameroot)"    #"$(inputs.bam.nameroot)/*" #あとで確認
