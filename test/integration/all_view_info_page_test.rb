require 'test_helper'

class AllViewInfoPageTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = TexArch::Application
    stub_omniauth
  end

  test "admin can view calf creek horizon info page" do
    admin_login
    visit '/calf_creek_horizon'
    within("#artifact-links") do
      click_link("Andice Points")
    end
    within("#table-#{andice.first.id}") do
      assert_equal points_path("Andice"), current_path
      assert page.has_content?("Andice")
      assert_equal 2, andice.count
      refute page.has_content?("Bell")
      refute page.has_content?("Calf Creek")
    end
  end
