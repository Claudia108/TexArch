# require 'test_helper'
#
# class UserViewsMapTest < ActionDispatch::IntegrationTest
#   def setup
#     Capybara.app = TexArch::Application
#   end
#
#   test "user can view map" do
#     Capybara.current_driver = :selenium
#     login_user
#     visit '/'
#     click_link("Map")
#     assert_equal map_path, current_path
#
#     assert page.has_content?("Map")
#     assert page.has_content?("Satellite")
#   end
#
#
# end
