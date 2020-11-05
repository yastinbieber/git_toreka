class AddIdealweightIdToUseradvices < ActiveRecord::Migration[5.2]
  def change
    add_column :useradvices, :idealweight_id, :integer
  end
end
