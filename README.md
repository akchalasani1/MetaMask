=-# Functional Tests

## Introduction

Tests for WeTrust


## Project Layout

    features/*.feature : cucumber features
    ../step_definitions:
    ../support/env.rb : configures the driver and other environment options

## Prerequisites

*   Ruby http://www.ruby-lang.org/en/downloads/; see (Gemfile) for Ruby version and run `ruby --version` to verify
*   Ruby Gems http://rubygems.org/

## Configuration

### First time

Windows: 

1.	Please have administrative rights to the computer/virtual machine/node. 

1.	Install Browsers (Firefox, Chrome, etc.) Ensure Browsers are able to reach test sites

1.	Install Ruby 2.3.1 X64 for windows http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.3.1-x64.exe

1.	Down and install devkit for windows http://dl.bintray.com/oneclick/rubyinstaller/DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe

1.	In command prompt, navigate to devkit installation folder and execute the following commands 
	1.	ruby dk.rb init: Config.yml is updated with the installed ruby path. If the line - <ruby installation path> in unavailable in the file then manually add it
	2.	ruby dk.rb review: Tells  you if the config.yml is set up properly
	3.	ruby dk.db install: Devkit is configured for the installed ruby version
	
1.	Download the latest ruby gems from https://rubygems.org/rubygems/rubygems-2.6.7.zip: update the existing ruby gems

1.	In command prompt, navigate to the ruby gems folder and run the following command: ruby setup.rb	This Updates the ruby gems

1.	Install the bundler by using the following command: gem –install bundler	This Installs the bundler for future use

1.	Get the latest test automation project to a work place in the computer	The test automation project is ready to be executed from this location

1.	In command prompt navigate to the root folder of the test automation project and execute the following command: bundle install	The gems required to execute the test automation project are installed

1.	In command prompt navigate to the root folder of the test automation project and execute the following command: rake	Test automation will execute. By default the web driver is set to Firefox. 
 
 
OS X:

1. Install Chrome and Firefox

1. Install test drivers:

```
    $ brew install chromedriver
    $ brew install geckodriver
```

### First time and for every new update to Gemfile or Gemfile.lock
This installs the bundler gem and runs `bundle install --path .bundle`

    $ ./setup.sh
    
If you're using a Mac and `setup.sh` runs into an issue compiling the `nokogirl` library then you may need to uninstall the `xz` library by running `brew uninstall xz` (see https://github.com/sparklemotion/nokogiri/issues/1483)

## Running

### Set your test user credentials

 *  Edit `config/env_config.yml`
 *  user and password values are base64 encoded Username and password.
  

### To run all features on QA Environment:

    $ bundle exec rake
          or+
    $ bundle exec rake env=QA  
    
### To run all features on Prod or Dev Environmnet:
*   update the URL, User and Password details in 'features/support/config.yml`
```
    $ bundle exec rake env=DEV
    $ bundle exec rake env=PROD
```
### To run a specific browser (firefox, chrome or poltergeist) defaults to firefox:

    $ bundle exec rake browser=chrome

### To run a specific feature:

    $ bundle exec cucumber features/employee_locator.feature

### Reports
*   The report for the current execution is generated in the folder `.\results`
   
## Debugging

 1. `bundle exec rake --trace`

## Password reset for Agent Users feature(yet to be tested..)
 
*   Run the  reset_password.feature when test user password expires or in grace period.
 
  	`$ bundle exec cucumber features/reset_password.feature`
                    or
  	`$ bundle exec cucumber --tags @reset_password`
 
*   This script also updates env_config.yml file with the new password.
 
*   So commit the file `config/env_config.yml` to the Git repo, once the password is reset.

## Test Automation Development(examples to be added)

* Feature File: This is where we author our test scenarios, 

1. Each feature file should have only one feature and can have multiple scenarios.
1. Each scenario shall have a tag name that matches Jira ticket no containing that scenario.

* Step definition file: This is where the definitions of steps written in feature file exist.

1. The steps should contain workflows that use page object functions
     
* Page Objects:  All pages in Application are mapped to page objects in Test automation framework

1. Create a new page class for each new page in the application.
1. All page classes must extend BasePage Class.
1. Define element locators at the top of the class, by passing arguments to element method
1. The frames in the page are modelled as a seperate page
1. Page Objects should have functions that reflect user actions on page
1. Do not put validations in page objects instead create predicate methods that return true or false.
1. update app class when a new page is added.
 
## Additional Documentation

*   http://cukes.info (for general cucumber information)
*   http://github.com/jnicklas/capybara (for actions such as click_link,
    click_button, etc...)
# Platform
