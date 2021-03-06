class CommentsController < ApplicationController

	before_action :authenticate_user!

	def new
	end

	def create
		 post = Post.find(params[:post_id])
         comment = current_user.comments.new(comment_params)
         comment.post_id = post.id
         comment.save
         redirect_to post_path(post.id)
	end

	def destroy
		post = Post.find(params[:post_id])
		comment = current_user.comments.find_by(post_id: post.id)
		comment.destroy
		redirect_to post_path(comment.post_id)
	end

	private

	def comment_params
		params.require(:comment).permit(:user_id, :post_id, :comment, :comment_image_id)
	end


end