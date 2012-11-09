class RenameProjectToTender < ActiveRecord::Migration
  def change
    rename_table :projects, :tenders
  end
end
