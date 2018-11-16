class SecretsController < ApplicationController
  def new
  end
  def create
  	
  	@content = params[:content]
  	@user = User.find_by(id:session[:id])
  	@secret = Secret.create(content:@content, user: @user)
  	redirect_to '/users/show'
  	
  end
end
