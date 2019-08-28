require 'test_helper'

class SeekerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get seeker_index_url
    assert_response :success
  end

end
