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
		@product_image = @product.product_images.build
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
			params.require(:product).permit( :name, :sku, :model, :description, :price, { category_ids: []}, 
											  product_images_attributes: [:id, :product_id, :image, :_destroy], 
											  product_specifications_attributes: [:id, :product_id, :name, :_destroy, product_specification_tables_attributes: [:id, :label, :content, :_destroy] ] )
		end


		def sort_column
			Product.column_names.include?(params[:sort]) ? params[:sort] : "name"
		end

		def sort_direction
			%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
		end



end
