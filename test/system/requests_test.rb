require "application_system_test_case"

class RequestsTest < ApplicationSystemTestCase

  test "creating a Request" do
    visit new_request_path

    fill_in "request_name", with: requests(:one).name
    click_on "Search"

    assert_selector "h2", text: "Students"
  end
end
