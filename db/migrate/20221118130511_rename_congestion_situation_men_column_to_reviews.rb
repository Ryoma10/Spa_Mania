class RenameCongestionSituationMenColumnToReviews < ActiveRecord::Migration[6.1]
  def change
    rename_column :reviews, :congestion_situation_men, :congestion_situation_man
    rename_column :reviews, :congestion_situation_women, :congestion_situation_woman
  end
end