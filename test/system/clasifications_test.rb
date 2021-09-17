require "application_system_test_case"

class ClasificationsTest < ApplicationSystemTestCase
  setup do
    @clasification = clasifications(:one)
  end

  test "visiting the index" do
    visit clasifications_url
    assert_selector "h1", text: "Clasifications"
  end

  test "creating a Clasification" do
    visit clasifications_url
    click_on "New Clasification"

    fill_in "Clasification", with: @clasification.clasification
    click_on "Create Clasification"

    assert_text "Clasification was successfully created"
    click_on "Back"
  end

  test "updating a Clasification" do
    visit clasifications_url
    click_on "Edit", match: :first

    fill_in "Clasification", with: @clasification.clasification
    click_on "Update Clasification"

    assert_text "Clasification was successfully updated"
    click_on "Back"
  end

  test "destroying a Clasification" do
    visit clasifications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Clasification was successfully destroyed"
  end
end
