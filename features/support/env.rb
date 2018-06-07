# frozen_string_literal: true
require 'bundler'
Bundler.require
require 'pry'
require 'rspec/matchers'
require 'rspec/expectations'
require 'capybara/cucumber'
require 'capybara-screenshot/cucumber'
require 'capybara/poltergeist'
require 'json'
require 'active_record'
require 'pg'

Capybara.register_driver :phantomjs do |app|
  options = {
      phantomjs_logger: File.open('phantom.log', 'w'),
      js_errors: true,
      inspector: true,
      extensions: [File.join(__dir__, 'disable_animations.js')],
      window_size: [1280, 768]
  }
  Capybara::Poltergeist::Driver.new(app, options)
end

Capybara.register_driver :selenium do |app|
  profile = Selenium::WebDriver::Firefox::Profile.from_name 'default'
  Capybara::Selenium::Driver.new(app, profile: profile)
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.configure do |config|
  driver_name = ENV['DRIVER']
  default_driver = driver_name.empty? ? 'selenium' : driver_name
  config.default_driver = default_driver.to_sym
  config.javascript_driver = default_driver.to_sym
  config.default_max_wait_time = 5
  config.app_host = ENV['HOST'].nil? ? 'http://localhost:8200' : ENV['HOST']
end

Capybara::Screenshot.prune_strategy = :keep_last_run
Capybara::Screenshot.webkit_options = {width: 1024, height: 768}
Capybara.save_and_open_page_path = 'reports/screenshots'
