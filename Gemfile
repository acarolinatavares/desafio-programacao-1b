source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.0.2'
gem 'sqlite3'
gem 'puma', '~> 3.0'
gem 'jquery-rails'
gem 'sass-rails'
gem 'materialize-sass'
gem 'material_icons'
gem 'slim'
gem 'will_paginate'
gem 'ransack'

group :development do
  gem 'pry'
  gem 'listen'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.5'
  gem 'factory_girl_rails'
  gem 'rails-controller-testing'
end