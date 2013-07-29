require 'test_helper'

class ActSchedulesControllerTest < ActionController::TestCase
  setup do
    @act_schedule = act_schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:act_schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create act_schedule" do
    assert_difference('ActSchedule.count') do
      post :create, act_schedule: { act_id: @act_schedule.act_id, end_time: @act_schedule.end_time, id: @act_schedule.id, start_time: @act_schedule.start_time }
    end

    assert_redirected_to act_schedule_path(assigns(:act_schedule))
  end

  test "should show act_schedule" do
    get :show, id: @act_schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @act_schedule
    assert_response :success
  end

  test "should update act_schedule" do
    put :update, id: @act_schedule, act_schedule: { act_id: @act_schedule.act_id, end_time: @act_schedule.end_time, id: @act_schedule.id, start_time: @act_schedule.start_time }
    assert_redirected_to act_schedule_path(assigns(:act_schedule))
  end

  test "should destroy act_schedule" do
    assert_difference('ActSchedule.count', -1) do
      delete :destroy, id: @act_schedule
    end

    assert_redirected_to act_schedules_path
  end
end
