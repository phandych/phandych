class Admin::ProductsController < ApplicationController
	layout 'admin/layouts/application'
	before_action :logged_in_admin?


  def index
  	@products = Product.all
  end

  def new
  end

  def edit
  end
end
