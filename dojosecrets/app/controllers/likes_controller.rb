class LikesController < ApplicationController

	def create
		@user = User.find_by(id:session[:id])

		@secret = Secret.find_by(id: params[:id])

		@like = Like.create(user: @user, secret: @secret)




		redirect_to :back
	end
end
