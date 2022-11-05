class Bathhouse < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :reviews,              dependent: :destroy
  has_many :genders,              dependent: :destroy
  has_many :favourite_bathhouses, dependent: :destroy


  belongs_to :user
  belongs_to :prefecture

  attribute :gender_man_attributes, type: Array
  attribute :gender_woman_attributes, type: Array
  attribute :gender_be_common_attributes, type: Array

  has_one_attached :bathhouse_image
end
