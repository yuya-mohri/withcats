class Item < ApplicationRecord
  belongs_to :user
  enum status: {not_on_sale: 0, on_sale: 10}
  
  validates :name, presence: true
  validates :price, presence: true
  validates :stock, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :status, presence: true
  
  mount_uploader :image, ImageUploader
end
