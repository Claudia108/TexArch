require 'test_helper'

class ArtifactsControllerTest < ActionController::TestCase
  test "should get index of Bell" do
    artifacts = Artifact.where(point_type: "Bell")
    get :index, point_type: "Bell"

    assert_response :success
    assert_equal 2, artifacts.count
    assert artifacts.first.has_attribute?("ui")
    assert artifacts.first.has_attribute?("point_type")
  end

  test "should get index of Andice" do
    artifacts = Artifact.where(point_type: "Andice")
    get :index, point_type: "Andice"

    assert_response :success
    assert_equal 2, artifacts.count
    assert artifacts.first.has_attribute?("ui")
    assert artifacts.first.has_attribute?("point_type")
  end

  test "should get index of Calf Creek" do
    artifacts = Artifact.where(point_type: "Calf Creek")
    get :index, point_type: "Calf Creek"

    assert_response :success
    assert_equal 2, artifacts.count
    assert artifacts.first.has_attribute?("ui")
    assert artifacts.first.has_attribute?("point_type")
  end

  test "should show site" do
    get :show, id: Artifact.first.id
    assert_response :success
  end
end
