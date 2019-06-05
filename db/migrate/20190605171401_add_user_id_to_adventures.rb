class AddUserIdToAdventures < ActiveRecord::Migration[5.2]
  def change
    add_column :adventures, :user_id, :integer
  end
end
