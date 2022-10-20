class Feature < ApplicationRecord
  has_many :categories, dependent: :destroy
  enum category: { bath_facilities: 0, sauna: 1, other: 2, building_facilities: 3 }
end
