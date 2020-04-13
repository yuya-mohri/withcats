class Item < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  enum status: {not_on_sale: 0, on_sale: 10}
  
  validates :name, presence: true
  validates :price, presence: true
  validates :stock, presence: true
  validates :description, presence: true
  validates :status, presence: true
  
  mount_uploader :image, ImageUploader
end
