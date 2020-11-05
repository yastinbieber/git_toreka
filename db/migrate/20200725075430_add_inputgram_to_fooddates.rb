class AddInputgramToFooddates < ActiveRecord::Migration[5.2]
  def change
    add_column :fooddates, :inputgram, :integer
  end
end
