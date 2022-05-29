#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh 
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

# ## 1. Reactクライアントのセットアップ

# このチュートリアルでは以下の画像のように、Reactクライアントと、さらに1つのターミナルを立ち上げます。

# ![アートボード 3.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/577bc67d-b285-7a05-a15f-3bd8e190bcb0.png)

# まずはReactクライアントをセットアップしていきましょう。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/84ffe06.patch # npx create-react-app app --template typescript
git apply patches/609f00f.patch # npx prettier --write .
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd app
npm install
npm run start
# ```

# :white_check_mark: Result: http://localhost:3000/ で以下のように表示されればOKです

# ![2022-05-06_20h00_38.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/42c1d114-7b6b-2b4c-6116-3714b36b8e03.png)

# **このプロセスは立ち上げたままにしてください。**

# Reactロゴが大きく表示されているこの画面から、画面の表示をシンプルなものに差し替えましょう。

# :large_orange_diamond: Action: 新しいターミナルを開いてください。

# ![アートボード 2.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/1f714def-aafd-9c7d-cea6-319c3c2bf966.png)

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/ae8cf03.patch # empty application
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![2022-05-06_21h29_54.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/ff80a767-9298-5fa0-c66a-f02ad9efe2a7.png)

# 上記の変更により、これ以降行うソースコード変更がわかりやすくなります。
