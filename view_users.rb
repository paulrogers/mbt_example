require_relative 'login_page'
require_relative 'create_users_page'

class ViewUsers < Model::WebNode

  transition :logout , :goes_to => :LoginPage 
  transition :create_user , :goes_to => :CreateUserPage

  def logout
    browser.find_element(:id => "logout").click
  end	

  def create_user
    browser.find_element(:id => "create_user").click
  end	

  def list_users
  	all = []
    list_parent = browser.find_element(:id => "users_list")
    items = list_parent.find_elements( :tag_name => "li")
    items.each do |li|
    	all << li.text
    end
    return all	
  end	

  def on_page?
    list_label = browser.find_element(:id => "user_list_label")
    if ( list_label.displayed? and list_label.text.match(/Users list:/) )
      puts list_users.inspect
      return true
    end
    return false	
  end

  def created?
    if on_page?
      if browser.find_element(:class => "alert").text.strip == "User '#{$new_user}' created."
        return true
      end  
    end
    return false  
  end  

end