class AddTitleToExperiences < ActiveRecord::Migration[5.2]
  def change
    add_column :experiences, :title, :string
  end
end
