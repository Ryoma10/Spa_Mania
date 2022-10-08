class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id,       null: false
      t.integer :bathhouse_id,  null: false
      t.date    :visiting_date, null: false
      t.integer :satisfaction
      t.text    :body,          null: false
      t.string  :time_zone_bath
      t.integer :congestion_situation_men
      t.integer :congestion_situation_women
      t.string  :time_zone_rest_area
      t.integer :congestion_situation_rest_area

      t.timestamps
    end
  end
end
