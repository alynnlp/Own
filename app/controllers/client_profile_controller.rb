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

  def new
        @register = Register.new
        respond_to do |format|
          format.html
          format.json { render json: @register}
        end
      end

  def create
    @user = User.new(register_params)

    respond_to do |format|
      if @register.save
        format.html { redirect_to @register, notice: "Save process completed!" }
        format.json { render json: @register, status: :created, location: @register }
      else
        format.html {
          flash.now[:notice]="Save proccess coudn't be completed!"
          render :new
        }
        format.json { render json: @register.errors, status: :unprocessable_entity}
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def register_params
      params.permit(:name, :email, :password)
    end
end
