class VideosController < ApplicationController

  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
    @link = Video.youtube_embed(@video.link)
  end
end
