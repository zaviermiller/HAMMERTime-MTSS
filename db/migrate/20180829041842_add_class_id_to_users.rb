class AddClassIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :class_id, :integer
  end
end
