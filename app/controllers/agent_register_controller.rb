class AgentRegisterController < ApplicationController
  layout 'agent_login'

  def new #agent register page
    @newAgent = Agent.new
  end

  def create #process register information
    puts 'REGISTER PARAMS'
    puts register_params
    puts '********'
    @newAgent = Agent.new(register_params)
    puts 'NEW AGENT'
    puts @newAgent
    puts '**********'
    if @newAgent.save
      session[:agent_id] = @newAgent.id
      redirect_to agent_profile_path(@newAgent), notice: 'New agent was successfully created.'
    else
      redirect_to action: "new", notice: "error"
    end
  end

  private
    def register_params
      params.require(:agent).permit(:utf8, :authenticity_token, :commit, :name, :email, :password, :password_confirmation, :bio, :specialty, :location, :img)
    end

end
