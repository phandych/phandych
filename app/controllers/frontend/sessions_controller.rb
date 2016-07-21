class Frontend::SessionsController < ApplicationController
	layout 'frontend/layouts/session', only: [:new, :create]

	def new
	end

	def create
		@user = User.find_by(email: params[:session][:email].downcase)
		if @user && @user.authenticate(params[:session][:password])
			log_in(@user)
			flash[:success] = "Login Success, Happy Shopping :)"
			redirect_to root_url
		else
			flash[:danger] = "Invalid Password or Email"
			render :new
		end
	end

	def destroy
		log_out if logged_in?
		redirect_to root_url
	end
end
