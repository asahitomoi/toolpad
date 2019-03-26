class UsersController < ApplicationController

	 before_action :correct_user, only:[:edit, :update]

	def information
		@user = User.find(params[:user_id])
	end

	def selfhelp
	end

	def show
		@user = User.find(params[:id])
		@q = Post.ransack(params[:q])
        @posts = @q.result(distinct: true)
        # @posts = Post.find_by(@user.post_id: post.id)
        @post = @user.posts.page(params[:page]).per(5)
        # @favorites = @user.favorite_posts
         # # @posts = Post.all.order(created_at: :desc)
         # @posts = Post.page(params[:page]).per(5)
	end

	def favorite
		@q = Post.ransack(params[:q])
        @posts = @q.result(distinct: true)
        @user = User.find(params[:user_id])
        @favorites = @user.favorite_posts.page(params[:page]).per(5)
        # @posts = Post.all.order(created_at: :desc)
        # @posts = Post.page(params[:page]).per(5)
	end

	def index
		@user = current_user
		@q = Post.ransack(params[:q])
        @posts = @q.result(distinct: true)
        @users = User.all.page(params[:page]).per(20)
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
		if user.update(user_params)
		   redirect_to user_information_path(user.id), notice: "お客様情報を変更しました"
		else
		   render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
        @user.destroy
        redirect_to posts_path
	end




	private
	def user_params
		params.require(:user).permit(:name, :place, :user_image_id, :gender, :age, :email ,:password ,:password_confirmation,:introduce)
	end

	def correct_user
	     user =User.find(params[:id])
	     if current_user != user
	        redirect_to user_path(user.id)
	     end
	end

    end