# テーブル設計

## usersテーブル

| Column          | Type     | Options     |
| --------------- | -------  | ----------- |
| email           | string   | null: false, unique: true |
| nickname        | string   | null: false |
| encrypted_password | string   | null: false |
| last_name       | string   | null: false |
| first_name      | string   | null: false |
| last_name_kana  | string   | null: false |
| first_name_kana | string   | null: false |
| birth_day       | date     | null: false |

### Association

- has_many :items
- has_many :purchases

## itemsテーブル

| Column        | Type           | Options                        |
| ------------- | ----------     | ------------------------------ |
| name          | string         | null: false                    |
| contents      | text           | null: false                    |
| category_id   | integer        | null: false                    |
| state_id      | integer        | null: false                    | 
| postage_id    | integer        | null: false                    |
| region_id     | integer        | null: false                    |
| shipping_date_id | integer        | null: false                    |
| price         | integer        | null: false                    |
| user          | references     | null: false, foreign_key: true |
### Association

- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :information

## informationsテーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postcode      | string  | null: false |
| prefecture_id | integer | null: false |
| city          | string  | null: false |
| block         | string  | null: false |
| building      | string  |             |
| phone_number  | string | null: false |
| purchase      | references | foreign_key: true |


### Association

- belongs_to :purchase