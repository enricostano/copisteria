class RemoveOrderAndRealUrlFromUrlConnector < ActiveRecord::Migration
  def up
    remove_column :url_connectors, :order_id
    remove_column :url_connectors, :real_url
  end

  def down
    add_column :url_connectors, :order_id, :integer
    add_column :url_connectors, :real_url, :string
 end
end
