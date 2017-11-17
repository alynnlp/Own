class AgentController < ApplicationController
  layout "agent"

  def index
    @agents = Agent.all
    @agent_props = Agent.name
    @agentmessage = Message.where(user_id: params[:id])
  end

  def show
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

  def edit
  end

  def create
    @agent = Agent.find(params[:id])
    @request = Message.new(params[agentrequest_params])

    if @request.save
      redirect_to action: :index
    else
      render 'show'
    end
  end

  def update
    @agent = Agent.find(params[:id])

    if @agent.update_attributes(agent_params)
      redirect_to agent_profile_path, :notice => "Your profile has been updated"
    else
      render "show"
    end
  end

  def destroy
  end

  private

    def agentrequest_params
      params.require(:message).permit(:content)
    end

    def agent_params
      params.require(:agent).permit(:name, :email, :password,:bio, :specialty, :location)
    end

end
