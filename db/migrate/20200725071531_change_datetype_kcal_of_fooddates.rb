class ChangeDatetypeKcalOfFooddates < ActiveRecord::Migration[5.2]
  def up
    change_column :fooddates, :kcal, 'float'
    change_column :fooddates, :protein, 'float'
    change_column :fooddates, :fat, 'float'
    change_column :fooddates, :carbo, 'float'
  end
end
