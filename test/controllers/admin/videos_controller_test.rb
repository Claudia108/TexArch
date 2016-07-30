require 'test_helper'

class Admin::VideosControllerTest < ActionController::TestCase
  setup do
    @video = videos(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create video" do
    assert_difference("Video.count") do
      post :create, video: {
                      title: @video.title,
                      description: @video.description,
                      link: @video.link}
    end
    assert_redirected_to video_path(assigns(:video))
  end

  test "should get edit" do
    get :edit, id: @video.id
    assert_response :success
  end

  test "should update video" do
    patch :update, id: @video.id, video: {
                                title: @video.title,
                                description: @video.description,
                                link: @video.link }
    assert_response :success
    assert_redirected_to video_path(assigns(:video))
  end

  test "should destroy video" do
    @video
    assert_difference('Video.count', -1) do
      delete :destroy, id: @video.id
    end
    assert_redirected_to videos_path
  end
end
