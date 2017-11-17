class AgentProfileController < ApplicationController
  layout "agent_profile"


  def index
    @agent_profile_props = {
      name: "Aileen Pang"
    }
    @agents = Agent.all
  end

  def show
    @agent = Agent.find(params[:id])
    @clientmessage = Message.where(agent_id: params[:id])
    @clientreview = Review.where(agent_id: params[:id])
  end

  def new
    @agent = Agent.new
  end
  def create
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

   def agent_params
     params.require(:agent).permit(:name, :email, :password,:bio, :specialty, :location)
   end

end
