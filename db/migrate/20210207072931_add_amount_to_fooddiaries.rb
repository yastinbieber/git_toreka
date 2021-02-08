class AddAmountToFooddiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :fooddiaries, :amount, :float
  end
end
