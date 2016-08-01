class VideosController < ApplicationController
  after_action :allow_youtube_iframe

  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
    @link = Video.youtube_embed(@video.link)
  end
end
