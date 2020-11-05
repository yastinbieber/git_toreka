class ChangeDatetypeUrlOfHowtovideos < ActiveRecord::Migration[5.2]
  def up
    change_column :howtovideos, :url, :text
  end
end
