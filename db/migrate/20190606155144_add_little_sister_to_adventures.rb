class AddLittleSisterToAdventures < ActiveRecord::Migration[5.2]
  def change
    add_column :adventures, :little_sister, :boolean, default: false
  end
end
