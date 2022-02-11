source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
# Client Side Validations made easy for Ruby on Rails. https://github.com/DavyJonesLocker/client_side_validations
gem 'client_side_validations'
# FriendlyId is the “Swiss Army bulldozer” of slugging and permalink plugins for ActiveRecord. http://norman.github.io/friendly_id/
gem 'friendly_id', '~> 5.2.4'
# Rails engine for cache-friendly, client-side local time. https://github.com/basecamp/local_time
gem 'local_time'
# OmniAuth is a flexible authentication system utilizing Rack middleware. https://omniauth.io
gem 'omniauth', '~> 1.6.1'
# OmniAuth strategy for the Auth0 platform. https://github.com/auth0/omniauth-auth0
gem 'omniauth-auth0', '~> 2.0.0'
# Track changes to your rails models. https://github.com/paper-trail-gem/paper_trail
gem 'paper_trail'
# The safe Markdown parser, reloaded. https://github.com/vmg/redcarpet
gem 'redcarpet'
# A pure-ruby code highlighter that is compatible with pygments. http://rouge.jneen.net/
gem 'rouge'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # A Ruby gem to load environment variables from `.env`. https://github.com/bkeepers/dotenv
  gem 'dotenv-rails'
  gem 'faker'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rename'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
  # Code coverage for Ruby 1.9+. https://github.com/colszowka/simplecov
  gem 'simplecov', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
