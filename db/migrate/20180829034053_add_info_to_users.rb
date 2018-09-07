class AddInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :studentid, :string
    add_column :users, :first, :string
    add_column :users, :last, :string
    add_column :users, :role, :integer
    add_column :users, :friends, :integer, array: true, default: []
  end
end
