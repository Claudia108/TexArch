class Admin::ArtifactsController < Admin::BaseController

  def new
    @artifact = Artifact.new
  end

  def create
    @artifact = Artifact.new(artifact_params)
    if @artifact.save
      flash[:notice] = "Artifact with UI #{@artifact.ui} created!"
      redirect_to artifact_path(@artifact.id)
    else
      flash[:alert] = "Data is missing or invalid! Try again"
      redirect_to new_admin_artifact_path
    end
  end

  def edit
    @artifact = Artifact.find(params[:id])
  end

  def update
    @artifact = Artifact.find(params[:id])
    if @artifact.update_attributes(artifact_params)
      flash[:alert] = "Artifact with UI #{@artifact.ui} updated!"
      redirect_to artifact_path(@artifact.id)
    else
      flash[:alert] = "Data is missing or invalid! Try again"
      redirect_to edit_admin_artifact_path
    end
  end

  def destroy
    artifact = Artifact.find(params[:id])
    artifact.destroy
    flash[:notice] = "Artifact with UI #{artifact.ui} Deleted!"
    redirect_to points_path(artifact.point_type)
  end

  private

  def artifact_params
    params.require(:artifact).permit(:id, :ui, :point_type, :max_width, :max_length,
                  :max_thickness, :basal_edge_width, :site_id, :image)
  end
end
