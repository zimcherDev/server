require 'test_helper'

class MyzimsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, id: users(:allen).id
    assert_response :success
    
    get :index,{format: 'json',id: users(:allen).id}
    assert_response :success
  end

end
