# テーブル設計

## usersテーブル

| Column          | Type     | Options     |
| --------------- | -------  | ----------- |
| nickname        | string   | null: false |
| email           | string   | null: false |
| password        | string   | null: false |
| last_name       | string   |  null: false|
| first_name      | string   | null: false |
| last_name_kana  | string   | null: false |
| first_name_kana | string   | null: false |
| year            | integer  | null: false |
| month           | integer  | null: false |
| day             | integer  | null: false |

### Association

- has_many :items
- has_many :comments

## itemsテーブル

| Column        | Type           | Options                        |
| ------------- | ----------     | ------------------------------ |
| image         | Active Storageで実装                             |
| name          | string         | null: false                    |
| contents      | text           | null: false                    |
| category_id   | integer        | null: false                    |
| state_id      | integer        | null: false                    | 
| postage_id    | integer        | null: false                    |
| region_id     | integer        | null: false                    |
| shipping_date | integer        | null: false                    |
| price         | integer        | null: false                    |
| saler_id      | references     | null: false, foreign_key: true |
| buyer_id      | references     | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchase


## commentsテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| text     | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## purchasesテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item        | references | null: false, foreign_key: true |
| information | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :information

## informationsテーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| card_number   | integer | null: false |
| limit_month   | integer | null: false |
| limit_year    | integer | null: false |
| card_code     | integer | null: false | 
| postcode      | integer | null: false |
| prefecture_id | integer | null: false |
| city          | string  | null: false |
| block         | string  | null: false |
| building      | string  |             |
| phone_number  | integer | null: false |

### Association

- belongs_to :purchase