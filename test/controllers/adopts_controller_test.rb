require "test_helper"

class AdoptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adopt = adopts(:one)
  end

  test "should get index" do
    get adopts_url
    assert_response :success
  end

  test "should get new" do
    get new_adopt_url
    assert_response :success
  end

  test "should create adopt" do
    assert_difference("Adopt.count") do
      post adopts_url, params: { adopt: { animal_id: @adopt.animal_id, date: @adopt.date, status: @adopt.status, user_id: @adopt.user_id } }
    end

    assert_redirected_to adopt_url(Adopt.last)
  end

  test "should show adopt" do
    get adopt_url(@adopt)
    assert_response :success
  end

  test "should get edit" do
    get edit_adopt_url(@adopt)
    assert_response :success
  end

  test "should update adopt" do
    patch adopt_url(@adopt), params: { adopt: { animal_id: @adopt.animal_id, date: @adopt.date, status: @adopt.status, user_id: @adopt.user_id } }
    assert_redirected_to adopt_url(@adopt)
  end

  test "should destroy adopt" do
    assert_difference("Adopt.count", -1) do
      delete adopt_url(@adopt)
    end

    assert_redirected_to adopts_url
  end
end
