class RenameSettyoeColumnToWorkoutdiaries < ActiveRecord::Migration[5.2]
  def change
    rename_column :workoutdiaries, :settyoe, :settype
  end
end
