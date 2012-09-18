class ChangeNameColumnToRole < ActiveRecord::Migration
  def up
    change_column :roles, :name, :string, :null => false
  end

  def down
    change_column :roles, :name, :string, :null => true 
  end
end
