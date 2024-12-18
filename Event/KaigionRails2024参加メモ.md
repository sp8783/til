# Day1
## 現実のRuby/Railsアップグレード - @takeyuweb
- やったこと
  - RubyとRailsを一緒に管理する
  - もともとあった問題点も解決
    - テストを作る
    - エラーを通知する
    - 非推奨警告の発生を通知
- アップグレードの手順
  - RailsのバージョンごとにRubyの対応バージョン範囲がある
  - Rails→Rubyの順に、依存関係を潰しながら1つずつ段階的にアップグレードしていく
    - 基本的にRailsガイドで
    - アップグレード後、フレームワークのデフォルト設定に対応する
      - 新しいデフォルト設定がコメントアウトされてるので、それぞれコメントアウトを外してテストする
- アップグレード後に出てくるいろいろな問題
  - 保守されていないgem
    - 自分でforkして保守、代替gemを探す
    - （そもそも、gem選定が大事という話もある）
  - モンキーパッチしているRails
    - 使わない
  - Rubyの非互換な変更
    - 標準ライブラリgemの変更 → 新しいRubyを想定したgemにアップグレード
  - Railsの非互換な変更
    - Railsガイドを見る
    - わからなかったらgithub
- 良かったこと
  - 書き心地向上
  - セキュリティ修正
  - パフォーマンス向上
  - テストを書く文化が根付く
  - 業務領域に対する理解が深まる
  - ビジネス側との関係が円滑に
- アップグレードしていくために
  - gemの選び方
    - 自分が保守できるか
      - 保守できないなら、「継続性」「置き換え出来そうか」で判断
  - コードの書き方
    - 賢"そう"なコードを書かない
    - 依存関係を閉じ込める
  - リソースのコストにちゃんとアップグレード分も見積もっておく
  - エンジニアの説明責任があるので、リスクの説明をする

## Hotwire or React? 〜Reactの録画機能をHotwireに置き換えて得られた知見〜 - @HarunaTsujita
- 小規模なサービスにReactが必要なのか → Hotwireで実現できるのでは？
- Stimulusの技術検証を持って、使用技術（React, Hotwire）の判断をする
  - Stimulus: JSフレームワーク
  - Hotwire/Turbo
    - CRUD操作をJSを書かずに実装できる
- CRUD操作が主体を伴う。JSのし掛けがある（Web紙芝居）→ Hotwire
- そうじゃない → React
- 真ん中の場合は、「実装をCRUDに集約できるか（Hotwire）」という観点で考える

# Day2
## 都市伝説バスターズ「WebアプリのボトルネックはDBだから言語の性能は関係ない」 - @Daisuke Aritomo
- 65-70%がI/O（SQLの実行待ち）、残りの代替がCPUを使う計算処理（Rubyの処理）
  - New RelicやDatadogで見れるよ
  - だからSQLの実行時間を改善するのが大事
- RubyのWeb server（Puma etc）は↑を前提に設計されている

- ただ、言語の速度差はある
  - **RubyはC, Rust, Goの10倍遅い**
    - 竹内関数, 二分木...
- I/Oや外部APIの結果待ちにかかる時間は、言語の性能にほぼ依存しないので、webappはあんま関係ない
- 一方でISUCONはほとんどGO...
- Goと比較してみた
  - io-only：GoとRubyはほぼ同じ性能特性
  - cpu-only：Goが圧倒的
  - realistic(30%cpu, 70%io)：差が縮まった
- RubyとGoの並列特性は全く異なる
  - Rubyでは同時にCPUは1スレッドしか使えない
  - Goは並列して使える
- また、スケーラビリティにも差が出る
  - Go 1スレッド= Ruby 3スレッド
- Rubyの性能を上げるには、立てるスレッド数をチューニングすれば良さそう
  - 実際、Pumaスレッド数のデフォルトが5→3に変更された
    - 100%/30%みたいな
  - **スレッドが多すぎると、CPUの待ち時間(GVL待ち時間)が発生しやすいので良くない**
- こういうことをすれば良さそう
  - CPUを減らす
    - 下はよく使う
    - JSON.parse
    - mysql2
    - Rack::Session
- RubyのランタイムでGoのようなサーバーモデルは必ずしも用意に実装できない
- **M:N Threads**という、Ruby3.3からGoに近しいスレッドモデルが出たよ

## ActiveRecordSQLインジェクションクイズ(Rails 7.1.3.4) - @kozy4324
- classsi所属
- 対策
  - プレースホルダで実装する
    - 静的プレースホルダ
    - 動的プレースホルダ
  - APIを用いて文字列連結
  - Railsは↑の3つを使い分けてる
- クイズ！
  - find_by: OK
  - where: SQLフラグメントはそのままSQL分へ組み込まれる
    - SQL分のリテラルと1対1　OK
    - 一指定ハンドラor名前付きハンドラを指定してないものはNG
  - order: リテラルと1対1に対応しない場合だが、エラーが出るようになっているのでOK
  - exists?: 引数を受け取るバリエーションが複数ある
