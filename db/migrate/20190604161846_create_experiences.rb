class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.boolean :hard_mode, default: false
      t.integer :xp, default: 5
      t.integer :hp_rating, default: 3
      t.integer :treasure_rating, default: 2
      t.integer :user_id


      t.timestamps
    end
  end
end
