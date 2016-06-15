class SitesController < ApplicationController
  before_action :require_user

  def show
    @site = Site.find(params[:id])
  end

  def index
    @sites = Site.all
  end
end
