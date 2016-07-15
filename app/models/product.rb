class Product < ActiveRecord::Base
  	belongs_to :category
  	mount_uploader :image, ImageUploader

  	validates_presence_of :name, :sku, :model, :price, :description
  	validates :price, numericality: true

	def product_name
		self.name = name.titleize
	end

	def self.search(search)
	  if search
	    @products = Product.where(['name LIKE ? or sku LIKE ?', "%#{search}%", "%#{search}%"])
	  else
	    all
	  end
	end
end
