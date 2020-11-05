class CreateUseradvices < ActiveRecord::Migration[5.2]
  def change
    create_table :useradvices do |t|
      t.integer :user_id
      t.integer :frequency
      t.string :purpose

      t.timestamps
    end
  end
end
