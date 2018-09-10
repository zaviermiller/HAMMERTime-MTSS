class AddAbsentToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :absent, :boolean
  end
end
