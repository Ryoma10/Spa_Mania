class Comment < ApplicationRecord
  has_many :notices,  dependent: :destroy
  has_many :report,   dependent: :destroy

  belongs_to :user
  belongs_to :review
end
