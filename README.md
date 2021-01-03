## 機能のご紹介

### 主な機能
- 日用品の消耗期間管理アプリです。
- 消費予定日を知ることが可能です。
- 消費までの残り日数を表示させた事で、日用品の在庫切れを防ぐことが可能です。

### その他機能

- 日用品登録 / お気に入り品登録 / すぐ買いたい物登録 / 削除 / 編集 / 更新機能

- ユーザー登録 / ログイン / 編集機能

- RSpecによるテスト機能

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

## 実装予定の機能

- レスポンシブデザイン
- 非同期通信
- 複数ユーザーで管理品を共有する機能
- 各登録品一覧表示機能

# テーブル設計

## users テーブル

| Column             | Type        | Options                   |
| ------------------ | ----------- | ------------------------- |
| email              | string      | null: false               |
| encrypted_password | string      | null: false               |
| nickname           | string      | null: false               |

### Association

- has_many :expendables
- has_many :favorites
- has_many :wants

## expendables テーブル

| Column  | Type        | Options                          |
| ------- | ----------- | -------------------------------- |
| name    | string      | null: false                      |
| content | text        | null: false                      |
| period  | integer     | null; false                      |
| user    | references  | null: false,foreign_key: true    |

### Association

- belongs_to :user

## favorites テーブル

| Column  | Type        | Options                          |
| ------- | ----------- | -------------------------------- |
| name    | string      | null: false                      |
| content | text        | null: false                      |
| period  | integer     | null; false                      |
| user    | references  | null: false,foreign_key: true    |

### Association

- belongs_to :user

## wants テーブル

| Column  | Type        | Options                          |
| ------- | ----------- | -------------------------------- |
| name    | string      | null: false                      |
| content | text        | null: false                      |
| user    | references  | null: false,foreign_key: true    |

### Association

- belongs_to :user
