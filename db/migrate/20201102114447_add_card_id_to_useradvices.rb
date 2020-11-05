class AddCardIdToUseradvices < ActiveRecord::Migration[5.2]
  def change
    add_column :useradvices, :card_id, :integer
  end
end
