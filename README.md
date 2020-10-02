
見やすくするため一部画面サイズ調整して載せます ６７％と33%

## TOPページ
![9b7782e449fad91104780ec4d239b25b](https://user-images.githubusercontent.com/68621609/94906012-bf11e480-04d8-11eb-9e7f-7eb6a899b636.gif)

## TOPページMAP(ユーザーが登録した住所から)
<img width="1251" alt="b4f68a219af1afa4a69948a337008724-2" src="https://user-images.githubusercontent.com/68621609/94909427-1a92a100-04de-11eb-8081-f5daf5a9dcc9.png">

## TOP(商品一覧)ページ
![3ba7a9c0213d0080f8a024836bea2845](https://user-images.githubusercontent.com/68621609/94906784-0b115900-04da-11eb-8efe-3393e29d710d.jpg)

## 商品詳細(未ログイン,購入者ユーザーでログイン時の表示 || 出品者の場合の表示)
![635a1baaa1ebc079e4dfad196d5bda85](https://user-images.githubusercontent.com/68621609/94908253-5cbae300-04dc-11eb-8685-60054a18ba23.gif)
<img width="890" alt="3bed4dac783baaa642c85aeec7e77404" src="https://user-images.githubusercontent.com/68621609/94908566-d4890d80-04dc-11eb-8635-5090b60e4ef1.png">

## 購入画面(購入者ユーザーログイン時のみ可能)　　
<img width="596" alt="62774502d20a2b2f13e6689198f2ce69" src="https://user-images.githubusercontent.com/68621609/94909705-8aa12700-04de-11eb-83b1-7ab9c0baec65.png">

## 出品者(企業)の詳細ページ(この場合は出品者が登録した住所を表示)
![ddb3fdfa9d4a30fbddf1f8f7193f962f](https://user-images.githubusercontent.com/68621609/94910993-6e9e8500-04e0-11eb-9141-f7f228dc10a1.gif)
出品者(企業)がログインした場合のみ売価変更率表示
![d11a8bf7866aa3b9c752d2ff377f34a7](https://user-images.githubusercontent.com/68621609/94910846-3a2ac900-04e0-11eb-805c-a506b8103ef7.jpg)

## 出品者(企業)の新規ユーザー登録
<img width="720" alt="fd04bf9fa8876216e45cf26986c627b3" src="https://user-images.githubusercontent.com/68621609/94911892-cb4e6f80-04e1-11eb-9f62-e558841280de.png">

## 購入者の新規ユーザー登録
<img width="625" alt="4fa914d3ed7bea4c1ba2fc277bc7d2d9" src="https://user-images.githubusercontent.com/68621609/94912504-b9210100-04e2-11eb-9aa0-8ea90cff0558.png">

## 商品出品画面(出品者(企業)ログイン時のみ)
<img width="697" alt="d09c28b34bfb64a9b70a7cd4eeebe7a7" src="https://user-images.githubusercontent.com/68621609/94914066-4b2a0900-04e5-11eb-90e5-2879483481cd.png">



# テーブル設計

## customers テーブル

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
| customer_id       | integer  | not:null,foreign_key: true |
| exhibition_id     | integer  | not:null,foreign_key: true |

### Association
- belongs_to :customer
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
|customer_id  | integer  | null: false,foreign_key: true  |
|item_id     | integer  | null: false,foreign_key: true  |

### Association
- belongs_to :customer
- belongs_to :item
- has_one :detail


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


## details テーブル

| Column            | Type     | Options           |
| ------            | ------   | -----------       |
| detailday         | date     | null: false |
| purchase_id     | integer  | not:null,foreign_key: true |

### Association
- belongs_to :purchase
