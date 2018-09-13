require 'test_helper'

class RoomTest < ActiveSupport::TestCase

  test "valid room" do
    room = Room.new(name: 'Test', desc: 'Test description')
    assert room.valid?
  end

  test "room not valid without name" do
    room = Room.new(desc: 'Test description')
    assert_not room.valid?, 'Room is not valid without a name'
  end

end
