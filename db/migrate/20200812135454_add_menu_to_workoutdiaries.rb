class AddMenuToWorkoutdiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :workoutdiaries, :menu, :string
  end
end
