class CreateGenders < ActiveRecord::Migration[6.1]
  def change
    create_table :genders do |t|
      t.integer :bathhouse_id
      t.integer :sex
      
      t.timestamps
    end
  end
end
