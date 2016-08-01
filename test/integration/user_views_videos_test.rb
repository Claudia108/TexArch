require 'test_helper'

class UserViewsVideosTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = TexArch::Application
    stub_omniauth
  end

  test "user can view videos index" do
    login_user
    videos = Video.all

    visit '/'
    within('.navbar') do
      click_link("Videos")
    end

    assert_equal videos_path, current_path
    assert page.has_content?("Watch a Video")
    assert_equal 2, videos.count
    assert page.has_content?(videos.first.title)
    assert page.has_content?(videos.last.title)
  end

  test "user can view individual video" do
    login_user
    video = Video.first

    visit '/videos'
    click_link(video.title)

    assert_equal video_path(video.id), current_path
    assert page.has_content?(video.title)
    assert page.has_content?(video.description)
    assert page.has_css?("iframe")
  end
end
