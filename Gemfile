source 'https://rubygems.org'

ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :production do
     gem 'pg'
     gem 'rails_12factor'
end 

group :development, :test do
  gem 'watchr'
  gem 'spring'
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'cucumber-rails', :require => false, git: 'https://github.com/cucumber/cucumber-rails.git'
  gem 'database_cleaner'
  gem 'terminal-notifier-guard'
end

group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'poltergeist'
end

gem 'devise'

gem 'twitter-bootstrap-rails'
gem 'therubyracer'
gem 'less-rails'

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
