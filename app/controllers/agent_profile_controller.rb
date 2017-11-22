class AgentProfileController < ApplicationController
  layout 'agent_profile'
  def index
  end

  def show #agentprofile
    @agent = Agent.find(params[:id])
    @clientmessage = Message.where(agent_id: params[:id])
    @clientreview = Review.where(agent_id: params[:id])

    def average(rating)
      calculate(:average, rating)
    end

  end

  def edit #edit page for agent settings
    @agent = Agent.find(params[:id])
  end

  def update #process edited information
    @agent = Agent.find(params[:id])
    if @agent.update_attributes(agent_params)
      @agent.save
      redirect_to agent_profile_path(@agent)
      flash[:success] = "Your profile has been updated"
    else
      redirect_to edit_agent_profile_path, notice: "error"
    end
  end

  private
    def agent_params
      params.require(:agent).permit(:name, :email, :password, :bio, :specialty, :location, :img)
    end

end
