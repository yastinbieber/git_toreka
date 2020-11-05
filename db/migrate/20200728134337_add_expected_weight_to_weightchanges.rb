class AddExpectedWeightToWeightchanges < ActiveRecord::Migration[5.2]
  def change
    add_column :weightchanges, :expected_weight, :float
  end
end
