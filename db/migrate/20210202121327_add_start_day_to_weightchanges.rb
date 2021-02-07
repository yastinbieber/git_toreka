class AddStartDayToWeightchanges < ActiveRecord::Migration[5.2]
  def change
    add_column :weightchanges, :start_day, :date
    add_column :weightchanges, :last_day, :date
  end
end