- 教訓
  - SQLフラグメントを受け取るメソッドを一定把握する必要がある
  - **クエリメソッドへ外部入力を雑に渡すな！**
- ActiveRecordsのエスケープ処理
  - 内部ではquoteメソッドが呼ばれる
  - APIの対策になってる！
- Brekeman
  - Railsのセキュリティツール
    - 7.2のデフォルト
  - 脆弱性について静的解析してくれる
    - 実際に上のクイズやったら満点！
  - ソースコード→AST→パターンチェック
  - ただ、偽陽性が多い
    - 特定のwarningは無視するように設定できる

## 推し活のハイトラフィックに立ち向かうRailsとアーキテクチャ - @hayato OKUMOTO
- https://speakerdeck.com/falcon8823/tui-sihuo-no-haitorahuitukunili-tixiang-kau-railstoakitekutiya-kaigi-on-rails-2024
- TwoGate社
  - Caravan - イベント物販に特化したアプリ 220万DL,100万ユーザ
    - マルチテナント
    - OME型
    - 内製向けローコード化
    - 負荷対策に強い
      - CDN 50000RPS
      - ALB/Rails 8000RPS
      - 決済エンドポイント 400RPS（max 600）
- 推し活×ハイトラフィック
- ハイトラフィックに挑む設計
  - スロークエリを起こさないように実装
  - CDNでのキャッシュを活用する
  - アプリケーションキャッシュ(Redis)の活用
- 起きる問題
  - DBレイヤーでのボトルネックから始まる
  - 外部APIのレートリミットに引っかかる
  - ピーク性能を出すパラメータチューニングが必要
  - ALBのスケーリングが間に合わずエラーが発生する
- 対処
  - Performance Insight / APMによる分析
  - アプリケーションログの分析
  - 実行計画の解析
    - ChatGPTに投げると便利
- この発表で扱うプロダクトの機能
  - 先着販売
    - ユーザが一同にアクセスし、在庫の奪い合いに
- ライブエンタメでの販売の難しさ
  - 在庫をきれいに売りたい
  - ピークトラフィックでサーバっダウンできない
  - レスポンスタイムの悪化はユーザの不満になる
- 在庫確保とパフォ－マンス
  - 同時の購入者がいると在庫を超過するケースがある
  - 安全な実装としては行ロックを使うが、ロックの奪い合いで、デッドロックが頻発する
  - それを回避するためには、同じデータを同時に書き換えないような構造に変える
  - **在庫テーブルの設計を1行1在庫のテーブルに変える**
    - 順番に排出できれば回避できる
    - テーブルは肥大化するけど、販売が終わったら消せば良い
  - **FOR UPDATE SKIP LOCKEDを使う**
    - 行ロックされている行をスキップ
  - LIMITで注文数を定義。行が足りない分は在庫不足扱い
  - 競合することがなくなり、これで実測で数百TPSでの処理が可能に！
    - 200万在庫のテーブルをさばけた！
- 決済
  - 前提
    - クレジットカード決済は外部のペイメントプロバイダを使用
    - APIレートリミットは20-30rps程度
      - そもそも400rps近くの緩和は厳しい
  - 決済プロバイダのレートを上げることができない。。
    - 非同期？
  - 結局、諦めた
    - **限界に対して正しく向き合うことは大事**
  - 決済システムの限界よりもリクエストを受け付けないようにする
    - これ以上裁けないのに処理を発行しない
  - レートリミットを導入
    - Redisで自作
## 入門『状態』 - @しんくう
- オブジェクトと状態
  - オブジェクトの状態はインスタンス変数で表現できる
    - 電球を例にするなら、@is_on、@brightness
- 状態を扱う上で辛くなるポイントと対策
  - 表現される幅が増えるとつらさが露見する
    - 変化（再代入）を繰り返すと追いづらくなる（最終的な状態が分かりづらい）
    - 変化の幅が多いと考慮点が増える
- 辛さを抑えるには
  - 状態を可能な限り変化させない
    - 再代入をさせない！変更する箇所を1箇所に
  - 状態の変化幅を限定的にする
    - 変更するメソッドを用意して抑制する
  - 状態をなるべくシンプルに保つ
    - 最終的な状態数を基準に、状態の読み取りを考える
      - 明るさ％ → 明度（明るい、暗い）みたいな感じ
- Railsでの状態のいなし方
  - controllerでのインスタンス変数の再代入は、変更するメソッドを用意して防ぐ
  - view内でインスタンス変数を利用した分岐は、modelで状態を判定するメソッドを用意にしてviewに埋め込む
  - 用途が迷子になったControllerインスタンス変数は減らす

## Hotwire光の道とStimulus - @nay3
- 万葉の社長
- Hotwore光の道 - 良い開発指針
  - 光の道じゃないと、色々めんどくさい
