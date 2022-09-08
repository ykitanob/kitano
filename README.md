# What is this?
This is a template to write CWL documents with VSCode with remote container extension.



[![Actions Status](https://github.com/ykitanob/kitano/workflows/CI/badge.svg)](https://github.com/ykitanob/kitano/actions) 

# CWL
# 実装作業~確認の流れ
## プロセスのCWLを作成する
run_2QC.cwl、run_subproc.cwlなどの、1処理分のCWLを作成します。


## プロセスを繋げるWorkflowを作成する
workflow.cwl を作成して先に作成しておいたプロセスのCWLの処理を繋げます。

## Workflowの処理を並列に実行できるように、scatterを利用する
scatter-workflow.cwl で workflow.cwlの処理を分散実行するように指定します。

## テスト
test.yamlを準備して`cwltest`が実行できるようにします。

## Github Actionsで確認
テストが作れていれば、Githubで自動で確認してくれます。

## CWL Viewで図を出力
https://view.commonwl.org/

# 今回の処理の流れ
今回はテストのため、空ファイルで処理

# プロセスのCWLを作成する
## (1) zatsu-cwl-generator
## (2) 
## (3) validate