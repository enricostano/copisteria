class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
