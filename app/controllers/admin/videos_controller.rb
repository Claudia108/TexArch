class Admin::VideosController < Admin::BaseController
  after_action :allow_youtube_iframe
  
  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      flash[:notice] = "#{@video.title} Saved!"
      redirect_to video_path(@video.id)
    else
      flash[:notice] = "Data is missing or invalid! Try again"
      redirect_to new_admin_video_path
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    if @video.update_attributes(video_params)
      flash[:alert] = "Video titled: '#{@video.title}' Updated!"
      redirect_to video_path(@video)
    else
      flash[:alert] = "Data is missing or invalid! Try again"
      redirect_to edit_admin_video_path(@video)
    end
  end

  def destroy
    video = Video.find(params[:id])
    video.destroy
    flash[:notice] = "Video titled: '#{video.title}' Deleted!"
    redirect_to videos_path
  end

  private

  def video_params
    params.require(:video).permit(:title, :description, :link)
  end
end
