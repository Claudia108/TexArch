require 'test_helper'

class VideosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:videos)
  end

  test "should show video" do
    get :show, id: Video.first.id
    assert_response :success
  end
end
