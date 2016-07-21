class Frontend::UsersController < ApplicationController
	layout 'frontend/layouts/session', only: [:new, :create]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "Welcome to tokourban"
  		redirect_to root_url
  	else
  		render :new
  	end
  end

  def edit
  end

  private

  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmantion)
  	end
end
