class Admin::SessionsController < ApplicationController
	layout 'admin/layouts/session', only: [:new, :create]

	def new
	end

	def create
		@admin = Admin.find_by(email: params[:session][:email].downcase)
		if @admin && @admin.authenticate(params[:session][:password])
			log_in_admin(@admin)
			flash[:success] = "Anda berhasil login"
			redirect_to admin_root_path
		else
			flash[:warning] = "Email atau Password anda salah!"
			render :new
		end
	end

	def destroy
		log_out_admin if logged_in_admin?
		redirect_to admin_login_path
	end
end
