class AgentProfileController < ApplicationController
  layout "agent_profile"

  def index
    @agent_profile_props = {
      name: "Aileen Pang"
    }
  end

  def show
    @agent = Agent.find(params[:id])
    @clientmessage = Message.where(agent_id: params[:id])
    @clientreview = Review.where(agent_id: params[:id])
  end

  def create
  end

  def new
  end

  def edit
    @agent = Agent.find(params[:id])
  end

  def update
  end

  def destroy
  end

end
