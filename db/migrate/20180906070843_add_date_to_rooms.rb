class AddDateToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :occurs, :date
  end
end
