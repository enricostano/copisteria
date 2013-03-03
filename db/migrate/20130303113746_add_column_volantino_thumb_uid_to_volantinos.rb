class AddColumnVolantinoThumbUidToVolantinos < ActiveRecord::Migration
  def change
    add_column :volantinos, :volantino_thumb_uid, :string
  end
end
