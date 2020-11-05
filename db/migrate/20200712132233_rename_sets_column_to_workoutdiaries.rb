class RenameSetsColumnToWorkoutdiaries < ActiveRecord::Migration[5.2]
  def change
    rename_column :workoutdiaries, :sets, :settyoe
  end
end
