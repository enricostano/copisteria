class AddPriceToProject < ActiveRecord::Migration
  def change
    add_column :projects, :price, :decimal, :precision => 8, :scale => 2
  end
end
