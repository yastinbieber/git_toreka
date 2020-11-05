class AddEmailToIdealweight < ActiveRecord::Migration[5.2]
  def change
    add_column :idealweights, :email, :string
  end
end
