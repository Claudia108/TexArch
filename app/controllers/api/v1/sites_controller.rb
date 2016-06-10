class Api::V1::SitesController < Api::ApiController
  def index
    respond_with Site.all
  end

end
