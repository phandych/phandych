class Admin::CategoriesController < ApplicationController
	layout 'admin/layouts/application'
	
	def new
	end

	def index
		@categories = Category.all
	end
end
