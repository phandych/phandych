class ProductSpecification < ActiveRecord::Base
  belongs_to :product
  has_many :product_specification_tables, dependent: :destroy
  accepts_nested_attributes_for :product_specification_tables, allow_destroy: true
end
