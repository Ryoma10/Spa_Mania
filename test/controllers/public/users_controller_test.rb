require "test_helper"

class Public::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_users_show_url
    assert_response :success
  end

  test "should get stats" do
    get public_users_stats_url
    assert_response :success
  end

  test "should get favorite_bathhouses" do
    get public_users_favorite_bathhouses_url
    assert_response :success
  end

  test "should get follow" do
    get public_users_follow_url
    assert_response :success
  end

  test "should get follower" do
    get public_users_follower_url
    assert_response :success
  end

  test "should get edit" do
    get public_users_edit_url
    assert_response :success
  end

  test "should get confirm" do
    get public_users_confirm_url
    assert_response :success
  end
end
