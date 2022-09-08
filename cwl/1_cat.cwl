#!/usr/bin/env cwl-runner
# Generated from: cat input.txt > catresult.txt
class: CommandLineTool
cwlVersion: v1.0
baseCommand: cat
arguments:
  - $(inputs.input_txt)
inputs:
  - id: input_txt
    type: File
outputs:
  - id: out
    type: stdout
stdout: catresult.txt
