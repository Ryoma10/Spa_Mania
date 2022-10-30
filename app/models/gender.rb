class Gender < ApplicationRecord
  belongs_to :bathhouse

  has_many :categories,                      dependent: :destroy
  has_many :features,  through: :categories, dependent: :destroy

  enum sex: { man: 0, woman: 1, be_common: 2 }
end
