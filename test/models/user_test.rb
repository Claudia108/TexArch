require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "it creates user in database" do
    user = User.from_omniauth(stub_omniauth)

    assert_equal "Claudia", user.first_name
    assert_equal "Kiesenhofer", user.last_name
    assert_equal "me@me.com", user.email
    assert_equal "15485124", user.uid
  end

  test "returns formatted date and time" do
    user = User.first
    user.update(created_at: "Sat, 11 Jun 2016 01:51:00 UTC +00:00")
    assert_equal "2016-06-11, 1:51 AM", user.first_visit
  end
end
