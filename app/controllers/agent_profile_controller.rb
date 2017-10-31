class AgentProfileController < ApplicationController
  layout "agent_profile"

  def index
    @agent_profile_props = {
      name: "Aileen Pang"
    }
  end

  def show
    @agent = Agent.find(params[:id])
  end

end
