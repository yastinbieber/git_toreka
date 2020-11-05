class AddDeletedAtToUseradvices < ActiveRecord::Migration[5.2]
  def change
    add_column :useradvices, :deleted_at, :datetime
  end
end
