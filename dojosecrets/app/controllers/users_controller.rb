class UsersController < ApplicationController
  def new

  end
  def create
  	@user = User.create(user_params)
  	if @user.valid?
  		return redirect_to '/sessions/new'
  	else
  		flash[:errors] = @user.errors.full_messages
  		return redirect_to :back	
  		
  	end
  end
  def show
	@user = User.find(session[:id])
	@secrets = Secret.all
  end

  def edit
  end
  private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	
  end
end
