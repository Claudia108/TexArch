require 'test_helper'

class Admin::SitesControllerTest < ActionController::TestCase
  setup do
    @site = sites(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create site" do
    assert_difference("Site.count") do
      post :create, site: {
                    name: "My Site",
                    longitude: "-38.654",
                    latitude: "45.345",
                    site_type: "public_site"}
    end
    assert_equal 'no description available', assigns(:site).description
    assert_equal 'no description available', assigns(:site).trinominal
    assert_redirected_to site_path(assigns(:site))
  end

  test "should get edit" do
    get :edit, id: @site.id
    assert_response :success
  end

  test "should update site" do
    patch :update, id: @site.id, site: {
                                name: "new name",
                                longitude: "-56.789",
                                latitude: "54.678",
                                site_type: @site.site_type }
    assert_response :success
    assert_redirected_to site_path(assigns(:site))
  end
end
