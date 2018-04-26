class App
  include Capybara::DSL
  def initialize
    @pages = {}
  end

  # all application pages are to be instantiated here
  def base_page
    @pages[:base_page] || BasePage.new
  end

  def login
    @pages[:login] ||= LoginPage.new
  end

  def createcircle
    @pages[:createcircle] ||= CreatecirclePage.new
  end

end
