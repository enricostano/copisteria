require 'test_helper'

class UrlConnectorsControllerTest < ActionController::TestCase
  setup do
    @url_connector = url_connectors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:url_connectors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create url_connector" do
    assert_difference('UrlConnector.count') do
      post :create, url_connector: { active: @url_connector.active, order_id: @url_connector.order_id, real_url: @url_connector.real_url, temp_url: @url_connector.temp_url, user_id: @url_connector.user_id }
    end

    assert_redirected_to url_connector_path(assigns(:url_connector))
  end

  test "should show url_connector" do
    get :show, id: @url_connector
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @url_connector
    assert_response :success
  end

  test "should update url_connector" do
    put :update, id: @url_connector, url_connector: { active: @url_connector.active, order_id: @url_connector.order_id, real_url: @url_connector.real_url, temp_url: @url_connector.temp_url, user_id: @url_connector.user_id }
    assert_redirected_to url_connector_path(assigns(:url_connector))
  end

  test "should destroy url_connector" do
    assert_difference('UrlConnector.count', -1) do
      delete :destroy, id: @url_connector
    end

    assert_redirected_to url_connectors_path
  end
end
