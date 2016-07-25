module Admin::SessionsHelper
	def log_in_admin(admin)
		session[:admin_id] = admin.id
	end

	def current_admin?(admin)
		current_admin == admin 
	end

	def current_admin
		@current_admin ||= Admin.find_by(id: session[:admin_id])
	end

	def logged_in_admin?
		!current_admin.nil?
	end

	def admin_verify?
		unless logged_in_admin?
			redirect_to admin_login_path
		end
	end

	# Log out admin
	def log_out_admin
		session.delete(:admin_id)
		@current_admin = nil
	end

	

end
