class Frontend::UsersController < ApplicationController
	layout :resolve_layout
  before_action :correct_user, only: [:show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]


  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      @user.send_user_activation_email
  		flash[:info] = "Please check your email to activate your account"
  		redirect_to root_url
  	else
  		render :new
  	end
  end

  def edit
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

  	def user_params
  		params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
  	end

    def resolve_layout
      case action_name
        when "new", "create"
          "frontend/layouts/session"
        when "show", "edit", "update"
          "frontend/layouts/application"
        else
          "application"
      end
    end
end
