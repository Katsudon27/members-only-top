require "test_helper"

class PostControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers # import helpers from devise

  setup do
    @user = users(:user_one)
    sign_in @user
  end

  test "should get new" do
    get new_post_path
    assert_response :success
  end

  test "should post create" do
    post posts_path, params: {
      post: {
        title: "testing",
        body: "testing",
        user_id: @user.id
      }
    }
    assert_redirected_to posts_path
  end
end
