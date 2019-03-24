class Recipe < ApplicationRecord

	belongs_to :post

	mount_uploader :recipe_image_id, ImageUploader
end
