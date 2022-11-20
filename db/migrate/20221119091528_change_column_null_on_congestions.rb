class ChangeColumnNullOnCongestions < ActiveRecord::Migration[6.1]
  def change
    change_column_null :congestions, :review_id,            false
    change_column_null :congestions, :classification,       false
    change_column_null :congestions, :time_zone,            false
    change_column_null :congestions, :congestion_situation, false
  end
end
