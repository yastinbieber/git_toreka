class CreateWeightchanges < ActiveRecord::Migration[5.2]
  def change
    create_table :weightchanges do |t|
      t.integer :user_id
      t.float :todayweight
      t.integer :idealweight_id
      t.date :date

      t.timestamps
    end
  end
end
