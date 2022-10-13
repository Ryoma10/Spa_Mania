class Bathhouse < ApplicationRecord
  has_many :reviews,              dependent: :destroy
  has_many :categories,           dependent: :destroy
  has_many :favourite_bathhouses, dependent: :destroy

  belongs_to :user
  belongs_to :prefecture

  has_one_attached :bathhouse_image
end
