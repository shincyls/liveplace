require "application_system_test_case"

class NeighborhoodPostsTest < ApplicationSystemTestCase
  setup do
    @neighborhood_post = neighborhood_posts(:one)
  end

  test "visiting the index" do
    visit neighborhood_posts_url
    assert_selector "h1", text: "Neighborhood Posts"
  end

  test "creating a Neighborhood post" do
    visit neighborhood_posts_url
    click_on "New Neighborhood Post"

    fill_in "Image", with: @neighborhood_post.image
    fill_in "Neighborhood", with: @neighborhood_post.neighborhood_id
    fill_in "Post", with: @neighborhood_post.post
    fill_in "Video Url", with: @neighborhood_post.video_url
    click_on "Create Neighborhood post"

    assert_text "Neighborhood post was successfully created"
    click_on "Back"
  end

  test "updating a Neighborhood post" do
    visit neighborhood_posts_url
    click_on "Edit", match: :first

    fill_in "Image", with: @neighborhood_post.image
    fill_in "Neighborhood", with: @neighborhood_post.neighborhood_id
    fill_in "Post", with: @neighborhood_post.post
    fill_in "Video Url", with: @neighborhood_post.video_url
    click_on "Update Neighborhood post"

    assert_text "Neighborhood post was successfully updated"
    click_on "Back"
  end

  test "destroying a Neighborhood post" do
    visit neighborhood_posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Neighborhood post was successfully destroyed"
  end
end
