source 'https://rubygems.org'

gem 'rails', '3.2.11'

gem 'mongoid', '~> 3'
gem 'mongoid-slugs'

gem 'devise'

gem 'carrierwave'
gem 'carrierwave-mongoid', require: 'carrierwave/mongoid'
gem 'fog', '~> 1.3.1'
gem 'mini_magick'

gem 'rabl-rails'
gem 'slim-rails'

gem 'slodown'
gem 'redcarpet'
gem 'coderay'
gem 'embed'

gem 'simple_form'
gem 'kaminari'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  gem 'uglifier', '>= 1.0.3'

  gem 'jquery-rails'
  gem 'showdown-rails'
  gem 'bootstrap-sass'
  gem 'handlebars_assets'
end

group :production do
  gem 'unicorn'
end

group :development do
  gem 'thin'

  gem 'quiet_assets'

  gem 'guard-rails'
  gem 'guard-bundler'
  # gem 'rb-inotify', require: false
  # gem 'rb-fsevent', require: false
  # gem 'rb-fchange', require: false
  gem 'terminal-notifier-guard'

  gem 'capistrano'

  gem 'debugger'

  gem 'pry-rails'
end

group :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'mongoid-rspec'
  gem 'fabrication-rails'
  gem 'ffaker'
  gem 'spork'
  gem 'guard-rspec'
  gem 'guard-spork'
end
