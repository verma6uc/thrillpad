require 'test_helper'

class TPactivitiesControllerControllerTest < ActionController::TestCase
  test "should get country" do
    get :country
    assert_response :success
  end

  test "should get state" do
    get :state
    assert_response :success
  end

  test "should get city" do
    get :city
    assert_response :success
  end

  test "should get place" do
    get :place
    assert_response :success
  end

  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get jssearch" do
    get :jssearch
    assert_response :success
  end

  test "should get upvote_places" do
    get :upvote_places
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get tags" do
    get :tags
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
