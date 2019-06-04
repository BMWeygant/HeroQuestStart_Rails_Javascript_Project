class CreateAdventures < ActiveRecord::Migration[5.2]
  def change
    create_table :adventures do |t|
      t.string :title
      t.integer :hp_rating
      t.integer :treasure_rating

      t.timestamps
    end
  end
end
