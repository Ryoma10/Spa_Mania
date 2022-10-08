class Review < ApplicationRecord
  has_many :comments,   dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :notices,    dependent: :destroy
  has_many :reports,    dependent: :destroy

  belongs_to :user
  belongs_to :bathhouse


  has_one_attached :image
end
