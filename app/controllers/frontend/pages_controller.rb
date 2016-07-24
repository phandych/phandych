class Frontend::PagesController < ApplicationController
	layout 'frontend/layouts/application'
	
	def home
		@categories = Category.all
	end
end
