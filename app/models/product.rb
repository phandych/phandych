class Product < ActiveRecord::Base
  	has_many :categorizations
  	has_many :categories, through: :categorizations
  	has_many :product_images, dependent: :destroy
  	has_many :product_specifications, dependent: :destroy
  	accepts_nested_attributes_for :product_images, allow_destroy: true
  	accepts_nested_attributes_for :product_specifications, allow_destroy: true
  	

  	validates_presence_of :name, :sku, :model, :price, :description
  	validates :price, numericality: true
  	attr_reader :product_tokens

  	def product_tokens
  		
  	end


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
