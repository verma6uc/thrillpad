require 'test_helper'

class HotelsControllerTest < ActionController::TestCase
  setup do
    @hotel = hotels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hotels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hotel" do
    assert_difference('Hotel.count') do
      post :create, hotel: { address: @hotel.address, check_out: @hotel.check_out, city_id: @hotel.city_id, description: @hotel.description, hotel_policies: @hotel.hotel_policies, id: @hotel.id, image1: @hotel.image1, image2: @hotel.image2, image3: @hotel.image3, image4: @hotel.image4, map: @hotel.map, number_of_rooms: @hotel.number_of_rooms, slug: @hotel.slug, title: @hotel.title }
    end

    assert_redirected_to hotel_path(assigns(:hotel))
  end

  test "should show hotel" do
    get :show, id: @hotel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hotel
    assert_response :success
  end

  test "should update hotel" do
    put :update, id: @hotel, hotel: { address: @hotel.address, check_out: @hotel.check_out, city_id: @hotel.city_id, description: @hotel.description, hotel_policies: @hotel.hotel_policies, id: @hotel.id, image1: @hotel.image1, image2: @hotel.image2, image3: @hotel.image3, image4: @hotel.image4, map: @hotel.map, number_of_rooms: @hotel.number_of_rooms, slug: @hotel.slug, title: @hotel.title }
    assert_redirected_to hotel_path(assigns(:hotel))
  end

  test "should destroy hotel" do
    assert_difference('Hotel.count', -1) do
      delete :destroy, id: @hotel
    end

    assert_redirected_to hotels_path
  end
end
