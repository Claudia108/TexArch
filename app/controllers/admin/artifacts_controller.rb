class Admin::ArtifactsController < Admin::BaseController

  def new
    @artifact = Artifact.new
  end

  def create
    @artifact = Artifact.new(artifact_params)
    if @artifact.save
      flash[:notice] = "Artifact with UI #{@artifact.ui} created!"
      redirect_to admin_artifact_path(@artifact.id)
    else
      flash[:notice] = "Invalid! Try Again"
      render :new
    end
  end

  def index
    @artifacts = Artifact.all
  end

  def show
    @artifact = Artifact.find(params[:id])
  end

  def edit
    @artifact = Artifact.find(params[:id])
  end

  def update
    @artifact = Artifact.find(params[:id])
    if @artifact.update_attributes(artifact_params)
      flash[:notice] = "Artifact Updated!"
      redirect_to admin_artifact_path(@artifact.id)
    else
      flash[:notice] = "Invalid! Try Again"
      render :edit
    end
  end

  def destroy
    artifact = Artifact.find(params[:id])
    artifact.destroy
    flash[:notice] = "Artifact Deleted!"
    redirect_to admin_artifacts_path
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


  private

  def artifact_params
    params.require(:artifact).permit(:id, :ui, :point_type, :max_width, :max_length,
                  :max_thickness, :basal_edge_width, :site_id, :image)
  end
end
