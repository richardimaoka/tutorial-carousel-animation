## 0. はじめに

React 上で、CSS の機能のみでカルーセルを作成するチュートリアルを用意しました。理解の前に「動かす感覚」を味わってもらうため、**ほぼ全てコピー&ペーストのみで**、素早く進められるチュートリアルになっています。

<iframe width="640" height="360" src="https://www.youtube.com/embed/ganTFTuqgwc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

このチュートリアルでは直に CSS を使って、カルーセルを実装するのに便利な CSS の機能を学んでもらいます。

もちろん、カルーセルは下記のような React の 3rd party コンポーネントライブラリを利用しても実装できます。

- [React Bootstrap](https://react-bootstrap.github.io/components/carousel/)
- [react-responsive-carousel](https://github.com/leandrowd/react-responsive-carousel)

ライブラリを利用するか、直に CSS を利用するかについては、どちらかが絶対的に優れた選択肢ということはないので、状況に応じて両方使えるようになっている方が良いでしょう。今回は後者のテクニックを覚えてみてください。

### 以前のチュートリアル

- [コピペで素早く学ぶ React カルーセル](https://qiita.com/RichardImaokaJP/items/0436b24c13c68a558651)

上記(前回)のチュートリアルでは、JavaScript の [ScrollIntoView](https://developer.mozilla.org/en-US/docs/Web/API/Element/scrollIntoView) を使ってカルーセルのスライド動作を実現しました。本チュートリアルでは、ScrollIntoView の代わりに、CSS の [transform](https://developer.mozilla.org/en-US/docs/Web/CSS/transform) でスライド動作を実現します。

### 事前準備

node と npm がインストール済みであることを確認して下さい。

### git レポジトリのクローン

:large_orange_diamond: Action: ターミナルで以下のコマンドを実行してください

```terminal
git clone https://github.com/richardimaoka/tutorial-carousel-transition.git
cd tutorial-carousel-transition
```


## 1. Reactクライアントのセットアップ

このチュートリアルでは以下の画像のように、Reactクライアントと、さらに1つのターミナルを立ち上げます。

![アートボード 3.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/577bc67d-b285-7a05-a15f-3bd8e190bcb0.png)

まずはReactクライアントをセットアップしていきましょう。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```shell
git apply patches/84ffe06.patch # npx create-react-app app --template typescript
git apply patches/609f00f.patch # npx prettier --write .
cd app
npm install
npm run start
```

:white_check_mark: Result: http://localhost:3000/ で以下のように表示されればOKです

![2022-05-06_20h00_38.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/42c1d114-7b6b-2b4c-6116-3714b36b8e03.png)

**このプロセスは立ち上げたままにしてください。**

Reactロゴが大きく表示されているこの画面から、画面の表示をシンプルなものに差し替えましょう。

:large_orange_diamond: Action: 新しいターミナルを開いてください。

![アートボード 2.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/1f714def-aafd-9c7d-cea6-319c3c2bf966.png)

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```shell
git apply patches/ae8cf03.patch # empty application
```

:white_check_mark: Result: 以下のように表示されればOKです

![2022-05-06_21h29_54.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/ff80a767-9298-5fa0-c66a-f02ad9efe2a7.png)

上記の変更により、これ以降行うソースコード変更がわかりやすくなります。


## 2. カルーセルのスライダーを作成

まずはカルーセルで使う画像を並べて表示します。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```shell
git apply patches/f6e9e58.patch # images added
```

:white_check_mark: Result: 以下のように表示されればOKです。この時点では縦に並んでいます。

![2022-05-23_00h09_48.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/9165278d-9c3e-9a73-c019-3fcf24ad4901.png)

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```shell
git apply patches/421815e.patch # display: auto
```

:white_check_mark: Result: 以下のように表示されればOKです

![2022-05-23_00h06_42.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/9509f6bf-decf-e2d8-3f6c-c0204bfd6dc1.png)

画面下にスライダーが表示されましたが、これはブラウザビューポートのスライダーであって、まだカルーセルのスライドではありません。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```shell
git apply patches/fdf0876.patch # overflow-x: auto
```

:white_check_mark: Result: 以下のように表示されればOKです。

<iframe width="640" height="360" src="https://www.youtube.com/embed/yREnYC_c7Ug" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

画像のすぐ下、つまりカルーセルの内部にスライダーが移動しました。




## 3. カルーセルのコンポーネント化

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```shell
git apply patches/905a2af.patch # CarouselItem component
```

:white_check_mark: Result: `<img>` を切り出して `CarouselItem` というコンポーネントを作成しました。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```shell
git apply patches/2b5eb26.patch # CarouselContainer component
```

:white_check_mark: Result: `CarouselItem` の外側にあたる `CarouselContainer` というコンポーネントが新規作成されました。



## 4. カルーセルの動作を制御するボタン

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```shell
git apply patches/b993591.patch # Add CarouselControll
```

:white_check_mark: Result: `CarouselContainer` の更に外側に `CarouselControl` というコンポーネントを作成しました。

ここからカルーセルをスライドさせるためのボタンを配置しますが、一気に実装してしまうとコードの差分が大きくなって、何がどう作用しているのか分かりづらくなってしまいます。そこでまずは、何も動作しないボタンを配置します。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```shell
git apply patches/b9e208a.patch # add barebone buttons
```

:white_check_mark: Result: 以下のように表示されればOKです。

![2022-05-23_00h36_21.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/8ddb9750-85ac-f6c7-47ed-bd8b28dbde7b.png)

小さくてわかりにくいですが、ボタンが画像の左下に配置されました。

次に、ボタンを使わずにカルーセルを動かす部分だけを実装します。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```shell
git apply patches/5bf161a.patch # tranform: translate(-648px)
```

:white_check_mark: Result: 以下のように表示されればOKです。

![2022-05-29_15h22_33.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/8373501a-73cc-6854-6288-428a9e99779a.png)

2番目の画像が表示されました。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```shell
git apply patches/b7a0b3f.patch # tranform: translate(-1296px)
```

:white_check_mark: Result: 以下のように表示されればOKです。

![2022-05-29_15h21_34.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/ca2bdb70-50a5-df29-a5e5-c5170b975899.png)

3番目の画像が表示されました。次にボタンによって、CarouselControl のstateを更新しましょう。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```shell
git apply patches/e2174d8.patch # snap state
```

いよいよ、ボタンによってカルーセルのスライドを実現します。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```shell
git apply patches/6eeb010.patch # buttons to work
```

:white_check_mark: Result: 以下のように表示されればOKです。

<iframe width="640" height="360" src="https://www.youtube.com/embed/0W8s6XaCcgg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

ボタンの動作を確認できたので、今度はその見た目を整えましょう。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```shell
git apply patches/cc54e35.patch # centering buttons
git apply patches/4c476b6.patch # decorate buttons
```

:white_check_mark: Result: 以下のように表示されればOKです。

![2022-05-24_00h17_11.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/7748a1dd-8a5a-33c6-fb0b-30afcc907e34.png)

ソースコードの見た目を整えてみましょう。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```shell
git apply patches/c22eebe.patch # buttons as a separate component
```

`CarouselControl` の中に、`CarouselContainer` と `CarouselButtons` という粒度の揃ったコンポーネントが並びました。

```ts
const CarouselControl = () => {
  ...
  return (
    <div style={{ width: "648px" }}>
      <CarouselContainer
        ...
      />
      <CarouselButtons
        ...
      />
    </div>
  );
};
```


## 5. リファクタリング

カルーセルの状態管理を以下のようなものから

```ts
const imagePathList = ["/images/1.png", "/images/2.png", "/images/3.png"];
const [snapped, setSnapped] = useState(imagePathList[0]);
```

以下のようなものに変えると、記述量は若干増えますが、画像ごとの `isSnapped` 状態が明確になって見通しが良くなります。

```ts
[
  const [images, setImages] = useState<ImageState[]>([
    {
      imagePath: "/images/1.png",
      isSnapped: true,
    },
    {
      imagePath: "/images/2.png",
      isSnapped: false,
    },
    {
      imagePath: "/images/3.png",
      isSnapped: false,
    },
  ]);
```

この方針でリファクタリングを行ってみましょう。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```shell
git apply patches/eb1ce8e.patch # define imagestate
```

既存のコンポーネントを壊さないように、まだ利用していない `useState` を定義しました。ではこの新しい `useState` を実際にコンポーネントで利用してみましょう。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```shell
git apply patches/78ff95e.patch # replace state with the new style
```

:white_check_mark: Result: 以下のように表示されればOKです。

<iframe width="640" height="360" src="https://www.youtube.com/embed/ganTFTuqgwc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


## 6. 異なるスタイルのボタン

ここまでは、スライドの番号が表示されるボタンを利用してきましたが、代わりに左右ボタンを配置してみましょう。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```shell
git apply patches/e3916e9.patch # place prev next buttons
```

:white_check_mark: Result: 以下のように表示されればOKです

![2022-05-26_00h35_35.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/94ed26fa-a591-34f9-d56e-35ff55418991.png)

ボタンが配置されましたが、これだけではまだ動作しません。

:large_orange_diamond: Action: 以下のコマンドを入力してください。

```shell
git apply patches/dc61691.patch # let the prev and next buttons work
```

:white_check_mark: Result: 以下のように表示されればOKです。

<iframe width="640" height="360" src="https://www.youtube.com/embed/pF-erRwHEc0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## 7. まとめ

以上 CSS の transform を使ってカルーセルを実装しました。CSS の transition を同時に指定することでスムーズなスライド動作を実現できましたし、duration の指定を変えることでスライド動作のスピードを変えられる点は、[前回のチュートリアルでの実装](https://qiita.com/RichardImaokaJP/items/0436b24c13c68a558651)にはなかった利点です。例えば、以下のように指定すれば、スライド動作は速くなります。

```diff
-transition: "all 0.3s linear",
+transition: "all 0.1s linear",
```

### 参考文献

- CSS-Only Carousel - CSS-TRICKS https://css-tricks.com/css-only-carousel/
- CSS overflow - Mozilla https://developer.mozilla.org/en-US/docs/Web/CSS/overflow
- CSS transform - https://developer.mozilla.org/en-US/docs/Web/CSS/transform
- CSS translate - https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function/translate
- CSS transition - https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Transitions/Using_CSS_transitions
- Create React App - https://create-react-app.dev/docs/adding-typescript/
