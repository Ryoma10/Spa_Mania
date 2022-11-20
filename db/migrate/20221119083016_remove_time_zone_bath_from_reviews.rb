class RemoveTimeZoneBathFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :time_zone_bath, :string
    remove_column :reviews, :congestion_situation_man, :integer
    remove_column :reviews, :congestion_situation_woman, :integer
    remove_column :reviews, :time_zone_rest_area, :string
    remove_column :reviews, :congestion_situation_rest_area, :integer
  end
end
