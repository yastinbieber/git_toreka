class CreateAdvicemenus < ActiveRecord::Migration[5.2]
  def change
    create_table :advicemenus do |t|
      t.string :menu
      t.integer :minimam_reps
      t.integer :max_reps
      t.integer :sets
      t.string :group

      t.timestamps
    end
  end
end
