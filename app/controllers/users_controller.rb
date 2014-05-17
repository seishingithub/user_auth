class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to login_path, notice: 'Thanks for registering'
    else
      redirect_to register_path, notice: 'Something went wrong'
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end