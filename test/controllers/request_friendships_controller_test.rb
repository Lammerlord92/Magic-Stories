require 'test_helper'

class RequestFriendshipsControllerTest < ActionController::TestCase
  setup do
    @request_friendship = request_friendships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:request_friendships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request_friendship" do
    assert_difference('RequestFriendship.count') do
      post :create, request_friendship: {  }
    end

    assert_redirected_to request_friendship_path(assigns(:request_friendship))
  end

  test "should show request_friendship" do
    get :show, id: @request_friendship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request_friendship
    assert_response :success
  end

  test "should update request_friendship" do
    patch :update, id: @request_friendship, request_friendship: {  }
    assert_redirected_to request_friendship_path(assigns(:request_friendship))
  end

  test "should destroy request_friendship" do
    assert_difference('RequestFriendship.count', -1) do
      delete :destroy, id: @request_friendship
    end

    assert_redirected_to request_friendships_path
  end
end
