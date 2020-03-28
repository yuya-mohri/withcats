class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
  validates :postcode, presence: true, length: { maximum: 8 }, format: { with: /\A\d{7}\z/ }
  validates :address, presence: true
  validates :tel, presence: true, length: {maximum: 11}, format: {with: /\A\d{10}$|^\d{11}\z/}
  
  has_secure_password
  
  has_many :items
end