class AddMinusWeightToIdealweights < ActiveRecord::Migration[5.2]
  def change
    add_column :idealweights, :minusweight_day, :float
  end
end
