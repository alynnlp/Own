class AgentProfileController < ApplicationController
  layout 'agent_profile'
  def index
  end

  def show #agentprofile
    @agent = Agent.find(params[:id])
    @clientmessage = Message.where(agent_id: params[:id])
    @clientreview = Review.where(agent_id: params[:id])
  end

  def edit #edit page for agent settings
    @agent = Agent.find(params[:id])
  end
  def update #process edited information
    @agent = Agent.find(params[:id])
    if @agent.update_attributes(agent_params)
      redirect_to agent_profile_path(@agent)
      flash[:success] = "Your profile has been updated"
    else
      render "edit", notice: "error"
    end
  end

  private
    def agent_params
      params.require(:agent).permit(:utf8, :authenticity_token, :commit, :name, :email, :password, :bio, :specialty, :location, :img)
    end

end
