class Congestion < ApplicationRecord
  belongs_to :review

  enum classification: { man: 0, woman: 1, rest_area: 2 }
  enum congestion_situation: { empty: 0, normal: 1, crowded: 2, very_crowded: 3 }
end
