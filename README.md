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
