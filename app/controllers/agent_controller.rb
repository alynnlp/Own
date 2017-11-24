class AgentController < ApplicationController
  layout "agent"

  def index #display all agents for users
    @agents = Agent.all
    @agent_props = Agent.name
    @agentmessage = Message.where(user_id: params[:id])
  end

  def show #display ONE agent for users
    @agent = Agent.find(params[:id])
    @agentmessage = Message.where(user_id: params[:id])
    # @agentname = Agent.find(params[:id]).name
    # @agentbio = Agent.find(params[:id]).bio
    # @agentspecialty = Agent.find(params[:id]).specialty
    # @agentlocation = Agent.find(params[:id]).location
    @agentreview = Review.where(agent_id: params[:id])
    @newMessage = Message.new
  end

  def new
  end

  def edit #edit page for agent settings
    @agent = Agent.find(params[:id])
  end

  def create #process request information from users
    @agent = Agent.find(params[:id])
    @request = Message.new(params[agentrequest_params])
    if @request.save
      redirect_to action: :index
    else
      render 'show'
    end
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
      redirect_to edit_agent_profile_path, notice: "error"
    end
  end

  private
    def agentrequest_params
      params.require(:message).permit(:content)
    end

    def agent_params
      params.require(:agent).permit(:email, :password,:bio, :specialty, :location)
    end

end
