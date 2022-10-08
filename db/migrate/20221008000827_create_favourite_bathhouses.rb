class CreateFavouriteBathhouses < ActiveRecord::Migration[6.1]
  def change
    create_table :favourite_bathhouses do |t|
      t.integer :user_id,       null: false
      t.integer :bathhouses_id, null: false

      t.timestamps
    end
  end
end
