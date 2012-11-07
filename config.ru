# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
if Rails.env.production?
  map '/copisteria' do
    run Copisteria2::Application
  end
else
  run Copisteria2::Application
end
