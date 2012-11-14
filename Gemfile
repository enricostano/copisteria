source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

#gem 'mysql2'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

#gem 'jquery-rails'
gem 'cloudfoundry-jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# To use debugger
gem 'debugger'

gem 'therubyracer'

gem 'devise'

gem 'rack-cache', :require => 'rack/cache'
gem 'dragonfly', '~>0.9.12'

gem 'cancan'

gem 'rails-i18n'

gem 'pg'

group :test, :development do
  gem "rspec-rails", "~> 2.0"
  gem 'factory_girl_rails'
end

group :test do
  gem 'cucumber-rails', :require => false
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
end

group :development do
  #gem 'sqlite3'
  gem 'capistrano'
  gem 'rvm-capistrano'
end
