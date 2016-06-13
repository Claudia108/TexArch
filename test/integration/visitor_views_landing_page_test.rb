require 'test_helper'

class VisitorViewsLandingPageTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = TexArch::Application
  end

  test "visitor views landing page" do
    visit '/'
    assert page.has_content?("Welcome to TexArch")
    assert page.has_content?("Sign in with Google")
  end

  test "visitor views calfcreek_horizon page" do
    visit '/'
    assert page.has_link?("Calf Creek Horizon")
    within("#bs-example-navbar-collapse-1") do
      click_link("Calf Creek Horizon")
    end

    assert_equal cch_path, current_path
    assert page.has_content?("Calf Creek Horizon")

  end

  test "visitor cannot visit map, artifacts and sites" do
    visit '/'

    refute page.has_content?("Map")
    refute page.has_content?("Artifacts")
    refute page.has_content?("Sites")

    within("#bs-example-navbar-collapse-1") do
      click_link("Calf Creek Horizon")
    end
    assert_equal cch_path, current_path

    refute page.has_content?("Map")
    refute page.has_content?("Artifacts")
    refute page.has_content?("Sites")
  end
end
