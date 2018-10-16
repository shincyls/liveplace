require 'test_helper'

class NeighborhoodRepliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @neighborhood_reply = neighborhood_replies(:one)
  end

  test "should get index" do
    get neighborhood_replies_url
    assert_response :success
  end

  test "should get new" do
    get new_neighborhood_reply_url
    assert_response :success
  end

  test "should create neighborhood_reply" do
    assert_difference('NeighborhoodReply.count') do
      post neighborhood_replies_url, params: { neighborhood_reply: { image: @neighborhood_reply.image, neighborhood_post_id: @neighborhood_reply.neighborhood_post_id, reply: @neighborhood_reply.reply, user_id: @neighborhood_reply.user_id, video_url: @neighborhood_reply.video_url } }
    end

    assert_redirected_to neighborhood_reply_url(NeighborhoodReply.last)
  end

  test "should show neighborhood_reply" do
    get neighborhood_reply_url(@neighborhood_reply)
    assert_response :success
  end

  test "should get edit" do
    get edit_neighborhood_reply_url(@neighborhood_reply)
    assert_response :success
  end

  test "should update neighborhood_reply" do
    patch neighborhood_reply_url(@neighborhood_reply), params: { neighborhood_reply: { image: @neighborhood_reply.image, neighborhood_post_id: @neighborhood_reply.neighborhood_post_id, reply: @neighborhood_reply.reply, user_id: @neighborhood_reply.user_id, video_url: @neighborhood_reply.video_url } }
    assert_redirected_to neighborhood_reply_url(@neighborhood_reply)
  end

  test "should destroy neighborhood_reply" do
    assert_difference('NeighborhoodReply.count', -1) do
      delete neighborhood_reply_url(@neighborhood_reply)
    end

    assert_redirected_to neighborhood_replies_url
  end
end
