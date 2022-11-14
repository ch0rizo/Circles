require "test_helper"

class UserCirclesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_circles_create_url
    assert_response :success
  end
end
