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

|     Column             |    Type    |    Options                 |
| ---------------------  |  --------  |  ------------------------  |
| nickname               |   string   | null: false                |
| email                  |   string   | null: false, unique: true  |
| encrypted_password     |   string   | null: false                |
| family_name_full_width |   string   | null: false                |
| first_name_full_width  |   string   | null: false                |
| family_name_kana       |   string   | null: false                |
| first_name_kana        |   string   | null: false                |
| birthday               |   date     | null: false                |

ここに追記していく）


### Association
  has_many :items
  has_many :purchases

## items テーブル

|     Column             |    Type      |    Options                       |
| --------------------   | -----------  |  ------------------------------  |
| name                   |  string      | null: false                      |
| product_explanation    |  text        | null: false                      |
| category_id            |  integer     | null: false                      |
| product_status_id      |  integer     | null: false                      |
| shipping_charges_id    |  integer     | null: false                      |
| prefectures_id         |  integer     | null: false                      |
| shipping_time_id       |  integer     | null: false                      |
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
  belongs_to :purchase
  has_one :address


### address テーブル

|     Column             |    Type      |    Options                       |
| --------------------   | -----------  |  ------------------------------  |
| postal_code            |  string      | null: false                      |
| prefectures_id         |  integer     | null: false                      |
| city                   |  string      | null: false                      |
| house_number           |  string      | null: false                      |
| building_name          |  string      |                                  |
| phone_number           |  string      | null: false                      |
| items                  |  reference  | null: false, foreign_key: true   |

### Association
 belongs_to :purchase


