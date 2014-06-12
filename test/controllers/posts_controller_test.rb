require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "should get newpost" do
    get :newpost
    assert_response :success
  end

  test "should get createpost" do
    get :createpost
    assert_response :success
  end

  test "should get newcomment" do
    get :newcomment
    assert_response :success
  end

  test "should get createcomment" do
    get :createcomment
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
