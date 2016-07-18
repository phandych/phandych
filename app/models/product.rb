class Product < ActiveRecord::Base
  	belongs_to :category
  	has_many :product_images, dependent: :destroy
  	has_many :product_specifications, dependent: :destroy
  	accepts_nested_attributes_for :product_images, allow_destroy: true
  	accepts_nested_attributes_for :product_specifications, allow_destroy: true
  	

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
