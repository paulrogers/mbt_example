require 'model'
require 'fileutils'
require 'selenium-webdriver'

def browser
	$browser
end	

$browser = Selenium::WebDriver.for(:firefox )

$new_users = []

require_relative "login_page_controls"
require_relative "create_users_page"
require_relative "bad_login" 
require_relative "login_page"
require_relative "main_page"
require_relative "view_users"

run_name  = "showcase_#{Time.now.to_i}"
FileUtils.mkdir_p "/tmp/#{run_name}_images/"

Model.base_url = "https://automation-showcase-app.herokuapp.com"
Model.iterations_to_do = 40
Model.url_recording( :on => true , :file => "/tmp/#{run_name}.log")
Model.screenshots(:on => true , :dir => "/tmp/#{run_name}_images/" ) 


Model.starting_point :page=> LoginPage


Model.go_with_browser

at_exit{ puts " created these users: " + $new_users.join(" ") }