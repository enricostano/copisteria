class AddCoseVarieToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :cap, :string
    add_column :users, :partitaiva, :string
  end
end
