class AddIndexPartitaivaToUsers < ActiveRecord::Migration
  def change
    add_index :users, :partitaiva, :unique => true
  end
end
