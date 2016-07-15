class Product < ActiveRecord::Base
  belongs_to :category
  mount_uploader :image, ImageUploader

	def product_name
		self.name = name.titleize
	end

	def self.search(search)
	  if search
	    @products = Product.where('name LIKE ?', "%#{search}%")
	  else
	    all
	  end
	end
end
