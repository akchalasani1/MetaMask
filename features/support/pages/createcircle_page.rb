class CreatecirclePage < BasePage

  #set_url BASE_URL

  element   :new_circle,                  :xpath, "//button[text() = 'New Circle']"
  element   :rndm_circle,                 :xpath, "//div[text()='Random']"
  element   :predet_circle,               :xpath, "//div[text()='Pre-determined']"
  element   :aucn_circle,                 :xpath, "//div[text()='Auction']"

  element   :name_circle,                 :xpath, "//div[text() = 'What would you like to name it?']//following-sibling::input"
  element   :cntribton_freq_dly,          :xpath, "//label[text()= 'Daily']"
  element   :cntribton_freq_wkly,         :xpath, "//label[text()= 'Weekly']"
  element   :cntribton_freq_mntly,        :xpath, "//label[text()= 'Monthly']"

  element   :crncy_dropdown,              :xpath, "//div[contains(@class, 'currencyContainer')]"
  # elements because it is clickable on multiple same name items.
  elements  :crncy_type_select,           :xpath, "//div[contains(@class, 'dropdownList')]//span"
  element   :enter_amount,                :xpath, "//input[@type = 'number']"
  element   :btn_next,                    :xpath, "//button[text() = 'Next']"

  element   :add_ptcpnt,                  :xpath, "//div[text() = '+ Add Participant']"
  elements  :title_crcl,                  :xpath, "//div[contains(@class, 'roscaItemTitle')]/h3"
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
  # elements because it is clickable on multiple same name items.
  elements  :btn_acpt,                    :xpath, "//button[text()='ACCEPT']"
  elements  :btn_dply,                    :xpath, "//button[text()='DEPLOY']"
  elements  :crcl_frmd,                   :xpath, "//img[@alt = 'Circle Formed']"

  element   :actv_crcl,                   :xpath, "//h2[text()='Active']"
  element   :pndg_crcl,                   :xpath, "//h2[text()='Pending']"
  element   :cmplt_crcl,                  :xpath, "//h2[text()='Completed']"
  element   :dplyg_btn,                   :xpath, "//button[text()='DEPLOYING'] "


  element  :btn_acpt_invt,                :xpath, "//button[text()='ACCEPT INVITE']"
  element  :btn_lnch_metamsk,             :xpath, "//button[text()='Yes, launch MetaMask to deploy circle']"
  element  :btn_sbt,                      :xpath, "//input[@class ='confirm btn-green']"
  elements :btn_pay,                      :xpath, "//button[text()='PAY']"
  element  :btn_sign_pymt_lnch_metamsk,   :xpath, "//button[text()='Launch MetaMask to sign payment']"

  element  :no_pndg_crcl,                 :xpath, "//div[text()='You have no pending circles.']"
  elements :btn_strt_rnd2,               :xpath, "//button[text()='START ROUND 2']"
  element  :no_btn,                       :xpath, "//div[text()='All participants must accept their invites before the Lending Circle can be started.']"




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
    has_btn_next?
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
    #puts "Organizer Created Circle Name: #{$crcl_name}"
    sleep 3

    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet :name => 'Circle_Details'

    url = URI.parse(current_url)
    #puts "#{url}"
    test = url.to_s.split('/')
    #puts test.last
    code = test.last.split('?')
    uniq_id = code.first

    sheet1.row(0).push "#{uniq_id}" # array variable name

    book.write 'Zrcl_test.xls'

  end

  def user_signout
    self.btn_grid.click
    sleep 2
    self.lnk_lg_out.click
    sleep 3
  end

  def accept_circle
    book = Spreadsheet.open('Zrcl_test.xls')
    sheet1 = book.worksheet('Circle_Details') # can use an index or worksheet name
    sheet1.each do |row|
       if !(row[0].nil?)
         #puts "row #{row[0]}"
         @id = row[0]
         #puts "ID: #{@id}"

       end
    end

    crcl_pndg_page = "https://tlc-testnet.wetrust.io/roscas/pending/#{@id}"
    #puts "crcl_pndg_page: #{crcl_pndg_page}"
    page.driver.visit crcl_pndg_page
    sleep 10
    has_terms_chkbox?
    self.terms_chkbox.click
    sleep 3
    self.btn_acpt_invt.click
    sleep 5

  end


  def dply_circle
    crcl_pndg_page = "https://tlc-testnet.wetrust.io/roscas/pending/#{@id}"
    #puts "crcl_pndg_page: #{crcl_pndg_page}"
    page.driver.visit crcl_pndg_page
    sleep 10
    page.find(:xpath,"(//button[text()='DEPLOY'])").click
    sleep 3

  end

  def review_crcl
    sleep 2
    has_btn_lnch_metamsk?
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

    crcl_pndg_page = "https://tlc-testnet.wetrust.io/roscas/pending/#{@id}"
    #puts "crcl_pndg_page: #{crcl_pndg_page}"
    page.driver.visit crcl_pndg_page

    # time = 0
    #puts "#{page.has_xpath?("//button[text()='PAY']")}"
    until (page.has_xpath?("//button[text()='PAY']"))   #until with flag
     # puts "InSide"
      # sleep time
      page.driver.browser.navigate.refresh
      # time+=3
      # break if time == 60
    end

      sleep 3
      page.find(:xpath,"(//button[text()='PAY'])").click
      sleep 5
      self.btn_sign_pymt_lnch_metamsk.click

      window = page.driver.browser.window_handles
      page.driver.browser.switch_to.window(window.last)
      page.driver.browser.navigate.refresh
      sleep 3
      self.btn_sbt.click
      sleep 3
      page.driver.browser.navigate.refresh
      sleep 3


      if page.has_xpath?("//input[@class ='confirm btn-green']")
         self.btn_sbt.click
      end

      page.driver.browser.switch_to.window(window.last)
      sleep 3
    #end
  end
end
