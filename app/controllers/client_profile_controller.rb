class ClientProfileController < ApplicationController
  layout "client_profile"

  def index
    @client_profile_props = {
      name: "Michael Yuen"
    }
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
  
  end

  def update
  end

  def destroy
  end

end
