class CreateWorkoutstocks < ActiveRecord::Migration[5.2]
  def change
    create_table :workoutstocks do |t|
      t.float :weight
      t.integer :reps
      t.float :weightsecond
      t.integer :repssecond
      t.float :weightthird
      t.integer :repsthird
      t.text :memo
      t.integer :workoutdiary_id
      t.integer :user_id
      t.timestamps
    end
  end
end
