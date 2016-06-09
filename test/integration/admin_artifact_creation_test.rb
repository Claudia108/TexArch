require 'test_helper'

class AdminArtifactCreationTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = TexArch::Application
  end

  test "creating an artifact" do
    admin = admin_login
    site = Site.first

    assert_equal '/admin/dashboard', current_path
    assert page.has_content?("#{admin.first_name}, welcome to your dashboard")
    assert page.has_link?("Add a new Artifact")

    click_link("Add a new Artifact")
    assert_equal new_admin_artifact_path, current_path

    fill_in "artifact[ui]", with: "17"
    fill_in "artifact[point_type]", with: "Bell"
    fill_in "artifact[max_length]", with: "1500"
    fill_in "artifact[max_thickness]", with: "47"
    fill_in "artifact[max_width]", with: "700"
    fill_in "artifact[basal_edge_width]", with: "12"
    select(site.name, from: "artifact[site_id]")
    attach_file("artifact[image]", 'app/assets/images/andice.jpg')

    click_button("Add this Artifact")

    assert_equal artifact_path(Artifact.last.id), current_path
    assert page.has_content?("Artifact Point Type: Bell")
    assert page.has_css?("img[src*='andice.jpg']")
  end

  # test "updating an artifact" do
  #   admin = admin_login
  #   site = Site.create(name: "Gault", longitude: "39.3456", latitude: "-30.000")
  #
  #   assert_equal '/admin/dashboard', current_path
  #   assert page.has_content?("#{admin.first_name}, welcome to your dashboard")
  #   assert page.has_link?("Add a new Artifact")
  #
  #   click_link("Add a new Artifact")
  #   assert_equal new_admin_artifact_path, current_path
  #
  #   fill_in "artifact[ui]", with: "17"
  #   fill_in "artifact[point_type]", with: "Bell"
  #   fill_in "artifact[max_length]", with: "1500"
  #   fill_in "artifact[max_thickness]", with: "47"
  #   fill_in "artifact[max_width]", with: "700"
  #   fill_in "artifact[basal_edge_width]", with: "12"
  #   select("#{site}", from: "artifact[site_id]")
  #
  #   attach_file("image[artifact_file_name]", 'app/assets/images/andice.jpg')
  #
  #   click_button("Add this Artifact")
  #   assert_equal artifact_path(Artifact.last.id), current_path
  #   assert page.has_content?("Artifact Point Type: Bell")
  #   # assert page.has_css?("img[src*='app/assets/images/anice.jpg']")
  #
  # end
end
