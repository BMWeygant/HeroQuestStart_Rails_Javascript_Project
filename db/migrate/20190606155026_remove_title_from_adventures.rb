class RemoveTitleFromAdventures < ActiveRecord::Migration[5.2]
  def change
    remove_column :adventures, :title
  end
end
