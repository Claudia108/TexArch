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
end
