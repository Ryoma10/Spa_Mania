class Report < ApplicationRecord
  belongs_to :review, optional: true
  belongs_to :comment, optional: true
  belongs_to :user
end