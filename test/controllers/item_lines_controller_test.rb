require "test_helper"

class ItemLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_line = item_lines(:one)
  end

  test "should get index" do
    get item_lines_url
    assert_response :success
  end

  test "should get new" do
    get new_item_line_url
    assert_response :success
  end

  test "should create item_line" do
    assert_difference('ItemLine.count') do
      post :create, product_id: products(:ruby).id #item_lines_url, params: { item_line: { product_id: @item_line.product_id, shopping_cart_id: @item_line.shopping_cart_id } }
    end

    assert_redirected_to shopping_cart_path(assigns(:item_line).shopping_cart) #item_line_url(ItemLine.last)
  end

  test "should show item_line" do
    get item_line_url(@item_line)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_line_url(@item_line)
    assert_response :success
  end

  test "should update item_line" do
    patch item_line_url(@item_line), params: { item_line: { product_id: @item_line.product_id, shopping_cart_id: @item_line.shopping_cart_id } }
    assert_redirected_to item_line_url(@item_line)
  end

  test "should destroy item_line" do
    assert_difference('ItemLine.count', -1) do
      delete item_line_url(@item_line)
    end

    assert_redirected_to item_lines_url
  end
end
