class RecipesController < ApplicationController
	def create
	end

	def destroy
	end

	private
	def recipe_params
		params.require(:recipe).permit(:recipe_image_id, :recipe, :recipe_number, :post_id, :image_cache)
	end
end