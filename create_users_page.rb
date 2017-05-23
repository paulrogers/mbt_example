class CreateUserPage < Model::WebNode

  transition :logout , :goes_to => :LoginPage
  transition :view_users ,:goes_to => :ViewUsers
  transition :create_user , :goes_to => :ViewUsers , :verification_method => :created?

  def logout
    browser.find_element(:id => "logout").click
  end	

  def view_users
    browser.find_element(:id => "users").click
  end	

  def create_user( name = nil)
    if name.nil?
      name = Time.now.to_i.to_s
    end
    $new_user = name
    browser.find_element(:id => "username").send_keys name
    browser.find_element(:id => "create").click
  end  

  def on_page?
    title = browser.find_element(:id => "title")
    ( title.displayed? and title.text.match(/Create User/) )
  end	

end