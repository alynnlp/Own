class AgentController < ApplicationController
  layout "agent"

  def index
    @agents = Agent.all
    @reviews = Review.all
  end

  def show
    @agents = Agent.find(params[:id])

  end

  def new
  end

  def edit
  end

  def create
     @request = Message.new(params[agentrequest_params])

     @request.save
     redirect_to agentrequest_index_path(@request.id)
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
