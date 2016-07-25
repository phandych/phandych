class Admin::PagesController < ApplicationController
	layout 'admin/layouts/application'

	before_action :admin_verify?

  def index
  end
end
