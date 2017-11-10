class ClientProfileController < ApplicationController
  layout "client_profile"

  def index
    @client_profile_props = {
      name: "Michael Yuen"
    }
  end

  def show
    @agentmessage = Message.where(user_id: params[:id])
    @agentreview = Review.where(user_id: params[:id])
    @user = User.find(params[:id])
  end

  def create
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
