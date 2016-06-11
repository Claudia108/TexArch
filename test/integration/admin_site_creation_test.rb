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

    click_button("Add this Site")

    assert_equal admin_site_path(Site.last.id), current_path
    assert page.has_content?("Site Name")
    assert page.has_content?("Denver Site")
    assert page.has_content?("public_site")
  end

end