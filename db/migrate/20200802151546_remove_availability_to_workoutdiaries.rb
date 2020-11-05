class RemoveAvailabilityToWorkoutdiaries < ActiveRecord::Migration[5.2]
  def change
    remove_column :workoutdiaries, :availability, :boolean
  end
end
