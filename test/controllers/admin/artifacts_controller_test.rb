require 'test_helper'

class Admin::ArtifactsControllerTest < ActionController::TestCase
  setup do
    @artifact = artifacts(:one)
    user = users(:one)
    user.update_attributes(role: 1)
    user
    @controller.stubs(:current_user).returns(user)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create artifact" do
    assert_difference("Artifact.count") do
      post :create, artifact: {
                      ui: @artifact.ui,
                      point_type: @artifact.point_type,
                      max_width: @artifact.max_width,
                      max_length: @artifact.max_length,
                      max_thickness: @artifact.max_thickness,
                      basal_edge_width: @artifact.basal_edge_width,
                      site_id: @artifact.site_id }
      assert_redirected_to artifact_path(assigns(:artifact))
    end
  end

  test "should get edit" do
    get :edit, id: @artifact.id
    assert_response :success
  end

  test "should update artifact" do
    patch :update, id: @artifact.id, artifact: {
                                ui: @artifact.ui,
                                point_type: @artifact.point_type,
                                max_width: @artifact.max_width,
                                max_length: @artifact.max_length,
                                max_thickness: @artifact.max_thickness,
                                basal_edge_width: @artifact.basal_edge_width,
                                site_id: @artifact.site_id }
    assert_redirected_to artifact_path(assigns(:artifact))
  end

  test "should destroy artifact" do
    @artifact
    assert_difference('Artifact.count', -1) do
      delete :destroy, id: @artifact.id
    end
    assert_redirected_to points_path(@artifact.point_type)
  end
end
