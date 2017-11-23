class ResponseController < ApplicationController

  def show
    @clientmessage = Message.where(agent_id: params[:id])
  end

  def create
  end

  def destroy
    @message = Message.find(params[:message_id])
    @message.destroy
    redirect_to agent_profile_path, :notice => "Rejected Client"
  end

end
