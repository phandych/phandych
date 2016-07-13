class Admin::CategoriesController < ApplicationController
	layout 'admin/layouts/application'

	before_action :logged_in_admin?
	before_action :set_category, only: [:edit, :update]

	def index
		@categories = Category.where(["LOWER(name) LIKE ?", "%#{params[:search]}%"]).first
	end

	def new
	end

	def edit
	end

	def update
		if @category.update(category_params)
			flash[:success] = "Category Updated"
			redirect_to admin_categories_path
		else
			render :edit
		end
	end

	private

		def set_category
			@category = Category.find(params[:id])
		end

		def category_params
			params.require(:category).permit(:name)
		end

end
