class ArtifactsController < ApplicationController
  before_action :require_user
  
  def show
    @artifact = Artifact.find(params[:id])
  end

  def index
    if params[:point_type] == "Calf Creek"
      @calf_creek = Artifact.where(point_type: "Calf Creek")
      render :calf_creek
    else
      @artifacts = Artifact.where(point_type: params[:point_type])
    end
  end
end
