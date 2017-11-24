class UserProfileController < ApplicationController
  layout "user_profile"

  def index
    @client_profile_props = {
      name: "Michael Yuen"
    }
  end

  def show
    @user = User.find(params[:id])
    @agentmessage = Message.where(user_id: params[:id])
    @agentreview = Review.where(user_id: params[:id])

    @responses = Response.where(user_id: params[:id])
  end

  def new
        @register = Register.new
  end

  def create

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to client_profile_path, :notice => "Your profile has been updated"
    else
      render "show"
    end
  end

  def destroy

  end

  private
    def register_params
      params.permit(:name, :email, :password)
    end

    def user_params
      params.require(:user).permit(:name, :email, :password,:location, :budget, :size, :age, :address, :occupation)
    end
end
