class Category < ActiveRecord::Base
	validates :name, presence: true, uniqueness: {case_sensitive: false}
	before_save :capitalize

	private

		def capitalize
			self.name = name.titleize
		end
end
