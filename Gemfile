source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
#gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'therubyracer', platforms: :ruby

#gem 'compass', '~> 1.0.0'
gem 'kaminari'
gem 'figaro'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'sass-rails', '>= 3.2'
gem 'autoprefixer-rails'
gem 'bootstrap_form'
gem 'kitco'
gem 'devise'
gem 'foreigner'
gem 'rufus-scheduler'
gem 'recaptcha', :require => 'recaptcha/rails'
#gem 'ffaker'
#gem 'fabrication'
#gem 'forgery'
gem 'nested_form'
gem 'aasm'

gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.47'
gem 'bootstrap-daterangepicker-rails'

#gem 'passenger'

group :development do
  #gem "capistrano-rails", require: false
  #gem "capistrano3-puma"
  gem 'listen', '~> 3.0.5'
  #gem 'capistrano', '~> 3.1', require: false
  #gem 'capistrano-rbenv', '~> 2.0', require: false
  #gem 'capistrano-bundler', require: false
  #gem 'capistrano-passenger', '>= 0.1.1'
  #gem 'capistrano-rbenv-install', github: "renuo/capistrano-rbenv-install", ref: 'master'
end

gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  #gem 'listen', '~> 3.0.5'
  #gem 'listen'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
