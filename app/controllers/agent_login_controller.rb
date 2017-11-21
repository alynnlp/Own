class AgentLoginController < ApplicationController
  layout 'agent_login'
  def index #agent login page
    @agents = Agent.all
    # @agent_props = {
    #   name: 'Aileen Pang'
    # }
    @agent = Agent.find_by(params[:id])
  end

  def show #agentprofile
    @agent = Agent.find(params[:id])
    @clientmessage = Message.where(agent_id: params[:id])
    @clientreview = Review.where(agent_id: params[:id])
  end

  def edit
    @agent = Agent.find(params[:id])
  end
  def update
    @agent = Agent.find(params[:id])
    if @agent.update_attributes(agent_params)
      redirect_to agent_profile_path(@agent)
      flash[:success] = "Your profile has been updated"
    else
      render "edit", notice: "error"
    end
  end

  private
    def register_params
      params.require(:agent).permit(:utf8, :authenticity_token, :commit, :name, :email, :password, :bio, :specialty, :location, :img)
    end

end
