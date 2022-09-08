#!/usr/bin/env cwl-runner
# Generated from: uniq sortresult.txt > uniqresult.txt
class: CommandLineTool
cwlVersion: v1.0
baseCommand: uniq
arguments:
  - $(inputs.sortresult_txt)
inputs:
  - id: sortresult_txt
    type: File
outputs:
  - id: out
    type: stdout
stdout: uniqresult.txt
