class Category < ActiveRecord::Base
	has_many :products
	validates :name, presence: true, uniqueness: {case_sensitive: false}


	def self.search(search)
	  if search
	    @categories = Category.where('name LIKE ?', "%#{search}%")
	  else
	    all
	  end
	end

	def category_name
		self.name = name.titleize
	end

end
