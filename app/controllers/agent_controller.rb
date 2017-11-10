class AgentController < ApplicationController
  layout "agent"

  def index
    @agents = Agent.all
  end

  def show
    @agent = Agent.find(params[:id])


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
  end

  def destroy
  end

  private
    def agentrequest_params
      params.require(:message).permit(:content)
    end

end
