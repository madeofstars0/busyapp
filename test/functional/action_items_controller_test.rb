require 'test_helper'

class ActionItemsControllerTest < ActionController::TestCase
  setup do
    @action_item = action_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:action_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create action_item" do
    assert_difference('ActionItem.count') do
      post :create, :action_item => @action_item.attributes
    end

    assert_redirected_to action_item_path(assigns(:action_item))
  end

  test "should show action_item" do
    get :show, :id => @action_item.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @action_item.to_param
    assert_response :success
  end

  test "should update action_item" do
    put :update, :id => @action_item.to_param, :action_item => @action_item.attributes
    assert_redirected_to action_item_path(assigns(:action_item))
  end

  test "should destroy action_item" do
    assert_difference('ActionItem.count', -1) do
      delete :destroy, :id => @action_item.to_param
    end

    assert_redirected_to action_items_path
  end
end
