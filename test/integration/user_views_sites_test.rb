require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = TexArch::Application
    stub_omniauth
  end

  test "user can view sites index" do
    login_user
    sites = Site.all

    visit '/'
    click_link("Sites")

    assert_equal sites_path, current_path
    assert page.has_content?("All Sites")
    assert_equal 3, sites.count
    assert page.has_content?(sites.first.name)
    assert page.has_content?(sites.last.name)
  end

  test "user can view individual site" do
    login_user
    site = Site.first

    visit '/sites'
    click_link(site.name)

    assert_equal site_path(site.id), current_path
    assert page.has_content?(site.name)
    assert page.has_content?(site.trinominal)
    assert page.has_content?(site.description)
    assert page.has_content?(site.longitude)
    assert page.has_content?(site.latitude)
    assert page.has_content?(site.site_type)
    assert page.has_css?("img[src*='landscape.jpg']")
  end
end
