require "test_helper"

class Admin::BathhousesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_bathhouses_show_url
    assert_response :success
  end

  test "should get index" do
    get admin_bathhouses_index_url
    assert_response :success
  end

  test "should get reviews" do
    get admin_bathhouses_reviews_url
    assert_response :success
  end

  test "should get congestion_situation" do
    get admin_bathhouses_congestion_situation_url
    assert_response :success
  end

  test "should get edit" do
    get admin_bathhouses_edit_url
    assert_response :success
  end

  test "should get edit_image" do
    get admin_bathhouses_edit_image_url
    assert_response :success
  end

  test "should get edit_confirm" do
    get admin_bathhouses_edit_confirm_url
    assert_response :success
  end

  test "should get review_show" do
    get admin_bathhouses_review_show_url
    assert_response :success
  end

  test "should get update" do
    get admin_bathhouses_update_url
    assert_response :success
  end

  test "should get destroy_image" do
    get admin_bathhouses_destroy_image_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_bathhouses_destroy_url
    assert_response :success
  end
end
