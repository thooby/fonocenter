require 'test_helper'

class LugarsControllerTest < ActionController::TestCase
  setup do
    @lugar = lugars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lugars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lugar" do
    assert_difference('Lugar.count') do
      post :create, :lugar => @lugar.attributes
    end

    assert_redirected_to lugar_path(assigns(:lugar))
  end

  test "should show lugar" do
    get :show, :id => @lugar.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @lugar.to_param
    assert_response :success
  end

  test "should update lugar" do
    put :update, :id => @lugar.to_param, :lugar => @lugar.attributes
    assert_redirected_to lugar_path(assigns(:lugar))
  end

  test "should destroy lugar" do
    assert_difference('Lugar.count', -1) do
      delete :destroy, :id => @lugar.to_param
    end

    assert_redirected_to lugars_path
  end
end
