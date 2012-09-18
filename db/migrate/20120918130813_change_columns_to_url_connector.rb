class ChangeColumnsToUrlConnector < ActiveRecord::Migration
  def up
    change_column :url_connectors, :user_id, :integer, :null => false
    change_column :url_connectors, :line_item_id, :integer, :null => false
    change_column :url_connectors, :temp_url, :string, :null => false
  end

  def down
    change_column :url_connectors, :user_id, :integer, :null => true
    change_column :url_connectors, :line_item_id, :integer, :null => true
    change_column :url_connectors, :temp_url, :string, :null => true
  end
end
