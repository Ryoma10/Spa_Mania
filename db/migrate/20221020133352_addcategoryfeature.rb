class Addcategoryfeature < ActiveRecord::Migration[6.1]
  def change
    add_column :features, :category, :integer
  end
end
