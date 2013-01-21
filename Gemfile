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
  gem 'guard-coffeescript'
  gem 'rb-fsevent'

  gem 'capistrano'

  gem 'debugger'

  gem 'pry-rails'
end

group :test do
  gem 'rspec-rails'
  gem 'fabrication'
  gem 'guard-rspec'
end
