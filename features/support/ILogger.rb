require 'Log4r'
#require 'log4r/formatter/patternformatter.rb'
class ILogger
  
 def self.log
    if @logger.nil?
       @logger = Log4r::Logger.new('Metamask Application')
       @logger.outputters << Log4r::Outputter.stdout
       @logger.outputters << Log4r::FileOutputter.new(
                   'MetamaskTest',
                   :filename =>  'results/Metamask.log',
                   :formatter => Log4r::PatternFormatter.new(:pattern => "%d %l %m \n" ),
                   :trunc => false)
    end
    @logger   
end

def self.info(msg)
  self.log.info(msg)
end

def self.error(msg)
  self.log.error(msg)   
end


end