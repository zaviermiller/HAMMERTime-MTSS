require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room = rooms(:one)
  end

  test "should create room" do
    assert_difference('Room.count') do
      post rooms_url, params: { room: { capacity: @room.capacity, name: @room.name, user_id: @room.user_id } }
    end

    assert_redirected_to root_path
  end
end
