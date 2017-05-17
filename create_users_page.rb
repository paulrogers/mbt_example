class CreateUserPage < Model::WebNode

  transition :logout , :goes_to => :LoginPage
  transition :view_users ,:goes_to => :ViewUsers


  def logout
    browser.find_element(:id => "logout").click
  end	

  def view_users
    browser.find_element(:id => "users").click
  end	

  def on_page?
    title = browser.find_element(:id => "title")
    ( title.displayed and title.match(/Create User/) )
  end	

end