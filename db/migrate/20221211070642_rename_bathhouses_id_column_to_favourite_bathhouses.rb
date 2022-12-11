class RenameBathhousesIdColumnToFavouriteBathhouses < ActiveRecord::Migration[6.1]
  def change
    rename_column :favourite_bathhouses, :bathhouses_id, :bathhouse_id
  end
end
