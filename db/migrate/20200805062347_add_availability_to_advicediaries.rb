class AddAvailabilityToAdvicediaries < ActiveRecord::Migration[5.2]
  def change
    add_column :advicediaries, :availability, :boolean, default: false, null: false
  end
end
