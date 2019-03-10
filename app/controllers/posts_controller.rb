class PostsController < ApplicationController
  def selfhelp
  end

  def introduction
  end

  def top
  end

  def index
  end

  def show
  end

  def new
    @post = Post.new
    @materials = @post.materials.build
    @recipes = @post.recipes.build
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to post_path(@post.id)
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :disease, :activity, :post_image_id, :copy, :tip, :user_id, post_materials_attributes: [:id, :material, :amount, :_destroy, :post_id], recipes: [:id,  :recipe_image_id, :recipe, :recipe_number, :post_id, :_destroy])
  end
end