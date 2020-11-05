class CreateWorkoutdates < ActiveRecord::Migration[5.2]
  def change
    create_table :workoutdates do |t|
      t.string :menu

      t.timestamps
    end
  end
end
