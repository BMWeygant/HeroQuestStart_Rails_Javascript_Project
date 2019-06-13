class AddHealingToExperiences < ActiveRecord::Migration[5.2]
  def change
    add_column :experiences, :healing, :boolean
  end
end
