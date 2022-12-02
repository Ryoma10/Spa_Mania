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

  has_one_attached :bathhouse_image_main
  has_one_attached :bathhouse_image_sub1
  has_one_attached :bathhouse_image_sub2
  has_one_attached :bathhouse_image_sub3
  has_one_attached :bathhouse_image_sub4
  has_one_attached :bathhouse_image_sub5

  def sort_by_sort_url(url, order)
    url.gsub(/%5Bs%5D=\w+\+\w+/, "%5Bs%5D=#{order}")
  end

end
