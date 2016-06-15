require 'test_helper'

class Admin::SitesControllerTest < ActionController::TestCase
  test "should get new" do
    site = Site.new
    get :new

    assert_response :success
    assert site.has_attribute?("name")
    assert site.has_attribute?("longitude")
  end

  # test "should get create" do
  #   get :create
  #   assert_response :success
  # end

end
