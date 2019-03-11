class PostsController < ApplicationController
  def selfhelp
  end

  def introduction
  end

  def top
  end

  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
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

  private
  def post_params
    params.require(:post).permit(:title, :disease, :activity, :post_image_id, :copy, :tip, :user_id, materials_attributes: [:id, :material, :amount, :_destroy, :post_id], recipes_attributes: [:id,  :recipe_image_id, :recipe, :recipe_number, :post_id, :_destroy])
  end
end