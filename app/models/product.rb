class Product < ActiveRecord::Base
  belongs_to :category

	def product_name
		self.name = name.titleize
	end
end
