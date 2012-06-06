require 'test_helper'

class StackItemsControllerTest < ActionController::TestCase
  setup do
    @stack_item = stack_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stack_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stack_item" do
    assert_difference('StackItem.count') do
      post :create, stack_item: { id: @stack_item.id, item_name: @stack_item.item_name }
    end

    assert_redirected_to stack_item_path(assigns(:stack_item))
  end

  test "should show stack_item" do
    get :show, id: @stack_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stack_item
    assert_response :success
  end

  test "should update stack_item" do
    put :update, id: @stack_item, stack_item: { id: @stack_item.id, item_name: @stack_item.item_name }
    assert_redirected_to stack_item_path(assigns(:stack_item))
  end

  test "should destroy stack_item" do
    assert_difference('StackItem.count', -1) do
      delete :destroy, id: @stack_item
    end

    assert_redirected_to stack_items_path
  end
end
