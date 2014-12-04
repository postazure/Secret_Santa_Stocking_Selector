require 'test_helper'

class FriendsControllerTest < ActionController::TestCase
  setup do
    @friend = friends(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:friends)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create friend" do
    assert_difference('Friend.count') do
      post :create, friend: { email: @friend.email, group_id: @friend.group_id, name: @friend.name, spouse: @friend.spouse }
    end

    assert_redirected_to friend_path(assigns(:friend))
  end

  test "should show friend" do
    get :show, id: @friend
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @friend
    assert_response :success
  end

  test "should update friend" do
    patch :update, id: @friend, friend: { email: @friend.email, group_id: @friend.group_id, name: @friend.name, spouse: @friend.spouse }
    assert_redirected_to friend_path(assigns(:friend))
  end

end
