class Photo < ApplicationRecord
  belongs_to :product

  validates :image, presence: true

  mount_uploader :image, ImageUploader
end
