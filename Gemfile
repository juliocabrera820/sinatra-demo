source 'http://rubygems.org'

gem 'activerecord', '~> 6.1', require: 'active_record'
gem 'bcrypt'
gem 'dotenv'
gem 'pry'
gem 'rake'
gem 'require_all'
gem 'shotgun'
gem 'sinatra', require: 'sinatra/base'
gem 'sinatra-activerecord', '~> 2.0.20', :require => 'sinatra/activerecord'
gem 'sinatra-flash'
gem 'thin'
gem 'tux'

group :test do
  gem 'capybara'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
  gem 'rack-test'
  gem 'rspec'
end

group :production do
  gem 'pg', "~> 1.1.3"
end
