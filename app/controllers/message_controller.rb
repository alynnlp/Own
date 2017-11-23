class ResponseController < ApplicationController
  def new
    @agent = Agent.find(params[:id])
    @user = User.find(session[:user_id])
    @newMessage = Message.new
  end

  def create
    @agent = Agent.find(params[:id])

    @newMessage = Message.new(message_params)
    @newMessage.agent_id = params[:id]
    @newMessage.user_id = session[:user_id]
    @newMessage.accept = 'true'
    current_user = session[:user_id]

    respond_to do |format|
      if @newMessage.save
        format.html {redirect_to user_profile_path(current_user), notice: 'Responded to Client' }
      else
        format.html {redirect_to agent_path(@newMessage.agent_id), notice: "error"}
        format.json {render json: @newMessage.erros, status: :unprocessable_entity}
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:request, :content, :user_id, :agent_id)
  end

end
