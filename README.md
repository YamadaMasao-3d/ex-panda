## 機能のご紹介

### 主な機能
- 日用品の消耗期間管理アプリです。
- 消費予定日を知ることが可能です。
- 消費までの残り日数を表示させた事で、日用品の在庫切れを防ぐことが可能です。

### その他機能

- 日用品登録 / お気に入り品登録 / すぐ買いたい物登録 / 削除 / 編集 / 更新機能

- ユーザー登録 / ログイン / 編集機能

- RSpec/Rubocopによるテスト機能

- 登録商品表示画面

![トップページ](https://user-images.githubusercontent.com/73803047/103966119-91f16400-51a2-11eb-8e12-aa726007971e.gif)

- すぐ欲しい物登録画面

<img width="1438" alt="すぐ必要な物登録画面" src="https://user-images.githubusercontent.com/73803047/103896853-f2968780-5135-11eb-84d5-0e7843994f4b.png">

- お気に入り品登録機能

<img width="1438" alt="お気に入り品登録画面" src="https://user-images.githubusercontent.com/73803047/103897216-8bc59e00-5136-11eb-9e68-bb11b9c2ed42.png">

- 消耗品登録画面

<img width="1438" alt="消耗品登録画面" src="https://user-images.githubusercontent.com/73803047/103897377-cd564900-5136-11eb-8ca1-ceb4adb17acd.png">

## URL

- https://ex-panda.herokuapp.com/

## テスト用アカウント

- Email hogehoge@gmail.com
- Pass hogehoge1
- ユーザー名 admin
- パスワード 2222

## 利用方法

### すぐ欲しい物機能

- その日欲しい物を登録することで、購入忘れを防ぎます。

### お気に入り機能

- 消耗品の中で拘って使っている物や、繰り返し使用したい物を把握出来ます。

### 消耗品機能

- 日用品を登録することで、おおよその消費予定日を把握でき、重複した購入を避けたり、使い切りが近い消耗品を事前に購入することが出来ます。

## 目指した課題解決

- これから初めて一人暮らしを始める方が重複した物をうっかり購入してしまうことや、パートナーや家族と日用品の使用、購入を共有する方が、お互いの拘って使用している物を誤って購入したり、お願いした物を買い忘れたりすることを解決するためのアプリです。

## こだわった/実装に苦労した機能

- ### 消費までの予定日が少ない順で商品が表示されるようにしました
- ### 一度消耗期間を入力すれば、あとは更新ボタン一つで消耗予定日が再セットするようにしました
- ### トップページに自分の登録した商品のみ表示するようにしました

## 使用言語技術

### バックエンド

- Ruby 2.6.5

- Ruby on Rails 6.0.0

### 使用Gem

- devise

- pry-rails

- mini_magick

- image_processing

- date

- aws-sdk-s3

- rspec-rails

- factory_bot_rails

- faker

### フロント

- HTML

- CSS

- SCSS

### データベース

- MySQL

### テスト

- RSpec

- FactoryBot

- Faker

## 実装予定の機能

- レスポンシブデザイン
- 非同期通信
- 複数ユーザーで管理品を共有する機能
- 各登録品一覧表示機能



## テーブル設計

### users テーブル

| Column             | Type        | Options                   |
| ------------------ | ----------- | ------------------------- |
| email              | string      | null: false               |
| encrypted_password | string      | null: false               |
| nickname           | string      | null: false               |

### Association

- has_many :expendables
- has_many :favorites
- has_many :wants

### expendables テーブル

| Column  | Type        | Options                          |
| ------- | ----------- | -------------------------------- |
| name    | string      | null: false                      |
| content | text        | null: false                      |
| period  | integer     | null; false                      |
| user    | references  | null: false,foreign_key: true    |

### Association

- belongs_to :user

### favorites テーブル

| Column  | Type        | Options                          |
| ------- | ----------- | -------------------------------- |
| name    | string      | null: false                      |
| content | text        | null: false                      |
| period  | integer     | null; false                      |
| user    | references  | null: false,foreign_key: true    |

### Association

- belongs_to :user

### wants テーブル

| Column  | Type        | Options                          |
| ------- | ----------- | -------------------------------- |
| name    | string      | null: false                      |
| content | text        | null: false                      |
| user    | references  | null: false,foreign_key: true    |

### Association

- belongs_to :user
