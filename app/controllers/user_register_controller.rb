class UserRegisterController < ApplicationController
  layout 'hello_world'

  def new #agent register page
    @newUser = User.new
  end

  def create #process register information
    @newUser = User.new(register_params)

    if @newUser.save
      session[:user_id] = @newUser.id
      redirect_to user_profile_path(@newUser), notice: 'New user was successfully created.'
    else
      redirect_to action: "new", notice: "error"
    end
  end

  private
    def register_params
      params.require(:user).permit(:utf8, :authenticity_token, :commit, :name, :email, :password, :password_confirmation, :location, :budget, :size, :age, :address, :occupation)
    end

end
