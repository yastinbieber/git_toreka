class AddPartToWorkoutdates < ActiveRecord::Migration[5.2]
  def change
    add_column :workoutdates, :part, :string
  end
end
