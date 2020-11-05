class AddSecondweightToAdvicediaries < ActiveRecord::Migration[5.2]
  def change
    add_column :advicediaries, :weightsecond, :float
    add_column :advicediaries, :repssecond, :integer
    add_column :advicediaries, :weightthird, :float
    add_column :advicediaries, :repsthird, :integer
  end
end
