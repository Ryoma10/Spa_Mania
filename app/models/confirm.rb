class Confirm < ApplicationRecord
  
  has_one_attached :bathhouse_image_main
  has_one_attached :bathhouse_image_sub1
  has_one_attached :bathhouse_image_sub2
  has_one_attached :bathhouse_image_sub3
  has_one_attached :bathhouse_image_sub4
  has_one_attached :bathhouse_image_sub5
end
