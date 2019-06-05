class CreateHeros < ActiveRecord::Migration[5.2]
  def change
    create_table :heros do |t|
      t.string :name
      t.integer :hp, default: 5
      t.integer :treasure, default: 0
      t.integer :total_xp, default: 0
      t.boolean :incapacitated, default: false
      t.integer :user_id

      t.timestamps
    end
  end
end
