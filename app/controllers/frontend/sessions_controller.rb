class Frontend::SessionsController < ApplicationController
	layout 'frontend/layouts/session', only: [:new, :create]

	def new
	end

	def create
		@user = User.find_by(email: params[:session][:email].downcase)
		if @user && @user.authenticate(params[:session][:password])
			log_in_user(@user)
			params[:session][:remember_me] == "1" ? remember_user(@user) : forget_user(@user)
			flash[:success] = "Login Success, Happy Shopping :)"
			redirect_to root_url
		else
			flash[:danger] = "Invalid Password or Email"
			render :new
		end
	end

	def destroy
		log_out_user if logged_in_user?
		redirect_to root_url
	end
end
