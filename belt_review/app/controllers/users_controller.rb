class UsersController < ApplicationController
  def new
  	@states = [ "AK","AL","AR","AS","AZ","CA","CO","CT","DC","DE","FL","GA","GU","HI","IA","ID","IL","IN","KS","KY","LA",
                "MA","MD","ME","MI","MN","MO","MS","MT","NC","ND","NE","NH","NJ","NM","NV","NY","OH","OK","OR",
                "PA","PR","RI","SC","SD","TN","TX","UT","VA","VI","VT","WA","WI","WV","WY"]

  end
  def create
	@user = User.create(user_params)
  	if @user.valid?
  		session[:id] = @user.id
  		return redirect_to '/events/index'
  	else
  		flash[:errors] = @user.errors.full_messages
  		return redirect_to :back
  	end
  	
  end

  def edit
  end
  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :location, :password, :password_confirmation)
  	
  end
end
