source "https://rubygems.org"
gem "rails", "~> 8.0.2"
gem "propshaft"
gem "sqlite3", ">= 2.1"
gem "puma", "~> 6.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem "bootsnap", require: false
gem "kamal", require: false
gem "thruster", require: false

# Markdown parsing
gem "kramdown"
gem "kramdown-parser-gfm"

# Use AWS S3 for Active Storage
gem "aws-sdk-s3", require: false

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mswin mingw x64_mingw ]

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end
group :development do
  gem "web-console"
end
group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
gem 'devise'
