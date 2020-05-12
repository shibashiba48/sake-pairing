# SAKE PAIRING(製作中)

## 概要
今夜の晩ごはんに合う日本酒を見つけることができるアプリです。
検索窓に料理名を入力し、その料理に合う日本酒を探すことができます。
この料理はこの日本酒と合うのに日本酒の登録が無い…という場合はユーザー登録を行い、ご自身で新規に日本酒を登録することもできます。

## 制作背景
近年、業界関係者の方々の努力により日本酒のイメージが払拭され、若い世代にも好んで飲まれつつある日本酒ですが、普段日本酒を飲まない方々にはまだまだ選び方が難しく思います。
「甘口辛口ってどういうこと？」「精米歩合って何？」「とりあえずお刺身があればOK？」等々お酒を選ぶ際のハードルが高くて手を出し辛いという声もよく聞きます。
そこで手軽に「このご飯に合う日本酒ってどんなものがあるのかな〜？」という悩みを解決するべく、かつ、新型コロナの影響により宅飲みを強いられている今だからこそ、こんなアプリがあったらいいなと思いこのアプリ開発に至りました。
私自身日本酒が大好きで、利酒師の資格を取得した程なのですがお酒好きの皆さんと一緒に作り上げていくようなアプリにしたいと思っています。


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|username|string|null: false|
### Association
- has_many :posts

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|type|string|null: false|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :posts_tags
- has_many :tags, through: :posts_tags

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|post_id|integer|null: false|
### Association
- has_many :posts_tags
- has_many  :posts, through: :posts_tags

## posts_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :tag
