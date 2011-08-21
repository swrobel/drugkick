require 'test_helper'

class TreatmentTypesControllerTest < ActionController::TestCase
  setup do
    @treatment_type = treatment_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:treatment_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create treatment_type" do
    assert_difference('TreatmentType.count') do
      post :create, :treatment_type => @treatment_type.attributes
    end

    assert_redirected_to treatment_type_path(assigns(:treatment_type))
  end

  test "should show treatment_type" do
    get :show, :id => @treatment_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @treatment_type.to_param
    assert_response :success
  end

  test "should update treatment_type" do
    put :update, :id => @treatment_type.to_param, :treatment_type => @treatment_type.attributes
    assert_redirected_to treatment_type_path(assigns(:treatment_type))
  end

  test "should destroy treatment_type" do
    assert_difference('TreatmentType.count', -1) do
      delete :destroy, :id => @treatment_type.to_param
    end

    assert_redirected_to treatment_types_path
  end
end
