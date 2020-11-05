class AddMemoToFooddates < ActiveRecord::Migration[5.2]
  def change
    add_column :fooddates, :memo, :text
  end
end
