require "application_system_test_case"

class NeighborhoodRepliesTest < ApplicationSystemTestCase
  setup do
    @neighborhood_reply = neighborhood_replies(:one)
  end

  test "visiting the index" do
    visit neighborhood_replies_url
    assert_selector "h1", text: "Neighborhood Replies"
  end

  test "creating a Neighborhood reply" do
    visit neighborhood_replies_url
    click_on "New Neighborhood Reply"

    fill_in "Image", with: @neighborhood_reply.image
    fill_in "Neighborhood Post", with: @neighborhood_reply.neighborhood_post_id
    fill_in "Reply", with: @neighborhood_reply.reply
    fill_in "User", with: @neighborhood_reply.user_id
    fill_in "Video Url", with: @neighborhood_reply.video_url
    click_on "Create Neighborhood reply"

    assert_text "Neighborhood reply was successfully created"
    click_on "Back"
  end

  test "updating a Neighborhood reply" do
    visit neighborhood_replies_url
    click_on "Edit", match: :first

    fill_in "Image", with: @neighborhood_reply.image
    fill_in "Neighborhood Post", with: @neighborhood_reply.neighborhood_post_id
    fill_in "Reply", with: @neighborhood_reply.reply
    fill_in "User", with: @neighborhood_reply.user_id
    fill_in "Video Url", with: @neighborhood_reply.video_url
    click_on "Update Neighborhood reply"

    assert_text "Neighborhood reply was successfully updated"
    click_on "Back"
  end

  test "destroying a Neighborhood reply" do
    visit neighborhood_replies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Neighborhood reply was successfully destroyed"
  end
end
