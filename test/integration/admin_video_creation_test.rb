require 'test_helper'

class AdminVideoCreationTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = TexArch::Application
  end

  test "creating an video" do
    admin = admin_login

    assert_equal '/admin/dashboard', current_path
    assert page.has_content?("#{admin.first_name}, welcome to your dashboard")
    assert page.has_link?("Add a new Video")

    click_link("Add a new Video")
    assert_equal new_admin_video_path, current_path

    fill_in "video[title]", with: "Flint Knapping"
    fill_in "video[description]", with: "Sergio is a hero."
    fill_in "video[link]", with: "https://www.youtube.com/watch?v=fxL3iAsbADw"

    click_button("Add Video")
    link = Video.transform_link(Video.last.link)

    assert_equal video_path(Video.last.id), current_path
    assert page.has_content?("#{Video.last.title} Saved!")
    assert page.has_content?(Video.last.title)
    assert page.has_content?(Video.last.description)
    assert page.has_css?("iframe[src*='http://www.youtube.com/embed/#{link}']")
  end

  test "returns error if title is missing" do
    admin = admin_login

    assert_equal '/admin/dashboard', current_path
    assert page.has_content?("#{admin.first_name}, welcome to your dashboard")
    assert page.has_link?("Add a new Video")

    click_link("Add a new Video")
    assert_equal new_admin_video_path, current_path

    fill_in "video[description]", with: "Sergio is a hero."
    fill_in "video[link]", with: "https://www.youtube.com/watch?v=fxL3iAsbADw"

    click_button("Add Video")

    assert_equal new_admin_video_path, current_path
    assert page.has_content?("Data is missing or invalid! Try again")
  end

  test "returns error if link is missing" do
    admin = admin_login

    assert_equal '/admin/dashboard', current_path
    assert page.has_content?("#{admin.first_name}, welcome to your dashboard")
    assert page.has_link?("Add a new Video")

    click_link("Add a new Video")
    assert_equal new_admin_video_path, current_path

    fill_in "video[title]", with: "Flint Knapping"
    fill_in "video[description]", with: "Sergio is a hero."

    click_button("Add Video")

    assert_equal new_admin_video_path, current_path
    assert page.has_content?("Data is missing or invalid! Try again")
  end

  test "does not return error if description is missing" do
    admin = admin_login

    assert_equal '/admin/dashboard', current_path
    assert page.has_content?("#{admin.first_name}, welcome to your dashboard")
    assert page.has_link?("Add a new Video")

    click_link("Add a new Video")
    assert_equal new_admin_video_path, current_path

    fill_in "video[title]", with: "Flint Knapping"
    fill_in "video[description]", with: ""
    fill_in "video[link]", with: "https://www.youtube.com/watch?v=fxL3iAsbADw"

    click_button("Add Video")
    link = Video.transform_link(Video.last.link)

    assert_equal video_path(Video.last.id), current_path
    assert page.has_content?("#{Video.last.title} Saved!")
    assert page.has_content?(Video.last.title)
    assert_equal "", Video.last.description
    assert page.has_css?("iframe[src*='http://www.youtube.com/embed/#{link}']")
  end

  test "updating a video" do
    video = Video.first
    new_title = "Galactic Archaeology"
    new_link = "https://www.youtube.com/watch?v=rtymNOK7jr8"
    admin = admin_login

    assert_equal '/admin/dashboard', current_path
    assert page.has_content?("#{admin.first_name}, welcome to your dashboard")
    assert page.has_link?("Add a new Video")
    click_link("Add a new Video")
    assert_equal new_admin_video_path, current_path

    fill_in "video[title]", with: "Flint Knapping"
    fill_in "video[description]", with: "Sergio is a hero."
    fill_in "video[link]", with: "https://www.youtube.com/watch?v=fxL3iAsbADw"
    click_button("Add Video")

    assert_equal video_path(Video.last.id), current_path
    assert page.has_content?(Video.last.title)

    click_link("Edit Video")
    assert_equal edit_admin_video_path(Video.last.id), current_path

    fill_in "video[title]", with: new_title
    fill_in "video[link]", with: new_link

    click_button("Update Video")
    new_link_transformed = Video.transform_link(Video.last.link)

    assert_equal video_path(Video.last.id), current_path
    assert page.has_content?("Video titled: '#{Video.last.title}' Updated!")
    assert page.has_content?(new_title)
    assert page.has_content?(Video.last.description)
    assert page.has_css?("iframe[src*='http://www.youtube.com/embed/#{new_link_transformed}']")
  end

  test "returns error if updated video misses title or link" do
    admin = admin_login

    assert_equal '/admin/dashboard', current_path
    assert page.has_content?("#{admin.first_name}, welcome to your dashboard")
    assert page.has_link?("Add a new Video")
    click_link("Add a new Video")
    assert_equal new_admin_video_path, current_path

    fill_in "video[title]", with: "Flint Knapping"
    fill_in "video[description]", with: "Sergio is a genius."
    fill_in "video[link]", with: "https://www.youtube.com/watch?v=fxL3iAsbADw"
    click_button("Add Video")

    assert_equal video_path(Video.last.id), current_path
    assert page.has_content?(Video.last.title)

    click_link("Edit Video")
    assert_equal edit_admin_video_path(Video.last.id), current_path

    fill_in "video[title]", with: ""
    fill_in "video[link]", with: ""

    click_button("Update Video")

    assert_equal edit_admin_video_path(Video.last.id), current_path
    assert page.has_content?("Data is missing or invalid! Try again")
  end

  test "deleting an video" do
    admin = admin_login
    video = Video.last

    assert_equal '/admin/dashboard', current_path
    assert page.has_content?("#{admin.first_name}, welcome to your dashboard")
    within(".navbar") do
      click_link("Videos")
    end

    assert_equal videos_path, current_path
    assert page.has_content?(video.title)

    click_link(video.title)

    click_link("Delete Video")
    # assert page.has_content?("Are you sure you want to delete this video?")
    # click_button("Ok")
    assert_equal videos_path, current_path
    assert page.has_content?("Video titled: '#{video.title}' Deleted!")
    within(".list-group") do
      refute page.has_content?(video.title)
    end
  end
end
