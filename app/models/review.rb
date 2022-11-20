class Review < ApplicationRecord
  has_many :comments,   dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :notices,    dependent: :destroy
  has_many :reports,    dependent: :destroy
  has_many :congestion, dependent: :destroy

  belongs_to :user
  belongs_to :bathhouse

  attribute :bath_congestion_attributes
  attribute :rest_area_congestion_attributes


  has_one_attached :image
end
