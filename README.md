suna
<img width="792" alt="スクリーンショット 2020-01-08 14.56.19.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/543133/5f3a1256-d59e-7718-139b-d034d16925a1.png">


## 1. usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|
|tel|string|null: false, unique: true|
|profile|text||
|image|text||

### Association
- has_many :products
- has_many :likes
- has_many :comments
- has_many :sns_credentials
- has_one :address
- has_one :card
- has_one :buyer
- has_one :seller

***

## 2. addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|postal_code|int|null: false|
|prefecture|int|enum, null: false|
|city|string|null: false|
|street|string|null: false|
|building|string|null: false|

### Association
- belongs_to :user

***

## 3. cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|number|int|null: false|
|expiration|date|null: false|
|security_code|int|null: false|

### Association
- belongs_to :user

***

## 4. producsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
|size|int|enum|
|condition|int|enum|
|name|string|null: false|
|description|text|null: false|
|shipping_charge|int|enum, null: false|
|shipping_method|int|enum, null: false|
|shipping_prefecture|int|enum, null: false|
|shipping_days|int|enum, null: false|
|price|int|null: false|
|progress|int|enum, null; false|

### Association
- belongs_to :user
- belongs_to :large_category
- belongs_to :middle_category
- belongs_to :small_category
- belongs_to :brand
- has_many :photos
- has_many :likes
- has_many :comments
- has_one :buyer
- has_one :seller

***

## 5. photosテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false, foreign_key: true|
|image|text|null: false|
### Association
- belongs_to :product

***

## 6. categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
### Association
- has_many :products
- has_many :brands_categories
- has_many :brands, through: :brands
- has_ancestry

***


## 7. brands_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|brand_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|

### Association
- belongs_to :category
- belongs_to :brand

***

## 8. brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products
- has_many :brands_categories
- has_many :categories, through: :brands_categories

***

## 9. buyersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
|evaluate|int|enum, null: false|
|comment|text|null: false|

### Association
- belongs_to :user
- belongs_to :product

***

## 10. sellersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
|evaluate|int|enum, null: false|
|comment|text|null: false|

### Association
- belongs_to :user
- belongs_to :product

***

## 11. likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product

***

## 12. commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
|content|text|null: false|

### Association
- belongs_to :user
- belongs_to :product

***

## 13. SNS認証テーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|provider|string||
|uid|string||

### Association
- belongs_to :user

***