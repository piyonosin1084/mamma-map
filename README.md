# 卒業制作

## ■サービス概要
子連れの方が行きやすいお店を検索するアプリです。
キッズメニューや低アレルゲンメニュー、
子供用椅子、座敷席の有無、お湯が貰える店など、ママパパに優しいお店を探せます。

現在地と条件検索を活用し、子連れでの外食をもっと快適で楽しいものに。

## ■ このサービスへの思い・作りたい理由
私自身、子供との外出時にお店選びで毎回苦労していました。

ミルクのお湯が貰えるか、ベビーカーで入店できるか、子供用椅子があるのかなど、
子連れに必要な情報を調べるために、
いくつものサイトを検索しなければならず、それが大きなストレスでした。

このような経験から、
「もっと簡単に必要な情報を探せる方法があれば」と
子連れのママパパが求める情報を、簡単に見つけられるサービスを作りたいと考えました。

子連れでの外食がもっと快適で楽しいものになる手助けができれば嬉しいです。

## ■ ユーザー層について
小さな子供を持つママ、パパ。子供連れの祖父母など。

子連れで外出する親御さんを主な対象にしました。

共働き家庭が増え、祖父母が子供を連れて外出する機会も多くなっているため
祖父母世代でも分かりやすい仕様にしたいと考えています。

## ■サービスの利用イメージ
アプリを開いて現在地から近い飲食店を検索します。

事前に調べる場合はエリアを選択します。
キッズメニューの有無や座敷、ベビーカー入店可否といった条件で絞り込むことができ、希望に合うお店を地図上で簡単に見つけられます。

他の利用者のコメントや評価も参考にすることで、お店選びの失敗を減らし、安心して外食を楽しめるようになります。

## ■ ユーザーの獲得について
子育て中のママ・パパが多く利用しているSNS（例: Instagram、Twitter、Facebook）でサービスをアピールします。

## ■ サービスの差別化ポイント・推しポイント
子連れの遊び場スポットを調べるアプリは存在しますが
飲食店に特化したものは現状存在していない認識です。

## ■ 機能候補
### MVPリリース時に作りたい機能
・店検索機能（位置情報は除く）
条件検索（例: キッズメニュー、座敷、ベビーカー可）を利用可能。

・ユーザー登録機能

・ユーザー認証（ログイン/サインアップ）を実装

・アプリ管理者が店舗情報を手動で登録できる機能。

・店舗名、住所、営業時間、電話番号などの基本情報を表示。
子連れに特化した情報（キッズメニューの有無、座敷、個室など）を一覧で表示。



### 本リリースまでに作りたい機能

・Google Maps APIを利用して、店舗の位置を地図上にマーカーで表示。
店舗登録機能（管理者用）

・ユーザーがログイン後、店舗に対してレビューを投稿できる機能。

・ユーザーがログイン後、気に入った店舗に「いいね」を付けられる機能。

・人気の店舗や条件に合った店舗をレコメンド表示。

・ユーザーが気になる店舗をお気に入りリストに保存し、後で確認できる機能。


## ■ 機能の実装方針予定
1. 条件付き店舗検索機能
2. ユーザー認証（ログイン/サインアップ）
3. レビュー・コメント機能
4. お気に入り機能
5. 地図表示機能
   Google Maps API（JavaScriptライブラリ）を使用して店舗位置を地図上に表示したい。


## 画面遷移図
Figma: [画面遷移図リンク](https://www.figma.com/design/BQKAu3ctg5KNssGfc54kTR/%E5%8D%92%E5%88%B6?node-id=3311-2&p=f&t=uuTD3tlL4LeN2OVu-0)
