class AddAvailabilityToWorkoutdiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :workoutdiaries, :availability, :boolean, default: false, null: false
  end
end
