class SessionsController < ApplicationController
  def new

  end
  def create
  	@user = User.find_by(email:params[:email])

  	if @user
  	
	  	if @user.authenticate(params[:password])
	  		session[:id] = @user.id
	  		return redirect_to '/users/show'
	  	else 
	  		flash[:errors] = ['incorrect password']
	  		return redirect_to :back
		end
	else
		flash[:errors] = ['incorrect email']
		redirect_to :back
  	end
  end
  def destroy
  	session.delete :id
  	
  	redirect_to '/sessions/new'
  	
  end
end
