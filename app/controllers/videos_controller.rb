class VideosController < ApplicationController
  after_action :allow_youtube_iframe

  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
    @link = Video.youtube_embed(@video.link)
  end


private

  def allow_youtube_iframe
    response.headers['X-Frame-Options'] = 'ALLOW-FROM https://www.youtube.com'
  end
end
