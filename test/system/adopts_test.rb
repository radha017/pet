require "application_system_test_case"

class AdoptsTest < ApplicationSystemTestCase
  setup do
    @adopt = adopts(:one)
  end

  test "visiting the index" do
    visit adopts_url
    assert_selector "h1", text: "Adopts"
  end

  test "should create adopt" do
    visit adopts_url
    click_on "New adopt"

    fill_in "Animal", with: @adopt.animal_id
    fill_in "Date", with: @adopt.date
    fill_in "Status", with: @adopt.status
    fill_in "User", with: @adopt.user_id
    click_on "Create Adopt"

    assert_text "Adopt was successfully created"
    click_on "Back"
  end

  test "should update Adopt" do
    visit adopt_url(@adopt)
    click_on "Edit this adopt", match: :first

    fill_in "Animal", with: @adopt.animal_id
    fill_in "Date", with: @adopt.date
    fill_in "Status", with: @adopt.status
    fill_in "User", with: @adopt.user_id
    click_on "Update Adopt"

    assert_text "Adopt was successfully updated"
    click_on "Back"
  end

  test "should destroy Adopt" do
    visit adopt_url(@adopt)
    click_on "Destroy this adopt", match: :first

    assert_text "Adopt was successfully destroyed"
  end
end
