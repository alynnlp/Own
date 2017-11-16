class AgentLoginController < ApplicationController
  layout 'agent_login'
  def index
    @agent = Agent.all
    @agent_props = {
      name: 'Aileen Pang'
    }
    render component: 'AgentLogin', props: {agent: @agent}
  end

  def new
    @RegisterNewAgent = Agent.new
    respond_to do |format|
      format.html
      format.json { render json: @RegisterNewAgent}
    end
  end

  def create
    @agent = Agent.new(register_params)

    respond_to do |format|
      format.json do
      if @agent.save
        render :json => @agent
      else
        render :json => {:errors => @agent.errors.messages }, :status => 422
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def register_params
      params.require(:agent).permit(:name, :email, :password, :bio, :specialty, :img)
    end
end
end
