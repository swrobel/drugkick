require 'test_helper'

class RehabsControllerTest < ActionController::TestCase
  setup do
    @rehab = rehabs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rehabs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rehab" do
    assert_difference('Rehab.count') do
      post :create, :rehab => @rehab.attributes
    end

    assert_redirected_to rehab_path(assigns(:rehab))
  end

  test "should show rehab" do
    get :show, :id => @rehab.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @rehab.to_param
    assert_response :success
  end

  test "should update rehab" do
    put :update, :id => @rehab.to_param, :rehab => @rehab.attributes
    assert_redirected_to rehab_path(assigns(:rehab))
  end

  test "should destroy rehab" do
    assert_difference('Rehab.count', -1) do
      delete :destroy, :id => @rehab.to_param
    end

    assert_redirected_to rehabs_path
  end
end
