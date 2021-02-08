class ChangeDatatypeGramOfFooddiaries < ActiveRecord::Migration[5.2]
  def change
    change_column :fooddiaries, :gram, :float
    change_column :fooddiaries, :kcal, :float
    change_column :fooddiaries, :protein, :float
    change_column :fooddiaries, :fat, :float
    change_column :fooddiaries, :carbo, :float
  end
end
