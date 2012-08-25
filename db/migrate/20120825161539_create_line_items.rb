class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :order_id
      t.integer :project_id
      t.decimal :price, :precision => 8, :scale => 2
      t.integer :quantity

      t.timestamps
    end
  end
end
