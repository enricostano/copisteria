class ChangeColumnsToLineItem < ActiveRecord::Migration
  def up
    change_column :line_items, :order_id, :integer, :null => false
    change_column :line_items, :project_id, :integer, :null => false
    change_column :line_items, :price, :decimal, :precision => 8, :scale => 2, :null => false
    change_column :line_items, :quantity, :integer, :null => false
  end

  def down
    change_column :line_items, :order_id, :integer, :null => true
    change_column :line_items, :project_id, :integer, :null => true
    change_column :line_items, :price, :decimal, :precision => 8, :scale => 2, :null => true
    change_column :line_items, :quantity, :integer, :null => true
  end
end
