source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'active_model_serializers'
gem 'api-pagination'
gem 'kaminari'
gem 'pg'
gem 'puma', '~> 3.0'
gem 'rack-cors'
gem 'rails', '~> 5.0.7'
gem 'responders'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'dotenv-rails'
end

group :test do
  gem 'factory_girl_rails'
  gem 'rspec', '~> 3.5'
  gem 'rspec-rails', '~> 3.5'
  gem 'database_cleaner'
  gem 'faker'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end