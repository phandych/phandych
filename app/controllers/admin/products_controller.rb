class Admin::ProductsController < ApplicationController
	layout 'admin/layouts/application'
	before_action :logged_in_admin?
	helper_method :sort_column, :sort_direction


	def index
		@products = Product.search(params[:search]).order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page: 5)
	end

	def new
	end

	def edit
	end

	private

		def sort_column
			Product.column_names.include?(params[:sort]) ? params[:sort] : "name"
		end

		def sort_direction
			%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
		end



end
