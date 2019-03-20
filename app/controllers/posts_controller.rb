class PostsController < ApplicationController
  def selfhelp
  end

  def introduction
  end

  def top
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  def index
    @posts = Post.all
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    @comment = Comment.new
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  def new
    @post = Post.new
    @material = @post.materials.build
    @recipe = @post.recipes.build
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to post_path(@post.id)
  end

  def destroy
  end

  def search
    @q = Post.search(search_params)
    @posts = @q.result(distinct: true)
  end

  private
  def post_params
    params.require(:post).permit(:title, :disease, :activity, :post_image_id, :copy, :tip, :user_id, :image_cache, materials_attributes: [:id, :material, :amount, :_destroy, :post_id], recipes_attributes: [:id,  :recipe_image_id, :recipe, :recipe_number, :post_id, :_destroy], comments_attributes: [:id,  :comment_image_id, :comment, :user_id, :post_id, :_destroy])
  end

  def search_params
    params.require(:q).permit!
  end
end

