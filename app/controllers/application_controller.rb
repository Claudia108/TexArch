class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :store_location

  helper_method :current_user,
                :admin_authenticated,
                :require_user


  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def admin_authenticated
    current_user.present? && current_user.admin?
  end

  def require_user
    render file: '/public/404' unless current_user
  end

  def store_location
    return unless request.get?
    if (request.path != "/auth/google_oauth2" &&
        request.path != "/auth/google_oauth2/callback" &&
        request.path != "/logout" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path(current_user)
    session[:previous_url] || root_path
  end
end
