include ApplicationHelper

def valid_signin(staff)
	visit root_path
	fill_in "email or username", with: staff.email
	fill_in "password", with: staff.password
	click_button "Sign in"
end
