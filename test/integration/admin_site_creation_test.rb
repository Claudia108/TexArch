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
    fill_in "site[trinominal]", with: "XCF123"
    fill_in "site[description]", with: "Visit a fun city!"
    fill_in "site[longitude]", with: "-104.991531"
    fill_in "site[latitude]", with: "39.742043"
    attach_file("site[image]", 'app/assets/images/landscape.jpg')
    find(:css, "#radio1").set(true)

    click_button("Add Site")

    assert_equal site_path(Site.last.id), current_path
    assert page.has_content?("#{Site.last.name} Created!")
    assert page.has_content?("Name")
    assert page.has_content?("Denver Site")
    assert page.has_content?("public_site")
    assert page.has_content?("Visit a fun city!")
    assert page.has_content?("XCF123")
    assert page.has_css?("img[src*='landscape.jpg']")
  end

  test "returns error if name is missing" do
    admin = admin_login

    assert_equal '/admin/dashboard', current_path
    assert page.has_content?("#{admin.first_name}, welcome to your dashboard")
    assert page.has_link?("Add a new Site")

    click_link("Add a new Site")
    assert_equal new_admin_site_path, current_path

    fill_in "site[longitude]", with: "-104.991531"
    fill_in "site[latitude]", with: "39.742043"
    find(:css, "#radio1").set(true)

    click_button("Add Site")

    assert_equal new_admin_site_path, current_path
    assert page.has_content?("Data is missing or invalid! Try again")
  end

  test "returns error if longitude or latitude is missing" do
    admin = admin_login

    assert_equal '/admin/dashboard', current_path
    assert page.has_content?("#{admin.first_name}, welcome to your dashboard")
    assert page.has_link?("Add a new Site")

    click_link("Add a new Site")
    assert_equal new_admin_site_path, current_path

    fill_in "site[name]", with: "Denver Site"
    fill_in "site[latitude]", with: "39.742043"
    find(:css, "#radio1").set(true)

    click_button("Add Site")

    assert_equal new_admin_site_path, current_path
    assert page.has_content?("Data is missing or invalid! Try again")
  end

  test "returns default values if trinominal or description is missing" do
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
    assert page.has_content?("#{Site.last.name} Created!")
    assert page.has_content?("Name")
    assert page.has_content?("Denver Site")
    assert page.has_content?("public_site")
    assert page.has_content?("no description available")
    assert page.has_content?("no trinominal available")
  end

  test "updating a site" do
    admin = admin_login
    site = Site.first
    new_site_name = "Large Gault Site"

    assert_equal '/admin/dashboard', current_path
    assert page.has_content?("#{admin.first_name}, welcome to your dashboard")

    click_link("Sites")
    assert_equal sites_path, current_path

    click_link(site.name)
    assert_equal site_path(site.id), current_path

    click_link("Edit")
    assert_equal edit_admin_site_path(site.id), current_path

    fill_in "site[name]", with: new_site_name
    click_button("Update Site")

    assert_equal site_path(site.id), current_path
    assert page.has_content?("#{new_site_name} Updated!")
    assert page.has_content?("Longitude")
    assert page.has_content?(site.longitude)
  end

  test "returns error if attribute of updated site is missing" do
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

    fill_in "site[longitude]", with: ""
    fill_in "site[latitude]", with: "39.742043"
    find(:css, "#radio1").set(true)

    click_button("Update Site")

    assert_equal edit_admin_site_path(site.id), current_path
    assert page.has_content?("Data is missing or invalid! Try again")
  end

  test "admin cannot delete a site" do
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

    refute page.has_link?("Delete")
  end
end
