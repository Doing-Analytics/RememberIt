# frozen_string_literal: true

Capybara.javascript_driver = :selenium_chrome_headless
Capybara.server_port = 3001
Capybara.app_host = 'http://127.0.0.1:3001'

# https://stackoverflow.com/questions/9784118/how-to-emulate-mouse-hover-with-capybara

Capybara.register_driver :selenium do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile.native_events = true
  Capybara::Selenium::Driver.new(app, browser: :firefox, profile:)
end
