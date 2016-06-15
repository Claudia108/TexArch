require 'test_helper'

class AdminViewsArtifactsByPointTypeTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = TexArch::Application
    stub_omniauth
  end

  test "admin can view all users" do
    admin = admin_login
    users = User.all

    assert_equal admin_dashboard_path, current_path
    assert page.has_content?("#{admin.first_name}, welcome to your dashboard")
    assert page.has_link?("Users")

    click_link("Current User(s)")

    assert_equal admin_users_path, current_path

    within(".table-striped") do
      assert_equal 3, users.count
      assert page.has_content?(users.first.first_name)
      assert page.has_content?(users.first.last_name)
      assert page.has_content?(users.first.email)

      assert page.has_content?(users.last.first_name)
      assert page.has_content?(users.last.last_name)
      assert page.has_content?(users.last.email)
    end
  end
end
