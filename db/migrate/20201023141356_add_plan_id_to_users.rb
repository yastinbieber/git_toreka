class AddPlanIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :plan_id, :string
  end
end
