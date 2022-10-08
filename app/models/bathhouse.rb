class Bathhouse < ApplicationRecord
  has_many :reviews,              dependent: :destroy
  has_many :categories,           dependent: :destroy
  has_many :favourite_bathhouses, dependent: :destroy

  belongs_to :prefecture
end
