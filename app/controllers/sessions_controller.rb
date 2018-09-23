class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[user_id] = @user
      redirect_to users_path(@user)
    else
      render 'users/new'
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
