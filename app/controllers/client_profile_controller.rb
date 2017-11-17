class ClientProfileController < ApplicationController
  layout "client_profile"

  def index
    @client_profile_props = {
      name: "Michael Yuen"
    }
  end

  def show
    @user = User.find(params[:id])
    @agentmessage = Message.where(user_id: params[:id])
    @agentreview = Review.where(user_id: params[:id])

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
    @agent = Agent.find(params[:id])
  end
  def update
    @agent = Agent.find(params[:id])
    if @agent.update_attributes(agent_params)
      redirect_to edit_agent_profile_path, :notice => "Your profile has been updated"
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
end
