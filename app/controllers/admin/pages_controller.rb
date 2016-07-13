class Admin::PagesController < ApplicationController
	layout 'admin/layouts/application'

	before_action :logged_in_admin?

  def index
  end
end
