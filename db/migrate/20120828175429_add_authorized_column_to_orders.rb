class AddAuthorizedColumnToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :authorized, :boolean, :default => false
  end
end
