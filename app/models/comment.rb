class Comment < ApplicationRecord

	belongs_to :user
	belongs_to :post

	validates :comment, presence: true, length: {maximum: 50}

	mount_uploader :comment_image_id, ImageUploader

end
