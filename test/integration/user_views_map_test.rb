require 'test_helper'

class UserViewsMapTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = TexArch::Application
    stub_omniauth
  end

  test "user can view map" do
    login_user
    visit '/'
    click_link("Map")
    assert_equal map_path, current_path

    assert page.has_content?("Geographic Location of all Sites")
    assert page.has_css?("#map")
  end
end
