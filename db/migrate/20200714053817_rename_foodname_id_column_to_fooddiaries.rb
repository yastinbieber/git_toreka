class RenameFoodnameIdColumnToFooddiaries < ActiveRecord::Migration[5.2]
  def change
    rename_column :fooddiaries, :foodname_id, :fooddate_id
  end
end
