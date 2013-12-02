require 'test_helper'

class AppsControllerTest < ActionController::TestCase
  setup do
    @app = apps(:one)
    @app.title = "Mortgage Mate"  ## Needs to be a unique name that is not one of the fixtures
    @app.default_proceeds_in_dollars = 0.7
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create app" do
    assert_difference('App.count') do
      post :create, app: { apple_identifier: @app.apple_identifier, category: @app.category, sku: @app.sku, title: @app.title, default_proceeds_in_dollars: @app.default_proceeds_in_dollars }
    end

    assert_redirected_to app_path(assigns(:app))
  end

  test "should show app" do
    get :show, id: @app
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @app
    assert_response :success
  end

  test "should update app" do
    patch :update, id: @app, app: { apple_identifier: @app.apple_identifier, category: @app.category, sku: @app.sku, title: @app.title, default_proceeds_in_dollars: @app.default_proceeds_in_dollars }
    assert_redirected_to app_path(assigns(:app))
  end

  test "should destroy app" do
    assert_difference('App.count', -1) do
      delete :destroy, id: @app
    end

    assert_redirected_to apps_path
  end
end
