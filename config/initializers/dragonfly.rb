require 'dragonfly'

app = Dragonfly[:images]
app.configure_with(:imagemagick)
app.configure_with(:rails)

app.define_macro(ActiveRecord::Base, :file_accessor)
app.define_macro(ActiveRecord::Base, :image_accessor)

app.datastore = Dragonfly::DataStorage::FileDataStore.new

app.datastore.configure do |d|
  d.root_path = Rails.root.to_s + '/gare'   # defaults to /var/tmp/dragonfly
  d.server_root = Rails.root.to_s + '/gare'
end

app.processor.add :thumb_pdf_page do |temp_object, pdf_page, args = "", format = nil|
  include Dragonfly::Shell
  pdf_page_str = pdf_page ? "\[#{pdf_page}\]" : ""
  binding.pry
  run "convert", %(#{quote(temp_object.path + pdf_page_str)} #{args} #{quote(temp_object.name)})
  tempfile
end
