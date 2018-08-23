require 'capybara'
require 'capybara/cucumber'
require 'site_prism'
require 'selenium-webdriver'

@browser = ENV['BROWSER']

=begin
# código para funcionar chrome headless com versão antiga do capybara
Capybara.register_driver :selenium do |app|
  browser_options = ::Selenium::WebDriver::Chrome::Options.new
  browser_options.args << '--headless'
  browser_options.args << '--disable-gpu' if Gem.win_platform?
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: browser_options)
end
=end


Capybara.configure do |config|
  if @browser.eql? ('headless')
    config.default_driver = :selenium_chrome_headless
  elsif @browser.eql? ('chrome')
    config.default_driver = :selenium_chrome
  else
    config.default_driver = :selenium
  end

  config.app_host = 'https://mark7.herokuapp.com'
end

# ate 5 segundos para encontrar um elemento
Capybara.default_max_wait_time = 5
