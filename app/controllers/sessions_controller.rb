class SessionsController < ApplicationController
  skip_before_action :store_location

  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
    end
    redirect_to after_sign_in_path
  end

  def destroy
    session[:user_id] = {}
    redirect_to root_path
  end

  private

  def after_sign_in_path
    session[:previous_url] || root_path
  end
end
