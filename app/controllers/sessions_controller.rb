class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "Invalid username or password. Please try again."
      redirect_to signin_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
