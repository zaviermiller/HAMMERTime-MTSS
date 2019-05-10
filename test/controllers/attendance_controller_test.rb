require 'test_helper'

class AttendanceControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get attendance_show_url
    assert_response :success
  end

end
