class CreateNotices < ActiveRecord::Migration[6.1]
  def change
    create_table :notices do |t|
      t.integer :visitor_id,  null: false
      t.integer :visited_id,  null: false
      t.integer :review_id,   null: false
      t.integer :comment_id,  null: false
      t.integer :caution_id,  null: false
      t.string  :action,      default: '',  null: false
      t.boolean :checked,     null: false

      t.timestamps
    end
  end
end
