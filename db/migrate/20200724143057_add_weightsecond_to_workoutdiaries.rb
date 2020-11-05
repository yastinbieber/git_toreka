class AddWeightsecondToWorkoutdiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :workoutdiaries, :weightsecond, :float
    add_column :workoutdiaries, :setssecond, :integer
    add_column :workoutdiaries, :weightthird, :float
    add_column :workoutdiaries, :setsthird, :integer
    add_column :workoutdiaries, :weightfourth, :float
    add_column :workoutdiaries, :setsfourth, :integer
    add_column :workoutdiaries, :weightfifth, :float
    add_column :workoutdiaries, :setsfifth, :integer
  end
end
