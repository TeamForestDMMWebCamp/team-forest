require 'test_helper'

class Public::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_products_index_url
    assert_response :success
  end

  test "should get genre" do
    get public_products_genre_url
    assert_response :success
  end

  test "should get show" do
    get public_products_show_url
    assert_response :success
  end

  test "should get top" do
    get public_products_top_url
    assert_response :success
  end

  test "should get about" do
    get public_products_about_url
    assert_response :success
  end

end
