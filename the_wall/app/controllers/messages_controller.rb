class MessagesController < ApplicationController
  def index
  	@user = User.find(session[:id])
  	@messages = Message.all

  end
  def create
  	
  	@message = Message.create(message:params[:content], user:User.find(session[:id]))

  	redirect_to :back
  	
  end
end
