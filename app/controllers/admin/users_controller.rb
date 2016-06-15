class Admin::UsersController < Admin::BaseController
  def show
    @presenter = DashboardPresenter.new
  end

  def index
    @users = User.all
  end
end
