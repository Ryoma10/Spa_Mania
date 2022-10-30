class Category < ApplicationRecord
  belongs_to :gender
  belongs_to :feature
end
