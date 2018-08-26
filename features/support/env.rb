# encoding: utf-8
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
all_encoding = []
Dir.glob('features/**/*.rb').each do |file|
  all_encoding.push(File.open(file).map { |line| line.to_s.encoding })
end

all_encoding.flatten.count { |encoding| encoding.name != 'UTF-8' } # 0


if @browser.eql? ('ci_headless')

  Capybara.javascript_driver = :selenium
  Capybara.run_server = false

  args = ['--no-default-browser-check']

  caps = Selenium::WebDriver::Remote::Capabilities.chrome(
    'chromeOptions' => {'args' => args}
  )

  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(
      app,
      browse: :remote,
      url: 'http://selenium:4444/wd/hub',
      desired_capabilities: caps
    )
  end
elsif @browser.eql? ('headless')
  Capybara.configure do |config|
    config.default_driver = :selenium_chrome_headless
    #config.default_driver = :selenium_chrome
    config.app_host = 'https://mark7.herokuapp.com'
  end
else
  Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    config.app_host = 'https://mark7.herokuapp.com'
  end
end

# ate 5 segundos para encontrar um elemento
Capybara.default_max_wait_time = 5