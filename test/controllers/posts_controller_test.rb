require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get selfhelp" do
    get posts_selfhelp_url
    assert_response :success
  end

  test "should get introduction" do
    get posts_introduction_url
    assert_response :success
  end

  test "should get top" do
    get posts_top_url
    assert_response :success
  end

  test "should get index" do
    get posts_index_url
    assert_response :success
  end

  test "should get show" do
    get posts_show_url
    assert_response :success
  end

end
