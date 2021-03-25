source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.1.3'
gem 'activerecord-import'
gem 'bootstrap'
gem 'hotwire-rails'
gem 'jbuilder', '~> 2.7'
gem 'kaminari'
gem 'pg', '~> 1.1'
gem 'pg_search', '~> 2.3.4'
gem 'puma', '~> 5.0'
gem 'redis'
gem 'sass-rails', '>= 6'
gem 'sidekiq', '>= 6.1.1'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails'
  gem 'rubocop-faker'
  gem 'rubocop-performance'
  gem 'rubocop-rspec'
end

group :development do
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'poltergeist'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mri mingw x64_mingw]
