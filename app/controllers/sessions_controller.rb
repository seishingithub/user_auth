class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_username(params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:id] = user.id
      redirect_to login_path, notice: "Thanks for logging in!
                                        You are logged in as #{user.username}!"
    else
      redirect_to login_path, notice: 'Something went wrong'
    end
  end
end