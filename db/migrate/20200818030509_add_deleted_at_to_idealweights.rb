class AddDeletedAtToIdealweights < ActiveRecord::Migration[5.2]
  def change
    add_column :idealweights, :deleted_at, :datetime
  end
end
