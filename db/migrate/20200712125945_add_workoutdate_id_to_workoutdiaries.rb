class AddWorkoutdateIdToWorkoutdiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :workoutdiaries, :workoutdate_id, :integer
    add_column :workoutdiaries, :user_id, :integer
  end
end
