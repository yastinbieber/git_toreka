class AddTargetToHowtovideos < ActiveRecord::Migration[5.2]
  def change
    add_column :howtovideos, :target, :string
  end
end
