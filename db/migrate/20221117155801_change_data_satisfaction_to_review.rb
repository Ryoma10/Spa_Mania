class ChangeDataSatisfactionToReview < ActiveRecord::Migration[6.1]
  def change
    change_column :reviews, :satisfaction, :string
  end
end
