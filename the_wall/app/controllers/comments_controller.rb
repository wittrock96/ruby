class CommentsController < ApplicationController

	def create

		@comment = Comment.create(content:params[:content], message:Message.find(params[:message].to_i))

		redirect_to :back
		
	end
end
