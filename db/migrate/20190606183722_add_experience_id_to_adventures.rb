class AddExperienceIdToAdventures < ActiveRecord::Migration[5.2]
  def change
    add_column :adventures, :experience_id, :integer
  end
end
