require "test_helper"

class Admin::WarningsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_warnings_create_url
    assert_response :success
  end
end
