require "test_helper"

class ListingSlotsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get listing_slots_index_url
    assert_response :success
  end
end
