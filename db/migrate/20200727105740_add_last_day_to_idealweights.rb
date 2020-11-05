class AddLastDayToIdealweights < ActiveRecord::Migration[5.2]
  def change
    add_column :idealweights, :last_day, :date
    add_column :idealweights, :start_day, :date
  end
end
