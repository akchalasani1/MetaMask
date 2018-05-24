
class LoginPage < BasePage


     element   :choose_network,              :xpath, ".//div[@class='network-name']"

     # elements because it is clickable on multiple same name items.
     elements  :network_name,                :xpath, "//li[@class='dropdown-menu-item']"
     element   :btn_accept,                   :xpath, "//button[text() = 'Accept']"

     element   :wallet_seed,                 :xpath, "//textarea[@placeholder='Enter your secret twelve word phrase here to restore your vault.']"
     element   :termsOfUse,                  :xpath, "//div[@class='notice-box']//a[text()='Terms of Use']"
     element   :link_import_existing_DEN,    :xpath, "//p[text()='Import Existing DEN']"
     element   :new_password,                :xpath, "//input[@id='password-box']"
     element   :confirm_password,            :xpath, "//input[@id='password-box-confirm']"
     element   :btn_ok,                      :xpath, "//button[text() = 'OK']"

     element   :click_user_icon,             :xpath, "//div[@class='cursor-pointer color-orange accounts-selector']"
     element   :import_user,                 :xpath, "//span[text()='Import Account']"
     element   :prvt_key,                    :xpath, "//input[@id='private-key-box']"
     element   :btn_import,                  :xpath, "//button[text()='Import']"
     element   :btn_metamask,                :xpath, "//button[text()='METAMASK LOG IN']"
     element   :sign_message_button,         :xpath, "//button[text()='Sign']"

     element   :ptcpnt_login,                :xpath, "//p[text()='Restore from seed phrase']"

      def access_metamask
        #visit(BASE_URL)
        app_invoke
        window = page.driver.browser.window_handles
        #puts"window.size: #{window.size}"
        if window.size > 1
          page.driver.browser.switch_to.window(window.last)
          page.driver.visit 'chrome-extension://nkbihfbeogaeaoehlefnkodbefgpgknn/popup.html'
        end
      end

     def select_network(networkName, walseed, pswd, confpwd, keyprvt)

       choose_network.click
       has_network_name?
       sleep 1
       network_name.each do |network|
         if network.text == networkName
           ILogger.info("network:#{network.text}")
           network.click
           break
         end
       end

       click_button 'Accept' # click_button has in built sleep
       #btn_accept.click
       has_termsOfUse?  # waiting to get displayed
       termsOfUse.click

       window = page.driver.browser.window_handles
       page.driver.browser.switch_to.window(window.last)
       page.driver.browser.close
       window = page.driver.browser.window_handles
       page.driver.browser.switch_to.window(window.last)
       btn_accept.click
       link_import_existing_DEN.click

       self.wallet_seed.set walseed
       self.new_password.set pswd
       self.confirm_password.set confpwd
       has_btn_ok?
       btn_ok.click
       has_click_user_icon?
       sleep 1
       click_user_icon.click
       sleep 1
       has_import_user?
       import_user.click
       self.prvt_key.set keyprvt
       btn_import.click
       sleep 3
       page.driver.browser.switch_to.window(window.first)
       has_btn_metamask?
       btn_metamask.click
       sleep 3
       page.driver.browser.switch_to.window(window.last)
       page.driver.browser.navigate.refresh
       sleep 3
       has_sign_message_button?
       sign_message_button.click
       page.driver.browser.switch_to.window(window.first)
     end

     def user_select_network(networkName, walseed, pswd, confpwd, keyprvt)
       has_ptcpnt_login?
       ptcpnt_login.click
       self.wallet_seed.set walseed
       self.new_password.set pswd
       self.confirm_password.set confpwd
       has_btn_ok?
       btn_ok.click
       has_click_user_icon?
       sleep 1
       click_user_icon.click
       sleep 1
       has_import_user?
       import_user.click
       self.prvt_key.set keyprvt
       btn_import.click
       sleep 3
       window = page.driver.browser.window_handles
       page.driver.browser.switch_to.window(window.first)
       sleep 5
       has_btn_metamask?
       btn_metamask.click
       sleep 5
       page.driver.browser.switch_to.window(window.last)
       page.driver.browser.navigate.refresh
       sleep 5
       has_sign_message_button?
       sign_message_button.click
       page.driver.browser.switch_to.window(window.first)
       sleep 3
     end
 end
