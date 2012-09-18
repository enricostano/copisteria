class ChangeColumnsToInstitution < ActiveRecord::Migration
  def up
    change_column :institutions, :email, :string, :null => false
    change_column :institutions, :name, :string, :null => false
    change_column :institutions, :phone, :string, :null => false
  end

  def down
    change_column :institutions, :name, :string, :null => true
    change_column :institutions, :phone, :string, :null => true
    change_column :institutions, :email, :string, :null => true
  end
end
