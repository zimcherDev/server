require 'test_helper'

class PostcontentsControllerTest < ActionController::TestCase
  setup do
    @postcontent = postcontents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:postcontents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create postcontent" do
    assert_difference('Postcontent.count') do
      post :create, postcontent: { description: @postcontent.description, media_type: @postcontent.media_type, media_url: @postcontent.media_url, post_id: @postcontent.post_id }
    end

    assert_redirected_to postcontent_path(assigns(:postcontent))
  end

  test "should show postcontent" do
    get :show, id: @postcontent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @postcontent
    assert_response :success
  end

  test "should update postcontent" do
    patch :update, id: @postcontent, postcontent: { description: @postcontent.description, media_type: @postcontent.media_type, media_url: @postcontent.media_url, post_id: @postcontent.post_id }
    assert_redirected_to postcontent_path(assigns(:postcontent))
  end

  test "should destroy postcontent" do
    assert_difference('Postcontent.count', -1) do
      delete :destroy, id: @postcontent
    end

    assert_redirected_to postcontents_path
  end
end
