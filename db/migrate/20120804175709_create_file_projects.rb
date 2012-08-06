class CreateFileProjects < ActiveRecord::Migration
  def change
    create_table :file_projects do |t|
      t.string :name
      t.string :file_uid

      t.timestamps
    end
  end
end
