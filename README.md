# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| --------          | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| family_name       | string | null: false |
| first_name        | string | null: false |
| first_name_kana   | string | null: false |
| family_name_kana  | string | null: false |
| birthday          | date   | null: false |
| postal_code       | string | null: false |
| phone_number      | string | null: false |
| prefectures_id    | integer| null: false |
| city              | string | null: false |
| city_number       | string | null: false |
| building_name     | string |   |
| purchase_id       | integer|  null: false,foreign_key: true  |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column            | Type     | Options           |
| ------            | ------   | -----------       |
| price             | integer  | null: false       |
| text              | text     | null: false       |
| department_id     | integer  | null: false       |
| item_status_id    | integer  | null: false       |
| user_id           | integer  | not:null,foreign_key: true |
| exhibition_id     | integer  | not:null,foreign_key: true |

### Association
- belongs_to :user
- has_one_attached :image
- has_one :purchase
- belongs_to :exhibition

## image テーブル
| Column  | Type       | Options          |
| ------  | ---------- | ---------------- |
|  image  | text       |  null: false     |

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
|user_id      | integer  | null: false,foreign_key: true  |
|items_id     | integer  | null: false,foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item

## Exhibitionテーブル
| Column            | Type   | Options     |
| --------          | ------ | ----------- |
| company_name      | text   | null: false |
| email             | string | null: false |
| password          | string | null: false |
| company_name_hira | string | null: false |
| company_name_kana | string | null: false |
| postal_code       | string | null: false |
| phone_number      | string | null: false |
| prefectures_id    | integer| null: false |
| city              | string | null: false |
| city_number       | string | null: false |
| building_name     | string |   |

### Association
- has_many :items