# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

gemspec

gem 'jquery-rails'

group :development, :test do
  gem "byebug", "~> 10.0", platform: :mri
  gem "codit-devise-cas-authenticable", git: "git@gitlab.coditdev.net:decidim/codit-devise-cas-authenticable.git"
end

group :development do
  gem "faker", "~> 1.8"
  gem "web-console", "~> 3.5"
end
