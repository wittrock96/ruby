class UsersController < ApplicationController
  def new
  end
  def create
  	@user = User.create(user_params)
  	if @user.valid?
  		session[:id] = @user.id
  		redirect_to '/groups/index'
  	else
  		flash[:reg_errors] = @user.errors.full_messages
  		redirect_to :back

  	end
  	
  end
  def login
  	@user = User.find_by(email:params[:email])
  	if @user
  		if @user.authenticate(params[:password])
  			session[:id] = @user.id
  			redirect_to '/groups/index'
  			
  		else
  			flash[:log_errors] = ["incorrect password"]
  			redirect_to :back

  		end
  	else
  		flash[:log_errors] = ["incorrect email"]
  		redirect_to :back

  	end
  	
  end

  def edit
  	@user = User.find(session[:id])

  end
  def update
  	@user = User.update(session[:id], edit_params)
  	if @user.valid?
  		redirect_to '/groups/index'
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to :back
  	end
  		
  end
  def session_destroy
  	session.delete :id

  	redirect_to '/'
  	
  end

  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  	
  end
  def edit_params
  	params.require(:user).permit(:first_name, :last_name, :email)
  	
  end
end
