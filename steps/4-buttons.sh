#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh 
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

# ## 4. カルーセルの動作を制御するボタン

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/b993591.patch # Add CarouselControll
# ```

# :white_check_mark: Result: `CarouselContainer` の更に外側に `CarouselControl` というコンポーネントを作成しました。

# ここからカルーセルをスライドさせるためのボタンを配置しますが、一気に実装してしまうとコードの差分が大きくなって、何がどう作用しているのか分かりづらくなってしまいます。そこでまずは、何も動作しないボタンを配置します。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/b9e208a.patch # add barebone buttons
# ```

# :white_check_mark: Result: 以下のように表示されればOKです。

# ![2022-05-23_00h36_21.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/8ddb9750-85ac-f6c7-47ed-bd8b28dbde7b.png)

# 小さくてわかりにくいですが、ボタンが画像の左下に配置されました。

# 次に、ボタンを使わずにカルーセルを動かす部分だけを実装します。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/5bf161a.patch # tranform: translate(-648px)
# ```

# :white_check_mark: Result: 以下のように表示されればOKです。

# ![2022-05-29_15h22_33.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/8373501a-73cc-6854-6288-428a9e99779a.png)

# 2番目の画像が表示されました。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/b7a0b3f.patch # tranform: translate(-1296px)
# ```

# :white_check_mark: Result: 以下のように表示されればOKです。

# ![2022-05-29_15h21_34.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/ca2bdb70-50a5-df29-a5e5-c5170b975899.png)

# 3番目の画像が表示されました。次にボタンによって、CarouselControl のstateを更新しましょう。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/e2174d8.patch # snap state
# ```

# いよいよ、ボタンによってカルーセルのスライドを実現します。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/6eeb010.patch # buttons to work
# ```

# :white_check_mark: Result: 以下のように表示されればOKです。

# <iframe width="640" height="360" src="https://www.youtube.com/embed/0W8s6XaCcgg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

# ボタンの動作を確認できたので、今度はその見た目を整えましょう。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/cc54e35.patch # centering buttons
git apply patches/4c476b6.patch # decorate buttons
# ```

# :white_check_mark: Result: 以下のように表示されればOKです。

# ![2022-05-24_00h17_11.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/7748a1dd-8a5a-33c6-fb0b-30afcc907e34.png)

# ソースコードの見た目を整えてみましょう。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/c22eebe.patch # buttons as a separate component
# ```

# `CarouselControl` の中に、`CarouselContainer` と `CarouselButtons` という粒度の揃ったコンポーネントが並びました。

# ```ts
# const CarouselControl = () => {
#   ...
#   return (
#     <div style={{ width: "648px" }}>
#       <CarouselContainer
#         ...
#       />
#       <CarouselButtons
#         ...
#       />
#     </div>
#   );
# };
# ```
