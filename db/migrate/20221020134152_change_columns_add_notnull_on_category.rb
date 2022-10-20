class ChangeColumnsAddNotnullOnCategory < ActiveRecord::Migration[6.1]
  def change
    change_column :features, :category, :integer, null: false
  end
end
