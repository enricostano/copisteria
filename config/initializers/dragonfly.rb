require 'dragonfly'

app = Dragonfly[:images]

app.configure_with(:rails)

app.define_macro(ActiveRecord::Base, :file_accessor)

app.datastore = Dragonfly::DataStorage::FileDataStore.new

app.datastore.configure do |d|
  d.root_path = Rails.root.to_s + '/gare'   # defaults to /var/tmp/dragonfly
  d.server_root = Rails.root.to_s + '/gare'
end
