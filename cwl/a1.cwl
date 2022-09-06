#!/usr/bin/env cwl-runner
# Generated from: touch aaa.txt
class: CommandLineTool
cwlVersion: v1.0
baseCommand: touch
arguments:
  - $(inputs.aaa_txt)
inputs:
  - id: aaa_txt
    type: string
outputs:
  - id: all-for-debugging
    type:
      type: array
      items: [File, Directory]
    outputBinding:
      glob: "*"

  - id: outputtest
    type: File
    outputBinding:
      glob: "$(inputs.aaa_txt)"
