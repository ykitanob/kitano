#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow

inputs:
    - id: input
      type: File

outputs:
    - id: out
      type: File
      outputSource: uniq/out

steps:
    - id: cat
      run: 1_cat.cwl
      in:
        input_txt: input
      out: [out]
    - id: sort
      run: 2_sort.cwl
      in:
        catresult_txt: cat/out
      out: [out]
    - id: uniq
      run: 3_uniq.cwl
      in:
        sortresult_txt: sort/out
      out: [out]
