class FavouriteBathhouse < ApplicationRecord
  belongs_to :user
  belongs_to :bathhouse
end
