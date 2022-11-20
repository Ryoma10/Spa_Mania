class CreateCongestions < ActiveRecord::Migration[6.1]
  def change
    create_table :congestions do |t|
      t.integer :review_id
      t.integer :classification
      t.integer :time_zone
      t.integer :congestion_situation

      t.timestamps
    end
  end
end
