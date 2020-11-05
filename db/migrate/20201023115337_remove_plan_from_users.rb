class RemovePlanFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :plan, :string
  end
end
