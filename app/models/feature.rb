class Feature < ApplicationRecord
  has_many :categories, dependent: :destroy
end
