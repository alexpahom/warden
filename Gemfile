source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# gem 'acts_as_list'
gem 'acts_as_tree',             '~> 2.7.0'
gem 'autoprefixer-rails',       '~> 8.0.0'
gem 'bootstrap-sass',           '~> 3.3.7'
gem 'bootstrap_form',           '~> 2.7'
gem 'cocoon',                   '~> 1.2.11'
gem 'haml-rails',               '~> 1.0'
gem 'jbuilder',                 '~> 2.5'
gem 'jquery-rails',             '~> 4.3.1'
gem 'jquery-ui-rails',          '~> 4.0.3'
gem 'jstree-rails-4'
gem 'pg',                       '~> 0.18'
gem 'puma',                     '~> 3.10.0'
gem 'rails',                    '~> 5.1.4'
gem 'rails-html-sanitizer',     '~> 1.0.4'
gem 'rubocop',                  '~> 0.51.0'
gem 'sass-rails',               '~> 5.0'
gem 'uglifier',                 '>= 1.3.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara',               '~> 2.13'
  gem 'chromedriver-helper'
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
