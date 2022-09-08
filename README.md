# What is this?
This is a template to write CWL documents with VSCode with remote container extension.



[![Actions Status](https://github.com/ykitanob/kitano/workflows/CI/badge.svg)](https://github.com/ykitanob/kitano/actions) 

# CWL
# 実装作業~確認の流れ
## 前提
このリポジトリにあるのはBH22.9期間中に初心者が作成した検証作業の記録です。

## 環境構築
DockerとVScodeをインストールして実行環境を立ちあげます。  

（こちらを参照）https://qiita.com/tm_tn/items/3fafe22e2c4a92a7f597

# プロセスのCWLを作成する
## (1) zatsu-cwl-generator
- 雑CWLgeneratorでCWLのフォームのだいたいの形をつくる。

    ```
    zatsu-cwl-generator "run_QC.sh path/to/bam" > cwl/zatsu-QC.cwl
    ```

- ざつなので、一部手直しが必要。（`cwl/zatsu-QC.cwl`ファイルのコメントに修正点を記載した。そのほかは入力規約を確認して修正する必要があるhttps://www.commonwl.org/user_guide/index.html）

## (2) validate
- `cwltool --validate` で作成したCWLの記法が正しいかを確認する。
    ```
     cwltool --validate cwl/zatsu-QC.cwl 
    ```
- 間違いがある場合はメッセージに従って修正する。
- `.cwl is valid CWL.`というメッセージが表示されればOK

# プロセスどうしを繋げるWorkflowを作成する
Workflowは手書きで作成する必要がある。
`workflow.cwl`ファイルのコメントに注意点を記載した。
- validateをかけて確認しておく。

### ※今回の処理内容
- touchで空ファイル（テストのための仮の.BAMファイル）を作成する
- BAMファイルをインプットにした処理1を実行する
- BAMファイルをインプットにした処理2を実行する
- BAMファイル、処理１の結果、処理2の結果を1つのディレクトリにまとめて結果ファイルを出力する


# Workflowの処理を並列に実行できるように、scatterを利用する
- workflow.cwlの処理を分散実行するように`scatter-workflow.cwl`ファイルに 指定する。
- 引数が多くなるので、`job/scatterjob.yaml`に引数を記載しておく。

# テスト
test.yamlを準備して`cwltest`が実行できるようにする
```
cwltest --test test.yml 
```
"All tests passed"が表示されればOK　

## Github Actionsで確認
テストが作れていれば、Githubで自動で確認できるようになっているはず

## CWL Viewで図を出力
https://view.commonwl.org/ でGithubのCWLのURLを入力すると自動で作図できるはず

以上（仮）
