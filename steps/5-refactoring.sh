#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh 
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

# ## 5. リファクタリング

# カルーセルの状態管理を以下のようなものから

# ```ts
# const imagePathList = ["/images/1.png", "/images/2.png", "/images/3.png"];
# const [snapped, setSnapped] = useState(imagePathList[0]);
# ```

# 以下のようなものに変えると、記述量は若干増えますが、画像ごとの `isSnapped` 状態が明確になって見通しが良くなります。

# ```ts
# [
#   const [images, setImages] = useState<ImageState[]>([
#     {
#       imagePath: "/images/1.png",
#       isSnapped: true,
#     },
#     {
#       imagePath: "/images/2.png",
#       isSnapped: false,
#     },
#     {
#       imagePath: "/images/3.png",
#       isSnapped: false,
#     },
#   ]);
# ```

# この方針でリファクタリングを行ってみましょう。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/eb1ce8e.patch # define imagestate
# ```

# 既存のコンポーネントを壊さないように、まだ利用していない `useState` を定義しました。ではこの新しい `useState` を実際にコンポーネントで利用してみましょう。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/78ff95e.patch # replace state with the new style
# ```

# :white_check_mark: Result: 以下のように表示されればOKです。

# <iframe width="640" height="360" src="https://www.youtube.com/embed/ganTFTuqgwc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
