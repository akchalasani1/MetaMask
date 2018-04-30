
class LoginPage < BasePage

     set_url BASE_URL

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
        visit(BASE_URL)
        window = page.driver.browser.window_handles
        #puts"window.size: #{window.size}"
        if window.size > 1
          page.driver.browser.switch_to.window(window.last)
          page.driver.visit 'chrome-extension://nkbihfbeogaeaoehlefnkodbefgpgknn/popup.html'
        end
      end

     def select_network(networkName, walseed, pswd, confpwd, keyprvt)

       choose_network.click
       sleep 3
       ILogger.info("networkName:#{networkName}")
       network_name.each do |network|
         ILogger.info("network:#{network.text}")
         if network.text == networkName
           network.click
           break
         end
       end

       #sleep 3
       btn_accept.click
       #sleep 3
       termsOfUse.click
       #sleep 3
       window = page.driver.browser.window_handles
       #sleep 3
       page.driver.browser.switch_to.window(window.last)
       #sleep 3
       page.driver.browser.close
       #sleep 3
       window = page.driver.browser.window_handles
       #sleep 3
       page.driver.browser.switch_to.window(window.last)
       #sleep 3
       btn_accept.click
       #sleep 3
       link_import_existing_DEN.click
       #sleep 3

       self.wallet_seed.set walseed
       #sleep 3
       self.new_password.set pswd
       #sleep 3
       self.confirm_password.set confpwd
       sleep 3
       btn_ok.click
       sleep 2
       click_user_icon.click
       sleep 2
       import_user.click
       sleep 2
       self.prvt_key.set keyprvt
       btn_import.click
       page.driver.browser.switch_to.window(window.first)
       sleep 3
       btn_metamask.click
       page.driver.browser.switch_to.window(window.last)
       page.driver.browser.navigate.refresh
       sleep 3
       sign_message_button.click
       page.driver.browser.switch_to.window(window.first)
       sleep 3
     end

     def user_select_network(networkName, walseed, pswd, confpwd, keyprvt)
       ptcpnt_login.click
       self.wallet_seed.set walseed
       #sleep 3
       self.new_password.set pswd
       #sleep 3
       self.confirm_password.set confpwd
       sleep 3
       btn_ok.click
       sleep 2
       click_user_icon.click
       sleep 2
       import_user.click
       #sleep 3
       self.prvt_key.set keyprvt
       btn_import.click
       sleep 3
       window = page.driver.browser.window_handles
       page.driver.browser.switch_to.window(window.first)
       sleep 5
       btn_metamask.click
       sleep 5
       page.driver.browser.switch_to.window(window.last)
       page.driver.browser.navigate.refresh
       sleep 5
       sign_message_button.click
       page.driver.browser.switch_to.window(window.first)
       sleep 5
     end
 end
