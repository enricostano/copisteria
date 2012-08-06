class AddProjectIdToFileProject < ActiveRecord::Migration
  def change
    add_column :file_projects, :project_id, :integer
  end
end
