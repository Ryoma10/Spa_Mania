class CreateBathhouses < ActiveRecord::Migration[6.1]
  def change
    create_table :bathhouses do |t|
      t.integer :user_id,       null: false
      t.integer :prefecture_id, null: false
      t.string  :name,          null: false
      t.string  :postal_code
      t.string  :address_city,  null: false
      t.string  :address_town,  null: false
      t.string  :address_building
      t.text    :access
      t.text    :parking_information
      t.string  :telephone_number
      t.text    :homepage
      t.text    :regular_holiday
      t.text    :opening_hours
      t.integer :minimum_fee
      t.text    :fee_detail
      t.text    :special_note

      t.timestamps
    end
  end
end
