class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.boolean :shipped

      t.timestamps
    end
  end
end
