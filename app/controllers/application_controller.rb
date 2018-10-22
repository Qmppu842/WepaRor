class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    return nil if session[:user_id].nil?

    User.find(session[:user_id])
  end

  def ensure_that_singed_in
    redirect_to signin_path, notice: 'you should be singed in' if current_user.nil?
  end

  def is_current_user_admin
    current_user.admin
  end

end
