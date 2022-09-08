#!/usr/bin/env cwl-runner
# Generated from: sort catresult.txt > sortresult.txt
class: CommandLineTool
cwlVersion: v1.0
baseCommand: sort
arguments:
  - $(inputs.catresult_txt)
inputs:
  - id: catresult_txt
    type: File
outputs:
  - id: out
    type: stdout
stdout: sortresult.txt
