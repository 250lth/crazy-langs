require 'test_helper'

class Api::V1::CategoryControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_v1_category_show_url
    assert_response :success
  end

end
