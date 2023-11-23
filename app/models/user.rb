class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true
  validates :photo_url, presence: true, format: { with: /\Ahttps?:\/\/.*\z/, message: "must be a valid URL" }
  validates :bio, length: { maximum: 500 }
end