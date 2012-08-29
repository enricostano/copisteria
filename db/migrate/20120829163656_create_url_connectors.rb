class CreateUrlConnectors < ActiveRecord::Migration
  def change
    create_table :url_connectors do |t|
      t.string :temp_url
      t.string :real_url
      t.integer :user_id
      t.integer :order_id
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
