class RenameColumnProjectIdToTenderIdInLineItems < ActiveRecord::Migration
  def change
    rename_column :line_items, :project_id, :tender_id
  end
end
