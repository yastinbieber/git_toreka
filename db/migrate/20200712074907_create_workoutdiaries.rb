class CreateWorkoutdiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :workoutdiaries do |t|
      t.float :weight
      t.integer :reps
      t.string :sets
      t.text :memo
      t.date :date

      t.timestamps
    end
  end
end
