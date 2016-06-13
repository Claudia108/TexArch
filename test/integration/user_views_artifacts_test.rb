require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = TexArch::Application
    stub_omniauth
  end

  test "user can view andice points" do
    login_user
    andice = Artifact.where(point_type: "Andice")

    visit '/calf_creek_horizon'
    within("#artifact-links") do
      click_link("Andice Points")
    end

    assert_equal andice_path, current_path
    assert page.has_content?("Artifact Point Type: Andice")
    assert_equal 2, andice.count
    refute page.has_content?("Artifact Point Type: Bell")
    refute page.has_content?("Artifact Point Type: Calf Creek")
  end

  test "user can view bell points" do
    login_user
    bell = Artifact.where(point_type: "Bell")

    visit '/calf_creek_horizon'
    within("#artifact-links") do
      click_link("Bell Points")
    end

    assert_equal bell_path, current_path
    assert page.has_content?("Artifact Point Type: Bell")
    assert_equal 2, bell.count
    refute page.has_content?("Artifact Point Type: Andice")
    refute page.has_content?("Artifact Point Type: Calf Creek")
  end

  test "user can view Calf Creek points" do
    login_user
    calf_creek = Artifact.where(point_type: "Calf Creek")

    visit '/calf_creek_horizon'
    within("#artifact-links") do
      click_link("Calf Creek Points")
    end

    assert_equal calf_creek_path, current_path
    assert page.has_content?("Artifact Point Type: Calf Creek")
    assert_equal 2, calf_creek.count
    refute page.has_content?("Artifact Point Type: Andice")
    refute page.has_content?("Artifact Point Type: Bell")
  end
end
