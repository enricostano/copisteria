class AddColumnFileUidToProject < ActiveRecord::Migration
  def change
    add_column :projects, :file_uid, :string
  end
end
