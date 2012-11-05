class AddColumnContactToInstitutions < ActiveRecord::Migration
  def change
    add_column :institutions, :contact, :string
  end
end
