source 'https://rubygems.org'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'nokogiri'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'spring'
  gem 'spring-commands-rspec'  # Speedup RSpec
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rspec-rails'        # RSpec
  gem 'database_cleaner'   # Cleanup database
  gem 'timecop'            # Control time
  gem 'email_spec'         # RSpec for emails
  gem 'webmock'
end
