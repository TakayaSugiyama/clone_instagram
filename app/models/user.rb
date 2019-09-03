class User < ApplicationRecord
  before_save {self.email.downcase! }
  mount_uploader :image, ImageUploader
  validates :name, presence: true, length: {in: 3..10}
  validates :email, presence: true,format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },uniqueness: true
  validates :password, presence: true, length: {minimum: 6}, on: :create
  validates :image, presence: true
  has_many :photos
  has_secure_password
end
