require 'base64'
require 'yaml'
require 'date'
module Utils
  
  def self.generate_new_password
    #increment the numeric part of the password
    current_password = PASSWORD
    base = current_password.split('#')[0]
    num = current_password.split('#')[1].to_i
    num = num + 1
    new_password =  base + '#'+ num.to_s   
    return new_password   
 end
   
 def self.update_password_in_config(new_password)
   # read config data from the file.
   config = YAML.load_file('./config/env_config.yml')
   new_config = config
   # add encoded new password to the new config data structure
   encoded_new_password = Base64.encode64(new_password)   
   new_config[$test_env]['password'] = encoded_new_password
   # remove the new line character added to the encoded values
   # as this is creating a new line while writing to file.  
   new_config.each_value do |env_details|
      env_details.each_pair do |k,v|
       # skip if url , as its not encoded
       next if k == 'url'
       env_details[k] = v.gsub("\n", "").gsub("==","").strip
      end  
   end    
   # write new config data to the file
   File.open('./config/env_config.yml', 'w')  do |out|
      YAML.dump(new_config, out)
    end   
 end 
 
 def self.decode(str)
   return Base64.decode64(str)
 end 
 
 def self.encode(str)
   return Base64.encode64(str)
 end  
 
 def self.get_downloaded_travelers_list
    Timeout.timeout(20) do
       sleep 2 until Dir["#{$download_folder}/*"].grep(/\.csv$/).any?
    end   
    require "csv"
     downloaded_travelers =[]
     begin
       files =  Dir.glob("#{$download_folder}/**/*.csv")
       downloaded_file = files[0]
       ILogger.info("downloaded file is " + downloaded_file)
       CSV.foreach(downloaded_file) do |row|
        ILogger.info(row)
        break if row[0].eql? nil
        downloaded_travelers << row[0]
       end
       if downloaded_travelers.length > 0
         k =  downloaded_travelers.index('Traveler')
         return downloaded_travelers.slice(k+1,downloaded_travelers.length-1)
       else
          raise "no downloaded travelers"
       end   
     rescue =>e
      ILogger.error(e)
      return []
    end   
 end

  def self.ijet_format(text)
     time_stamp = Time.now.utc
     return "#{time_stamp} : TWIC Func Test: #{text}"
  end  

  def self.wait_for_csv_download(time_out, download_dir)
    Timeout.timeout(time_out) do
          sleep 2 until Dir["#{download_dir}/*"].grep(/\.csv$/).any?
     end 
  end
  
  
  def self.read_recipients_report 
    wait_for_csv_download(20, $download_folder )
    require "csv"
    downloaded_recipients =[]
    begin      
       files =  Dir.glob("#{$download_folder}/**/*.csv")
       downloaded_file = files[0]
       ILogger.info("downloaded file is " + downloaded_file)
       CSV.foreach(downloaded_file) do |row|
        ILogger.info(row)
        break if row[0].eql? nil
        downloaded_recipients << row[0] + ", " + row[1]
       end
       downloaded_recipients.delete_at(0)
       return downloaded_recipients
     rescue =>e
      ILogger.error(e)
      return []
    end  
  end
    
  def self.get_past_date( no_of_days_ago )
    require 'date'    
    days_ago = Date.today - no_of_days_ago.to_i  
    puts days_ago  
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
  
  def self.wait_for_gif_file_to_download(time_out = 20)
    begin
    Timeout.timeout(time_out) do
        sleep 2 until Dir["#{$download_folder}/*"].grep(/\.gif$/).any?
     end
    rescue
      ILogger.info("waited for file to download for a #{time_out} seconds")
    end   
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

end