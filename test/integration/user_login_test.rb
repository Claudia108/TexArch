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
