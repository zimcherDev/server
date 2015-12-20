require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create session" do
    post :create, email: 'allen@gmail.com',password: 'secret'
    assert_redirected_to myzims_path(id: users(:allen))
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end
  
  test "create session json" do
    post :create, { format: 'json',email: 'allen@gmail.com',password: 'secret'}
    assert_response :success
  end

  test "should fail create session json" do
    post :create, { format: 'json',email: 'allen@gmail.com',password: '123'}
    assert_response :unprocessable_entity
    
    post :create, { format: 'json',email: 'allen@gmail.co',password: 'secret'}
    assert_response :unprocessable_entity
  end
end
