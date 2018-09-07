class AddMoreToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :desc, :text
    add_column :users, :room, :integer
    add_column :users, :dept, :integer
  end
end
