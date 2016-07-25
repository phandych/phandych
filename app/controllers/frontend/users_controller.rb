class Frontend::UsersController < ApplicationController
  layout 'frontend/layouts/application', only: [:show, :edit, :update]
	layout 'frontend/layouts/session', only: [:new, :create]


  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in_user(@user)
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
  		params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
  	end
end
