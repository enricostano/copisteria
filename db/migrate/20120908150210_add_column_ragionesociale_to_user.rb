class AddColumnRagionesocialeToUser < ActiveRecord::Migration
  def change
    add_column :users, :ragionesociale, :string
  end
end
