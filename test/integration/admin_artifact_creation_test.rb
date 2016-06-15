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
    fill_in "artifact[max_length]", with: "1500"
    fill_in "artifact[max_thickness]", with: "47"
    fill_in "artifact[max_width]", with: "700"
    fill_in "artifact[basal_edge_width]", with: "12"
    select(site.name, from: "artifact[site_id]")
    select("Andice", from: "artifact[point_type]")
    attach_file("artifact[image]", 'app/assets/images/andice.jpg')

    click_button("Add Artifact")

    assert_equal artifact_path(Artifact.last.id), current_path
    assert page.has_content?("Point Type")
    assert page.has_content?("Andice")
    assert page.has_css?("img[src*='andice.jpg']")
  end

  test "updating an artifact" do
    admin = admin_login
    site = Site.first
    new_site = Site.last
    new_image = "app/assets/images/Figure11.jpg"

    assert_equal '/admin/dashboard', current_path
    assert page.has_content?("#{admin.first_name}, welcome to your dashboard")
    assert page.has_link?("Add a new Artifact")
    click_link("Add a new Artifact")
    assert_equal new_admin_artifact_path, current_path

    fill_in "artifact[ui]", with: "17"
    fill_in "artifact[max_length]", with: "1500"
    fill_in "artifact[max_thickness]", with: "47"
    fill_in "artifact[max_width]", with: "700"
    fill_in "artifact[basal_edge_width]", with: "12"
    select("Bell", from: "artifact[point_type]")
    select(site.name, from: "artifact[site_id]")
    attach_file("artifact[image]", 'app/assets/images/andice.jpg')
    click_button("Add Artifact")

    assert_equal artifact_path(Artifact.last.id), current_path
    click_link("Edit")
    assert_equal edit_admin_artifact_path(Artifact.last.id), current_path

    fill_in "artifact[max_thickness]", with: "4987"
    select("Andice", from: "artifact[point_type]")
    select(new_site.name, from: "artifact[site_id]")
    attach_file("artifact[image]", "#{new_image}")

    click_button("Update Artifact")

    assert_equal artifact_path(Artifact.last.id), current_path
    assert page.has_content?("Point Type")
    assert page.has_content?("Andice")
    assert page.has_content?("#{new_site.name}")
    assert page.has_css?("img[src*='Figure11.jpg']")
  end

  test "deleting an artifact" do
    admin = admin_login
    artifacts = Artifact.where(point_type: "Andice")

    assert_equal '/admin/dashboard', current_path
    assert page.has_content?("#{admin.first_name}, welcome to your dashboard")
    click_link("Andice")

    assert_equal points_path("Andice"), current_path
    assert page.has_content?(artifacts.last.ui)

    visit artifact_path(artifacts.last.id)
    click_link("Delete")
    assert_equal admin_artifacts_path, current_path

    refute page.has_content?(artifacts.last.ui)
  end
end
