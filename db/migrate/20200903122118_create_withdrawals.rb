class CreateWithdrawals < ActiveRecord::Migration[5.2]
  def change
    create_table :withdrawals do |t|
      t.integer :user_id
      t.text :reason

      t.timestamps
    end
  end
end
