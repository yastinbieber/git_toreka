class AddWorkoutdateIdToAdvicediaries < ActiveRecord::Migration[5.2]
  def change
    add_column :advicediaries, :workoutdate_id, :integer
  end
end
