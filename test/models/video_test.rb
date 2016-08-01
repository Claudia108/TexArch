require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  should validate_presence_of(:title)
  should validate_presence_of(:link)

  test "it trasforms youtube link" do
    url = "https://www.youtube.com/watch?v=pqhBgCTPTwA"

    assert_equal "pqhBgCTPTwA", Video.transform_link(url)
  end

  test "youtube_embed returns iframe with transformed link embedded" do
    link = "https://www.youtube.com/watch?v=pqhBgCTPTwA"
    iframe = Video.youtube_embed(link)

    assert_equal "<iframe title=\"YouTube video player\" width=\"640\" height=\"390\" src=\"http://www.youtube.com/embed/pqhBgCTPTwA\" frameborder=\"0\" allowfullscreen></iframe>", iframe
  end
end
