#!/usr/bin/env cwl-runner
# Generated from: sh run_QC.sh path/to/bam
class: CommandLineTool
cwlVersion: v1.0
baseCommand: sh
arguments:
  - $(inputs.script) #実行スクリプトを引数で渡す。
  - $(inputs.bam) #bamファイルを引数で渡す。
inputs:
  - id: script
    type: File
  - id: bam
    type: File
outputs:
  - id: all-for-debugging #開発中のデバッグのために全てのファイルを出力させる例として記載している
    type:
      type: array
      items: [File, Directory]
    outputBinding:
      glob: "*"
  - id: output 
    type: Directory #出力されるのはディレクトリ１つ、と定義している
    outputBinding:
      glob: "$(inputs.bam.nameroot)" #inputのファイル名の拡張子なしの文字列
