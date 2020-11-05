class ChangeDatetypeKcalburnedOfIdealweights < ActiveRecord::Migration[5.2]
  def up
    change_column :idealweights, :kcalburned, 'float'
    change_column :idealweights, :basemetabolism, 'float'
    change_column :idealweights, :minuskcal, 'float'
    change_column :idealweights, :kcalintake, 'float'
    change_column :idealweights, :intakeproteingram, 'float'
    change_column :idealweights, :intakeproteinkcal, 'float'
    change_column :idealweights, :intakefatgram, 'float'
    change_column :idealweights, :intakefatkcal, 'float'
    change_column :idealweights, :intakecarbogram, 'float'
    change_column :idealweights, :intakecarbokcal, 'float'
  
  
  end
end
