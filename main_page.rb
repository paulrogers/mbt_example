require_relative "login_page"

class MainPage < Model::WebNode

  transition :logout , :goes_to => :LoginPage
  transition :view_users , :goes_to => :ViewUsers

  def logout
    browser.find_element(:id => "logout").click
  end	

  def view_users
    browser.find_element(:id => "users").click
  end	

  def on_page?
    message_span = browser.find_element(:id => "message")
    ( message_span.displayed? and message_span.text.match(/You are now signed in/ )  )
  end	
end