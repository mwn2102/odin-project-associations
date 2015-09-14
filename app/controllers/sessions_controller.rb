class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user
      log_in user
      redirect_to user_path(user)
    else
      render login_path
    end
      
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
