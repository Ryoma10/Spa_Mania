require "test_helper"

class Public::BathhousesControllerTest < ActionDispatch::IntegrationTest
  test "should get confirm" do
    get public_bathhouses_confirm_url
    assert_response :success
  end

  test "should get new" do
    get public_bathhouses_new_url
    assert_response :success
  end

  test "should get image" do
    get public_bathhouses_image_url
    assert_response :success
  end

  test "should get create_confirm" do
    get public_bathhouses_create_confirm_url
    assert_response :success
  end

  test "should get create" do
    get public_bathhouses_create_url
    assert_response :success
  end

  test "should get show" do
    get public_bathhouses_show_url
    assert_response :success
  end

  test "should get index" do
    get public_bathhouses_index_url
    assert_response :success
  end

  test "should get reviews" do
    get public_bathhouses_reviews_url
    assert_response :success
  end

  test "should get congestion_situation" do
    get public_bathhouses_congestion_situation_url
    assert_response :success
  end

  test "should get edit" do
    get public_bathhouses_edit_url
    assert_response :success
  end

  test "should get edit_image" do
    get public_bathhouses_edit_image_url
    assert_response :success
  end

  test "should get edit_confirm" do
    get public_bathhouses_edit_confirm_url
    assert_response :success
  end

  test "should get review_show" do
    get public_bathhouses_review_show_url
    assert_response :success
  end

  test "should get update" do
    get public_bathhouses_update_url
    assert_response :success
  end
end
