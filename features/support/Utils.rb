require 'base64'
require 'yaml'
require 'date'
module Utils

  def self.get_past_date( no_of_days_ago )
    require 'date'
    days_ago = Date.today - no_of_days_ago.to_i
    #puts days_ago
    year = days_ago.to_s.split('-')[0].to_i
    mon = days_ago.to_s.split('-')[1].to_i
    day = days_ago.to_s.split('-')[2].to_i
    calendar_months = ['January', 'February', 'March', 'April', 'May', 'June','July','August', 'September','October', 'November','December' ]
    past_date = {}
    past_date[:day] = day
    past_date[:month] = mon
    past_date[:year] = year
    return past_date
  end

  def self.get_month_diff(month1, month2)
    calendar_months = ['January', 'February', 'March', 'April', 'May', 'June','July','August', 'September','October', 'November','December' ]
    return (calendar_months.index(month1) - calendar_months.index(month2)).abs
  end

  def self.get_month_index(month)
    calendar_months = ['January', 'February', 'March', 'April', 'May', 'June','July','August', 'September','October', 'November','December' ]
    return calendar_months.index(month) + 1
  end


  def self.get_today_date
    DateTime.now.to_date
  end

  def self.parse_date_from_string(date_string)
    Date.parse(date_string)
  end

  def self.wait_for_time(time_in_sec)
    sleep(time_in_sec)
  end

  def scroll_to(element)
    script = <<-JS
      arguments[0].scrollIntoView(true);
    JS

    Capybara.current_session.driver.browser.execute_script(script, element.native)
  end

end
