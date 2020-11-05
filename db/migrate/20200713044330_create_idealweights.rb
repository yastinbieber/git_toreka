class CreateIdealweights < ActiveRecord::Migration[5.2]
  def change
    create_table :idealweights do |t|
      t.integer :user_id
      t.integer :fooddiary_id
      t.float :height
      t.float :weight
      t.float :targetweight
      t.float :exerciselevel
      t.integer :period
      t.integer :basemetabolism
      t.integer :kcalburned
      t.float :minusweight
      t.integer :minuskcal
      t.integer :kcalintake
      t.integer :intakeproteingram
      t.integer :intakeproteinkcal
      t.integer :intakefatgram
      t.integer :intakefatkcal
      t.integer :intakecarbogram
      t.integer :intakecarbokcal

      t.timestamps
    end
  end
end
