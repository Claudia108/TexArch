class Video < ActiveRecord::Base
  validates :title, presence: true
  validates :link, presence: true

  def self.transform_link(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
  end

  def self.youtube_embed(url)
    formatted_link = transform_link(url)
    %Q{<iframe title="YouTube video player" width="640" height="390" src="https://www.youtube.com/embed/#{ formatted_link }" frameborder="0" allowfullscreen></iframe>}
  end
end
