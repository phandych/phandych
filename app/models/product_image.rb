class ProductImage < ActiveRecord::Base
  belongs_to :product, dependent: :destroy
  mount_uploader :image, ImageUploader
end
