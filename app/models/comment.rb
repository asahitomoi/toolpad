class Comment < ApplicationRecord

	belongs_to :user
	belongs_to :post

	mount_uploader :comment_image_id, ImageUploader

end
