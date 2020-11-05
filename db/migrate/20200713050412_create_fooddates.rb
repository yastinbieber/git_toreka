class CreateFooddates < ActiveRecord::Migration[5.2]
  def change
    create_table :fooddates do |t|
      t.string :foodname
      t.integer :gram
      t.integer :kcal
      t.integer :protein
      t.integer :fat
      t.integer :carbo
      
      t.timestamps
    end
  end
end
