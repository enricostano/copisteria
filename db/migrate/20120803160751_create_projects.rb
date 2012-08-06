class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :institution_id
      t.date :start
      t.date :stop

      t.timestamps
    end
  end
end
