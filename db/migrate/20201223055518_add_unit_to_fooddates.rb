class AddUnitToFooddates < ActiveRecord::Migration[5.2]
  def change
    add_column :fooddates, :unit, :string
  end
end
