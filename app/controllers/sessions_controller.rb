class SessionsController < ApplicationController
  skip_before_action :store_location

  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
    end
    if current_user.admin?
      redirect_to admin_dashboard_path
    else
      redirect_to after_sign_in_path(current_user)
    end
  end

  def destroy
    session[:user_id] = {}
    redirect_to root_path
  end
end
