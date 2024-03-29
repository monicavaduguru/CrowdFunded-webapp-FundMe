require 'test_helper'

class KidsControllerTest < ActionController::TestCase
  setup do
    @kid = kids(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kids)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kid" do
    assert_difference('Kid.count') do
      post :create, kid: { address: @kid.address, age: @kid.age, comments: @kid.comments, image_url: @kid.image_url, money_received: @kid.money_received, money_required: @kid.money_required, name: @kid.name, purpose: @kid.purpose }
    end

    assert_redirected_to kid_path(assigns(:kid))
  end

  test "should show kid" do
    get :show, id: @kid
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kid
    assert_response :success
  end

  test "should update kid" do
    patch :update, id: @kid, kid: { address: @kid.address, age: @kid.age, comments: @kid.comments, image_url: @kid.image_url, money_received: @kid.money_received, money_required: @kid.money_required, name: @kid.name, purpose: @kid.purpose }
    assert_redirected_to kid_path(assigns(:kid))
  end

  test "should destroy kid" do
    assert_difference('Kid.count', -1) do
      delete :destroy, id: @kid
    end

    assert_redirected_to kids_path
  end
end
