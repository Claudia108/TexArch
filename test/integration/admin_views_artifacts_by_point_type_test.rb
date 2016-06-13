require 'test_helper'

class AdminViewsArtifactsByPointTypeTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = TexArch::Application
    stub_omniauth
  end

  test "admin can view andice points" do
    admin_login
    andice = Artifact.where(point_type: "Andice")

    visit '/calf_creek_horizon'
    within("#artifact-links") do
      click_link("Andice Points")
    end

    assert_equal admin_points_path("Andice"), current_path
    assert page.has_content?("Artifact Point Type: Andice")
    assert_equal 2, andice.count
    refute page.has_content?("Artifact Point Type: Bell")
    refute page.has_content?("Artifact Point Type: Calf Creek")
  end

  test "admin can view bell points" do
    admin_login
    bell = Artifact.where(point_type: "Bell")

    visit '/calf_creek_horizon'
    within("#artifact-links") do
      click_link("Bell Points")
    end

    assert_equal admin_points_path("Bell"), current_path
    assert page.has_content?("Artifact Point Type: Bell")
    assert_equal 2, bell.count
    refute page.has_content?("Artifact Point Type: Andice")
    refute page.has_content?("Artifact Point Type: Calf Creek")
  end

  test "admin can view Calf Creek points" do
    admin_login
    calf_creek = Artifact.where(point_type: "Calf Creek")

    visit '/calf_creek_horizon'
    within("#artifact-links") do
      click_link("Calf Creek Points")
    end

    assert_equal admin_points_path("Calf Creek"), current_path
    assert page.has_content?("All Calf Creek Points")
    assert_equal 2, calf_creek.count
    refute page.has_content?("Artifact Point Type: Andice")
    refute page.has_content?("Artifact Point Type: Bell")
  end
end
