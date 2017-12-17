module ApplicationHelper
	def current_user_email
		session[:current_user_email]
	end

	def create_current_user_session email
		session[:current_user_email] = email
	end
end
