class RemoveHardModeFromExperiences < ActiveRecord::Migration[5.2]
  def change
    remove_column :experiences, :hard_mode
  end
end
