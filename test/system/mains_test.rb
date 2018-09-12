require "application_system_test_case"

class MainsTest < ApplicationSystemTestCase

  test "visiting the home page" do
    visit main_home_path
    assert_selector "h1", text: "HAMMER Time"
    assert_selector "h3", text: "MLK MTSS APP"
  end

  test "creating a student account" do
    visit main_home_path

    click_on "Sign Up"

    
  end

end
