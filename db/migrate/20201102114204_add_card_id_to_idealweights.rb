class AddCardIdToIdealweights < ActiveRecord::Migration[5.2]
  def change
    add_column :idealweights, :card_id, :integer
  end
end
