class SessionsController < ApplicationController
  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
    end
    redirect_to root_path
  end

  def destroy
    session[:user_id] = {}
    redirect_to root_path
  end
  # def create
  #   @user = User.find_or_create_from_auth_hash(auth_hash)
  #   binding.pry
  #   self.current_user = @user
  #   redirect_to '/'
  # end
  #
  #   private
  #
  #   def auth_hash
  #     request.env['omniauth.auth']
  #   end
end
