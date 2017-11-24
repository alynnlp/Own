class ResponseController < ApplicationController

  def new
    @agent = Agent.find(session[:agent_id])
    @client = User.find(params[:user_id])
    @newResponse = Response.new
  end

  def create
    @newResponse = Response.new(response_params)
    @newResponse.agent_id = session[:agent_id]
    @newResponse.user_id = params[:user_id]
    current_user = session[:agent_id]

    respond_to do |format|
      if @newResponse.save
        @newResponse.accept = 'true'
        format.html {redirect_to agent_profile_path(current_user), notice: 'Responded to Client' }
      else
        format.html {redirect_to action: "new", notice: "error"}
        format.json {render json: @newResponse.erros, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @response = Response.find(params[:id])
    @response.destroy
    current_user = params[:id]
    redirect_to user_profile_path(current_user), :notice => "Message deleted"
  end

  private

  def response_params
    params.require(:response).permit(:accept, :content, :user_id, :agent_id)
  end

end
