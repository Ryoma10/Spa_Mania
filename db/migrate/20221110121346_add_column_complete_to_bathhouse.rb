class AddColumnCompleteToBathhouse < ActiveRecord::Migration[6.1]
  def change
    add_column :bathhouses, :complete, :boolean, default: false
  end
end