- 光の道へ
  - サーバサイド
    - サーバをコンポーネント風に扱うのは良くない！
      - JSで書くことが増える
      - メンテもし辛い
    - なので、Web紙芝居（すべての画面遷移を考える）
    - 制御をサーバに集める（画面しか知らないことを作らない）
  - あ
    - 画面ごとにStimulusコードを作らない方が良い
      - 画面ごとに作られたJSコード同士の共通点をあとから抽出し構造化するのは難しい
        - 独特の複雑な処理がある画面は例外
    - Stimulusで何をやりたいかを考えるべき
      - Stimulusはそもそも何を担当すべきか
        - Rails+Turboで実現できるものは避ける
        - HotwireとReactが同じレイヤーを担当しているわけではない
          - 画面変更について、Reactで担当している部分をHotwireとRailsで賄っている
        - 作りたいものはなにか
  - Stimulusが担当スべきこと
    - HTMLブラウザの拡張
    - サーバの処理を待つ準備
    - サーバによらない画面変更
    - 描画の拡張
- ※難しいので以下省略！！
- まとめ
  - 目的を意識して、なるべく汎用的に作る
  - 個別の画面要素と疎結合にする
  - 注意点：Stimulusの設計は全体設計の一部。

## Importmapを使ったJavaScriptの読み込みとブラウザアドオンの影響 - @shu_numata
- https://speakerdeck.com/swamp09/importmapwoshi-tutajavascriptno-du-miip-mitoburauzaadoonnoying-xiang?slide=67
- esm社
- Rails7にバージョンアップにより、webpackが終了
- importmap-railsで代替！
- なぜ、rails7のデフォルトにならなかったの？
  - Babelでのトランスパイル不要になった
  - http2が当たり前に使われるようになった（1つのJSファイルにまとっめなくていい）

## Tuning GraphQL on Rails - @pyama86
- ↓ここから眠すぎてメモ取れず・・・
- https://speakerdeck.com/pyama86/tuning-graphql-on-rails
- GMOペパボ社　シニア
- minne

## 30万人が利用するチャットをFirebase Realtime DatabaseからActionCableへ移行する方法 - @Ryosuke Uchida
- pato 
- ボトルネック
  - リージョンがus-central
  - 1000リクエスト/秒という制約が存在

## omakaseしないためのrubocop.yml のつくりかた - @Shu Oogawara
- 個別のルール cop
- Rails7.2で標準に含まれるように
- ただ、ベストプラクティスはなし。
- 一応omakaseはあるが、よりよい設定を決める方法があるのでは？
- .rubocop.ymlを作る難しさ
  - 直接は売上を産まないから
    - 時間の確保が難しい
      - すでに定期MTGの中に時間を確保する
  - チームの文化を言語化・集約したものだから
    - ファシリテーションが難しい
      - 表明の幅は広く・採血ルールは細かく
- 作り方
  - 基本的に、デフォルトをベースに.rubocop_todo.ymlを減らしていく
- 成功の要因
  - オーナーシップ
    - 担当を自分に固定
      - 継続する
  - チーム文化の下支え
    - テストを当たり前に書く文化
    - 心理的安全性の高い文化

## Identifying User Identity - @moro
- ユーザーのアイデンティティとは
- ユーザーとは
  - 雑把に利用者とくくるのではなく、もっと詳細化して定義したい
    - 購入者、管理者、Rubyist...
  - 目的や利用方法hが異なる場合は別の存在として考えたい
  - identify死体単位がユーザー
    - その人のデータをつくれる
    - アクセス範囲
    - 他のユーザーから特定できる
- ログインからでなく、サービスを利用するシーンから作る
  - 一番クオリティを高めたいところから作ると、ユーザーの解像度が上がる
  - やればここから開発できるようになる
- idだけのテーブル：ユーザーが「いる」ことを表現している
- 個人情報を分ける
  - 個人情報取得の離脱を減らせる
    - すぐゲームできるみたいな
  - 秘匿性の高い情報のテーブルを分析環境から見えなくするとかできる
- 登録フローの最中はまだユーザーではないので、登録しようとしていることを表すUserRegistrationへ
  - 登録できたらUser以下一連のデータグラフを作成する
  - usersテーブルを検索するときに意識スべき状態が減る
  - credentials.emailなどにユニーク制約をかけられる
- 退会した場合も、いたことの事実は残す必要がある
  - 存在したというアイデンティティはなくならない
- ただ、個人情報は消すことができる
  - user_credentialsを消すことで、ログインも同時にできなくなる
- 管理スタッフとユーザーを分ける
  - 二社で利用目的が違うので、別のモデルに！
    - 別の実装とすることで複雑さを減らせる
      - 最初のコードは増えるけど、長期的には楽
- ユーザー状態をstatus列なしで表現できる
