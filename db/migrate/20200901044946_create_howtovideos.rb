class CreateHowtovideos < ActiveRecord::Migration[5.2]
  def change
    create_table :howtovideos do |t|
      t.string :menu
      t.string :url

      t.timestamps
    end
  end
end
