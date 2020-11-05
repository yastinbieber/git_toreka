class RemoveAvailabilityToAdvicediaries < ActiveRecord::Migration[5.2]
  def change
    remove_column :advicediaries, :availability, :boolean
  end
end
