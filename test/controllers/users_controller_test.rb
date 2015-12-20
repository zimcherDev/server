require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
        
    @update = {
      name: 'test',
      email: 'test@gmail.com',
      password: '123',
      password_confirmation: '123'
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: @update
    end

    assert_redirected_to users_url
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: users(:allen).id, user: @update
    assert_redirected_to users_url
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
  
  test "create user json" do
    assert_difference('User.count') do
      post :create, { format: 'json',user:{ name:"John", email:"john@126.com",password: "123", password_confirmation: "123"}}
    end
    
    assert_response :created
  end
end
