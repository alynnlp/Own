class UserSessionController < ApplicationController
  layout 'hello_world'

  def new #login page
  end

  def create #process login information
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_profile_path(agent), :notice => "Logged in!"
    else
      redirect_to user_login_path, :notice => "Fail to log in!"
    end
  end

  def destroy #destroy the session
    session[:user_id] = nil
    redirect_to '/', :notice => "Logged out"
  end

end
