class EventsController < ApplicationController
  def index
  	@user = User.find(session[:id])
  end

  def show
  end
end
