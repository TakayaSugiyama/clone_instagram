class User < ApplicationRecord
  before_save {self.email.downcase! }
  mount_uploader :image, ImageUploader
  validates :name, presence: true, length: {in: 3..10}
  validates :email, presence: true,format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },uniqueness: true
  validates :password, presence: true, length: {minimum: 6}, on: :create
  validates :image, presence: true
  has_many :photos
  has_secure_password
  has_many :favorites
  has_many :favorites_photos , through: :favorites, source: :photo

  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy 
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower 
end
