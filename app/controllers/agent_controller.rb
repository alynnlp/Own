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
    # @agentrating = Review.where(agent_id: params[:id]).rating
  end

  def new
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

  private
    def agentrequest_params
      params.require(:message).permit(:content)
    end
    def agent_params
      params.require(:agent).permit(:name, :email, :password,:bio, :specialty, :location)
    end

end
