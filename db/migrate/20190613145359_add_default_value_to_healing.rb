class AddDefaultValueToHealing < ActiveRecord::Migration[5.2]
  def change
    remove_column :experiences, :healing, :boolean
    add_column :experiences, :healing, :boolean, default: false
  end
end
