class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string  :name,          null: false
      t.integer :bathhouse_id,  null: false
      t.integer :feature_id,    null: false

      t.timestamps
    end
  end
end