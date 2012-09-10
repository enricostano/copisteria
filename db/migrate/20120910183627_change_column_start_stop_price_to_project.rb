class ChangeColumnStartStopPriceToProject < ActiveRecord::Migration
  def up
    change_column :projects, :start, :date, :null => false
    change_column :projects, :stop, :date, :null => false
    change_column :projects, :price, :decimal, :precision => 8, :scale => 2, :null => false
  end

  def down
    change_column :projects, :start, :date, :null => true
    change_column :projects, :stop, :date, :null => true
    change_column :projects, :price, :decimal, :precision => 8, :scale => 2, :null => true
  end
end
