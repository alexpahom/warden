source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'autoprefixer-rails',       '~> 7.1.4'
gem 'bootstrap_form',           '~> 2.7'
gem 'jbuilder',                 '~> 2.5'
gem 'jquery-rails',             '~> 4.3.1'
gem 'pg',                       '~> 0.18'
gem 'puma',                     '~> 3.7'
gem 'rails',                    '~> 5.1.4'
gem 'rails-html-sanitizer',     '~> 1.0.3'
gem 'rubocop',                  '~> 0.51.0'
gem 'sass-rails',               '~> 5.0'
gem 'uglifier',                 '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails',             '~> 4.2'
gem 'table-for',                '~> 3.6.1'
gem 'turbolinks',               '~> 5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara',               '~> 2.13'
  gem 'pry',                    '~> 0.11.3'
  gem 'selenium-webdriver'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
