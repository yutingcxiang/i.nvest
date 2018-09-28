class SessionsController < ApplicationController
  def new
  end

  def create
    if auth_hash
      @user = User.find_or_create_by(uid: auth_hash['uid']) do |u|
        u.username = unique_username
        u.email = auth['info']['email']
        u.password = SecureRandom.hex
      end
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user.id)
      else
        flash[:notice] = "Invalid username or password. Please try again."
        redirect_to signin_path
      end
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def unique_username
    username = auth['info']['username'].split("@").first + rand(1...100)
  end

  def auth_hash
    request.env['omniauth.auth']
  end
end
