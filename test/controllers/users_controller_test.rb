require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_new_url
    assert_response :success
  end

  test "should get create" do
    get users_create_url
    assert_response :success
  end

  test "should get signin" do
    get users_signin_url
    assert_response :success
  end

  test "should get signout" do
    get users_signout_url
    assert_response :success
  end
end
