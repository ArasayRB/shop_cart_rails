require "test_helper"

class ClasificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clasification = clasifications(:one)
  end

  test "should get index" do
    get clasifications_url
    assert_response :success
  end

  test "should get new" do
    get new_clasification_url
    assert_response :success
  end

  test "should create clasification" do
    assert_difference('Clasification.count') do
      post clasifications_url, params: { clasification: { clasification: @clasification.clasification } }
    end

    assert_redirected_to clasification_url(Clasification.last)
  end

  test "should show clasification" do
    get clasification_url(@clasification)
    assert_response :success
  end

  test "should get edit" do
    get edit_clasification_url(@clasification)
    assert_response :success
  end

  test "should update clasification" do
    patch clasification_url(@clasification), params: { clasification: { clasification: @clasification.clasification } }
    assert_redirected_to clasification_url(@clasification)
  end

  test "should destroy clasification" do
    assert_difference('Clasification.count', -1) do
      delete clasification_url(@clasification)
    end

    assert_redirected_to clasifications_url
  end
end
