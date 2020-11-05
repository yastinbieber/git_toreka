class AddUseradviceIdToAdvicediaries < ActiveRecord::Migration[5.2]
  def change
    add_column :advicediaries, :useradvice_id, :integer
  end
end
