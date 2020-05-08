class MembersController < ApplicationController

	def create

		@user = User.find(session[:id])
		@group = Group.find(params[:id])
		@member = Member.create(user:@user, group: @group)
		redirect_to :back
		
	end
	def destroy
		@user = User.find(session[:id])
		@member = Member.find_by(user_id: @user.id)
		@member.delete
		return redirect_to :back
		
	end
end
