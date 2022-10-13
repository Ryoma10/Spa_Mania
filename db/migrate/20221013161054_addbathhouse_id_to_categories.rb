class AddbathhouseIdToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :bathhouse_id, :integer
    add_column :categories, :feature_id, :integer
  end
end
