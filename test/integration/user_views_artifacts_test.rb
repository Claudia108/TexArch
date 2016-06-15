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

    assert_equal points_path("Andice"), current_path

    within("#table-#{andice.first.id}") do
      assert page.has_content?("Andice")
      assert_equal 2, andice.count
      refute page.has_content?("Bell")
      refute page.has_content?("Calf Creek")
    end
  end

  test "user can view bell points" do
    login_user
    bell = Artifact.where(point_type: "Bell")

    visit '/calf_creek_horizon'
    within("#artifact-links") do
      click_link("Bell Points")
    end

    assert_equal points_path("Bell"), current_path

    within("#table-#{bell.first.id}") do
      assert page.has_content?("Bell")
      assert_equal 2, bell.count
      refute page.has_content?("Andice")
      refute page.has_content?("Calf Creek")
    end
  end

  test "user can view Calf Creek points" do
    login_user
    calf_creek = Artifact.where(point_type: "Calf Creek")

    visit '/calf_creek_horizon'
    within("#artifact-links") do
      click_link("Calf Creek Points")
    end

    assert_equal points_path("Calf Creek"), current_path

    assert page.has_content?("All Calf Creek Points")
    assert_equal 2, calf_creek.count
    refute page.has_content?("Artifact Point Type: Andice")
    refute page.has_content?("Artifact Point Type: Bell")
  end

  test "user views single artifact" do
    login_user
    artifact = Artifact.find_by(point_type: "Bell")

    visit '/calf_creek_horizon'
    within('#artifact-links') do
      click_link("Bell Points")
    end
    assert_equal points_path("Bell"), current_path
    find("#image-#{artifact.id}").click

    assert_equal artifact_path(artifact.id), current_path
    assert page.has_content?("Point Type")
    assert page.has_content?("Bell")
    assert page.has_content?("1456")
    assert page.has_content?("1003")
  end
end
