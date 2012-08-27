class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :order_id
      t.integer :project_id
      t.integer :quantity
      t.decimal :price, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
