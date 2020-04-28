require 'test_helper'

class Api::V1::ActivitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get '/api/v1/activities'
    assert_response :success
  end

end
