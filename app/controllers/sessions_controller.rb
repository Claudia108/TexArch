class SessionsController < ApplicationController
  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
    end
    if current_user.admin?
      redirect_to admin_dashboard_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = {}
    redirect_to root_path
  end
end
