# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

gemspec

gem "decidim", "~> 0.9.2"

group :development, :test do
  gem "byebug", "~> 10.0", platform: :mri
  gem "codit-devise-cas-authenticable", path: "../devise-cas-authenticable"
end

group :development do
  gem "faker", "~> 1.8"
  gem "web-console", "~> 3.5"
end
