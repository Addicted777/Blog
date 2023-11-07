class Post < ApplicationRecord
    mount_uploader :image, ImageUploader

    belongs_to :user

    validates :title, presence: true, length:  {minimum: 5}
    validates :summary, presence: true, length:  {minimum: 5}
    validates :body, presence: true, length:  {minimum: 5}
end 
