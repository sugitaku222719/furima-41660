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
|user|references|null: false, foreign_key: true|
|name|string|null: false|
|content|text|null: false|
|category_id|integer|null: false|
|condition_id|integer|null: false|
|shipping_fee_id|integer|null: false|
|area_id|integer|null: false|
|period_id|integer|null: false|
|price|integer|null: false|

### Association
belongs_to :user
has_one :purchaser



## users

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|
|family_name_kanji|string|null: false|
|first_name_kanji|string|null: false|
|family_name_katakana|string|null: false|
|first_name_katakana|string|null: false|
|birthday|date|null: false|

### Association
has_many :items
has_many :histories



## purchasers

|Column|Type|Options|
|------|----|-------|
|history|references|null: false, foreign_key: true|
|postal_code|string|null: false|
|area_id|integer|null: false|
|city|string|null: false|
|address_line1|string|null: false|
|address_line2|string||
|phone_number|string|null: false|

### Association
belongs_to :history



## histories

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one :purchaser
