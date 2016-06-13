class ArtifactsController < ApplicationController

  def show
    @artifact = Artifact.find(params[:id])
  end

  def andice
    @andice = Artifact.where(point_type: "Andice")
  end

  def bell
    @bell = Artifact.where(point_type: "Bell")
  end

  def calf_creek
    @calf_creek = Artifact.where(point_type: "Calf Creek")
  end

end
