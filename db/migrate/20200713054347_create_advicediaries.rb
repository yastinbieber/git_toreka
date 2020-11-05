class CreateAdvicediaries < ActiveRecord::Migration[5.2]
  def change
    create_table :advicediaries do |t|
      t.integer :user_id
      t.integer :idealweight_id
      t.integer :advicemenu_id
      t.float :weight
      t.integer :reps
      t.date :date

      t.timestamps
    end
  end
end
