require 'test_helper'

class AllViewInfoPagesTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = TexArch::Application
    stub_omniauth
  end

  test "visitor can view calf creek horizon info page" do
    visit '/calf_creek_horizon'
    click_link("Learn more")
    assert_equal info_index_path, current_path

    within("h2") do
      assert page.has_content?("Calf Creek Horizon")
    end

    assert page.has_content?("At the terminus of the Early Archaic")
    assert page.has_css?("#andice")
    assert page.has_content?("Stay tuned!")

    click_link("Back")
    assert_equal cch_path, current_path
  end

  test "user can view calf creek horizon info page" do
    login_user

    visit '/calf_creek_horizon'
    click_link("Learn more")
    assert_equal info_index_path, current_path

    within("h2") do
      assert page.has_content?("Calf Creek Horizon")
    end

    assert page.has_content?("At the terminus of the Early Archaic")
    assert page.has_css?("#andice")
    assert page.has_content?("Stay tuned!")

    click_link("Back")
    assert_equal cch_path, current_path
  end

  test "admin can view calf creek horizon info page" do
    admin_login

    visit '/calf_creek_horizon'
    click_link("Learn more")
    assert_equal info_index_path, current_path

    within("h2") do
      assert page.has_content?("Calf Creek Horizon")
    end

    assert page.has_content?("At the terminus of the Early Archaic")
    assert page.has_css?("#andice")
    assert page.has_content?("Stay tuned!")

    click_link("Back")
    assert_equal cch_path, current_path
  end

  test "visitor can view cch preforms info page" do
    visit '/calf_creek_horizon'

    find("#preform").click

    assert_equal preforms_path, current_path

    within("h2") do
      assert page.has_content?("Calf Creek Horizon Preforms")
    end
    assert page.has_css?("#preform")

    click_link("Back")
    assert_equal cch_path, current_path
  end
end
