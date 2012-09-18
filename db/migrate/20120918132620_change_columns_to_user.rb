class ChangeColumnsToUser < ActiveRecord::Migration
  def up
    change_column :users, :phone, :string, :null => false
    change_column :users, :address, :string, :null => false
    change_column :users, :cap, :string, :null => false
    change_column :users, :city, :string, :null => false
    change_column :users, :partitaiva, :string, :null => false
    change_column :users, :ragionesociale, :string, :null => false
  end

  def down
    change_column :users, :phone, :string, :null => true
    change_column :users, :address, :string, :null => true
    change_column :users, :cap, :string, :null => true
    change_column :users, :city, :string, :null => true
    change_column :users, :partitaiva, :string, :null => true
    change_column :users, :ragionesociale, :string, :null => true
 end
end
