require 'test_helper'

class HotelFacilitiesControllerTest < ActionController::TestCase
  setup do
    @hotel_facility = hotel_facilities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hotel_facilities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hotel_facility" do
    assert_difference('HotelFacility.count') do
      post :create, hotel_facility: { 24hr_room_service: @hotel_facility.24hr_room_service, airport_transfer: @hotel_facility.airport_transfer, hotel_id: @hotel_facility.hotel_id, id: @hotel_facility.id }
    end

    assert_redirected_to hotel_facility_path(assigns(:hotel_facility))
  end

  test "should show hotel_facility" do
    get :show, id: @hotel_facility
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hotel_facility
    assert_response :success
  end

  test "should update hotel_facility" do
    put :update, id: @hotel_facility, hotel_facility: { 24hr_room_service: @hotel_facility.24hr_room_service, airport_transfer: @hotel_facility.airport_transfer, hotel_id: @hotel_facility.hotel_id, id: @hotel_facility.id }
    assert_redirected_to hotel_facility_path(assigns(:hotel_facility))
  end

  test "should destroy hotel_facility" do
    assert_difference('HotelFacility.count', -1) do
      delete :destroy, id: @hotel_facility
    end

    assert_redirected_to hotel_facilities_path
  end
end
