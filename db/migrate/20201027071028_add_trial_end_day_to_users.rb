class AddTrialEndDayToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :trial_end_day, :datetime
  end
end
