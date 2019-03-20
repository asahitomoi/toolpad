class UsersController < ApplicationController

	def information
		@user = User.find(params[:user_id])
	end

	def selfhelp
	end

	def show
		@user = User.find(params[:id])
		@q = Post.ransack(params[:q])
        # @posts = @q.result(distinct: true)
        @posts = @user.posts
        @favorites = @user.favorites_posts
	end

	def favorite
		@q = Post.ransack(params[:q])
        @posts = @q.result(distinct: true)
	end

	def post
		@user = User.find(current_user.id)
		@posts = @user.posts
		@q = Post.ransack(params[:q])
        @posts = @q.result(distinct: true)
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_information_path(@user.id)
	end

	def destroy
	end




	private
	def user_params
		params.require(:user).permit(:name, :place, :user_image_id, :gender, :age, :email ,:password ,:password_confirmation)
	end

end