require_relative 'login_page_controls'
require_relative 'main_page'

class LoginPage < Model::WebNode

  transition :bad_login , :goes_to => :BadLogin
  transition :login , :goes_to => :MainPage

  has_url "/"

  include LoginPageControls

  def bad_login
    login( Time.now.to_i.to_s )
  end

  def login( name = nil )
  	name = "test " unless name  # the space on the login field messes us up a bit
    username_text_field.send_keys( name )
    login_button.click
  end


  def on_page?
    title_section.displayed? and title_section.text == "Login"

  end	
end