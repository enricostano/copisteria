class ChangeColumnUserIdToOrder < ActiveRecord::Migration
  def up
    change_column :orders, :user_id, :integer, :null => false
  end

  def down
    change_column :orders, :user_id, :integer, :null => true 
  end
end
