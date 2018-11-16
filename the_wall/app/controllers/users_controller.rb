class UsersController < ApplicationController
  def new
  end
  def create
  	@user = User.create(params.require(:user).permit(:username))
  	session[:id] = @user.id
  	redirect_to '/messages/index'
  	
  end
end
