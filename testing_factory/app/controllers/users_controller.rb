class UsersController < ApplicationController
  def new
  	

  end
	def create
		@user = User.new(params.require(:user).permit(:first_name, :last_name, :email))
			if @user.save
			
			
				redirect_to "/user/show/#{User.last.id}"
			else
				
				flash[:errors] = @user.errors.full_messages
				redirect_to "/users/new"
			end
		
	end
	def show
		@user = User.find(params[:id])

		
	end

end
