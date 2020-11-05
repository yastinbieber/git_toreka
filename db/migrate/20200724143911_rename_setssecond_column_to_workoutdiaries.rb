class RenameSetssecondColumnToWorkoutdiaries < ActiveRecord::Migration[5.2]
  def change
    rename_column :workoutdiaries, :setssecond, :repssecond
    rename_column :workoutdiaries, :setsthird, :repsthird
    rename_column :workoutdiaries, :setsfourth, :repsfourth
    rename_column :workoutdiaries, :setsfifth, :repsfifth
  end
end
