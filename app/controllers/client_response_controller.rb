class ClientResponseController < ApplicationController
  layout "client_response"

  def index
    @client_response_props = {
      name: "first client"
    }

    @response = Response.all
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
    @agent = Agent.find(1)
  end

  def update
  end

  def destroy
  end

end
