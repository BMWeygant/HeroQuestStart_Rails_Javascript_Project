class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.integer :xp
      t.integer :user_id
      t.integer :adventure_id
      t.integer :hero_id

      t.timestamps
    end
  end
end
