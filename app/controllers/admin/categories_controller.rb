class Admin::CategoriesController < ApplicationController
	layout 'admin/layouts/application'

	before_action :admin_verify?
	before_action :set_category, only: [:edit, :update]
	helper_method :sort_column, :sort_direction

	def index
		@categories = Category.search(params[:search]).order(sort_column + " " + sort_direction)
	end

	def new
	end

	def create
		
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
			params.require(:category).permit(:name, { product_ids: [] })
		end

		def sort_column
			Category.column_names.include?(params[:sort]) ? params[:sort] : "name"
		end

		def sort_direction
			%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
		end

end
