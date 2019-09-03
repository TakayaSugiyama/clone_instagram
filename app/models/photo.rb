class Photo < ApplicationRecord
  belongs_to :user
  validates :photo, presence: true 
  validates :description, presence: true, length: {maximum: 140}
  mount_uploader :photo, PhotoUploader
end
