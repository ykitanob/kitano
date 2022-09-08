#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

requirements:
  ScatterFeatureRequirement: {} ##書いておけばscatterをサポートしているか確認してくれる
  SubworkflowFeatureRequirement: {}
inputs:
  - id: input_strings
    type: string[] #複数の文字列を渡す
  - id: script
    type: File
  - id: script2
    type: File
  - id: script3
    type: File

outputs:
  - id: output_directories
    type: Directory[] #インプットの文字列のDIRができる＃この型は呼び出しているWFのoutputと揃える
    outputSource: wf/output #wfのアウトプット
steps:
  - id: wf 
    run: workflow.cwl
    scatter: aaa_txt #分散実行したいパラメ―タ(id)
    in:
        script: script 
        script2: script2
        script3: script3
        aaa_txt: input_strings
    out: [output] #複数の結果が返ってくる