# see http://bundler.io/gemfile.html

source "https://rubygems.org"

ruby '2.4.2'

  group(:test) do
  # ruby make
  gem 'rake','~>11.3'

  # bdd and test framework
  gem 'cucumber','~>2.4'
  gem 'rspec','~>3.5'

  # underlying browser driver
  gem 'selenium-webdriver','~>2.53.4'

  # testing dsl and other features over the webdriver
  gem 'capybara','~>2.10'

  # screenshots
  gem 'capybara-screenshot','~>1.0'

  # headless testing -- requires phantomjs
  gem 'poltergeist','~>1.11'

  # guard utility
  gem 'guard','~>2.14'
  gem 'guard-rake','~>1.0'   # allows running rake in Guardfile

  # logger
  gem 'log4r','~>1.0'

  # excel parser
  gem 'roo', '~> 2.5', '>= 2.5.1'

  #  page object model pattern
  gem 'site_prism', '~> 2.9'


end
