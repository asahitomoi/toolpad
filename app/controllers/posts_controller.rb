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
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).page(params[:page]).per(5)
  end

  def show
    @post = Post.find(params[:id])
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
    if @post.save
    redirect_to post_path(@post.id)
    else
    render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def search
    @q = Post.ransack(search_params)
    @posts = @q.result(distinct: true).page(params[:page]).per(5)
  end

  private
  def post_params
    params.require(:post).permit(:title, :disease, :activity, :post_image_id, :copy, :tip, :user_id, :image_cache, materials_attributes: [:id, :material, :amount, :_destroy, :post_id], recipes_attributes: [:id,  :recipe_image_id, :recipe, :recipe_number, :post_id, :_destroy], comments_attributes: [:id,  :comment_image_id, :comment, :user_id, :post_id, :_destroy])
  end

  def search_params
    params.require(:q).permit!
  end
end

