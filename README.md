# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| item_name     | string  | null: false |
| description   | text    | null: false |
| category      | text    | null: false |
| state         | text    | null: false |
| postage       | string  | null: false |
| region        | string  | null: false |
| shipping_date | string  | null: false |
| price         | integer | null: false |
| seller_id     | integer | null: false |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| buyer_id   | integer    | null: false                    |
| item_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipment

## shipments テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| postalcode   | string | null: false |
| prefecture   | string | null: false |
| city         | string | null: false |
| block        | string | null: false |
| building     | string |             |
| phone_number | string | null: false |

### Association

- belongs_to :order