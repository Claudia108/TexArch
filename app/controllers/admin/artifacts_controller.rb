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
      flash[:notice] = "Invalid! Try Again"
      render :new
    end
  end

  def edit

  end

  def destroy

  end

  private

  def artifact_params
    params.require(:artifact).permit(:ui, :point_type, :max_width, :max_length,
                  :max_thickness, :basal_edge_width, :site_id)
  end
end
