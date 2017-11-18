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

  def new
    @agent = Agent.all
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
        format.html { redirect_to @agent, notice: 'Agent was successfully listed.' }
        format.json { render json: @agent }
      else
        format.html {render :new}
        format.html {render json:@agent.errors}
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
