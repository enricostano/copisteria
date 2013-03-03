class AddColumnVolantinoFileUidToVolantinos < ActiveRecord::Migration
  def change
    add_column :volantinos, :volantino_file_uid, :string
  end
end
