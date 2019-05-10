class AddInfoToRequests < ActiveRecord::Migration[5.2]
  def change
    add_reference :requests, :user, foreign_key: true
    add_column :requests, :reqsi, :string
  end
end
