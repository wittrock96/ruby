class GroupsController < ApplicationController
  def index
  	@user = User.find(session[:id])
  	@groups = Group.all
  end

  def show
  	@user = User.find(session[:id])
  	@group = Group.find(params[:id])

  	@members = @group.members.eager_load(:user)

  end
  def create
  	@user = User.find(session[:id])
  	@group = Group.create(name: params[:name], description: params[:description], user: @user)
  	if @group.valid?
  		@member= Member.create(group: @group, user: @user)
  		redirect_to :back
  	else
  		flash[:errors] = @group.errors.full_messages
  		redirect_to :back
  	end
  	
  end
  def edit
    @group = Group.find(params[:id])

    
    
  end
  def update
    @group = Group.find(params[:id])

    Group.update(@group.id, name:params[:name], description:params[:description])
     redirect_to "/groups/show/#{@group.id}"
    
  end
  def destroy
  	@group = Group.find(params[:id])
  	@group.delete
  	redirect_to '/groups/index'
  	
  end
end
