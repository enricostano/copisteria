class CreateVolantinos < ActiveRecord::Migration
  def change
    create_table :volantinos do |t|
      t.string :name
      t.date :start
      t.date :stop

      t.timestamps
    end
  end
end
