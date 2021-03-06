require 'simplecov'
require 'coveralls'

SimpleCov.add_filter "/spec/"

if ENV["COVERAGE"]
  SimpleCov.start 'rails'
elsif ENV["COVERALLS"]
  SimpleCov.formatter = Coveralls::SimpleCov::Formatter
  Coveralls.wear!
end

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../dummy/config/environment", __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'rspec/its'

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
end
