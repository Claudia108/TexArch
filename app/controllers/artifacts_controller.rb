class ArtifactsController < ApplicationController
  def show
    @artifact = Artifact.find(params[:id])
  end
end
