class AddUrlToAdvicemenus < ActiveRecord::Migration[5.2]
  def change
    add_column :advicemenus, :url, :text
  end
end
