class AddFoodnameToFooddiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :fooddiaries, :foodname, :string
  end
end
