require 'test_helper'

class ZimsControllerTest < ActionController::TestCase
  setup do
    @zim = zims(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:zims)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create zim" do
    assert_difference('Zim.count') do
      post :create, zim: { description: @zim.description, image_url: @zim.image_url, name: @zim.name, publicity: @zim.publicity }
    end

    assert_redirected_to zim_path(assigns(:zim))
  end

  test "should show zim" do
    get :show, id: @zim
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @zim
    assert_response :success
  end

  test "should update zim" do
    patch :update, id: @zim, zim: { description: @zim.description, image_url: @zim.image_url, name: @zim.name, publicity: @zim.publicity }
    assert_redirected_to zim_path(assigns(:zim))
  end

  test "should destroy zim" do
    assert_difference('Zim.count', -1) do
      delete :destroy, id: @zim
    end

    assert_redirected_to zims_path
  end
end
