require 'test_helper'

class AllViewInfoPageTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = TexArch::Application
    stub_omniauth
  end

  test "visitor can view calf creek horizon info page" do
    visit '/calf_creek_horizon'
    click_link("Learn more")
    assert_equal cch_info_path, current_path

    within("h2") do
      assert page.has_content?("Calf Creek Horizon")
    end

    assert page.has_content?("At the terminus of the Early Archaic")
    # assert page.has_css?("img[src*='Andice.jpg']")
    assert page.has_content?("Stay tuned!")
  end

  test "user can view calf creek horizon info page" do
    login_user

    visit '/calf_creek_horizon'
    click_link("Learn more")
    assert_equal cch_info_path, current_path

    within("h2") do
      assert page.has_content?("Calf Creek Horizon")
    end

    assert page.has_content?("At the terminus of the Early Archaic")
    # assert page.has_css?("img[src*='Andice.jpg']")
    assert page.has_content?("Stay tuned!")
  end

  test "admin can view calf creek horizon info page" do
    admin_login

    visit '/calf_creek_horizon'
    click_link("Learn more")
    assert_equal cch_info_path, current_path

    within("h2") do
      assert page.has_content?("Calf Creek Horizon")
    end

    assert page.has_content?("At the terminus of the Early Archaic")
    # assert page.has_css?("img[src*='Andice.jpg']")
    assert page.has_content?("Stay tuned!")
  end
end
