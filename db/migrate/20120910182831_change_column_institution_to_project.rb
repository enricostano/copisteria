class ChangeColumnInstitutionToProject < ActiveRecord::Migration
  def up
    change_column :projects, :institution_id, :integer, :null => false
  end

  def down
    change_column :projects, :institution_id, :integer, :null => true
  end
end
