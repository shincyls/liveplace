require 'test_helper'

class NeighborhoodPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @neighborhood_post = neighborhood_posts(:one)
  end

  test "should get index" do
    get neighborhood_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_neighborhood_post_url
    assert_response :success
  end

  test "should create neighborhood_post" do
    assert_difference('NeighborhoodPost.count') do
      post neighborhood_posts_url, params: { neighborhood_post: { image: @neighborhood_post.image, neighborhood_id: @neighborhood_post.neighborhood_id, post: @neighborhood_post.post, video_url: @neighborhood_post.video_url } }
    end

    assert_redirected_to neighborhood_post_url(NeighborhoodPost.last)
  end

  test "should show neighborhood_post" do
    get neighborhood_post_url(@neighborhood_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_neighborhood_post_url(@neighborhood_post)
    assert_response :success
  end

  test "should update neighborhood_post" do
    patch neighborhood_post_url(@neighborhood_post), params: { neighborhood_post: { image: @neighborhood_post.image, neighborhood_id: @neighborhood_post.neighborhood_id, post: @neighborhood_post.post, video_url: @neighborhood_post.video_url } }
    assert_redirected_to neighborhood_post_url(@neighborhood_post)
  end

  test "should destroy neighborhood_post" do
    assert_difference('NeighborhoodPost.count', -1) do
      delete neighborhood_post_url(@neighborhood_post)
    end

    assert_redirected_to neighborhood_posts_url
  end
end
