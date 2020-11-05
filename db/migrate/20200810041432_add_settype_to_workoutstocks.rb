class AddSettypeToWorkoutstocks < ActiveRecord::Migration[5.2]
  def change
    add_column :workoutstocks, :settype, :string
  end
end
