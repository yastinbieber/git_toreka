class RemoveCustomerIdToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :customer_id, :string
    remove_column :users, :trial_end_day, :datetime
  end
end
