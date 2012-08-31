class AddColumnLineItemToUrlConnectors < ActiveRecord::Migration
  def change
    add_column :url_connectors, :line_item_id, :integer
  end
end
