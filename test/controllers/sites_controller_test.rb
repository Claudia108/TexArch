require 'test_helper'

class SitesControllerTest < ActionController::TestCase
  test "should get index" do
    sites = Site.all
    get :index

    assert_response :success
    assert_equal 3, sites.count
    assert sites.first.has_attribute?("name")
    assert sites.first.has_attribute?("longitude")
  end

  # test "should get show" do
  #   site = Site.first
  #   get :show
  #
  #   assert_response :success
  #   assert site.has_attribute?("name")
  #   assert site.has_attribute?("longitude")
  # end
end
