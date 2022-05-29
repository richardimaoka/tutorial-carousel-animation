#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh 
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

# ## 6. 異なるスタイルのボタン

# ここまでは、スライドの番号が表示されるボタンを利用してきましたが、代わりに左右ボタンを配置してみましょう。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/e3916e9.patch # place prev next buttons
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![2022-05-26_00h35_35.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/94ed26fa-a591-34f9-d56e-35ff55418991.png)

# ボタンが配置されましたが、これだけではまだ動作しません。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/dc61691.patch # let the prev and next buttons work
# ```

# :white_check_mark: Result: 以下のように表示されればOKです。

# <iframe width="640" height="360" src="https://www.youtube.com/embed/pF-erRwHEc0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

