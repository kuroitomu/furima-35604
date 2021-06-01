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

|     Column            |    Type    |    Options                 |
| --------------------  |  --------  |  ------------------------  |
| nickname              |   string   | null: false                |
| email                 |   string   | null: false, unique: true  |
| encrypted_password    |   string   | null: false                |
| family_name           |   string   | null: false                |
| first_name            |   string   | null: false                |
| middle_name           |   string   | null: false                |
| family_name_kana      |   string   | null: false                |
| first_name_kana       |   string   | null: false                |
| birthday              |   date     | null: false                |

ここに追記していく）


### Association
  has_many :items
  has_many :purchases

## items テーブル

|     Column             |    Type      |    Options                       |
| --------------------   | -----------  |  ------------------------------  |
| name                   |  text        | null: false                      |
| product_explanation    |  text        | null: false                      |
| category_id            |  integer     | null: false                      |
| product_status_id      |  integer     | null: false                      |
| Shipping_charges_id    |  integer     | null: false                      |
| Shipping_area_id       |  integer     | null: false                      |
| Shipping_time          |  integer     | null: false                      |
| price                  |  integer     | null: false                      |
| user                   |  references  | null: false, foreign_key: true   |

### Association
  belongs_to :user
  has_one    :purchase
  has_one    :address


### purchase テーブル

| Column  |    Type      |    Options                       |
| ------  | -----------  |  ------------------------------  |
| user    |	 references  | null: false, foreign_key: true   |
| item    |  references  | null: false, foreign_key: true   |

### Association
  belongs_to :user
  belongs_to :item


### address テーブル

|     Column             |    Type      |    Options                       |
| --------------------   | -----------  |  ------------------------------  |
| postal_code            |  integer     | null: false                      |
| prefectures            |  string      | null: false                      |
| city                   |  string      | null: false                      |
| house_number           |  string      | null: false                      |
| building_name          |  string      | null: false                      |
| phone_number           |  string      | null: false                      |
| items                  |  references  | null: false, foreign_key: true   |

### Association
  belongs_to :item



