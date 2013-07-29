require 'test_helper'

class HotelRoomsControllerTest < ActionController::TestCase
  setup do
    @hotel_room = hotel_rooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hotel_rooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hotel_room" do
    assert_difference('HotelRoom.count') do
      post :create, hotel_room: { description: @hotel_room.description, hotel_id: @hotel_room.hotel_id, id: @hotel_room.id, image1: @hotel_room.image1, image2: @hotel_room.image2, price: @hotel_room.price, title: @hotel_room.title }
    end

    assert_redirected_to hotel_room_path(assigns(:hotel_room))
  end

  test "should show hotel_room" do
    get :show, id: @hotel_room
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hotel_room
    assert_response :success
  end

  test "should update hotel_room" do
    put :update, id: @hotel_room, hotel_room: { description: @hotel_room.description, hotel_id: @hotel_room.hotel_id, id: @hotel_room.id, image1: @hotel_room.image1, image2: @hotel_room.image2, price: @hotel_room.price, title: @hotel_room.title }
    assert_redirected_to hotel_room_path(assigns(:hotel_room))
  end

  test "should destroy hotel_room" do
    assert_difference('HotelRoom.count', -1) do
      delete :destroy, id: @hotel_room
    end

    assert_redirected_to hotel_rooms_path
  end
end
