require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = TexArch::Application
    stub_omniauth
  end

  test "logging in" do
    visit '/'
    assert_equal 200, page.status_code
    click_link "Sign in with Google"
    assert_equal "/", current_path
    assert page.has_content?("Claudia")
    assert page.has_link?("Logout")
  end

  test "after login user is redirected to calf_creek_horizon page" do
    visit '/calf_creek_horizon'
    assert_equal 200, page.status_code
    click_link "Sign in with Google"
    assert_equal "/calf_creek_horizon", current_path
    assert page.has_content?("Claudia")
  end

  test "after login user is redirected to info page" do
    visit '/info'
    assert_equal 200, page.status_code
    click_link "Sign in with Google"
    assert_equal "/info", current_path
    assert page.has_content?("Claudia")
  end

  test "after login user is redirected to info/preform page" do
    visit '/info/preforms'
    assert_equal 200, page.status_code
    click_link "Sign in with Google"
    assert_equal "/info/preforms", current_path
    assert page.has_content?("Claudia")
  end

  test "logging out" do
    visit '/'
    click_link "Sign in with Google"
    assert_equal "/", current_path
    assert page.has_content?("Claudia")
    assert page.has_link?("Logout")
    click_link "Logout"
    assert_equal '/', current_path
    refute page.has_content?("Claudia")
    refute page.has_content?("Logout")
    assert page.has_content?("Sign in with Google")
  end
end
