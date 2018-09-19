class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by username: params[:username]

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user), notice: "Welcome back!"
    else
      redirect_to signin_path, notice: "EROROROROROROROROROORRR!!!! Also known as Username/password incorrect"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end
end