class AddCategoriesToId < ActiveRecord::Migration[6.1]
  def change
    add_column :ids, :bathhouse_id, :integer
    add_column :ids, :feature_id, :integer
  end
end
