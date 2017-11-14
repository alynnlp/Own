class AgentLoginController < ApplicationController
  layout 'agent_login'
  def index
    @agent = Agent.all
    @agent_props = {
      name: 'Aileen Pang'
    }
  end
end
