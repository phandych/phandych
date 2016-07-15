class Admin::ProductsController < ApplicationController
	layout 'admin/layouts/application'
	before_action :logged_in_admin?
	before_action :set_product, only: [:edit, :update]
	helper_method :sort_column, :sort_direction


	def index
		@products = Product.search(params[:search]).order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page: 20)
	end

	def new
		@product = Product.new
		@product_images = @product.product_images.build
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			flash[:success] = "Product create success"
			redirect_to admin_products_path
		else
			render :new
		end
	end

	def edit
		@product_images = @product.product_images.where(product_id: @product.id)
	end

	def update
		if @product.update(product_params)
			flash[:success] = "Product update success"
			redirect_to admin_products_path
		else
			render :edit
		end
	end

	private

		def set_product
			@product = Product.find(params[:id])
		end

		def product_params
			params.require(:product).permit( :name, :sku, :model, :description, :price, product_images_attributes: [:id, :product_id, :image] )
		end


		def sort_column
			Product.column_names.include?(params[:sort]) ? params[:sort] : "name"
		end

		def sort_direction
			%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
		end



end
