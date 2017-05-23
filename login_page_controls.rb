module LoginPageControls

  def username_text_field
    browser.find_element(:id => "username" )
  end

  def login_button
    browser.find_element(:id => "login" )
  end

  def title_section
    browser.find_element(:id => "title")
  end	

  def error_section
    browser.find_element(:id => "page_body")

  end	

end