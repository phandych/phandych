module Frontend::SessionsHelper
	# Create user sessions
	def log_in_user(user)
		session[:user_id] = user.id
	end

	# Returns a current user
	def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

	# User must login
	def logged_in_user
		unless logged_in?
			store_location
			flash[:danger] = "Please Login"
			redirect_to login_path
		end
	end

	# Remember a current_user
	def remember_user(user)
		user.remember
		cookies.permanent.signed[:user_id] = user.id
		cookies.permanent[:remember_token] = user.remember_token
	end

	# Login a User.
	def logged_in_user?
		!current_user.nil?
	end

	# Forget a persistent session
	def forget_user(user)
		user.forget
		cookies.delete(:user_id)
		cookies.delete(:remember_token)
	end

	# Clear current_user sessions
	def log_out_user
		forget_user(current_user)
		session.delete(:user_id)
		@current_user = nil
	end

	# Redirects to stored location (or to the default).
	def redirect_back_or(default)
		redirect_to(session[:forwarding_url] || default)
		session.delete(:forwarding_url)
	end

	# Stores the URL trying to be accessed.
	def store_location
		session[:forwarding_url] = request.url if request.get?
	end
end
