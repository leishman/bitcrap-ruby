source 'https://rubygems.org'
ruby "2.1.5"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.8'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

gem 'mysql2'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

gem 'puma'

gem 'maicoin', git: 'git@github.com:leishman/maicoin-ruby.git'

gem 'autoprefixer-rails'

gem 'exception_notification'

gem 'activeadmin', github: 'activeadmin'
gem 'devise'

group :development, :test do
  gem 'byebug'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :development do
  gem 'capistrano'
  # cap tasks to manage puma application server
  gem 'capistrano3-puma', require: false
  gem 'capistrano-rails',   '~> 1.1', require: false
  gem 'capistrano-bundler', '~> 1.1', require: false
  gem 'capistrano-rvm',   '~> 0.1', require: false
end

group :test do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

