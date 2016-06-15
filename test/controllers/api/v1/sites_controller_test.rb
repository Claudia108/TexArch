require 'test_helper'

class Api::V1::SitesControllerTest < ActionController::TestCase
  test "can visit index" do
    get "index", format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 3, parsed_json.count
    assert parsed_json.first.has_key?("name")
    assert parsed_json.first.has_key?("longitude")
  end
end
