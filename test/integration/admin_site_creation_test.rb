require 'test_helper'

class AdminSiteCreationTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = TexArch::Application
  end

  test "creating a site" do
    admin = admin_login

    assert_equal '/admin/dashboard', current_path
    assert page.has_content?("#{admin.first_name}, welcome to your dashboard")
    assert page.has_link?("Add a new Site")

    click_link("Add a new Site")
    assert_equal new_admin_site_path, current_path

    fill_in "site[name]", with: "Denver Site"
    fill_in "site[longitude]", with: "-104.991531"
    fill_in "site[latitude]", with: "39.742043"
    find(:css, "#radio1").set(true)

    click_button("Add Site")

    assert_equal site_path(Site.last.id), current_path
    assert page.has_content?("Site Name")
    assert page.has_content?("Denver Site")
    assert page.has_content?("public_site")
  end

  test "updating a site" do
    admin = admin_login
    site = Site.first

    assert_equal '/admin/dashboard', current_path
    assert page.has_content?("#{admin.first_name}, welcome to your dashboard")

    click_link("Sites")
    assert_equal sites_path, current_path
    click_link(site.name)
    assert_equal site_path(site.id), current_path
    click_link("Edit")
    assert_equal edit_admin_site_path(site.id), current_path

    fill_in "site[name]", with: "Gault Artifacts"
    click_button("Update Site")

    assert_equal site_path(site.id), current_path
    assert page.has_content?("Name")
    assert page.has_content?("Gault Artifacts")
  end

  test "deleting a site" do
    admin = admin_login
    site = Site.first

    assert_equal '/admin/dashboard', current_path
    click_link("Sites")
    assert_equal sites_path, current_path

    click_link(site.name)
    assert_equal site_path(site.id), current_path
    assert page.has_content?(site.name)
    assert page.has_content?(site.longitude)
    assert page.has_content?(site.latitude)

    click_link("Delete")
    assert_equal sites_path, current_path

    refute page.has_content?(site.name)
    refute page.has_content?(site.longitude)
    refute page.has_content?(site.latitude)
  end

end
