class AddUsernameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :area, :string
    add_column :users, :birthday, :date
    add_column :users, :text, :text
    add_column :users, :sex, :string
    add_column :users, :age, :integer
  end
end
