require "application_system_test_case"

class ItemLinesTest < ApplicationSystemTestCase
  setup do
    @item_line = item_lines(:one)
  end

  test "visiting the index" do
    visit item_lines_url
    assert_selector "h1", text: "Item Lines"
  end

  test "creating a Item line" do
    visit item_lines_url
    click_on "New Item Line"

    fill_in "Product", with: @item_line.product_id
    fill_in "Shopping cart", with: @item_line.shopping_cart_id
    click_on "Create Item line"

    assert_text "Item line was successfully created"
    click_on "Back"
  end

  test "updating a Item line" do
    visit item_lines_url
    click_on "Edit", match: :first

    fill_in "Product", with: @item_line.product_id
    fill_in "Shopping cart", with: @item_line.shopping_cart_id
    click_on "Update Item line"

    assert_text "Item line was successfully updated"
    click_on "Back"
  end

  test "destroying a Item line" do
    visit item_lines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item line was successfully destroyed"
  end
end
