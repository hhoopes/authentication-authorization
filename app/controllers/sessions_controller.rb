class SessionsController < ApplicationController
  def new

  end

  def create
    @user = current_user
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to login_path
    end
  end
end
