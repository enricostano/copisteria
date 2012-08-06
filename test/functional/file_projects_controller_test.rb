require 'test_helper'

class FileProjectsControllerTest < ActionController::TestCase
  setup do
    @file_project = file_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:file_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create file_project" do
    assert_difference('FileProject.count') do
      post :create, file_project: { file_uid: @file_project.file_uid, name: @file_project.name }
    end

    assert_redirected_to file_project_path(assigns(:file_project))
  end

  test "should show file_project" do
    get :show, id: @file_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @file_project
    assert_response :success
  end

  test "should update file_project" do
    put :update, id: @file_project, file_project: { file_uid: @file_project.file_uid, name: @file_project.name }
    assert_redirected_to file_project_path(assigns(:file_project))
  end

  test "should destroy file_project" do
    assert_difference('FileProject.count', -1) do
      delete :destroy, id: @file_project
    end

    assert_redirected_to file_projects_path
  end
end
