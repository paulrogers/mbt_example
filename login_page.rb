require_relative 'login_page_controls'
require_relative 'main_page'

class LoginPage < Model::WebNode

  transition :bad_login , :goes_to => :BadLogin
  transition :login , :goes_to => :MainPage
  transition :login_with_created_user , :goes_to => :MainPage , :if => :any_users_created?

  has_url "/"

  include LoginPageControls

  def bad_login
    login( "bad_" + Time.now.to_i.to_s )
  end

  def any_users_created?
    $new_users.length > 0
  end

  def login_with_created_user
    login( $new_users.sample )
  end  

  def login( name = nil )
    if name.nil?
  	  name = [ " test "  , "alpha"].sample   # the space on the login field messes us up a bit
    end
    puts "login with #{name}"
    username_text_field.clear
    username_text_field.send_keys( name )
    login_button.click
  end


  def on_page?
    title_section.displayed? and title_section.text == "Login"

  end	
end