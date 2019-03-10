class UsersController < ApplicationController

	def information
		@user = User.find(params[:user_id])
	end

	def selfhelp
	end

	def show
	end

	def favorite
	end

	def post
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