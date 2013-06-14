module SessionsHelper

	def sign_in(staff)
		cookies.permanent[:remember_token] = staff.remember_token
		self.current_staff = staff
	end

	def current_staff=(staff)
		@current_staff = staff
	end

	def current_staff
		@current_staff ||= Staff.find_by(remember_token: cookies[:remember_token])
	end
end
