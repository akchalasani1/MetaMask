
class CreatecirclePage < BasePage

  set_url BASE_URL

     element   :new_circle,                  :xpath, "//button[text() = 'New Circle']"
     element   :rndm_circle,                 :xpath, "//div[text()='Random']"
     element   :predet_circle,               :xpath, "//div[text()='Pre-determined']"
     element   :aucn_circle,                 :xpath, "//div[text()='Auction']"

     element   :name_circle,                 :xpath, "//div[text() = 'What would you like to name it?']//following-sibling::input"
     element   :cntribton_freq_dly,          :xpath, "//label[text()= 'Daily']"
     element   :cntribton_freq_wkly,         :xpath, "//label[text()= 'Weekly']"
     element   :cntribton_freq_mntly,        :xpath, "//label[text()= 'Monthly']"

     element   :crncy_dropdown,              :xpath, "//div[contains(@class, 'currencyContainer')]"
     # elements because it is a list
     elements  :crncy_type_select,           :xpath, "//div[contains(@class, 'dropdownList')]//span"
     element   :enter_amount,                :xpath, "//input[@type = 'number']"
     element   :btn_next,                    :xpath, "//button[text() = 'Next']"

     element   :add_ptcpnt,                  :xpath, "//div[text() = '+ Add Participant']"
     element   :title_crcl,                  :xpath, "//div[contains(@class, 'roscaItemTitle')]/h3"
     element   :fst_name,                    :xpath, "//input[@id = 'firstname']"
     element   :lst_name,                    :xpath, "//input[@id = 'lastname']"
     element   :e_mail,                      :xpath, "//input[@id = 'email']"
     element   :btn_add,                     :xpath, "//button[text() = '+ ADD']"
     element   :mem_next_btn,                :xpath, "//button[text() = 'NEXT']"

     element   :terms_chkbox,                :xpath, "//i[text() = 'check_box_outline_blank']"
     element   :crct_crcl,                   :xpath, "//button[text() = 'CREATE CIRCLE']"
     element   :crcl_crtd,                   :xpath, "//div[text()='Your circle was created']"
     element   :btn_grid,                    :xpath, "//div[@class='sandwich-expando']"
     element   :lnk_lg_out,                  :xpath, "//li[text()='Log Out']"
     # elements because it is a list
     elements  :btn_acpt,                    :xpath, "//button[text()='ACCEPT']"
     elements  :btn_dply,                    :xpath, "//button[text()='DEPLOY']"

     #element  :btn_arrow_up,                 :xpath, "%Q{(//img[contains(@src, '/img/arrow-up.svg')]) [1]}"
     #element  :btn_arrow_up,                 :xpath, "//img[contains(@src, '/img/arrow-up.svg')]"

     element  :btn_lnch_metamsk,             :xpath, "//button[text()='Yes, launch MetaMask to deploy circle']"
     element  :btn_sbt,                      :xpath, "//input[@class ='confirm btn-green']"
     elements :btn_pay,                      :xpath, "//button[text()='PAY']"
     element  :btn_sign_pymt_lnch_metamsk,   :xpath, "//button[text()='Launch MetaMask to sign payment']"


  def select_circle_type(circle_type)
         new_circle.click
         if circle_type == "Random"
           rndm_circle.click
         elsif circle_type == "Pre-Determined"
           predet_circle.click
         elsif circle_type == "Auction"
           aucn_circle.click
         end
       end


       def enter_crcl_name

         # CIRCLE NAME NEED TO BE CREATED USING CURRENT DATE. ********
         t=Time.now
         current_month = t.strftime("%b")
         current_date = t.strftime("%d")
         current_hour = t.strftime('%H')
         current_minutes = t.strftime("%M")
         $crcl_name = + "AUTO-" +current_month + current_date + "-" + current_hour + ":" + current_minutes
         #puts crcl_name
         self.name_circle.set $crcl_name  #circle_name
       end


       def select_cntrbn_frq(frequency)
         if frequency == "daily"
           cntribton_freq_dly.click
         elsif frequency == "weekly"
           cntribton_freq_wkly.click
         elsif frequency == "monthly"
           cntribton_freq_mntly.click
         end
       end


       def contribution_amount(crncy_type, amount)
         crncy_dropdown.click
         crncy_type_select.each do |currency_type|
           if currency_type.text == crncy_type
             currency_type.click
             enter_amount.set amount.to_f
           elsif currency_type.text == crncy_type
             currency_type.click
             enter_amount.set amount.to_f
           end
         end
         sleep 1
         btn_next.click
       end

        def add_participant
          self.add_ptcpnt.click
          self.fst_name.set "A"
          self.lst_name.set "K"
          self.e_mail.set "anil+12@wetrust.io"
          self.btn_add.click
          self.mem_next_btn.click
        end

        def term_condi
          self.terms_chkbox.click
          self.crct_crcl.click
          sleep 3
        end

       def user_signout
         self.btn_grid.click
         sleep 2
         self.lnk_lg_out.click
         sleep 3
       end

        def accept_all_circles

            sleep 3
            #self.btn_arrow_up.click
            sleep 3
          btn_acpt.each do |accpt|

            sleep 3
             puts "title_crcl: #{title_crcl.text}"
            # puts "$crcl_name: #{$crcl_name}"
            if title_crcl.text == $crcl_name
              puts "I AM IN"
              puts "title_crcl: #{title_crcl.text}"
              puts "$crcl_name: #{$crcl_name}"
              accpt.click
              break
            end
          end
        end

        def dply_circle
          sleep 3
          btn_dply.each do |deploy|
            sleep 3
            deploy.click
            sleep 3
          end
        end

        def review_crcl
          self.btn_lnch_metamsk.click
          sleep 3
          window = page.driver.browser.window_handles
          page.driver.browser.switch_to.window(window.last)
          page.driver.browser.navigate.refresh
          sleep 3
          self.btn_sbt.click
          sleep 3
          page.driver.browser.switch_to.window(window.first)
        end

        def pay_crcl
          sleep 3
          btn_pay.each do |pay_circle|
            sleep 3
            pay_circle.click
            sleep 3
            self.btn_sign_pymt_lnch_metamsk.click

            window = page.driver.browser.window_handles
            page.driver.browser.switch_to.window(window.last)
            page.driver.browser.navigate.refresh
            sleep 3
            self.btn_sbt.click
            sleep 3
            page.driver.browser.navigate.refresh
            sleep 3

            if btn_sbt == "confirm btn-green"
              btn_sbt.click
              puts "cool"
            elsif
              btn_sbt.click
              puts "nice"
            end

            page.driver.browser.switch_to.window(window.last)
          end
        end
 end
