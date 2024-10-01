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


## items

|Column|Type|Options|
|------|----|-------|
id|integer|null: false, primary key
user_id|integer|null: false, foreign_key: true
image|text|null: false
name|string|null: false
text|text|null: false
category|string|null: false
condition|string|null: false
shipping_fee|boolean|null: false
area|string|null: false
days|string|null: false
price|integer|null: false
status|boolean|null: false
created_at|datetime|null: false
updated_at|datetime|null: false

### Association
belongs_to user
has_one purchaser



## users

|Column|Type|Options|
|------|----|-------|
id|integer|null: false, primary key
nickname|string|null: false
email|string|null: false
password|string|null: false
password_confirmation|string|null: false
family_name_kanji|string|null: false
first_name_kanji|string|null: false
family_name_katakana|string|null: false
first_name_katakana|string|null: false
birth_year|integer|null: false
birth_month|integer|null: false
birth_day|integer|null: false
created_at|datetime|null: false
updated_at|datetime|null: false

### Association
has_many items
has_many purchasers



## purchasers

|Column|Type|Options|
|------|----|-------|
id|integer|null: false, primary key
user_id|integer|null: false, foreign_key: true
item_id|integer|null: false, foreign_key: true
postal_code|string|null: false
prefecture|string|null: false
city|string|null: false
address_line1|string|null: false
address_line2|string|
phone_number|string|null: false
created_at|datetime|null: false
updated_at|datetime|null: false

### Association
belongs_to item
belongs_to user


