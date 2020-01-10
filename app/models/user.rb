class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :likes
  has_many :comments
  has_one :address
  has_one :card
  has_one :buyer
  has_one :seller

  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :birthdate, presence: true
  validates :nickname, :email, :tel, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 7 }

  mount_uploader :icon, ImageUploader
end
