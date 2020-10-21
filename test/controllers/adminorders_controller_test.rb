require 'test_helper'

class AdminordersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adminorders_index_url
    assert_response :success
  end

  test "should get show　update" do
    get adminorders_show　update_url
    assert_response :success
  end

end
