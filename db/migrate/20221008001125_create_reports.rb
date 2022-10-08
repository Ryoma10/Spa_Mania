class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.integer :review_id, null: false
      t.integer :user_id,   null: false
      t.integer :comment_id
      t.text    :body,      null: false

      t.timestamps
    end
  end
end
