class ArtifactsController < ApplicationController
  def show
    @artifact = Artifact.find(params[:id])
    # @image = Image.find_by(artifact_id: @artifact.id)
  end
end
