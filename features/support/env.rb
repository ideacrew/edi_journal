ENV["RAILS_ENV"] ||= 'test'
require 'webdrivers'
require 'capybara/cucumber'
require 'capybara-screenshot/cucumber'

require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')

require 'rails/test_help'
require "rspec/rails"
require 'cucumber/rails'


After do
  DatabaseCleaner.start
end


Cucumber::Rails::Database.javascript_strategy = :truncation

Capybara::Screenshot.webkit_options = { width: 2280, height: 1800 }
Capybara::Screenshot.prune_strategy = :keep_last_run
Webdrivers.cache_time = 86_400

Capybara.register_driver :selenium_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument("headless")
  options.add_argument("--window-size=1024,768")
  options.add_argument("--no-sandbox")

  if RUBY_PLATFORM =~ /darwin/
    options.add_argument("--enable-features=NetworkService,NetworkServiceInProcess")
  end

  client = Selenium::WebDriver::Remote::Http::Default.new
  client.open_timeout = 120 # instead of the default 60
  client.read_timeout = 120 # instead of the default 60

  Capybara::Selenium::Driver.new(app,
    browser: :chrome,
    options: options,
    http_client: client
  )
end

Capybara.default_driver = :selenium_chrome