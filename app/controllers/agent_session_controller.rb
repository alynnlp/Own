class AgentSessionController < ApplicationController
  def new #login page
  end

  def create #process login information
    agent = Agent.find_by(email: params[:session][:email].downcase)
    if agent && agent.authenticate(params[:session][:password])
      session[:agent_id] = agent.id
      flash[:success] = "#{agent.email}, Successfully logged in!"
      redirect_to agent_profile_path(agent), :notice => "Logged in!"
    else
      flash[:danger] = "Incorrect User/Password"
      redirect_to agent_login_path
    end
  end

  def destroy #destroy the session
    session[:agent_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
end
