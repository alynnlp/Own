class AgentLoginController < ApplicationController
  layout 'agent_login'
  def index
    @agents = Agent.all
    @agent_props = {
      name: 'Aileen Pang'
    }
    render component: 'AgentLogin', props: {agent: @agents}
  end

  def show
    @agent = Agent.find(params[:id])
  end

  def new #registerpage
    @newAgent = Agent.new
    respond_to do |format|
      format.html
      format.json { render json: @newAgent}
    end
  end

  def create #process register information
    @newAgent = Agent.new(register_params)


    if @newAgent.save
      redirect_to agent_profile_path(@newAgent), notice: 'New agent was successfully created.'
    else
      redirect_to action: "new", notice: "error"
    end
  end

  private
    def register_params
      params.require(:agent).permit(:utf8, :authenticity_token, :commit, :name, :email, :password, :bio, :specialty, :location, :img)
    end

end
