class RemoveAdventureIdFromAdventures < ActiveRecord::Migration[5.2]
  def change
    remove_column :adventures, :adventure_id
  end
end
