require "test_helper"

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_users_show_url
    assert_response :success
  end

  test "should get stats" do
    get admin_users_stats_url
    assert_response :success
  end

  test "should get favorite_bathhouses" do
    get admin_users_favorite_bathhouses_url
    assert_response :success
  end

  test "should get follow" do
    get admin_users_follow_url
    assert_response :success
  end

  test "should get follower" do
    get admin_users_follower_url
    assert_response :success
  end

  test "should get edit" do
    get admin_users_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_users_update_url
    assert_response :success
  end

  test "should get confirm" do
    get admin_users_confirm_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_users_destroy_url
    assert_response :success
  end

  test "should get warning_new" do
    get admin_users_warning_new_url
    assert_response :success
  end

  test "should get warning" do
    get admin_users_warning_url
    assert_response :success
  end
end
