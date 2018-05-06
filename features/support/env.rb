# Screen shot config info:
# https://github.com/mattheworiordan/capybara-screenshot/blob/master/lib/capybara-screenshot.rb

require "selenium-webdriver"
require 'capybara'
require 'capybara/cucumber'
require 'capybara/poltergeist'           # for headless
require 'capybara-screenshot/cucumber'   # screenshots
require "./features/support/ILogger"
require 'site_prism'
$download_folder = File.expand_path(File.join(File.path(__dir__),"../../downloads"))


path=File.expand_path(File.join(File.path(__dir__),"/../../config/MetaMask_v4.1.2.crx"))

caps = Selenium::WebDriver::Remote::Capabilities.chrome({'chromeOptions' => {'extensions' => [Base64.strict_encode64(File.open(path,'rb').read)]}})

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome, :desired_capabilities => caps)
end

Capybara.default_driver = :chrome

Capybara::Screenshot.register_driver(:chrome) do |driver, path|
  driver.browser.save_screenshot(path)
end

#Capybara::Screenshot.webkit_options = { width: 320, height: 420 }
#  using :keep_last_run is deleting result.html
 Capybara::Screenshot.prune_strategy = { keep: 1}       # OR :keep_last_run

# Driver config
Capybara.default_max_wait_time = 60
Capybara.save_path = "./results"
Capybara::Screenshot.autosave_on_failure = true


# Set default driver
# headless using poltergeist -- requires phantomjs installed on test runner

default_browser = (ENV['browser'] || 'chrome').to_sym
if default_browser == 'poltergeist' then
  Capybara.default_driver = Capybara.javascript_driver = :poltergeist
else
  Capybara.default_driver = default_browser
end

#include Capybara::DSL
config = YAML.load_file('./config/env_config.yml')
$test_env = ENV['env']

begin
#  $test_env ||= 'QA'
#  env = $test_env.to_s
#  BASE_URL =  config[env]['url']

# BASE_URL = "https://tlc-stage.herokuapp.com/account/login"  # STAGE
# BASE_URL = "https://tlc-rc.herokuapp.com/account/login"      # RC
 BASE_URL = "https://tlc-testnet.wetrust.io/account/login"    # TestNet

#USER_NAME = Base64.decode64( config[env]['user'])
#  PASSWORD =  Base64.decode64( config[env]['password'])
rescue
  ILogger.error("env variable is set as #{$test_env} which is invalid , please select QA, DEV or PROD")
  raise "invalid environment!!"
end


path = File.expand_path(File.join(File.path(__dir__),"/../../config/user_details.yml"))
user_details = YAML.load(File.open(path))

$org_wallet_phase = user_details["organizer_details"]["walletseed_phase"]
$org_wallet_password = user_details["organizer_details"]["password"]
$org_wallet_cnfm_password = user_details["organizer_details"]["confirm_password"]
$org_wallet_key = user_details["organizer_details"]["key_private"]

$prpnt_wallet_phase = user_details["participant_details"]["walletseed_phase"]
$prpnt_wallet_password = user_details["participant_details"]["password"]
$prpnt_wallet_cnfm_password = user_details["participant_details"]["confirm_password"]
$prpnt_wallet_key = user_details["participant_details"]["key_private"]

