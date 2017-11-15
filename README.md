# python-docker

開発作業などでDocker内のpython環境を使う方法。

## 準備

`do`コマンドのパスにPATHを通す。  

pythonのスクリプト開発をするフォルダ上に、`env.inc`ファイルを作成し、以下の環境変数を定義する

```shell
# 環境として起動するDocker image名
export IMAGE=python:3.6
```

## コマンド

```shell
# Dockerの環境を起動
$ do up

# pythonを対話モードで起動
$ do py
$ do python

# スクリプトを実行
$ do py main.py

# シェル環境に入る
$ do sh
```

`do py`が通常のpythonコマンドの代わりに使います


