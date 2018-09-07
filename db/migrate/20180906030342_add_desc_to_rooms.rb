class AddDescToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :desc, :text
  end
end
