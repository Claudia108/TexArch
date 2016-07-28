require "simplecov"
SimpleCov.start "rails"

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/autorun'
require 'minitest/pride'
require "capybara/rails"
require "vcr"
require "webmock"
require "minitest-vcr"
require "mocha/mini_test"
require 'database_cleaner'
# require 'shoulda/matchers'


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      provider: 'google_oauth2',
      uid: "15485124",
      info: {
        first_name: "Claudia",
        last_name: "Kiesenhofer",
        email: "me@me.com"
      }
    })
  end

  def login_user
    User.from_omniauth(stub_omniauth)
    user = User.find_by(uid: "15485124")
    visit '/'
    within(".navbar-right") do
      click_link("Sign in with Google")
    end
    assert_equal '/', current_path
    user
  end

  def admin_login
    User.from_omniauth(stub_omniauth)
    user = User.find_by(uid: "15485124")
    user.admin!
    visit '/'
    within(".navbar-right") do
      find("#sign-in").click
    end

    assert_equal '/admin/dashboard', current_path
    user
  end
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL


  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
# then, whenever you need to clean the DB
end
