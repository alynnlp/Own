class ResponseController < ApplicationController

  def index
    @client_response_props = {
      name: "first client"
    }
    @response = Response.all
  end

  def create
    @response = Response.new(register)
  end

  def edit
  end
  def update
  end

  def destroy
    @message = Message.find( )
    @message.destroy
    redirect_to agent_profile_path, :notice => "Rejected Client"
  end

end
