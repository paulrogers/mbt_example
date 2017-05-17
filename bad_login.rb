class BadLogin < Model::WebNode

  transition :goto_login , :goes_to => :LoginPage

  include LoginPageControls

  def goto_login
    browser.find_element(:id => "logout").click
  end	

  def on_page?
    title_section.displayed? and title_section.text == "Username was incorrect."
  end	
end