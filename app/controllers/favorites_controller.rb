class FavoritesController < ApplicationController

before_action :authenticate_user!

	def create
		post = Post.find(params[:post_id])
		favorite = current_user.favorites.new(post_id: post.id)
		favorite.save
		redirect_to post_path(post)

		  # @user = User.find(params[:user_id])
    #       @favorite = @user.favorites.new
    #       @favorite.save
    #       redirect_to root_path
    #  # @user_id = current_user.id
     # @post_id = Post.find(params[:id])
     # @favorite = Favorite.new(post_id: @post_id, user_id: @user_id)


     #  if @favorite.save
     #    redirect_to root_path
     #  end
	end

	def destroy
		 post = Post.find(params[:post_id])
         favorite = current_user.favorites.find_by(post_id: post.id)
         favorite.destroy
         redirect_to post_path(post)
	end

	private
	def favorite_params
		params.require(:favorite).permit(:user_id, :post_id)
	end

end



 # def create


 #    @user_id = current_user.id
 #    @event_id = Event.find(params[:id]).id
 #    @clip = Clip.new(event_id: @event_id, user_id: @user_id)


 #      if @clip.save
 #        redirect_to user_path(current_user)
 #      end

 #  end

 #  def destroy
 #    @clip = Clip.find(params[:id])
 #    if @clip.destroy
 #      redirect_to user_path(current_user)
 #    end
 #  end