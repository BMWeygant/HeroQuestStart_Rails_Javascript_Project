class AddDefaultValuesToHeros < ActiveRecord::Migration[5.2]
  def change
    change_column_default :heros, :hp, 5
    change_column_default :heros, :treasure, 0
    change_column_default :heros, :total_xp, 0
    change_column_default :heros, :incapacitated, false
  end
end
