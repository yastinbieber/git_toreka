class AddUnitToFooddiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :fooddiaries, :unit, :string
  end
end
