source "https://rubygems.org"
# Or use a mirror
# source "https://gems.ruby-china.com"

ruby file: ".ruby-version"

# Rails
gem "rails", github: "rails/rails", branch: "main"

# Drivers
gem "sqlite3", "~> 1.4"
gem "redis", ">= 4.0.1"

# Deployment
gem "puma", ">= 5.0"
gem "bootsnap", require: false

# Assets
gem "importmap-rails"
gem "propshaft"
gem "tailwindcss-rails"

# Hotwire
gem "stimulus-rails"
gem "turbo-rails"

# Active Storage
gem "image_processing", "~> 1.2"

# Other
gem "bcrypt", "~> 3.1.7"
gem "faraday"
gem "faraday-retry"
gem "jwt"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]


group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem "letter_opener"
end

group :development do
  gem "web-console"
  gem "hotwire-livereload"
  gem "rubocop-rails-omakase", require: false
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
