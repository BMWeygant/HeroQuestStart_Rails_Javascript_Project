class CreateHeros < ActiveRecord::Migration[5.2]
  def change
    create_table :heros do |t|
      t.string :name
      t.integer :hp
      t.integer :treasure
      t.integer :total_xp
      t.boolean :incapacitated

      t.timestamps
    end
  end
end
