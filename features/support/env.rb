BASE_URL = "http://www.etsy.com/"

require 'watir-webdriver'
require 'page-object'
require 'page-object/page_factory'

$: << File.dirname(__FILE__)+'/../../lib'

require 'pages.rb'

World PageObject::PageFactory

driver = (ENV['WEB_DRIVER'] || :firefox).to_sym
client = Selenium::WebDriver::Remote::Http::Default.new
client.timeout = 180
  
browser = Watir::Browser.new driver, :http_client => client

Before { @browser = browser }

After do |scenario|
  Dir::mkdir('screenshots') if not File.directory?('screenshots')
  screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
  if scenario.failed?
    @browser.driver.save_screenshot(screenshot)
    embed screenshot, 'image/png'
  end
end

at_exit { browser.close }