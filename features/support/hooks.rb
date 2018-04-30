# hooks to be run before and after each scenario
#Before do |scenario|
#   ILogger.info("starting scenario #{scenario.name}")
#   LoginPage.login
#end

After do |scenario|
 if scenario.failed?
   #page.driver.browser.save_screenshot
   encoded_img = page.driver.browser.screenshot_as(:base64)
   embed("data:image/png;base64,#{encoded_img}",'image/png')
 end
  page.driver.quit
  #FileUtils.rm_rf Dir.glob("#{$download_folder}/**/*")
  ILogger.info("Ending scenario #{scenario.name}")
end


Before do |scenario|
  # page.driver.options[:resynchronize] = false
  ILogger.info("Beginning scenario #{scenario.name}")
  browser = Capybara.current_session.driver.browser
  browser.manage.delete_all_cookies
  # browser.manage.window.maximize
  @app = App.new
end

