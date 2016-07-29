class Frontend::SessionsController < ApplicationController
	layout 'frontend/layouts/session', only: [:new, :create]

	def new
	end

	def create
		@user = User.find_by(email: params[:session][:email].downcase)
		if @user && @user.authenticate(params[:session][:password])
			if @user.activated?
				log_in_user(@user)
				params[:session][:remember_me] == "1" ? remember_user(@user) : forget_user(@user)
				flash[:success] = "Login Success, Happy Shopping :)"
				redirect_to root_url
			else
				message = "Account not activated."
			    message += "Check your email for the activation link."
			    flash[:warning] = message
			    redirect_to root_url
			end
		else
			flash[:danger] = "Invalid Password or Email"
			render :new
		end
	end

	def social
		auth = request.env['omniauth.auth']
		user = User.from_omniauth(auth)
		authorization = user.authorizations.from_omniauth(auth)
		flash[:success] = "Login Success, Happy Shopping :)"
    	log_in_user(user)
    	redirect_to root_path
	end

	def destroy
		log_out_user if logged_in_user?
		redirect_to root_url
	end
end
