class AddTrialEndToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :trial_end, :integer
  end
end
