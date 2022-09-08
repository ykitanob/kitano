#!/usr/bin/env cwl-runner
# Generated from: touch aaa.txt　## zatsu-cwl-generatorでこのファイルを作成した
class: CommandLineTool
cwlVersion: v1.0
baseCommand: touch
arguments:
  - $(inputs.filename)
inputs:
  - id: filename  #今回はテストのため、拡張子が".bam"の適当な空ファイルを作成して処理が進むようにしている。ファイル名の文字列だけを渡すように設定した。
    type: string #文字列を渡すと定義している
outputs:
  - id: all-for-debugging
    type:
      type: array
      items: [File, Directory]
    outputBinding:
      glob: "*"
  - id: outputtest
    type: File #出力されるのはファイルだと定義している
    outputBinding:
      glob: "$(inputs.filename)"
