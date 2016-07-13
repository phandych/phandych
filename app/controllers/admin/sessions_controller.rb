class Admin::SessionsController < ApplicationController
	def new
	end

	def create
		@admin = Admin.find_by(email: params[:session][:email].downcase)
		if @admin && @admin.authenticate(params[:session][:password])
			log_in(@admin)
			flash[:success] = "Anda berhasil login"
			redirect_back_or(@admin)
		else
			flash[:warning] = "Email atau Password anda salah!"
			render :new
		end
	end

	def destroy
		log_out if logged_in?
		redirect_to root_path
	end
end
