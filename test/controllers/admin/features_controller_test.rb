require "test_helper"

class Admin::FeaturesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_features_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_features_destroy_url
    assert_response :success
  end
end
