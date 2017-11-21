class AgentRegisterController < ApplicationController

  def new #agent register page
    @newAgent = Agent.new
  end

  def create #process register information
    @newAgent = Agent.new(register_params)
    if @newAgent.save
      log_in @newAgent
      redirect_to agentlogin_path(@newAgent), notice: 'New agent was successfully created.'
    else
      redirect_to action: "new", notice: "error"
    end
  end

end
