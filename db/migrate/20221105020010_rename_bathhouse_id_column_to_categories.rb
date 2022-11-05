class RenameBathhouseIdColumnToCategories < ActiveRecord::Migration[6.1]
  def change
    rename_column :categories, :bathhouse_id, :gender_id
  end
end
